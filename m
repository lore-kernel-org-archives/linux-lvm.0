Date: Sat, 23 Sep 2000 08:31:20 +0200
From: Christoph Hellwig <hch@ns.lst.de>
Subject: Re: [linux-lvm] e2fsadm and fstab
Message-ID: <20000923083120.A23012@ns.lst.de>
References: <20000923005801.A2164@gondor.com> <200009222352.e8MNq1t18026@webber.adilger.net> <20000923021627.A5309@gondor.com>
Mime-Version: 1.0
In-Reply-To: <20000923021627.A5309@gondor.com>; from jan@gondor.com on Sat, Sep 23, 2000 at 02:16:28AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Andreas Dilger <adilger@turbolinux.com>, Linux LVM mailing list <linux-lvm@msede.com>

On Sat, Sep 23, 2000 at 02:16:28AM +0200, Jan Niehusmann wrote:
> BTW, 2.4 allows more than one filesystem mounted on the same mountpoint. Is
> this case handled correctly?

It doesn't really support multiple filesystems on one mountpoint. Yes,
you can mount something multoiple times on the same point, but you will
only be able to use the last mounted one. Al Viro is still working on
union mounts.
To prevent the user from doing baad things when resizing I will add support
for detecting multiple filesystem on the same mountpoint to my lvmadm tool.

	Christoph

P.S. to Andreas: those filesystems do not share the superblock.
-- 
Always remember that you are unique.  Just like everyone else.
