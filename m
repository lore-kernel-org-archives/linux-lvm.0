Message-ID: <3FCC46F4.5050607@daemons-point.com>
From: Uli Heller <uli@daemons-point.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM2: Problems with "lvextend" on device with mounted filesystem
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
Date: Tue Dec  2 02:10:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

|
| You never told reiserfs that it's partition had increased.  AFAIK
| you can either remount it with the correct parameters or use some
| tool to alert it.
|
| -Wolfgang

Thank you for your reply!
I think you're pretty near to the point but you didn't
get it. Perhaps my explanation was to sparse.

At first, I tried to do the usual steps:
- - lvextend ...
- - resize_reiserfs ...
This did not work. So I was unsure if it is an error
in "reiserfs" or in LVM.

So I tried to figure out another test. The key point of
my test is to use the command "dd" to try to write some data
into the extended part of the LV.

Here is the result:
1. unused LVs (=3D not used by a mounted filesystem):
	You can write into the extended part immediately
	after executung "lvextend"
2. used LVs (=3D used by a mounted filesystem):
	You can not write into the extended part at first!
	You have to "umount" the filesystem!
This is true for linux-2.6.0-test11 and 2.6.0-test5
and LVM2. It is not true for linux-2.4.22-ac4 and LVM1
and various older versions. You can write into the extended
part immediately after executing "lvextend", no matter
wheather the LV is mounted or not.

I think that because of error 2 (it's an
error in my current opinion but perhaps I'm wrong),
I'm not able to do an online resize of the filesystem.

- --
Mit frohem Gru=EF=BF=BDe, Uli Heller
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/zEbzsi63wwMPCzwRAox4AJ9c9E+wVzYyOcPjRENWjse6UZ7y9wCfZIUu
Hx6tLFNuJAq5S+e60uu4+JI=3D
=3DPE2B
-----END PGP SIGNATURE-----
