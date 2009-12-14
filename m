Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBEESgFW011791
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 09:28:42 -0500
Received: from er-systems.de (er-systems.de [85.25.136.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBEESQ4W008542
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 09:28:27 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
	by er-systems.de (Postfix) with ESMTP id 86F9E17405E
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 15:28:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by er-systems.de (Postfix) with ESMTP id 39BC9174059
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 15:28:25 +0100 (CET)
Date: Mon, 14 Dec 2009 15:28:24 +0100 (CET)
From: Thomas Voegtle <tv@lio96.de>
Sender: thomas@er-systems.de
Subject: Re: [linux-lvm] lvcreate does not respect units?
In-Reply-To: <20091214140057.GA14009@agk-dp.fab.redhat.com>
Message-ID: <alpine.LNX.2.00.0912141527510.25221@er-systems.de>
References: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
	<20091214140057.GA14009@agk-dp.fab.redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 14 Dec 2009, Alasdair G Kergon wrote:

> On Mon, Dec 14, 2009 at 02:45:21PM +0100, Thomas Voegtle wrote:
>> vgdisplay  Free  PE / Size       6127 / 25.70 GB
>
>> root@(none):~# lvcreate -L 25.50g datavolume -n datavolume
>> lvcreate  Insufficient free extents (6127) in volume group datavolume:
>> 6528 required
>
>> So it seems lvcreate does not respect the unit in power of 1000?
>
> Use either:
>   lvcreate -l 6127
> or
>   lvcreate -l 100%FREE


Yes, thanks. I know.


But I thought you guys would like to hear from bugs?

Why is it possible to use vgdisplay with units power of 1000, if you
cant use lvcreate with that kind of units?

The lvcreate man page says:

      -L, --size LogicalVolumeSize[bBsSkKmMgGtTpPeE]
