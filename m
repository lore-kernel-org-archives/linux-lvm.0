From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010231749.e9NHn8s21427@webber.adilger.net>
Subject: Re: [linux-lvm] 2.4.0-test10-pre4 oops with LVM
In-Reply-To: <Pine.LNX.4.21.0010191857290.20436-200000@uyema.net>
 "from Myles Uyema at Oct 19, 2000 07:07:52 pm"
Date: Mon, 23 Oct 2000 11:49:08 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Myles Uyema <myles@puck.nether.net>
Cc: linux-kernel@vger.kernel.org, linux-lvm@msede.com

Myles Uyema writes:
> This kernel panic occurred when I attempted to dump my ext2 filesystem
> /home onto /mnt/ide/backup.  My exact dump command was:
> 
> dump -0 -u -M -f /mnt/ide/backup/home -B 2096128 /home
> 
> I believe dump managed to start reading directories before the oops
> occurred...Haven't been able to duplicate the oops on 2.4.0-test9.

I suppose it is worth asking if this was a regular LV, or a snapshot LV?
If it is a regular LV, then it is very unlikely that it is a LVM
problem, since mostly LVM is just remapping the block number and device.
It is not a very complicated code path.

It appears that the OOPS happened in the VM subsystem and not the LVM
code.  While this may still indicate a problem in LVM, it is more likely
that it is one of the ongoing series of VM bugs that are being fixed.
I would suggest posting your oops report to the linux-kernel and/or
linux-mm lists to see if they can find more about it.  It may already
have been fixed.

One other thing to check is if this was the first oops, or if there was
an earlier one.  It is usually the first oops that is the real problem,
and later ones do not really help much.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
