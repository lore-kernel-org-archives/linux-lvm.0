Message-ID: <3A1AD7FF.84904C52@wrkhors.com>
Date: Tue, 21 Nov 2000 14:15:59 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] What if...
References: <200011211835.eALIZ9j20425@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


> > If I have a VG over 3 harddisks and one logical volume using all the VG
> > space, then what will happen if one harddisk fails? Is the whole date lost,
> > or only the data which was stored on the failed disk?
> 
> If you have ext2 on the disks, and the last one fails then you _may_ be
> able to get back most of the data on the first two disks.  However, it is
> a lot easier to get your data back from a backup.  You can use RAID 5 to
> help with single disk failures, but it still isn't a substitute for a
> backup.

common habit w/ LVM systems is to have LV's spread over multple
PV's.  common use of LVM is to make nice, big, juicy LV's to use
up all the PV's.

q.e.d., RAID is pretty much a necessity.  given linux' 4k page
size, a 1K chunk on 4 drives running RAID-5 gives nice performance
and lets you spread out the LV's w/ impunity [somewhat :-].

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
