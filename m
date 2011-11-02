Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2EoYxM008477
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:50:34 -0400
Received: from kenny.oneemedia.com (mail-o.oneemedia.com [92.240.244.203])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2EoXe4016127
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 10:50:33 -0400
Received: from MPODMAKA1.emea.hpqcorp.net (mail-o.oneemedia.com
	[92.240.244.203]) (Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTPA id 3E9FE20008F
	for <linux-lvm@redhat.com>; Wed,  2 Nov 2011 15:50:32 +0100 (CET)
Date: Wed, 2 Nov 2011 15:50:31 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <610510063.20111102155031@marki-online.net>
In-Reply-To: <20111102141842.GC17976@IUPUI.Edu>
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
	<4EB1190A.30501@ankh.org>
	<581100587.20111102124129@marki-online.net>
	<20111102141842.GC17976@IUPUI.Edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
	Volume Group ?
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Wednesday, November 2, 2011, 15:18:42, Mark H. Wood wrote:

> That's just it -- normally you don't change the size of a PV.  That's
> the reason for VGs, which can be expanded anytime by adding new PVs.

> To add capacity from a SAN, you could either:

> 1.  create a new LUN, create a PV on it, and add it to a VG; or
> 2.  expand the LUN, create a new PV in the added space, and add it to a
>     VG.

I am working with large SANs at work, so I am familiar with that. In
the past, we always added a new LUN and after few years we ended with
40-120 LUNs per VG which is really a mess. Recently many disk arrays
and unix systems started to support online LUN resize which is much
more manageable.

My question was about if it is possible to change the partition table
(extend partition or add new partition) while using the PV in
activated VG.


-- 
  bYE, Marki
