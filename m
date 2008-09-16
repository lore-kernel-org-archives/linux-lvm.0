Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GLDaAx000909
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 17:13:54 -0400
Received: from smtp2.versatel.nl (smtp2.versatel.nl [62.58.50.89])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8GKKnfl007033
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 16:20:50 -0400
Received: from [192.168.1.102] (unknown [192.168.1.102])
	by mail.vermeer.tv (Postfix) with ESMTPA id C60CA26F1BB
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 22:20:11 +0200 (CEST)
Subject: Re: [linux-lvm] Mirrored LV
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <48D00F51.5090305@free.fr>
References: <1221592827.6037.57.camel@localhost>  <48D00F51.5090305@free.fr>
Date: Tue, 16 Sep 2008 22:20:47 +0200
Message-Id: <1221596447.6037.62.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Op dinsdag 16-09-2008 om 21:56 uur [tijdzone +0200], schreef Georges
Giralt:
> I confirm that you have to use 3 disks to mirror a VG with the actual 
> version of software.

I assume you mean that you have to use 3 disks if you want to put the
log on disk? I mean, you can use 2 disks and have the log in memory,
right?
In any way, if you indeed need 3 disks when putting the log on disk,
then the man page seems to be misleading.

> P.S. At home, I do not use the whole PV for my LV.
> Each PV is split in two dissymitrical parts : a small 100 M partition 
> and the rest of the device. The small partition is used for a software 
> RAID (md) to hold the /boot. The rest of the disk as a regular PV used 
> to build the mirrored VG/LV. This way, if one disk breaks I still can 
> boot onto the remaining  one. Of course, it is a manual boot but easier 
> compared to searching a useable rescue CD and the correct kernel 
> version. Think about it.

I currently have a small /boot partition on both disks, mirrored with
RAID 1. The rest of the disks are LVM partitions. I like the flexibility
of having everything (except /boot) as LVM partitions, rather than
separating them into unmirrored and RAID 1 partitions. But maybe I'm
just out of luck here...

Best,
Koen
