From: Austin Gonyou <austin@coremetrics.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-lHENg14NhMSBxTM/2R2h"
Message-Id: <1011414567.2241.29.camel@UberGeek>
MIME-Version: 1.0
Subject: [linux-lvm] LVM causing IO contention or slowdown?
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
Date: Fri Jan 18 22:30:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-lHENg14NhMSBxTM/2R2h
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Some disturbing things about LVM I've found. I'm not sure if this has
anything to do with XFS or not, I'm still working on that part.=20

Anyway, I've got an AMI MegaRAID 1600(or so, Dell PERC2/DC, and a Dell
PERC3/DC[also ami/lsi]). I conducted a test with dbench in the following
manner:=20


1. create a 3 drive RAID0 on the PERC.=20
2. mkfs.xfs the new "drive" as the OS sees it. (/dev/sdxx)=20
3. mount /dev/sdxx /mnt/test=20
4. chown austin:austin /mnt/test=20
<login as austin>=20
5. cd /mnt/test=20
6. cp ~/dbench/client.txt .=20
7. dbench 200 (ended up at 29MB/s)=20
8. dbench 150 (ended up at 31MB/s)=20
<login as root>=20
9. umount /mnt/test=20
10. fdisk /dev/sdxx=20
11. 'T' for partition type=20
12. '1' for partition #=20
13. '8e' for LVM and 'w' to save partition config.=20
14. pvcreate /dev/sdxx;vgcreate -Ay testvg /dev/sdxx=20
15. lvcreate -Cy -L 109G -n testlv testvg=20
16. mkxfs.xfs /dev/testvg/testlv=20
17. mount /dev/testvg/testlv /mnt/test=20
18. chown austin:austin /mnt/test=20
<login as austin>=20
19. cp ~/dbench/client.txt .=20
20. dbench 200 (ended up at 54MB/s)=20
21. dbench 150 (ended up at 61MB/s)=20

The disk which was made into a pv you see up there is /dev/sdxx. That
means it was a partition. I also set it to be contiguous. This could be
very bad for the dbench kind of test. I'm not sure. Next I did something
similar to the above, but I removed all partitions from the physical
device and recreated the volume using just /dev/sdx. That said, I
retested just now and got the following:=20

o Throughput 49.733 MB/sec (NB=3D62.1662 MB/sec  497.33 MBit/sec)  200
procs=20
o Throughput 43.5752 MB/sec (NB=3D54.469 MB/sec  435.752 MBit/sec)  150
procs (not sure about why this is)=20

and then on a whim...=20

o Throughput 37.4975 MB/sec (NB=3D46.8719 MB/sec  374.975 MBit/sec)  250
procs=20
and again...=20
o Throughput 43.4332 MB/sec (NB=3D54.2916 MB/sec  434.332 MBit/sec)  150
procs=20

Either way, these results are a far cry from what was shown above using
Contiguous on a partition, instead of a whole disk. If there's a way to
improve this, Please advise.

And then I removed the volume from LVM control, and tested again:=20

o Throughput 51.2596 MB/sec (NB=3D64.0745 MB/sec  512.596 MBit/sec)  200
procs
oThroughput 52.0488 MB/sec (NB=3D65.061 MB/sec  520.488 MBit/sec)  150
procs

Not as huge a jump as last night, but still rather far above what it is
with LVM turned on.=20

Anyone know why this might be?


On Fri, 2002-01-18 at 17:08, karlheg@microsharp.com wrote:=20
>=20
>  I had visions of using XFS on LVM volumes for our product.  I would
>  like to start with some default LV sizes, and have the ability to
>  shrink and grow them as needed to meet individual requirements.  For
>  this, I will need to use ext3fs.  (and very stable LVM; still
>  learning about it.)
--=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-698-7250
email: austin@coremetrics.com

"It is the part of a good shepherd to shear his flock, not to skin it."
Latin Proverb

--=-lHENg14NhMSBxTM/2R2h
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA8SPYn94g6ZVmFMoIRAig7AKDWWkHoTf56J6cPie8OrNucf9Yo6wCgsq73
j79BpctcLa3xYJJSkeRjarI=
=9ir0
-----END PGP SIGNATURE-----

--=-lHENg14NhMSBxTM/2R2h--
