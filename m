Date: Sat, 23 Sep 2000 02:16:28 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] e2fsadm and fstab
Message-ID: <20000923021627.A5309@gondor.com>
References: <20000923005801.A2164@gondor.com> <200009222352.e8MNq1t18026@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200009222352.e8MNq1t18026@webber.adilger.net>; from adilger@turbolinux.com on Fri, Sep 22, 2000 at 05:51:37PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

On Fri, Sep 22, 2000 at 05:51:37PM -0600, Andreas Dilger wrote:
> This sounds like a bug I added then fixed in my local version of e2fsadm.
> It is not in the original e2fsadm.  I will post a patch and upload a new
> SRPM.

You're right, I'm using the patches from your SRPM.

> Basically, I check /etc/fstab to do mountpoint -> device renaming for
> unmounted filesystems, and /proc/mounts and /etc/mtab for mounted
> filesystems.

BTW, 2.4 allows more than one filesystem mounted on the same mountpoint. Is
this case handled correctly?

Jan
