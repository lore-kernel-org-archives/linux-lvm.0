Date: Wed, 23 Aug 2000 16:29:57 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: [linux-lvm] LVM and sw RAID1
Message-ID: <20000823162957.B8398@gospelcom.net>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I am having a really difficult time being able to get LVM to recognize my
/dev/md[012] arrays. The system:

  (pcg@dmna) ~> uname -a
  Linux dmna 2.4.0-0.21 #2 Wed Aug 23 11:46:12 EDT 2000 i686 unknown
  
  (pcg@dmna) ~> cat /proc/lvm
  LVM driver version 0.8final  (15/02/2000)

  Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
  Global: 143 bytes malloced   IOP version: 6   4:01:56 active
  
  (pcg@dmna) ~> cat /proc/mdstat 
  Personalities : [linear] [raid0] [raid1] [raid5] 
  read_ahead 1024 sectors
  md2 : active raid1 sdg1[1] sdd1[0]
        17920384 blocks [2/2] [UU]
	      
  md1 : active raid1 sdf1[1] sdc1[0]
        35840896 blocks [2/2] [UU]

  md0 : active raid1 sde1[1] sdb1[0]
        17936448 blocks [2/2] [UU]

(User-space tools are 0.8final+0.8final-2 patch. /dev/sda is on a BusLogic
BT-958, while sd[b-g] are on two separate channels of an Adaptec 39160.)
Here is the symptom:

  (pcg@dmna) ~> sudo pvcreate /dev/md0
  pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

  (pcg@dmna) ~> sudo pvcreate /dev/md1
  pvcreate -- invalid partition type 0x83 for "/dev/md1" (must be 0x8e)

  (pcg@dmna) ~> sudo pvcreate /dev/md2
  pvcreate -- can't use DOS extended partition "/dev/md2"

Just for completeness:

  (pcg@dmna) ~> sudo pvcreate -f /dev/md0
  pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

  (pcg@dmna) ~> sudo pvcreate -ff /dev/md0
  pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

  (pcg@dmna) ~> sudo pvcreate -f /dev/md1
  pvcreate -- invalid partition type 0x83 for "/dev/md1" (must be 0x8e)

  (pcg@dmna) ~> sudo pvcreate -ff /dev/md1
  pvcreate -- invalid partition type 0x83 for "/dev/md1" (must be 0x8e)

  (pcg@dmna) ~> sudo pvcreate -f /dev/md2
  pvcreate -- can't use DOS extended partition "/dev/md2"

  (pcg@dmna) ~> sudo pvcreate -ff /dev/md2
  pvcreate -- can't use DOS extended partition "/dev/md2"

What I don't understand is how those partition types got associated with my
/dev/md? devices. Some more output:

  (pcg@dmna) ~> sudo lvmdiskscan 
  lvmdiskscan -- reading all disks / partitions (this may take a while...)
  lvmdiskscan -- /dev/sda1 [      15.66 MB] Primary  LINUX native partition [0x83]
  lvmdiskscan -- /dev/sda2 [       8.53 GB] DOS extended partition [0x5]
  lvmdiskscan -- /dev/sda5 [     258.83 MB] Extended LINUX swap partition [0x82]
  lvmdiskscan -- /dev/sda6 [       8.28 GB] Extended LINUX native partition [0x83]
  lvmdiskscan -- /dev/sdb1 [      17.11 GB] Primary   [0xFD]
  lvmdiskscan -- /dev/sdc1 [      34.18 GB] Primary   [0xFD]
  lvmdiskscan -- /dev/sdd1 [      17.09 GB] Primary   [0xFD]
  lvmdiskscan -- /dev/sde1 [      17.11 GB] Primary   [0xFD]
  lvmdiskscan -- /dev/sdf1 [      34.18 GB] Primary   [0xFD]
  lvmdiskscan -- /dev/sdg1 [      17.09 GB] Primary   [0xFD]
  lvmdiskscan -- /dev/md1  [      15.66 MB] Primary  LINUX native partition [0x83]
  lvmdiskscan -- /dev/md2  [       8.53 GB] DOS extended partition [0x5]
  lvmdiskscan -- 7 disks
  lvmdiskscan -- 0 whole disks
  lvmdiskscan -- 0 loop devices
  lvmdiskscan -- 0 multiple devices
  lvmdiskscan -- 0 network block devices
  lvmdiskscan -- 10 partitions
  lvmdiskscan -- 0 LVM physical volume partitions

As you can see, there are some pretty weird entries for /dev/md[12] and
*nothing* for /dev/md0. lvmdiskscan also doesn't detect any multiple
devices, which doesn't seem right. (/dev/md0 and /dev/md2 are mirrors of two
18GB disks, while /dev/md1 is a mirror of two 36GB disks.) Interestingly
(and I just noticed this) the output for /dev/md1 matches that of /dev/sda1,
while the output for /dev/md2 matches /dev/sda2.

Any idea of what's going on and how to fix it? Is there any other
information I can provide to help?

Thanks!

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
> > Other than the fact Linux has a cool name, could someone explain why I
> > should use Linux over BSD?
>
> No.  That's it.  The cool name, that is.  We worked very hard on
> creating a name that would appeal to the majority of people, and it
> certainly paid off: thousands of people are using linux just to be able
> to say "OS/2? Hah.  I've got Linux.  What a cool name".  386BSD made the
> mistake of putting a lot of numbers and weird abbreviations into the
> name, and is scaring away a lot of people just because it sounds too
> technical.
(Linus Torvalds' follow-up to a question about Linux)
