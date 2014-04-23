Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3N7xwGt001870
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2014 03:59:58 -0400
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3N7xu2d018589
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2014 03:59:57 -0400
Received: by mail-wg0-f50.google.com with SMTP id x13so501505wgg.9
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2014 00:59:56 -0700 (PDT)
Message-ID: <535772FA.3060205@gmail.com>
Date: Wed, 23 Apr 2014 09:59:54 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>	<5342A6A9.6060104@redhat.com>	<5345703E.2050401@ucdavis.edu>	<5346A663.502@redhat.com>	<006a01cf5b33$47f5bb20$d7e13160$@edu>
	<53564F0C.3080402@redhat.com> <007b01cf5e5a$d1293500$737b9f00$@edu>
In-Reply-To: <007b01cf5e5a$d1293500$737b9f00$@edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, rrdavis@ucdavis.edu

Dne 22.4.2014 20:43, Ryan Davis napsal(a):
> Hi Peter,
>
>
> Thanks for the support.
>
> Everything ran smooth until I did a fsck on the FS on the LV.  It's
> complaining about a bad superblock

Saying something runs smooth here is somewhat pointless...


Looking at your lvmdump  --


pv0 {
			id = "8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf"
			device = "/dev/sdc1"	# Hint only

			status = ["ALLOCATABLE"]
			flags = []
			dev_size = 7812456381	# 3.63796 Terabytes
			pe_start = 384
			pe_count = 953668	# 3.63795
}


This is how your PV was looking when you have created your VG.

Obviously your device  /dev/sdc1  had   7812456381 sectors.
(Very strange to have odd number here....)

Later you report # blockdev --getsz /dev/sdc1 as 7812441596

So we MUST start from the moment you tell us what you did to your
system that suddenly your device is 14785 blocks shorter (~8MB) ?

Have you reconfigured your  /dev/sdc device?
Is it HW raid5 device ?
Have you repartitioned/resized  it  (fdisk,gparted) ?

We can't move forward without knowing exact roots of your problem ?

Everything else is pointless waste of time since we will just try to hunt
some random piece of information?

I just hope you have not tried to play directly with your /dev/sdc  device
(Since in some emails it seems you try to execute various command directly on 
this device)

Zdenek
