Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q71NWkwg019876
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 19:32:46 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71NWi54030433
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 19:32:45 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	q71NWgHQ017013
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 16:32:44 -0700
Message-ID: <5019BC99.6090407@tlinx.org>
Date: Wed, 01 Aug 2012 16:32:41 -0700
From: "Linda A. Walsh" <law@tlinx.org>
MIME-Version: 1.0
References: <500C44EF.4080004@tlinx.org> <20120725200625.GH29767@soda.linbit>
In-Reply-To: <20120725200625.GH29767@soda.linbit>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] RFE?  Really power of 2?  extents,
	chunks and raid alignment
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
to save away a
copy for future reference...

    now if only disk prices would come back down (or rather (*sardonic 
laugh*), the dollar
value would go back up)......
