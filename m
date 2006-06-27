Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5R94s4b012287
	for <linux-lvm@redhat.com>; Tue, 27 Jun 2006 05:04:54 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5R94kgA018400
	for <linux-lvm@redhat.com>; Tue, 27 Jun 2006 05:04:47 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id A0D9A1F4011
	for <linux-lvm@redhat.com>; Tue, 27 Jun 2006 11:04:37 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02654-09 for <linux-lvm@redhat.com>;
	Tue, 27 Jun 2006 11:04:24 +0200 (CEST)
Message-ID: <44A0F496.3060008@conterra.de>
Date: Tue, 27 Jun 2006 11:04:22 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Setting up LVM with existing RAID 1 (Mirror)
References: <20060626164657.79277.qmail@web33408.mail.mud.yahoo.com>
In-Reply-To: <20060626164657.79277.qmail@web33408.mail.mud.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Rehan,

If I have a look at your partition table

> Disk /dev/sda: 73.2 GB, 73274490880 bytes
> 255 heads, 63 sectors/track, 8908 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot Start    End      Blocks   Id System
> /dev/sda1   *      1    784     6297448+  83 Linux
> /dev/sda2        785   8907    65247997+   f W95 Ext'd (LBA)
> /dev/sda5        785   1176     3148708+  82 Linux swap
> /dev/sda6       1177   1960     6297448+  83 Linux
> /dev/sda7       1961   2744     6297448+  83 Linux
> /dev/sda8       2745   3528     6297448+  83 Linux
> /dev/sda9       3529   3790     2104483+  83 Linux
> /dev/sda10      3791   4052     2104483+  83 Linux

it seems /dev/sda2 is a container holding sda5-10 as logical 
partitions. This concept is similar to a LVM layout, where sda2
would be a physical volume (PV) containing several logical volumes
(LV) like /opt /home swap etc. 

But even if you have a lot of free space within sda2, it does
not help you, as long as the whole disk is occupied by sda2.
You have to get rid of all the logical partitions :-(

But you may keep your root partition :-)

step 1: erase sda5-10

You may copy /usr /var and /home into your root partition
(use: cp -a). Swap can be disabled for a while. But you
have to save /opt (may be /tmp) to an additional disk.
Then you are able delete sda5-10.

step 2: initialize LVM / create a logical volume

Turn sda2 into a PV with "pvcreate /dev/sda2".
Create a logical volume: "vgcreate volume1 /dev/sda2".
You may choose any other name instead of "volume1".
Now you create your LVs as needed:

lvcreate volume1 -n swap -l 2G
lvcreate volume1 -n usr -l 6G
lvcreate volume1 -n opt -l 12G
....

mkswap /dev/volume1/swap
mke2fs /dev/volume1/usr
mke2fs /dev/volume1/opt
...

step 3: copy back the data to your newly created LVs.

conclusion:

Your new LVs have real names instead of just /dev/sda8.
Any free space you have may be assigned to any of your
LVs, as they don't have to be continuous any more.
Anyway, dealing with additional disk space is MUCH
easier once after you started using LVM. 

Dieter.
