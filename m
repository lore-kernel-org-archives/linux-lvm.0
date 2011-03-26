Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2Q2wS4m020253
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 22:58:28 -0400
Received: from eastrmfepo203.cox.net (eastrmfepo203.cox.net [68.230.241.218])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q2wNFv030767
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 22:58:23 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmfepo203.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110326025822.WGIO32702.eastrmfepo203.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 22:58:22 -0400
Message-ID: <4D8D564F.9090609@cox.net>
Date: Fri, 25 Mar 2011 21:58:23 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question about LV StripeSize
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
To: linux-lvm@redhat.com


Are these distributed among the VGs in a round-robin method?

My PE Size = 8.00 MiB and the LV was created with options "--stripes 8 
--stripesize 8192".

So, would a 640MiB file be equally split between my 8 PVs, with the 1st 
8MiB in pv1, the 2nd 8MiB in pv2, ..., the 9th 8MiB in pv1, etc for 
(640/8 = 80) chunks?

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749
