Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GIDWgk026592
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 14:13:32 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5GIDQCN005759
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 14:13:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id EA4BD16D07
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 18:12:47 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 18138-08 for <linux-lvm@redhat.com>;
	Fri, 16 Jun 2006 18:12:46 +0000 (UTC)
Received: from ath600.krakrjak.com (ip70-178-219-238.ks.ks.cox.net
	[70.178.219.238])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id A9DDE16D12
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 18:12:46 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] LVM and Device Mapper
Date: Fri, 16 Jun 2006 13:13:22 -0500
References: <5485940d0606152014i4f309594o70efbe2568641b2a@mail.gmail.com>
In-Reply-To: <5485940d0606152014i4f309594o70efbe2568641b2a@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606161313.22831.krakrjak@volumehost.net>
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

On Thursday 15 June 2006 22:14, C'est Pierre wrote:
> Hello,
>
> I've setup multipath with multipath-tools and I guess everything is OK
> there. However, I can't get lvm to recognize the multipath'ed devices:
Need to check that your /etc/lvm/lvm.conf file is accepting those devices.

> # dmsetup ls
> 3600508b40010130d00006000011c0000p1     (253, 4)
> system-lv03     (253, 2)
> system-lv01     (253, 1)
> system-lv00     (253, 0)
> dm-3p2  (253, 7)
> dm-3p1  (253, 6)
>
> cabtagdb01:~ # fdisk -l /dev/dm-3
>
> Disk /dev/dm-3: 53.6 GB, 53687091200 bytes
> 64 heads, 32 sectors/track, 51200 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
>
>      Device Boot      Start         End      Blocks   Id  System
> /dev/dm-3p1               1           1        1008   83  Linux
> /dev/dm-3p2               2       51200    52427776   8e  Linux LVM
> cabtagdb01:~ # fdisk -l /dev/mapper/3600508b40010130d00006000011c0000
>
> Disk /dev/mapper/3600508b40010130d00006000011c0000: 53.6 GB, 53687091200
> bytes 64 heads, 32 sectors/track, 51200 cylinders
> Units = cylinders of 2048 * 512 = 1048576 bytes
>
>                                          Device Boot      Start
>  End      Blocks   Id  System
> /dev/mapper/3600508b40010130d00006000011c0000p1               1
>    1        1008   83  Linux
> /dev/mapper/3600508b40010130d00006000011c0000p2               2
> 51200    52427776   8e  Linux LVM
>
>
> # pvcreate /dev/dm-3p2
>   Device /dev/dm-3p2 not found.
So you need something like:
filter = [ "a|dm-.*|", <other rules here> ]

In the devices {} section of your /etc/lvm/lvm.conf file so it will accept the 
device.
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
