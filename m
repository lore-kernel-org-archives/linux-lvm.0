Message-ID: <3860D151.21FD732B@twc.de>
Date: Wed, 22 Dec 1999 14:25:37 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: [linux-lvm] booting w/o initrd
Content-Type: multipart/mixed;
 boundary="------------88730411514D390E8CC9830E"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------88730411514D390E8CC9830E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi!

We're searching ppl with some time to try this out...

;-)

Bye!
	Ulf.
--------------88730411514D390E8CC9830E
Content-Type: text/plain; charset=us-ascii;
 name="partition-alias.txt-19991222"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="partition-alias.txt-19991222"

==============================================================================
The Idea (and Definition) of a Partition Alias for a LV
------------------------------------------------------------------------------

Required reading:
LVM-HOWTO
http://www.freenet.de/y.e.t.i./LVM-experimente.txt (sorry, only in german
                                                    at the moment)
sfdisk(8)

Partitions and Logical Volumes
------------------------------

Partitions of disks are normally contiguuous blocks of disk space, starting at
a specific cylinder and ending at another one. 
They allow for addressing raw data blocks by translation through filesystem
facilities. However, this doesn't have to be so with LVM. Since this logical
layer between the raw disk and the filesystem allows for online allocation 
of more disk space it is quite normal that Logical Volumes as counterpart to 
traditional partitions are spread non-contiguuous over the disk(s). This 
poses no threat on an LVM system - it is just normal.

Booting with partitions vs. LVM
-------------------------------

Booting on a PC is a relatively simple thing: the partition only has to be 
flagged bootable and - it has to be contiguuous. 
This is required by all conventional PC Hardware and OSes. Therefore 
different approaches have been done to overcome this limitation, some of them are 
also used to boot the system with LVM activated. This includes initrd with its 
two-phase boot concept as well. But there is another, simpler and easier 
technique to make a system boot with initial LVM support.

Prerequisites
-------------

Imagine a LV lying in some VG of your PV.
This LV has to be allocated in a continuous range of PEs, especially it 
must not cross the border between two disks.  With these requirements 
fullfilled, the LV could be described completely by the number of the its beginning 
sector on the disk and its length in sectors. This information can be obtained by 
looking up the start of the LV relative to the partition which is the PV 
containing this LV and the offset of this partition on your harddisk:

iason:~# pvdisplay -v /dev/sda3
--- Physical Volume ---
PV Name		 	 		 /dev/sda3
VG Name		 	 		 vg00
PV Size		 	 		 9996.22 MB / NOT usable 223 KB [LVM: 121 KB]
PV#		 	 		 1
PV Status				 available
Allocatable		 		 yes
Cur LV		 	 		 7
PE Size	 (KByte)	 		 4096
Total PE		 		 2498
Free PE	 		 		 1043
Allocated PE		 		 1455

		 --- Distribution of physical volume ---
		 LV Name		LE of LV		 PE for LV
		 /dev/vg00/root		2		 		 2

		 --- Physical extents ---
		 PE		 LV		LE	 Disk sector
       		 00000		 /dev/vg00/root 00000	 446
		 00001		 /dev/vg00/root	00001	 8638
iason:~#

Adding the values for the start Disk sector of the LV to the start value 
of the partition in which the LVM lives gives the absolute position of the boot 
sector of the LVM-ized system.
Now imagine entering start (on the disk) and length of this LV in the
partition table of this disk (maybe using sfdisk) as another (normally in 
a LVM system unused) partition.

What would you get?

You could access this LV via an ordinary partition device like /dev/hda1.


Partition Alias and Booting a Linux Installation
------------------------------------------------

Prerequisites:

* you partitioned (nearly) your whole harddisk as one partition with the 
  right ID (0xFE) to be recognized by LVM.

* you created two LVs /dev/vg00/boot and /dev/vg00/root fullfilling the
  requirements mentioned above and a lot of other LVs to contain the other
  filesystems of your linux installation.

* you created partition aliases for /dev/vg00/boot and /dev/vg00/root and
  use only the partition aliases in /etc/lilo.conf and /etc/fstab.

* you put some script to start and stop LVM in some /etc/init.d-script.

So you would be able to boot your root in a conventional way, activate LVM
and mount the other LVs.

And when bringing the system down, LVM can be stopped cleanly because the 
root filesystem is only addressed via the partition alias.


But what if ...
---------------

... you want to resize the root?

It is not much more complicated to do this compared to booting via initrd.
Even when booting via initrd, you cannot resize the root while it is
mounted. So this way is not responsible for the main problem in resizing 
the
root.

Using initrd, you would bring up a initrd with all tools to resize the root
or create another secondary root with all these tools.

Using a partition alias you can do this the same way. The only thing you 
have to remember is to recalculate the values for the partition alias and put 
those in your partition-table again. And even this can be done by a script.

So this is not really a drawback.


Installing...
-------------

Installing a LVM-only system is the main problem even when using an initrd.

If you managed to get a system up with all filesystems in LVs and
temporarily boot using a syslinux-disk with an initrd, creating the
partition aliases is no hard task and the next reboot could succeed without
bootfloppy.

==============================================================================

Ok -- you mean what I know... ;-)

There's a lot to do in getting such a system up and running but it was
sucessfully done with two systems @home as well as with a notebook and another
desktop system. With the notebook system it was also possible to use an LVMized
Linux system in a multiboot- configuration with Windows NT4.0 and Windows 95. 

Comments?

==============================================================================
1999-12-22

Ulf Bartelt, ulf@twc.de
Peter Wuestefeld, pw@resnova.de
==============================================================================


--------------88730411514D390E8CC9830E--
