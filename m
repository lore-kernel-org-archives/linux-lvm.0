Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p361rQNi029913
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:53:26 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p361rM8p027801
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:53:22 -0400
Received: from bast.ankh.org ([172.22.128.4])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7Hvt-0006jI-Ix
	for linux-lvm@redhat.com; Wed, 06 Apr 2011 02:53:21 +0100
Message-ID: <4D9BC789.3060508@ankh.org>
Date: Wed, 06 Apr 2011 01:53:13 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!	kh.org>	<4D9BAD26.5010405@abpni.co.uk>	<4D9BB0D4.8050401@ankh.org>	<4D9BB398.5070007@abpni.co.uk>	<alpine.LRH.2.00.1104052035080.21002@bmsred.bmsi.com>	<alpine.LRH.2.00.1104052040090.21075@bmsred.bmsi.com>	<4D9BC3A8.1070005@ankh.org>
	<4D9BC63A.9040306@abpni.co.uk>
In-Reply-To: <4D9BC63A.9040306@abpni.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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

On 06/04/2011 01:47, Jonathan Tripathy wrote:
>
> Currently, as part of our procedure, we zero LVs once a customer has 
> left our service. The reason why we don't zero on allocation is that 
> customer usually expect quick setup times (under 10 minutes) and 
> zeroing gigabytes worth of space can take too long. Getting new zeroed 
> LVs ready before sign ups also isn't an option but for other reasons.

Very reasonable

It however is a shame than lvm cannot zero PE (physical extents) on 
first access or do a proper background initialisation. As would happen 
on hardware raids.

James
