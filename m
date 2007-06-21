Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5LGXdtG014430
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 12:33:39 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5LGXbYA028993
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 12:33:37 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 628821822A
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 18:33:36 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id w78ZmdoVJoc9 for <linux-lvm@redhat.com>;
	Thu, 21 Jun 2007 18:32:01 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id D8CBA18228
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 18:31:56 +0200 (CEST)
Received: from [192.168.0.33] (82-170-10-11.dsl.ip.tiscali.nl [82.170.10.11])
	by soetens.vdberg.org (Postfix) with ESMTP id 1D8BC14C04F
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 18:31:56 +0200 (CEST)
Message-ID: <467AA7FB.1060700@vdberg.org>
Date: Thu, 21 Jun 2007 18:31:55 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Does pv failure effect whole vg?
References: <Pine.LNX.4.44.0706211043080.17457-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0706211043080.17457-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
> When md devices haven't come up, it has been one of the following:
>   

I think in this case it has to do with lvm being started before mdadm on
the systemrescuecd. I'll start a thread on their support site..

Sincerely,

Richard van den Berg
