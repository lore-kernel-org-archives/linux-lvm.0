Message-ID: <3BE6BF1A.56821DC7@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot questions
References: <D880FFC9CFDBA84FA13E9B166D06A123B64805@daedalus.kenamea.com>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Nov  5 10:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi, Kenny:

Kenny Gorman wrote:
>=20
> I use cooked file systems for Oracle not RAW.  I am not sure MySQL has
> an similar function to Oracle Hot Backup.  Basically, oracle suspends
> writes to the datafiles for the tablespaces in Hot Backup by keeping the
> whole blocks in the redo logs.  Since MySQL (to my knowledge) doesn't do
> something like this, your datafiles will get corrupted when you
> snapshot.   I am not sure the 'flush to disk' idea will work... unless
> (and maybe your saying this and I am not getting it) MySQL will suspend
> writes until your snapshot is done.  I suppose that would work...
>=20

It can do it... at a cost: While Oracle will still accept clients to
write data (but it'll end up at the redo logs instead to the "real"
database), when you block for writing you clients they simply won't
write, which it can turn on an error at the client app side, or a freeze
till the lock goes away.

...but there's another snapshot-like approach you can take with MySQL:
hot replication.  Under these circumnstances a "live" database will
create an "insert log" on one hand, and will sustain an open pipe to a
read-only copy (which it can be at other machine... only caveat is that
the conection pipe should be wide enough to cope with traffic
generated).  The copy will in turn be actualized reading that insert log
(the insert log is only a binary-format for all operations that alter
the database, like insert, update, create table, delete table, etc.).=20
Thus you can programatically break the mirror in the moment you desire
and backup the backup database the way that best fit (and you can even
stop the engine: once you break the mirror it'll be "death" for
practical purpouses).  Once the backup is done you redo the mirror and
your copy will "automagically" run the log till current state.  In order
to restore you will need to restore from last backup and rerun the log
(you should examine it, of course, for post-mortem diagnostic purpouses)
from the backup checkpoint to-date (well, that's not magic on current
MySQL stable version: you will need to purge the update log to run it
from the backup check point, while you can avoid it if proper database
schema is in place so you can guarantee that a duplicated insertion will
fail).

--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
