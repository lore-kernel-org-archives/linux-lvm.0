Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4SH0d023854
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 13:00:39 -0400
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net
	[68.14.253.125])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4SH0XXn031577
	for <linux-lvm@redhat.com>; Fri, 28 May 2004 13:00:33 -0400
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.34) id 1BTkia-0008Jz-06
	for linux-lvm@redhat.com; Fri, 28 May 2004 10:00:28 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
	by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31728-05 for <linux-lvm@redhat.com>;
	Fri, 28 May 2004 10:00:27 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.34) id 1BTkiZ-0008Js-A3
	for linux-lvm@redhat.com; Fri, 28 May 2004 10:00:27 -0700
Received: from [192.168.172.107] (helo=[192.168.172.107])
	by jeeves.kpf.internal with esmtp (Exim 4.05) id 1BTkiS-0006I2-00
	for linux-lvm@redhat.com; Fri, 28 May 2004 10:00:20 -0700
Message-ID: <40B77026.5090302@backtobasicsmgmt.com>
Date: Fri, 28 May 2004 10:00:22 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [RFC] dmraid design 1.0.3
References: <20040528151953.GK16912@redhat.com>
In-Reply-To: <20040528151953.GK16912@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:

> o do we need to support partitions on RAID sets ?

IMHO the answer is no, because dmpartx (or whatever it's called) can do 
this today. It can use dm tables to slice up any existing block device, 
whether it's a raw disk or a dm-constructed RAID set.

> Open questions:
> ---------------
> 
> o do we need to prioritize on device-mapper targets for higher RAID levels
>   (in particular we'ld need RAID5 to support some ATARAID formats) ?

Personally I would be thrilled to see this work move ahead; in fact, I'd 
be happy to see this dmraid tool support the Linux MD metadata so I can 
use dm targets for my MD RAID-1 systems (thereby reducing the amount of 
code I build into my kernel).
