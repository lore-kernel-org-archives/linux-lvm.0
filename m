Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EEQdqq013051
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 10:26:39 -0400
Received: from alnrmhc12.comcast.net (alnrmhc12.comcast.net [204.127.225.92])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7EEQTVb015082
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 10:26:29 -0400
From: "Greg Hartzog" <glhartzog@comcast.net>
Subject: RE: [linux-lvm] LVM2 on dmraid -- can't boot
Date: Mon, 14 Aug 2006 10:24:15 -0400
Message-ID: <000501c6bfad$52285460$640a0a0a@laptopoptimus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <uu05q3b1r.fsf@boost-consulting.com>
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

Hello there David.

Several things to check.

First, do you have LVM2 support in the kernel at time of boot?  Either by
having modules which get carried in the initial RAM disk and then get loaded
when the kernel first boots or by compiling them in.

Second, do you have DM-RAID support in the kernel at time of boot?  Same
note as above for how to get there.

Third, do you have someplace where the kernel and initial RAM disk live that
is either on RAID-1 or not protected at all?  

Fourth, which boot loader as you using?  LILO can be fooled into handling
getting the kernel and initial RAM disk from inside an LV, GRUB can not be
fooled like that.

Fifth, since I assume this is Intel based, you still need the kernel and
initial RAM disk to reside on the first section of the physical disks due to
hardware boot logic issues (INT 13 things I think).

I have a number of systems running LVM2 on top of soft RAID, using LILO to
boot.  My system volumes have 2 paritions, one for "/boot" and then
everything else.  All filesystems reside on LVs, including swap and "/".  So
I know this will work.

Give me a shout back if you still having issues.

Thanks!

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of David Abrahams
Sent: Sunday, July 09, 2006 2:09 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM2 on dmraid -- can't boot


When building the new system installation from a liveCD, I can easily
create an LVM2 filesystem on top of a dmraid (FakeRaid) 1 array, and
the filesystem works great.  However, when booting from a primary
physical (non-LVM) partition on the dmraid array, only that partition
seems to mount properly; When I try to mount any of the LVM
partitions, all I see in them is "lost+found."  Naturally, the boot
process fails at that point.

http://article.gmane.org/gmane.linux.ataraid/1989
illustrates my situation.

The two details not mentioned there:

1. When mounting any partition (LVM or not), I get 'cramfs: wrong magic'

2. I see the following when I do dmraid -ay

    [ 2881.836361] attempt to access beyond end of device
    [ 2881.836406] sda: rw=0, want=9767777280, limit=876773168
    [ 2881.836361] attempt to access beyond end of device
    [ 2881.836406] sdb: rw=0, want=9767777280, limit=876773168

Can anyone offer help?
Thanks!

-- 
Dave Abrahams
Boost Consulting
www.boost-consulting.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
