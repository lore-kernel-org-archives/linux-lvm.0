Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5B8b3Wj012280
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 04:37:03 -0400
Received: from thunderbird6.fab.redhat.com (vpn-6-32.fab.redhat.com
	[10.33.6.32])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m5B8b28J022240
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 04:37:03 -0400
Message-ID: <484F8DD5.6010901@redhat.com>
Date: Wed, 11 Jun 2008 09:33:25 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] which volume is a file on?
References: <c873553d0806101602w30ce13d5o8daf3a02dfc34eb5@mail.gmail.com>
In-Reply-To: <c873553d0806101602w30ce13d5o8daf3a02dfc34eb5@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Zarthan South wrote:
> Is there a utility or a simple way to determine which volume a file is located on.

That's more of a file system question than an LVM question and it's no
different than any other type of device: find the mount point of the
file system containing the file and then consult /proc/mounts or the
output of the mount command to determine what LV the file is on.

If you want to know where the data blocks are located physically you'll
need to do a bit more work: find the inode location, determine what
block ranges are allocated to it and then figure out how they map to
physical device regions using e.g. lvdisplay --maps. The details for
this step depend on the file system type you are using. For ext2/3 you
can determine the physical location of a file's data blocks using degbugfs.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkhPjdUACgkQ6YSQoMYUY97/MwCgiyszlwRO/oYMR6ABbiITOeBU
pnMAn3JLz1XNFbVlqx2KGJsgGWfhdhYk
=MHes
-----END PGP SIGNATURE-----
