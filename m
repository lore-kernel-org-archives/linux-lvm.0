Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104032230.f33MUQj17503@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
In-Reply-To: <01040400155200.00918@darkvader> from Diederick van Dijk at "Apr
 4, 2001 00:15:52 am"
Date: Tue, 3 Apr 2001 16:30:26 -0600 (MDT)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Diederick van Dijk writes:
> ]# dd --version
> dd (GNU fileutils) 4.0p
> 
> # strace dd of=/dev/hda2 bs=1 seek=6144 if=/etc/uuids
> open("/dev/hda2", O_RDWR|O_CREAT|O_LARGEFILE, 0666) = 1
> ftruncate64(0x1, 0x1800, 0, 0, 0x1)     = -1 EINVAL (Invalid argument)

Strange, it is trying to truncate the block device!  You need to
add the option "conv=notrunc" to "dd" so that it will not do this.
It really shouldn't try truncating a block device, so maybe this is
a bug?  I don't know if "GNU fileutils 4.0p" is newer or older than
"GNU fileutils 4.0.35".  If you update to the latest fileutils and it
still has this problem, I suggest submitting a bug report.

In any case, it is not so important because you already have your VG back,
but good to know for future reference.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
