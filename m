Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5L8gaDj016123
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 04:42:36 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5L8gTLD011125
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 04:42:30 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 7DBFD1F4045
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 10:42:19 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27795-02 for <linux-lvm@redhat.com>;
	Wed, 21 Jun 2006 10:42:13 +0200 (CEST)
Message-ID: <44990663.60400@conterra.de>
Date: Wed, 21 Jun 2006 10:42:11 +0200
From: =?UTF-8?B?RGlldGVyIFN0w7xrZW4=?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange doesn't activate the  logical volume
References: <004001c69509$fa226440$713a14ac@iai.co.il>
In-Reply-To: <004001c69509$fa226440$713a14ac@iai.co.il>
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

Daniel Loney wrote:
> suse01:~ # vgdisplay -v vg02| more
>     Using volume group(s) on command line
>     Finding volume group "vg02"
>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error

looks like a bad sector/read error on /dev/sda.
You may verify this either by a simple

dd if=/dev/sda of=/dev/null bs=512 iflag=direct

to find the bad sectors number. Or you may run 
"badblocks -s /dev/sda", which does roughly the same.

I strongly suggest to use smartctl to monitor the state of your
disk (see http://smartmontools.sourceforge.net). Most problems
show up here some time before your disk finally dies.

Try "smartctl -d ata -a /dev/sda" to display the disks error log.
If you did not use it before, you might have to enable it by:
"smartctl -d ata -s on /dev/sda".

All disks have spare sectors they can use, if some sector gets broken
But the sector is not automatically replaced, as most people believe.
This does not happen until some new data is written to that sector.
If your bad sector occurs within the LVM metadata description of /dev/sda
you may recover it by using "vgcfgrestore" to repair the broken LVM header.

I did not use vgcfgrestore before, so I can't describe the necessary steps
in detail. May be someone else can help here...

Dieter.
