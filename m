Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6K4UZRG016878
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 00:30:35 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6K4UMNB031325
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 00:30:22 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n6K4ULm5027775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 00:30:21 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n6K4UL2M009850
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2009 00:30:21 -0400
Date: Mon, 20 Jul 2009 00:30:21 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm2 and external enclosures
In-Reply-To: <4A639532.6050506@cox.net>
Message-ID: <Pine.LNX.4.64.0907200016130.9385@bmsred.bmsi.com>
References: <4A639532.6050506@cox.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 19 Jul 2009, Ron Johnson wrote:

> (The purpose of this "exercise" is to implement a backup strategy.)

...

> Any thoughts on getting lvm2 to play nice with dynamic devices?

You have to do "vgchange -an backupvgxx" before removing the 
dynamic volumes.  It is possible to deactivate the vg after
physical removal (which you must do before a vgscan will work),
but it was tricky - the details were posted here a while back.

I created the VG on the full physical device (/dev/sdx, not /dev/sdx1),
and liked the idea of dispensing with the crufty DOS boot sector,
and getting resizable "partitions".

But the whole process is a pain (the two levels of mount/umount/vgchange) 
- and after creating similar backup solutions at 7 sites, I finally decided
that a labeled (so it doesn't matter which device node the drive appears on)
filesystem on /dev/scx1 was the simplest and most reliable way to go.
I keep the filesystem mounted in readonly mode (users are always removing
tapes or usb drives when they aren't supposed to, "Didn't you see the yellow
light flashing???").  I do "mount  -o remount,rw /media/backup" before the
backup script, and "mount -o remount,ro /media/backup" afterward.  I do and
unmount and fsck every day - which ensures that the fs gets clean regularly.

Where USB and other hotswap drives shine with LVM is testing drive failure
recovery.  It is simple and safe (hardware wise) to disconnect a USB
drive to see how your LVM configuration handles the failure.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
