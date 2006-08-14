Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EMvxwb020456
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 18:57:59 -0400
Received: from mtaout02-winn.ispmail.ntl.com (mtaout02-winn.ispmail.ntl.com
	[81.103.221.48])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EMvuxI000466
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 18:57:56 -0400
Received: from aamtaout01-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout02-winn.ispmail.ntl.com with ESMTP id
	<20060814225750.DURT27023.mtaout02-winn.ispmail.ntl.com@aamtaout01-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 23:57:50 +0100
Received: from remain.afraid.org ([82.10.238.226])
	by aamtaout01-winn.ispmail.ntl.com with ESMTP id
	<20060814225750.KPAU644.aamtaout01-winn.ispmail.ntl.com@remain.afraid.org>
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 23:57:50 +0100
Received: from localhost ([127.0.0.1])
	by remain.afraid.org with esmtp (Exim 4.60)
	(envelope-from <zak.kipling@cantab.net>) id 1GClNU-0007ph-Ji
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 23:57:48 +0100
Message-ID: <44E0FFE7.6070202@cantab.net>
Date: Mon, 14 Aug 2006 23:57:43 +0100
From: Zak Kipling <zak.kipling@cantab.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 on hardware RAID
References: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7F@exchange2k.lims.com>
	<20060814223654.GD11767@cobalt0.panici.net>
In-Reply-To: <20060814223654.GD11767@cobalt0.panici.net>
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

paddy wrote:

> I dont' have a pvresize or a pvextend, what version are you guys using ?

pvresize should be in 2.02.00 and later, according to WHATS_NEW.

I'm puzzled that you can't find it in etch (testing) though, since
(according to packages.debian.org) it has 2.02.06 -- and the files list
for the package includes /lib/lvm-200/pvresize. Sarge (stable), however,
only has 2.01.04 which won't have pvresize.


Zak.
