Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
References: <200201020451.g024pPg00867@oss.sgi.com>
    <E16Md6L-0007pY-00@hermes.sistina.com> <20020104163939.C12868@lynx.no>
In-Reply-To: <20020104163939.C12868@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16MgH4-0002SD-00@hermes.sistina.com>
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
Date: Fri Jan  4 20:10:02 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolabs.com>
Cc: Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sat, 5 Jan 2002 09:39, Andreas Dilger wrote:
> Can you repeat this test, but skip the ext3 snapshot creation part of it
> entirely (i.e. create a reiserfs snapshot and an XFS snapshot, without
> changing the kernel)?  I'm wondering if XFS is getting an old inode that
> ext3 was using, but either ext3 or XFS is not clearing it, so that is why
> it is calling into ext3.  Also, are you using ext3 on other filesystems in
> this computer?
>
> Cheers, Andreas

Yes there are other volumes using ext3.
/boot			    20M	ext3
/			   512M	ext3
/usr			   512M	ext3
/var			   512M	ext3
swap			   768M
/tmp			   128M	reiserfs  LVM
/cache			   512M	reiserfs  LVM
/chroot			   512M	ext3	LVM
/usr/src			  4096Mreiserfs	LVM
/data			   ~30G	xfs	LVM

the tests are done on /chroot for ext3,
/usr/src for resierfs & /data for xfs.

I can skip the ext3 snapshot creation part - each test is done on its own 
logical volume; however, in the dark dim past any of these could have had 
other filesystems on them.
Does this sound sensible?
1)	Run tests without doing the ext3 snapshot creation, then
2)	dd the entire lv that is giving problems and try again?

Thanks for your time & effort.

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NmEb8ZJI8OvSkAcRAiJGAJ9SeL5O399a56EQc2hOu3KbAlTsngCgksF+
y/yKm/SxB7lji0XMLXaAQXo=
=DRn3
-----END PGP SIGNATURE-----
