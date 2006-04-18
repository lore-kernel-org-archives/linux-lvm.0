Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3IBbti1003190
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 07:37:55 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3IBbpQt015018
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 07:37:52 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id D45C21F4206
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 13:37:36 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27468-05 for <linux-lvm@redhat.com>;
	Tue, 18 Apr 2006 13:37:30 +0200 (CEST)
Message-ID: <4444CF78.6090003@conterra.de>
Date: Tue, 18 Apr 2006 13:37:28 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Creating a new partition /dev/hda5
References: <1144902347.443dd2cb12d49@webmail.telus.net>
In-Reply-To: <1144902347.443dd2cb12d49@webmail.telus.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

faryalb@telus.net wrote:
> 
> I have Fedora Core4 installed on my machine and trying to make mythtv work for
> me. I understand I need to create a new partition /dev/hda5 and mount /video
> file system. I've done some reading on LVM and come up with following commands
> to install the new partition on my machine. I need to have them verified by
> experts as I don't want to risk losing any data on my hard. 
> 
> #pvcreate /dev/hda5
> #vgcreate VolGroup00 /dev/hda5
> #lvcreate -L50G -name video VolGroup00
> #mount /dev/hda5/video
> #mount -0 remount,resize /video

Seems your understanding of logical volumes and partitions is a bit 
confused. First you have a physical disk (/dev/hda). Your "fdisk -l" 
shows me, that you have divided (partitioned) your disk into two 
partitions hda1 and hda2, where hda2 contains your LVM data.

So, you won't think about any additional partitions, because there is no 
space left next to hda1 and hda2. But you want to distribute the disk 
space within your volume group (named VolGroup00, located within hda2). 
This has nothing to do with "partitions" any more. Instead you create a 
"logical volume" (lv) named "video", which is a part of your volume 
group. Thus its device path becomes "/dev/VolGroup00/video". Before you 
can mount it, you have to "format" this volume (see mkfs).

However, your "vgdisplay" shows me, that you already used all space of 
your volume grop (Free  PE / Size 1 / 32.00 MB), too. So it seems you 
already performed some "vgcreate" and "lvcreate".
Can you please do a "lvdisplay" or "lvs" to show us the current content 
of your VolGroup00.

What do you intend using "-O remount,resize"?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
