From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009230212.e8N2CRL18361@webber.adilger.net>
Subject: Re: [linux-lvm] e2fsadm and fstab
In-Reply-To: <20000923021627.A5309@gondor.com> "from Jan Niehusmann at Sep 23,
 2000 02:16:28 am"
Date: Fri, 22 Sep 2000 20:12:27 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Andreas Dilger <adilger@turbolinux.com>, Linux LVM mailing list <linux-lvm@msede.com>

Jan writes:
> > Basically, I check /etc/fstab to do mountpoint -> device renaming for
> > unmounted filesystems, and /proc/mounts and /etc/mtab for mounted
> > filesystems.
> 
> BTW, 2.4 allows more than one filesystem mounted on the same mountpoint. Is
> this case handled correctly?

Yes, it shouldn't be a problem, because there is only 1 device, so you can
have multiple mountpoint->device mappings, but it is the device (LV) that
has the LVM resizing done on it, and I assume there us still only 1
superblock between all of the mountpoints, so the fs resizing should be OK.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
