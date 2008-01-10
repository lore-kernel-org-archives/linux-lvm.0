Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0ACDbB7024542
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 07:13:37 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0ACD45F006735
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 07:13:04 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id E56C548841
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 13:12:58 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 894979456
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 13:12:56 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id 6VEZDSo06TgN for <linux-lvm@redhat.com>;
	Thu, 10 Jan 2008 13:12:47 +0100 (CET)
Received: from [192.168.178.20] (koln-4d0b0b66.pool.mediaWays.net
	[77.11.11.102]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2008 13:12:47 +0100 (CET)
Message-ID: <47860BBE.3090302@wpkg.org>
Date: Thu, 10 Jan 2008 13:12:46 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can't use LVM2 - "Failed to write physical volume"?
	[SOLVED]
References: <4784F989.3030801@wpkg.org>
In-Reply-To: <4784F989.3030801@wpkg.org>
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

Tomasz Chmielewski schrieb:
> It seems to me that for some reason it's not possible to create a 
> physical volume on a DRBD device. Below, we can see that running 
> "pvcreate" succeeds and than fails, then it succeeds again etc.:
> 
> # pvcreate -d -v /dev/drbd0
>     Set up physical volume for "/dev/drbd0" with 976544952 available 
> sectors
>     Zeroing start of device /dev/drbd0
>   Physical volume "/dev/drbd0" successfully created
> 
> # pvcreate -d -v /dev/drbd0
>     Wiping cache of LVM-capable devices
>     Set up physical volume for "/dev/drbd0" with 976544952 available 
> sectors
>     Zeroing start of device /dev/drbd0
>   Failed to write physical volume "/dev/drbd0"

Looks like LVM doesn't like some raw devices?

I added a partition to /dev/drbd0 with fdisk.

Then, I added a drive mapping with kpartx.

It works fine now.

# kpartx -a -v /dev/drbd0
add map drbd0p1 : 0 976543092 linear /dev/drbd0 63

# pvcreate -d -v /dev/mapper/drbd0p1
     Set up physical volume for "/dev/mapper/drbd0p1" with 976542708 
available sectors
     Zeroing start of device /dev/mapper/drbd0p1
   Physical volume "/dev/mapper/drbd0p1" successfully created


Anyway, why does it fail if I want to set up LVM on raw DRBD device? A 
bug or a feature?



-- 
Tomasz Chmielewski
http://wpkg.org
