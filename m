Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1P3H9102013
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2006 22:17:09 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1P3H9QK015180
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2006 22:17:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 49C74D356
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 03:17:08 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 22902-14 for <linux-lvm@redhat.com>;
	Sat, 25 Feb 2006 03:17:06 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id A26E8D288
	for <linux-lvm@redhat.com>; Sat, 25 Feb 2006 03:17:06 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] lvextend - device-mapper: create ioctl failed: Device
	or resource busy\nFailed to suspend
Date: Fri, 24 Feb 2006 21:17:05 -0600
References: <200602232345.46437.dragonheart@gentoo.org>
In-Reply-To: <200602232345.46437.dragonheart@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602242117.05125.krakrjak@volumehost.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thursday 23 February 2006 06:45, Daniel wrote:
> spider / # umount /backup/
Shouldn't be needed.  You can resize the lvol while it's mounted.  Your 
symptoms below look like the vg metadata may be out of sync.  Are you 
performing a pvmove or other LVM operations?

> spider / # lvextend -L+60G vg/backup
>   Extending logical volume backup to 110.00 GB
>   device-mapper: create ioctl failed: Device or resource busy
>   Failed to suspend backup
Interesting....  You gave tons of other output below, but what would be really 
helpful is a vgdisplay -v vg and an lvdisplay vg/backup.  You also asked 
about removing vg/usr, however that lv only shows up in dmsetup table.

Is there a snapshot being taken?  Is there an active snapshot volume?  Sounds 
like the volume group is actually locked right now.
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
