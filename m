Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j23LltK22095
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 16:47:55 -0500
Received: from anchor-post-32.mail.demon.net (anchor-post-32.mail.demon.net
	[194.217.242.90])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j23LlrKx002972
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 16:47:54 -0500
Date: Thu, 3 Mar 2005 21:47:32 +0000
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] df doesn't display increased available disk space
Message-ID: <20050303214732.GD4141@pob>
References: <1109885756.6400.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline
In-Reply-To: <1109885756.6400.16.camel@localhost.localdomain>
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
To: robert.buick@btconnect.com, LVM general discussion and development <linux-lvm@redhat.com>


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2005 at 09:35:55PM +0000, Robert Buick wrote:
> I'm running Fedora Core 3 with LVM2, and have added /dev/hda4 (13.09GB)
> to the VG, however this increase is not reflected if I do a df -h. Have
> I missed something?

Yes - you need to resize the filesystem as well.

If you are using an ext2 or ext3 filesystem you could use resize2fs. If you
are using reiserfs, you could use resize_reiserfs. I don't know about resize
tools for other filesystems.

Please note that resize2fs in Fedora Core 3 is buggy, and may corrupt the
resize inode. To get a version that works better, I recommend you download =
and build
from source e2fsprogs 1.36 from http://prdownloads.sourceforge.net/e2fsprog=
s/e2fsprogs-1.36.tar.gz

(If you wanted to avoid using resize2fs altogether, you could of course
backup all your data in /, mke2fs the root filesystem, and copy all the data
back again. But that would be much slower.)
--=20
Robin

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFCJ4X0tPCt67UksSYRAlllAKDbsuXbqYwWeW9FAcuGQG5gHO7qrwCfXNa0
2nbdjIeyWYNGF+lVMz2I8bA=
=2eWM
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
