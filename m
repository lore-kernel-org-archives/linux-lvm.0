From: jasonf@Cronosys.COM
Message-ID: <20000323114100.A15997@nccr-cle-c.nccrs.com>
Date: Thu, 23 Mar 2000 11:41:00 -0500
Subject: [linux-lvm] Same ole' problem as w/RaidZone (?)
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Okay, I've gotten the volume group to see the whole shootin match worth of
space, but now I'm having another problem: I can't run mke2fs again.  This
happened before when I was using RaidZone's raid stuff (I don't recall if I
posted about that) but, mke2fs fails with "short write", "short read".  When
I tried to mount one the kernel complained "couldn't read superblock 2nd
time".

Current config: 2.2.14 with 0.8i patch, aforementioned raid patch, and
Consensus' RaidZone patch, with the "fault tolerence" option disabled
(in other words, I just see five 40Gb hard drives).  Partition on each
of the drives, then partitions are raid5'd together to make /dev/md0
using software raid, and /dev/md0 is my sole PV in my raid_vg VG.  I 
currently have six or so LVs varying in size from 250Mb to 50Gb, none
of which I can format or mount.  This is the same thing that happened
when my sole PV was /dev/rza (the raidzone device) or /dev/rza1
(a partition on the raidzone device).

Could it be that 0.8i just doesn't work right on 2.2.14?  The notes
on the web site say that 0.8final doesn't work with 2.2.1[45], but that
0.8i works with 2.2.1[34], which doesn't make much sense.

I can downgrade to 2.2.13, but I don't have much more time to play with
this...

Thanks in advance,
-Jason M. Felice
