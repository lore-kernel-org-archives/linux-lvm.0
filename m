Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27343704CD
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 16:51:35 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77B9080C1A
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 16:51:33 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v6DFrwar024425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 11:54:07 -0400
Date: Thu, 13 Jul 2017 12:06:09 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <4577d764-d6bb-723f-086a-20c004e68a36@redhat.com>
Message-ID: <alpine.LRH.2.20.1707131201510.29228@fairfax.gathman.org>
References: <55f9c8eb-41df-8b3b-c790-e81fbcef0a73@meduniwien.ac.at>
	<4577d764-d6bb-723f-086a-20c004e68a36@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] convert LV to physical device _in_place_?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 13 Jul 2017, Zdenek Kabelac wrote:

> PV has 'header' so the real 'data' are shifted by  PV header+lvm2 metadata.
> and also LV does not need to be sequential.
>
> However if you have been having a single 'segment' LV and and you calculate
> proper skipping offset (typically 1MB) you can try to use such device 
> directly without lvm2 with a loop device mapping -  see losetup --offset

The AIX system used a single segment boot volume LV so that bootstrap
code needed only an offset and did not need to understand the LVM. 
But the boot volume was a normal LV in all other respects.  I think
there was a flag on the LV to ensure it remained a single segment.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
