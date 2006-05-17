Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HJQOC2000543
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 15:26:24 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HJQM9g031245
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 15:26:22 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id F231A1F404B
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 21:26:14 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16364-04 for <linux-lvm@redhat.com>;
	Wed, 17 May 2006 21:26:07 +0200 (CEST)
Message-ID: <446B78CD.2090804@conterra.de>
Date: Wed, 17 May 2006 21:26:05 +0200
From: =?windows-1252?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "/boot" under LVM2 support in lilo or grub
References: <000001c679bb$6946ca10$640a0a0a@laptopoptimus>
In-Reply-To: <000001c679bb$6946ca10$640a0a0a@laptopoptimus>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Greg Hartzog wrote:
> I found from poking around the web that lilo, in theory, supports having 
> �/boot� under LVM2 control rather then existing as its own partition.

this would be really nice to see. Most FAQs advise you to partition your
disk. But my PV is about 5TB, which stupid DOS partitioning can't handle
anyway. I think it should be possible to have a small LV containing
the /boot directory. With my PE size of 32M, I don't even have to worry
if it is contiguous, as it will fit into a single PE. The very first
sector of a PV seems to be unused by LVM, thus a Lilo or Grub MBR may be 
installed. The remaining problem is to set up the mapping for LILO or
Grub to load further stages and the kernel itself.

I looked into the LILO sources and indeed found some fragments dealing
with LVM when trying to get the physical sector numbers of the files to
load (using FIBMAP). But I'm still searching where this is documented.

The Grub development seems to be focused mainly on wired mutiboot
problems with DOS and Windows XY. The whole system fundamentally
depends on the concept of a partition table to solve problems
I will never have :-)

Dieter.
