Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9CHxcV19773
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2005 13:59:38 -0400
Received: from slcexch.CYBERKINETICSINC.COM (67-42-21-33.slkc.qwest.net
	[67.42.21.33] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9CHxZID024394
	for <linux-lvm@redhat.com>; Wed, 12 Oct 2005 13:59:35 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 12 Oct 2005 11:59:19 -0600
Message-ID: <26F201282709AA4895C203A194DA57DB4ED8EE@slcexch.cyberkineticsinc.com>
From: "Kirk Korver" <kkorver@CYBERKINETICSINC.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to turn LVM off 
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I'm using FC4 as a base for an embedded instrument. When the instrument
goes out the door, it has a 256 MB flash card for the hard drive, and a
Pentium 4M motherboard. Also, there will never be a keyboard, nor a
monitor.

During development, there is a SATA hard drive with all of FC4 on it,
and it is currently using LVM.

My task is to prepare a bootable, flash card. Next remove the hard drive
and have the system work.

Here is what I do:
1) fdisk /dev/hdc (the flash card is hdc)
2) In fdisk, create a single large linux partition (don't need any swap
space) and active this partition.

Create the file system
3) mke2fs /dev/hdc1
4) tune2fs -c 0 /dev/hdc1

5)Copy over the files I need (I'll give a set if you want, but its
enough to make linux happy).
6)copy over my custom  rc.sysinit, since I want to have exact control
over how the system boots

7) Install grub. I'll give the details:
	grup --no-floppy
	   device (hd0) /dev/hdc
	   root (hd0,0)
         setup (hd0)

8) Grup is happy. And says so
9) Edit grub.conf so the kernel is at /boot/.....
10) Edit the fstab to mount /dev/hdc1  on /

Turn the power off, and remove the SATA hard drive:

Now the problem
Grub starts, and finds my kernel
The kernel starts.
Redhat nash starts. Then I get the following messages.
 Reading all physical volumes. This may take a while...
 Aborting - please provide new pathname for what used to be /dev/hdc1
 No volume groups found
 Unable to find volume group "VolGroup00"
ERROR: /bin/lvm exited abnormally with value 5
ext3: No journal on filesystem on hdc1
Mount: error 22 mounting ext3
ERROR opening /dev/console!!!!: 2
error dup2'ing fc of 0 to 0
error dup2'ing fc of 0 to 1
error dup2'ing fc of 0 to 2
Switchroot: mount failed:22
Kernel panic - not syncing: Attempted to kill init!



I see it is asking about VolGroup00. This is LVM stuff. I don't want LVM
on the card. What is really weird is that all of this is happening
before the rc.sysinit is started. I don't find any command line options
to the kernel to turn LVM off. All of the LVM options are "modules" when
I built my kernel.

So my question is quite simply,
What do I have to do so that LVM is NOT used?? Any other options?

--Kirk


Kirk Korver
email: kkorver cyberkineticsinc com
