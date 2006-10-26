Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9QKJOAt007287
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 16:19:24 -0400
Received: from cel.leo (cel.leonerd.org.uk [62.49.94.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9QKHq5b005474
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 16:17:52 -0400
Received: from nim.leo (nim.leo [192.168.42.3])
	by cel.leo (Postfix) with ESMTP id A323822681
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 21:17:43 +0100 (BST)
Date: Thu, 26 Oct 2006 21:17:38 +0100
From: Paul LeoNerd Evans <leonerd-lvm@leonerd.org.uk>
Message-ID: <20061026211738.008da405@nim.leo>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_j0y6GZnE.3m4CdSi4lh91qd;
	protocol="application/pgp-signature"; micalg=PGP-SHA1
Subject: [linux-lvm] Mirror resync direction
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
To: linux-lvm@redhat.com

--Sig_j0y6GZnE.3m4CdSi4lh91qd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I'm running kernel 2.6.17 using the lvm2 package currently in debian
testing (2.02.06-3). I use it to set up a VG containing two
PVs, /dev/sda2 and /dev/sdb2. I create a mirror LV using corelog:

  lvcreate --mirror 1 --corelog ...

I create a filesystem on it, and populate it with files. I then try
testing how it copes with drive failures, by simulating a replaced disk.

To do this, I zero out one of the sides using=20

  dd if=3D/dev/zero of=3D/dev/sda2

Having done that, I do the usual restore method

  pvcreate --uuid 'whatever' /dev/sda2
  vgcfgrestore vg
  vgchange -a y

And I note that it starts to resync the mirror. But it goes in the
"wrong" direction - sda2's PV is the master, but that's been zeroed out.
sdb2's is the slave but contains the real data. The block copying goes in
the wrong direction here, copying the master's zeroes over the good data
in the slave.

Is this a bug in the LVM2 tools, or the dm-mirror target, or what? Is it
perhaps a limitation of --corelog; in which case, how can I protect
against that?


--=20
Paul "LeoNerd" Evans

leonerd@leonerd.org.uk
ICQ# 4135350       |  Registered Linux# 179460
http://www.leonerd.org.uk/

--Sig_j0y6GZnE.3m4CdSi4lh91qd
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFQRfmqRXzCRLr5iQRAnxWAJ0RE8XP1ossEtIS4/7zc7d2U3f9GACaArNW
hzRGrmQ+FZiXkD9HaCTDN8I=
=onzZ
-----END PGP SIGNATURE-----

--Sig_j0y6GZnE.3m4CdSi4lh91qd--
