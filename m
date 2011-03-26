Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2Q4gW51026028
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:42:32 -0400
Received: from eastrmfepo202.cox.net (eastrmfepo202.cox.net [68.230.241.217])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q4gNAr016480
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:42:23 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo202.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110326044223.YQVF32466.eastrmfepo202.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:42:23 -0400
Message-ID: <4D8D6EAF.8050403@cox.net>
Date: Fri, 25 Mar 2011 23:42:23 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
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

On 03/25/2011 11:24 PM, Stuart D. Gathman wrote:
[snip]
>
> 2) make sure important LVs do not span multiple PVs (except for LVM
> mirroring) - you could be unhappy in the event of a system crash.
>

But isn't "volumes larger than physical devices" (one of) the raison 
d'etre of LVM?

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749
