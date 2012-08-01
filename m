Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q71NYtg1020112
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 19:34:55 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71NYslv011861
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 19:34:54 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	q71NYqcw017372
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 16:34:54 -0700
Message-ID: <5019BD1C.8070206@tlinx.org>
Date: Wed, 01 Aug 2012 16:34:52 -0700
From: Linda Walsh <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Really power of 2?  extents, chunks and raid alignment
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Lars Ellenberg wrote:

> pvs --units s -o pv_name,vg_name,pe_start
>
> pvcreate: --metadatasize, --dataalignment, --dataalignmentoffset
> vgcreate: --physicalextentsize
>   
---
   BTW, thanks for this ... I missed it earlier -- and have been sure 
to save away a copy for future reference...

   now if only disk prices would come back down (or rather (*sardonic 
laugh*), the dollar value would go back up)......
