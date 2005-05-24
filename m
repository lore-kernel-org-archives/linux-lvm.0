Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4OD8RO26620
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 09:08:27 -0400
Received: from caduceus2.gmu.edu (caduceus2.gmu.edu [129.174.0.41])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4OD8PZJ013272
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 09:08:25 -0400
Received: from localhost ([129.174.245.143])
	by caduceus2.gmu.edu (Sun Java System Messaging Server 6.2-2.05 (built
	Apr 28
	2005)) with ESMTPSA id <0IGZ00BWKWHW00B0@caduceus2.gmu.edu> for
	linux-lvm@redhat.com; Tue, 24 May 2005 09:08:20 -0400 (EDT)
Date: Tue, 24 May 2005 09:08:19 -0400
From: Jozsef Bakosi <jbakosi@gmu.edu>
Message-id: <20050524130819.GA10277@debian>
MIME-version: 1.0
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary=NzB8fVQJ5HfG6fxh
Content-disposition: inline
Subject: [linux-lvm] No volume groups found at boot
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


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I have

LVM version:     2.01.04 (2005-02-09)
Library version: 1.01.00-ioctl (2005-01-17)
Driver version:  4.1.0

with two working volume groups on an AMD64 Athlon running kernel version
2.6.8 (root@backup) (gcc version 3.3.5 (Debian 1:3.3.5-12)) #1 Fri May 13
08:54:18 EDT 2005 with Debian sarge.

The problem is that /etc/init.d/lvm doesn't find the volume groups at
boot, thus /etc/init.d/checkfs.sh (the next script) stops for
maintenance because it can't find the volumes.

The disks are SATA and all nicely recongized before the init-lvm script
starts (by enforcing the loading of their drivers in /etc/modules).

After boot, I can do "vgscan" and "vgchange -a y", finding the volumes no
problem and can mount them as well.

The strangest thing is when I insert a "/sbin/sulogin $CONSOLE" right
before

/sbin/vgscan $IGNORELOCKINGFAILURES $MKNODES || true
/sbin/vgchange -a y $IGNORELOCKINGFAILURES

in /etc/init.d/lvm and do vgscan and vgchange manually, it works fine.

So what is the difference in between running a command from a script in
/etc/rcS.d/ and mannually from command line?

Jozsef

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCkydDwu2S2Awqe+MRAmehAJ0WKwBsSi3eFj5FJbvFPMTOCSyi9gCfXf4G
ebPSwhoeVCGkfjcOmOs0Ano=
=Ouop
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
