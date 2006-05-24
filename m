Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OM8Sfu007104
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 18:08:28 -0400
Received: from amsfep13-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OM8QcX016164
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 18:08:27 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep13-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060524220818.NWVF21819.amsfep13-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 00:08:18 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4OM8H6k006036
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 00:08:17 +0200
Message-ID: <4474D94B.7010504@neuroweave.nl>
Date: Thu, 25 May 2006 00:08:11 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting from an LV
References: <4472E235.6020707@neuroweave.nl>	<20060523105821.GA6491@percy.comedia.it>	<4472EE4E.9050208@neuroweave.nl>	<4473ED42.1060702@wanadoo.fr>	<4474B6E8.9010106@neuroweave.nl>
	<4474D256.8080603@chaos.ao.net>
In-Reply-To: <4474D256.8080603@chaos.ao.net>
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

Harik A'ttar wrote:

> Joep Blom wrote:
>
>> Francis,
>> Thanks. I've read that. But after 7 or 8 years using LILO with all 
>> the problems around it, I switched 2 years ago to grub and decided to 
>> stick to it. So my solution is to make a small (100 Mb) primary 
>> partition for grub and do the rest with LVM as I have discovered the 
>> ease and advantage of it after years of struggling with fdisk (DOS, 
>> W98, Linux) and with the ntfsprogs suite it's easy to create XP 
>> partitions in an LV for backups.
>> Joep
>
>
> Even with LILO, it's easier to have a raw BIOS partition for /boot:
>
> software raid4/5/6, pvmove, raid1, &tc.  There are a lot of bad hacks
> in lilo to support some of those things in some configurations, but 
> nothing clean.  The most reliable way to bring things up is to install 
> grub or lilo in /boot (on [hs]da1) and possibly mirror the boot sector
> and the boot partition to the second drive.   However, on a 
> failed-drive, most motherboards can't reboot anyway so you're talking 
> manual intervention in either case.  With a block-level mirror, 
> hopefully just yanking the first drive lets you boot off #2, and of 
> course once you hit initrd and raidstart, it handles the failed disk 
> gracefully, right? :)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Harik,
I couldn't agree more. IMHO it's a bloody shame we still have to work 
with a misconcept of over 25 years to start any OS (I'm not familiar 
with the Mac but I presume it's equally oldfashioned).
Joep
