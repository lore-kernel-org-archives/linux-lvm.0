Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5FHug1Q029411
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 13:56:42 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5FHuaSu005963
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 13:56:36 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id D8EFE1F4017
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 19:56:29 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07645-07 for <linux-lvm@redhat.com>;
	Thu, 15 Jun 2006 19:56:23 +0200 (CEST)
Message-ID: <44919F46.1010305@conterra.de>
Date: Thu, 15 Jun 2006 19:56:22 +0200
From: =?ISO-8859-2?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm -> "normal" system conversion
References: <449194DD.6070801@poczta.onet.pl>
In-Reply-To: <449194DD.6070801@poczta.onet.pl>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Maciej S=EF=BF=BDojewski wrote:
> I have Linux Kubuntu Breezy system running completely on software raid,=20
> LVM2, including root and boot partitions (LILO boot loader). As for some =

> reasons I found such a structure not very convenient I would like revert =

> it the following one:
> - crucial data on software raid matrix (sda & sdb), so home partition etc=
.;
> - boot partition and  root partition on separate hard disk (hde).

Hi Maciej,

sorry, I don't exactly understand your current setting:
do sda/sdb form your raid md0? In both cases?
Does your LVM then resides on md0?
Are root, boot home and zasoby1/2 logical volumes?

I only see, you want to move off root and boot to an other disk hde.

So, what do you mean by "revert"?

> I've already formatted and partitioned hde6. Now I think how to make a=20
> copy of root and finally how to install GRUB so it will be able to see=20
> LVM2 volumes...

If you move off boot and root to a traditional partition,
so why has grub to know anything about LVM any more?

perhaps you should give us an output of "pvs" and "lvs" commands.

regards, Dieter.
