Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLLrDr28541
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 16:53:13 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBLLr7WN002393
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 16:53:07 -0500
Subject: Re: [linux-lvm] Can't mount after crash
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20041221211015.GS26670@agk.surrey.redhat.com>
References: <41BB808E.60108@danielroth.se> <41BFC24F.6060207@danielroth.se>
	<41C1D30A.6030201@danielroth.se>
	<1103222964.31909.224.camel@tesuji.nac.uci.edu>
	<20041221211015.GS26670@agk.surrey.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-9Ft+k2ylAfFVzCRojKtM"
Date: Tue, 21 Dec 2004 13:53:04 -0800
Message-Id: <1103665984.11479.45.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-9Ft+k2ylAfFVzCRojKtM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-12-21 at 21:10 +0000, Alasdair G Kergon wrote:
> On Thu, Dec 16, 2004 at 10:49:24AM -0800, Dan Stromberg wrote:
> > ext3 users list,=20
>=20
> But you tried to mount it as ext2?
>=20
> Is it meant to be ext2 or ext3?

It's ext3, but ext2 tools are supposed to often work on ext3 -
especially if you're applying them to a -copy- of your data.  :)

> > and don't seem to be getting satisfaction.
>=20
> Probably because you're not giving people all the information they need
> to help you; and maybe even some of the things you've tried have made
> the problem worse - I don't understand yet why you did the pvcreates,
> for example, and are you certain the lvm2 backup file you used was=20
> completely up-to-date? =20

I have my data back now. As a reminder, what I did was:

On FC3's rescue disk...

1) Do startup network interfaces
2) Don't try to automatically mount the filesystems - not even readonly
3) lvm vgchange --ignorelockingfailure -P -a y
4) fdisk -l, and guess which partition is which based on size: the small
one was /boot, and the large one was /
5) mkdir /mnt/boot
6) mount /dev/hda1 /mnt/boot
7) Look up the device node for the root filesystem
in /mnt/boot/grub/grub.conf
8) A first tentative step, to see if things are working: fsck -
n /dev/VolGroup00/LogVol00
9) Dive in: fsck -f -y /dev/VolGroup00/LogVol00
10) Wait a while...  Be patient.  Don't interrupt it
11) Reboot

> Have you a kept a complete log (i.e. shell history) of every command=20
> you ran on the system while trying to recover things?

Nope, but all seems fine now.

Thanks!


--=-9Ft+k2ylAfFVzCRojKtM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBByJtAo0feVm00f/8RAjAPAJ9qw1Jyu7xc11qfN7osmdR9ojqVawCgmdz6
g+sNNd2oIJHV0F/sPfICrp4=
=IRIi
-----END PGP SIGNATURE-----

--=-9Ft+k2ylAfFVzCRojKtM--
