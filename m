From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009222352.e8MNq1t18026@webber.adilger.net>
Subject: Re: [linux-lvm] e2fsadm and fstab
In-Reply-To: <20000923005801.A2164@gondor.com> "from Jan Niehusmann at Sep 23,
 2000 00:58:01 am"
Date: Fri, 22 Sep 2000 17:51:37 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Jan writes:
> Is the following behaviour wanted?
> 
> If a filesystem is listed in /etc/fstab, but currently not mounted, e2fsadm
> checks for the availability of ext2online, and if it doesn't find it, it 
> aborts with an error message. The check is in e2fsadm.c, lines 275ff.

This sounds like a bug I added then fixed in my local version of e2fsadm.
It is not in the original e2fsadm.  I will post a patch and upload a new
SRPM.

Basically, I check /etc/fstab to do mountpoint -> device renaming for
unmounted filesystems, and /proc/mounts and /etc/mtab for mounted
filesystems.  It's no great loss if you simply remove /etc/fstab from
the list in e2fsadm of places to check for devices/filesystems for now.
It just means you need to give the LV name always instead of optionally
giving the mountpoint.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
