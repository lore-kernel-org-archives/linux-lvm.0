From: mschout@gkg.net
Date: Fri, 5 Nov 1999 11:55:13 -0600 (CST)
Subject: [linux-lvm] Is LVM work ongoing?
Message-ID: <Pine.LNX.4.10.9911051146040.1112-100000@cdm-24-019.tca.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi.

I posted earlier this week about problems using LVM 0.7 with 2.2.12 on top of a
raid5 device using the latest software raid patches (19990824).  After hours of
searching newsgroups and mailing list archives, it appears that either 1)
nobody else has tried this, or 2) it just plain does not work.

I also notice that there has not been any new RAID patches or any new LVM
patches in quite some time.  The latest news on http://linux.msede.com/lvm is
one month ago.  The latest kernel patch is about 3 months old, and conflicts
with the raid patches out of the box.  I know alan cox included the LVM patches
in 2.2.10-acX somewhere along the line, but I notice that he has backed LVM out
of his patches, and does not even have it on the list of features he is
considering adding anymore.  Also, the traffic on the mailing list is very
light, so it appears that not much is going on in terms of development
with LVM.  

I would love to try to fix some of the problems I am seeing, but I dont have
enough of an understanding of what is happening that is causing the problems I
am seeing (hang in mkfs).  My guess is that something is terribly wrong in
either ll_rw_blk.c, or md.c..  But since the machine just hangs with no ooops,
panic, or anything else, its kind of hard to know what is going on.  If I knew
more about what is going on in ll_rw_blk.c, I might take a stab at trying to
unravel this, but I am not familiar with it yet.

And I dont want to spend weeks trying to dig into this if LVM has been
abandoned and will never make it into the kernel.  So is LVM work still going
on, or is it pretty much on the shelf for now?    If there is still work going
on, I may try to dig into this probelm, but I dont want to waste my time
otherwise :).

Thanks,
Mike
