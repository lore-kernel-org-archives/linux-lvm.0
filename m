Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E1C5C677
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 21:21:54 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1388DCAA65
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 21:21:54 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v9HLLmdH023033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 17:21:53 -0400
Date: Tue, 17 Oct 2017 17:21:48 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
Message-ID: <alpine.LRH.2.21.1710171713001.9273@fairfax.gathman.org>
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
	<4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
	<alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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

On Tue, 17 Oct 2017, Stuart D. Gathman wrote:

> thanks!), and is not the same as raid1+0 (raid1 on top of raid0).

Sorry, that is raid0 on top of raid1.  With raid1 on top, then after
the first disk failure, the second failure has a 66% chance of
destroying the data.  With raid0 on top, the second failure has only
a 33% chance of destroying the data.

Raid10 is a way of striping the data with redundancy in a single layer.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
