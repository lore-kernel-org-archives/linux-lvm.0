Message-ID: <3BE65BE0.880D0D84@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot questions
References: <D880FFC9CFDBA84FA13E9B166D06A123B647FB@daedalus.kenamea.com>
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
Date: Mon Nov  5 03:27:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi, Kenny:

Kenny Gorman wrote:
>=20
> Kyle,
>=20
> I have the opposite opinion as Jesus.  File system level backups are the
> way to go.  Maybe not on Linux (because of the robustness of the
> snapshot facility), but for sure using Veritas.  See, file system level
> database backups are fast, scalable, and simple.  However, if you can
> not count on the data consistency, then I would agree with Jesus.
>=20

Well, yes, that's the point: You can never count on data consistency
regarding database activities.  As a general matter, data disk
consistency is not mapped one-to-one to data base consistency: The
filesystem can be glad enough regarding consistency on the middle of a
database transaction, while the database won't be so, in case data is to
be recovered from that backup.  It *migth* probe that in any particular
case sysadmin and dba are working close enough so in one particular
installation you can sign on the "yes, you can safely do filesystem
backups", but that won't be the general case, not by far.  Even if
write-to-disk is an atomic operation, you cannot know for sure that
writing down transaction logs will be so (even having filesystem
snapshots in place: unless the snapshotting is *very* carefully
programmed to be truly atomic *and* there's no write buffer around -OS
write buffer, or hardware one -both at the disks or the disk controller,
you can't count there won't be any write operation from the moment the
snapshot is asked to be started and the moment it is taken).

In the usual case, the sysadmin will do system backups (they're
simpler), he'll test it and they'll work, so they'll go into
production.  Once in a sudden, those backups will be needed, and then,
misteriously, they'll bring the database to an unconsistant state.=20
Why?  Because tests were done under ligth on no load at all so having
the backup storing half an atomic operation is the rarest case.  Once in
production you can bet that -taking apart human mistakes, database
problems will appear under heavy load conditions which mostly will mean
that last backup will include unconsistant data (either because your
RDBM doesn't support true ACID, or because programmers didn't wrapped
that operation that needed it into a single transaction, or because the
operation would need to be insured as atomic but it couldn't from the
RDBM point of view because it expanded more than a single database,
or...).

> My personal opinion (as a DBA), is that the simplest approach to backup
> and recover is best.  If you cant do the restore at 3:00am with one eye
> closed and make 0 mistakes, then it's not worth it (that why I dont use
> Oracle RMAN).  I use snapshots (Veritas/Sun) for backups of my
> production DB's.  It's really nice to not to ever worry about a backup
> window, just backup whenever!
>=20

Hmmm... The one and only way to achieve that goal is heavy automation,
heavy documentation and heavy training/testing your procedures.  Even if
you can be confident on your snapshots (the only one I know of are Sun's
off-site hardware replication, but that's another story), they'll be
done with certain delay, so if you should return the database to the
latest consistant state possible, still you will need last transaction
log available.  All in all, at the end you will find that either
database tools are the ones that best fit (since you will end up needing
them if only in some cases) or that you're lucky enough that -as DBA,
you can pass that shit down to the sysadmin (but that wouldn't be fair
play, at least).

Speaking about Oracle, I have to say I'm not proficient at it (to say
the least), but AFAIK, it has its own snapshot methods to do hot
backups, so you're most probably re-doing filesystem level what can be
done with more accuracy at RDBM level.

There's even some "politics" envolved here: the health of the databases
is a concern for the DBA; the RDBM will have is own tools to achieve the
goal, so it is *her* responsibility to have them in place.  It will make
no difference if sysadmin and DBA is the same person, since this migth
change tomorrow, and when this happens both sysadmin and dba will be
glad not needing to take more responsibilities than those associated
with the post.

Being said this all, there *is* one situation when filesystem backup is
the tool to choice and this is it when you can turn down your RDBM prior
to the backup.  Even then it obviously need to be sync'd with the DBA,
since she will be the one who will turn off and on the RDBM (and know
how to do this safely, or at least, being her responsibility to do so).

> That said, I am _evaluating_ how good Linux/LVM backups are in this
> regard.  So far, it's been fine.  Also, as always, make sure you are, or
> have a good DBA around. 8-)
>=20

Fair enough, no doubt.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
