Message-ID: <3BE666F3.C1A15761@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot questions
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net> <0111021341411E.08803@khayes-lin>
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
Date: Mon Nov  5 04:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi, Kyle:

Kyle Hayes wrote:
>=20
> Hmm, seems to be quite a range of opinion.  However, I must say that
> having so many negative options is not a good sign.  Do snapshots
> work at all?
>=20

Well, I can't say if LVM snapshots do work, but I know for sure they can
be very useful on a wide bunch of situations.

[...]

>=20
> It is good to hear that it works more like Veritas and less like the
> SuSE whitepaper claims.  That paper claimed that the changes will go
> to the snapshot partition.  This implied that there would be a terrible
> IO hit when you deleted the snapshot partition and the changes need to
> be written back to the original partition.
>=20

Huh?  Well, I haven't search the code, but the LVM How to stays that it
has to "...hold all the changes that are likely to happen to the
original volume during the lifetime of the snapshot", and it says too
"...You should remove snapshot volume when you have finished with them
because they take a copy of all data wirtten to the original volume".
On the other hand, rigth in between those two states it says: "Note that
the [snapshot] volume was mounted read-only. Snapshots can never be
written to, and the data in them cannot change."  So there is obviously
something missed in here.

> I am confused by the claim (see below) that you need the same amount
> of space for the snapshot partition as you had on the original LV.

Again, from the LVM How To: "A snapshot volume can be as large or a
[sic] small as you like but it must be large enough to hold all the
changes that are likely to happen... [...]  A snapshot logical volume
can be a maximum of 1.1x the size of the original volume".

[...]

> Under what circumstances do snapshots work?  I am confused by the
> claims that a snapshot partition is going to be "corrupt" as far as
> the OS is concerned.  In my scenario, here is what I am planning on
> doing:
>=20
> 1) lock all tables against writes.
>=20
> 2) flush all logs and tables to disk.
>=20
> 3) create a snapshot partition for the filesystem (ext2 or probably)
> on which the database data resides.  These are not raw disks.
>=20
> 4) unlock the tables.
>=20
> 5) mount the snapshot partition and copy the database data out.
>=20

That's a "standard procedure" for RDBMs that don't support hot backups
with the exception that the "standard" would include a dump of the
database contents instead of the filesystem snapshot.  *If* you know
there won't be operations spanning more than one database, you can
reduce comptention by just blocking/dumping one database at a time.=20
Then I would evaluate speed.  If the dump doesn't need too much time
than the snapshot I would go with it because of portability and
(somehow) integrity (you will have a database operation completly driven
from the RDBM).  Under some circumnstances size can be an issue too: if
you go with the snapshot you will have to do it big enough to cope with
the worst case scenario, and since it does involve creating and deleting
a filesystem you will find more dificult to reclaim that disk space if
needed.  On the other hand, the dump will most probably need less space
(specially if you pipe it through gzip, or tar -z) and will need as much
space as really needed, which can be reclaimed as soon as the dump is
finished and properly stored somewhere else.

>=20
> We run 24/7 systems and it is not an option to take down a system to
> back it up.  We can handle slightly degraded performance, but even
> that is a problem.
>=20

Again, regarding database operations you will end up most probably
recognizing that database backup is a database issue best coped with
database tools.  Snapshots can be useful tool for many other situations
like mail (or other) spools, user data, etc.
(just my 2 cents)
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
