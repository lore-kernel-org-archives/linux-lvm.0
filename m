Message-ID: <3BE66C5A.C5BA896C@promofinarsa.es>
From: Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot questions
References: <3.0.6.32.20011102140312.00806c50@mail.doorpi.net> <0111021341411E.08803@khayes-lin> <20011102153947.P746@lynx.no> <0111021621181I.08803@khayes-lin>
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
Date: Mon Nov  5 04:38:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi again, Kyle:

Kyle Hayes wrote:
>=20

[...]

>=20
> > Depending on your I/O and response requirements, you can do the backups
> > while your tables are in hot backup mode, without using snapshots at
> > all.
>=20
> With MySQL this is not possible at this time.  I suspect they'll have it
> relatively soon.  They seem to add features based on demand and as it
> expands in popularity, I suppose that better backup features will be
> demanded.
>=20

So, can I suppouse your RDBM is MySQL? If so, my previous assertion goes
from *very sensible* to a totally must.  Don't go with snapshots, go
with dump.  If it is safe to suppouse that there's not transaction-like
operations spanning more than one database, write-block and dump on a
per database basis, and pipe the dump to tar -z.  This will be safest
method.  Well, there's no fool proof backup with MySQL apart from
shuting down the engine and you can bet *there will be* database
unconsistancies disregarding what you do to avoid them  (since even
write blocking doesn't guard against bad programming practices and you
can bet your database accessing programs will have more than a bug
regarding "pseudo transacting" through multiple table locking).

> The LVM solution seems like it will also be usable for other things
> than databases.  I'd like to be able to create a set of scripts and
> tools for our use that can be used for more than databases.
>=20

What I would suggest is use snapshots for everything you want *except*
database backups.  They can be acomplished easier and safer using
mysqldump.


>=20
> The locking tables part does this.  It prevents other threads from writing
> to any table.  I explain this above.
>=20

But it doesn't protect you against bad programming practices: *Any*
multiple table writing *must* be wrapped between write blocks, *and*
rollback code *must* be in place.  I bet that there's at least one
operation on the code accesing those databases that doesn't follow this
must.  In this case, sooner or later you will end up "cutting" a
multiple writing operation by half when you write block tables for the
backup.  *If* you're very carefull still you will be able to restore to
a stable state using the mysqldump *and* a timestamped transaction log,
but this is a pain in the ass.  Luckily enough MySQL is fairly stable,
so you won't need your backups but very rarely.

> > In Oracle, the files that are part of the snapshot are not consistent
> > (corrupted).  Thats just how it works.  Then when you use Oracle to
> > recover, it puts together the coherent database image using the System
> > Change Number and the blocks in the redo logs (recovery structures) and
> > archive logs.  It's pretty advanced in this regard.
>=20

Yes it is, while quite curious: as you say, once in hot-backup mode
Oracle tables are backuped in an unconsistent manner, but it can recover
to a consistent state because of the fact that though tables change, SCN
markers do not, so redologs -holding the entire block contents, can do
the trick.

> You have the choice in MySQL of locking all tables, or a subset.  If you
> lock a subset, then you'll probably get a partially incoherent snapshot.
>=20

Well yes.  As it usually turns to be even if you can find common groups
of tables that can be locked since no operation crosses its boundaries,
things will change tomorrow without you noting it.  The only safe
asumption is that you can block database by database instead of all
databases at a time... provided you can policy-force there won't be
cross-database operations.

> The lock plus flush actions are fast enough that I think we can use them
> successfully for this purpose.
>=20

They usually are... if there's no code flaws around there.

>=20
> I am doing all my testing on SuSE as well.  We have deployed Red Hat
> in the past, but have not been thrilled with the stability of the
> product.  By the time you get to a X.2 or so, they are fine.  We had

That's why I'm still with RH6.2 and 2.2 kernels.

> problems with installation of binary drivers on Red Hat (they were our
> own drivers!) too, so that also has soured us on it.  We have since
> released our drivers under the GPL, so that isn't as much of an issue,
> but about 75% of the extra work in the configuration and installation
> testing just tests Red Hat specific quirks.  Sigh.
>=20
> I really like the fact that SuSE bundles all this stuff already so
> that I do not have to go hunting all over the place for an RPM that
> might work.  I love source but I don't have time to compile everything
> myself.
>=20

Not being used to the SuSE way, I can't say for sure but it surprises my
that SuSE will do "thingies" regarding drivers on a different way RH
does, or that you have less problems "haunting" RPMs for SuSE than for
RH.
--=20
SALUD,
Jes=EF=BF=BDs
***
jesus_navarro@promofinarsa.es
***
