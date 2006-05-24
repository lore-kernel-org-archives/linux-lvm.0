Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OLl104002613
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 17:47:01 -0400
Received: from chaos.chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4OLkoDQ027802
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 17:46:50 -0400
Received: from [205.244.242.67] (taz.ao.net [205.244.242.67])
	by chaos.chaos.ao.net (8.13.5/8.13.5/Debian-3) with ESMTP id
	k4OLklvw016623
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 17:46:47 -0400
Message-ID: <4474D256.8080603@chaos.ao.net>
Date: Wed, 24 May 2006 17:38:30 -0400
From: "Harik A'ttar" <harik@chaos.ao.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting from an LV
References: <4472E235.6020707@neuroweave.nl>	<20060523105821.GA6491@percy.comedia.it>	<4472EE4E.9050208@neuroweave.nl>	<4473ED42.1060702@wanadoo.fr>
	<4474B6E8.9010106@neuroweave.nl>
In-Reply-To: <4474B6E8.9010106@neuroweave.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Joep Blom wrote:

> Francis,
> Thanks. I've read that. But after 7 or 8 years using LILO with all the 
> problems around it, I switched 2 years ago to grub and decided to stick 
> to it. So my solution is to make a small (100 Mb) primary partition for 
> grub and do the rest with LVM as I have discovered the ease and 
> advantage of it after years of struggling with fdisk (DOS, W98, Linux) 
> and with the ntfsprogs suite it's easy to create XP partitions in an LV 
> for backups.
> Joep

Even with LILO, it's easier to have a raw BIOS partition for /boot:

software raid4/5/6, pvmove, raid1, &tc.  There are a lot of bad hacks
in lilo to support some of those things in some configurations, but 
nothing clean.  The most reliable way to bring things up is to install 
grub or lilo in /boot (on [hs]da1) and possibly mirror the boot sector
and the boot partition to the second drive.   However, on a 
failed-drive, most motherboards can't reboot anyway so you're talking 
manual intervention in either case.  With a block-level mirror, 
hopefully just yanking the first drive lets you boot off #2, and of 
course once you hit initrd and raidstart, it handles the failed disk 
gracefully, right? :)
