Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JM3g9E010283
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:03:42 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8JM3V6u007128
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:03:32 -0400
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 4A5BA12EDE
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 23:03:25 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] LVM on RAID
Date: Tue, 19 Sep 2006 23:03:11 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
Message-Id: <20060919220325.4A5BA12EDE@bluewhale.planbit.co.uk>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

I've run LVM on top of hardware raid (Areca SATA system with 8 drives in
RAID-6) as well as LVM on top of software RAID-1 and RAID-5  (both IDE and
SATA).  LVM has been no less reliable in this configuration than in any
other.  IMHO, running LVM over RAID makes absolute sense.  My preferred
installation on a Linux box is to run s/w RAID-1 or RAID-5 with LVM on top
and boot directly into an LVM root partition with initrd.  I put a small
(64MB) boot partition on each drive in the RAID array with an identical boot
image and then any drive can boot into the kernel + initrd and start the
RAID+LVM+root.  I've never tried it with more sophisticated RAIDs such as
your Fibre or SCSI

As always, your mileage may vary, but [IDE|SATA]+[HW|SW]RAID+LVM has worked
very well for me.

- Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alexander Lazarevich
> Sent: 19 September 2006 22:54
> To: LVM general discussion and development
> Subject: [linux-lvm] LVM on RAID
> 
> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which
> are currently single devices on our 64bit linux servers (RHEL-4, core5).
> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I
> don't doubt the reliability and robustness of LVM2 on single drives, but I
> worry about it on top of RAID devices.
> 
> Does anyone have any experience with LVM on to of RAID volumes, positive
> or negative?
> 
> Thanks,
> 
> Alex
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
