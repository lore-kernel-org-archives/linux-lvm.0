Date: Wed, 23 Aug 2000 19:48:47 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000823194847.D8398@gospelcom.net>
References: <20000823162957.B8398@gospelcom.net> <200008232200.e7NM0oI22048@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200008232200.e7NM0oI22048@webber.adilger.net>; from adilger@turbolinux.com on Wed, Aug 23, 2000 at 04:00:49PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

Thanks for the response,

also sprach adilger:
> Peter Green writes:
> > I am having a really difficult time being able to get LVM to recognize my
> > /dev/md[012] arrays.
> 
> What does /proc/partitions show you?  What about cfdisk -P s /dev/sdX for
> each drive?

/proc/partitions:
  major minor  #blocks  name

     8     0    8965347 sda
     8     1      16033 sda1
     8     2          1 sda2
     8     5     265041 sda5
     8     6    8683101 sda6
     8    16   17942584 sdb
     8    17   17936541 sdb1
     8    32   35843684 sdc
     8    33   35840983 sdc1
     8    48   17921835 sdd
     8    49   17920476 sdd1
     8    64   17942584 sde
     8    65   17936541 sde1
     8    80   35843684 sdf
     8    81   35840983 sdf1
     8    96   17921835 sdg
     8    97   17920476 sdg1
     9     0   17936448 md0
     9     1   35840896 md1
     9     2   17920384 md2

cfdisk:
  [root@dmna /root]# cfdisk -P s /dev/sdb
  Partition Table for /dev/sdb
  
              First    Last
   # Type     Sector   Sector   Offset  Length   Filesystem Type (ID)   Flags
  -- ------- -------- --------- ------ --------- ---------------------- ---------
   1 Primary        0 35873144      63 35873145  Linux raid autode (FD) None (00)

It's the same for all six of the drives, except for last sector and length.
The first drive is obviously different, having the root fs on it:

  [root@dmna /root]# cfdisk -P s /dev/sda
  Partition Table for /dev/sda
  
              First    Last
   # Type     Sector   Sector   Offset  Length   Filesystem Type (ID)   Flags
  -- ------- -------- --------- ------ --------- ---------------------- ---------
   1 Primary        0    32129      63    32130  Linux (83)             Boot (80)
   2 Primary    32130 17928539       0 17896410  Extended (05)          None (00)
   5 Logical    32130   562274      63   530145  Linux swap (82)        None (00)
   6 Logical   562275 17928539      63 17366265  Linux (83)             None (00)

> >   (pcg@dmna) ~> sudo pvcreate /dev/md0
> >   pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)
> 
> Have you tried doing this directly as root?  I'm not sure if it makes a
> difference, but it is worth trying.

Same result:

[root@dmna /root]# pvcreate /dev/md0
pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

[root@dmna /root]# pvcreate -f /dev/md0
pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

[root@dmna /root]# pvcreate -ff /dev/md0
pvcreate -- invalid partition type 0x83 for "/dev/md0" (must be 0x8e)

> Have you applied the fixes from "BUGS" to the LVM tools?

In the BUGS list:

* ``patch-lvm_0.8final-2    - patch against LVM 0.8final user mode tools'':
  I applied this.
* ``If you compile devfs into the kernel...'': Not applicable, no devfs.
* ``Arjan Filius noted the following problem with kernel version
  2.3.99-pre[23]'': Not applicable, not my kernel *plus* this was a compile
  problem, with which I had no difficulty.
* ``Jorg de Jong[...]detected a bug...'': I can't even get this far.
* ``in LVM 0.8e (4/1/2000) (shipped with SuSE 6.4)...'': Not my version, not
  my OS, not the problem I'm seeing. :)
* ``Harald Milz[...]discovered a bug with pvdisplay'': Ditto (not the
  problem I'm seeing).

I was pretty careful about checking everything out before-hand. That's why
I'm so baffled. It seems like pvcreate shouldn't even be looking for a
partition type for MD, right?

Anyway, thanks for the help thus far!

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
Microsoft is not the answer.
Microsoft is the question.
NO (or Linux) is the answer.
(Taken from a .signature from someone from the UK, source unknown)
