Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1SKoH116879
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 15:50:17 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1SKoB17027985
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 15:50:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 8F463EFCA
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 20:50:10 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 07807-05-2 for <linux-lvm@redhat.com>;
	Tue, 28 Feb 2006 20:50:09 +0000 (UTC)
Received: from ath600 (ip70-178-169-79.ks.ks.cox.net [70.178.169.79])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 14A4DEFC6
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 20:50:09 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] lvextend - device-mapper: create ioctl failed: Device
	or resource busy\nFailed to suspend
Date: Tue, 28 Feb 2006 14:50:08 -0600
References: <200602232345.46437.dragonheart@gentoo.org>
	<200602251630.40762.dragonheart@gentoo.org>
	<200602282202.52038.dragonheart@gentoo.org>
In-Reply-To: <200602282202.52038.dragonheart@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602281450.08563.krakrjak@volumehost.net>
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

On Tuesday 28 February 2006 05:02, Daniel wrote:
> Guessing the additional info didn't help and there is no easy way to reset
> the state.
Not really unfortunately.  I have been thinking about this a lot though.  I've 
never seen it and I'm not sure what the next move really is.  Someone did 
suggest (and sorry for not posting sooner) that you should run lsof 
against /dev/mapper/control and see if something is keeping it open.

> I'm going to use spare space to create a new logical volume and move data
> across and delete the wacky vg-backup unless any other bright ideas arise
> soon.
Hopefully this will work.  I guess you were able to remove an lv previously so 
you shouldn't have an issue doing this.  One thing you didn't answer (and I 
didn't ask) is if you had problems extending any other lvs.  The output of 
all the tools show the devices in a good state, so to me it just doesn't make 
sense.  Try the lsof bit and see if anything interesting shows up.
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
