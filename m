Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3S9vZv10124
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 05:57:35 -0400
Received: from nestor.kbinirsnb.be (nestor.kbinirsnb.be [193.190.234.10])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3S9vW99020373
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 05:57:33 -0400
Received: from bernie.kbinirsnb.be (root@bernie.kbinirsnb.be [192.168.20.4])
	by nestor.kbinirsnb.be (8.12.11.Beta0/8.12.11.Beta0/Debian-1) with
	ESMTP id i3S9vH45028692
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 11:57:17 +0200
Received: from naturalsciences.be (PC20_115 [192.168.20.115])
	by bernie.kbinirsnb.be (8.12.11.Beta0/8.12.11.Beta0/Debian-1) with
	ESMTP id i3S9vIwc013320
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 11:57:18 +0200
Message-ID: <408F7FF9.5020603@naturalsciences.be>
Date: Wed, 28 Apr 2004 11:57:13 +0200
From: Paul Libert <Paul.Libert@naturalsciences.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with EXT filesystem on LVM2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dears,

I'm facing the following problem :
When I try to create an EXT3 filesystem on a LVM2 logical volume, the 
system end up frozen, in 100% wio state.
Accessing already existing EXT3 FS gives no problem.
If  I try to resize a EXT3 FS via 'resize2fs', I got the same behaviour.
Creating a EXT3 FS on a raw partition works without problem.
Creating a Reiser3 or Reiser4 or XFS FS on a LVM2 logical volume also works.
fsck of an existing EXT3 partition on LVM2 also works

System is a HP DL380 with a external diska array also from HP. SCSI 
controller is a HP5xxx using hardware RAID (configured for the RAID5 ADG 
mode)
Distribution is Debian/Testing with 2.6.3 stock kernel. All packages are 
also from Debian/Testing (nothing external, nothing recompiled)
LVM version:     2.00.08 (2003-11-14)
Library version: 1.00.07-ioctl (2003-11-21)
Driver version:  4.0.0
mke2fs 1.35 (28-Feb-2004), Using EXT2FS Library version 1.35

I can provide strace of :
mkfs.ext3 (failed)
resize2fs (failed)
mkfs.resierfs (successfull)
mkfs.reiser4 (successfull)

Quick look at the starce seems to show that it blocks in a 'fsync' call.

Actually, I've succeded in creating a new EXT3 FS on LVM2 using 
following trick :
- dd an existing, smaller EXT3 FS to the LVM2 logical volume
- resize2fs this FS -> it stuck the system in frozen, 100% wio state
- reboot the system
- do a fsck on the problematic FS
This seems to work without bad effect but, hell, it's not very elegant ...

Any hint or information will be greatly apreciated.

Best regards.

Paul
