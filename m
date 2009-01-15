Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F8bInY017432
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 03:37:19 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0F8b3st022975
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 03:37:04 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0F8b2tk029679
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 09:37:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id 241C62C1F1
	for <linux-lvm@redhat.com>; Thu, 15 Jan 2009 09:36:57 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id bBksiz6I-B2H for <linux-lvm@redhat.com>;
	Thu, 15 Jan 2009 09:36:56 +0100 (CET)
Date: Thu, 15 Jan 2009 09:36:56 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] Allocation maps of a mirrored LV?
Message-ID: <20090115083656.GL21131@lupe-christoph.de>
References: <20090113100902.GJ21131@lupe-christoph.de>
	<b072968d0901141258n12aaea7nbccf0700bdda4512@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b072968d0901141258n12aaea7nbccf0700bdda4512@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wednesday, 2009-01-14 at 20:58:28 +0000, David Robinson wrote:
> On Tue, Jan 13, 2009 at 10:09 AM, Lupe Christoph <lupe@lupe-christoph.de> wrote:

> > I'm about to integrate support for LVM mirrors into the configuration
> > management system I'm maintaining for a client. This system has a "scan"
> > function that retrieves the current configuration and compares it
> > against a database.

> > My problem is that I'm unable to get the allocation info for the parts
> > of a mirrored volume under SLES 10 (lvm2 RPM is at 2.02.17, even
> > OpenSuSE 10.3 has only lvm2 2.02.25).

> > lvdisplay --maps only gives me:

> Try pvs/vgs/lvs instead (and use -o to get the details you want):

> # pvs --segments
>   PV         VG     Fmt  Attr PSize  PFree  Start SSize
>   /dev/dm-0  laptop lvm2 a-   55.69G 32.00M     0   250
>   /dev/dm-0  laptop lvm2 a-   55.69G 32.00M   250  1499
>   /dev/dm-0  laptop lvm2 a-   55.69G 32.00M  1749    32
>   /dev/dm-0  laptop lvm2 a-   55.69G 32.00M  1781     1

OK, let me show you. I created an LV with:
lvcreate --name testlv0 --size 100m --mirror 1 testvg

lvs -o +devices
  LV              VG     Attr   LSize   Origin Snap%  Move Log          Copy%  Devices
  testlv0         testvg mwi-a- 100.00M                    testlv0_mlog 100.00 testlv0_mimage_0(0),testlv0_mimage_1(0)

Any other suggestion for a -o option? I tried stripes, segtype, seg_start,
seg_size, seg_tags, regionsize, mirror_log and lvs --segments.

I can't find an option for pvs that prints the allocation map, nor for
vgs. Any suggestions?

Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |
