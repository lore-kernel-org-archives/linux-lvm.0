Date: Sat, 23 Sep 2000 12:16:23 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] e2fsadm and fstab
Message-ID: <20000923121622.A1529@gondor.com>
References: <20000923005801.A2164@gondor.com> <200009222352.e8MNq1t18026@webber.adilger.net> <20000923021627.A5309@gondor.com> <20000923083120.A23012@ns.lst.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000923083120.A23012@ns.lst.de>; from hch@ns.lst.de on Sat, Sep 23, 2000 at 08:31:20AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>, Linux LVM mailing list <linux-lvm@msede.com>

On Sat, Sep 23, 2000 at 08:31:20AM +0200, Christoph Hellwig wrote:
> It doesn't really support multiple filesystems on one mountpoint. Yes,
> you can mount something multoiple times on the same point, but you will
> only be able to use the last mounted one. Al Viro is still working on
> union mounts.

Yes I know. 
	mount /dev/a /mnt/
	mount /dev/b /mnt/

now ls /mnt/ shows the contents of device b.

/proc/mounts shows both mounts. If I use e2fsadm on /mnt/, which one
of the filesystems should be resized? 

Probably it should say someting like '/mnt/ is ambiguous' and do 
nothing. Currently, it picks the first one, which is actually invisible
in the filesystem. This is not the expected behaviour, I think.

Jan
