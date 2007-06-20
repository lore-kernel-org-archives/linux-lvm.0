Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5KHwFxv014489
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 13:58:16 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5KHvub8023145
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 13:57:56 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 0105F1822A
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 19:57:54 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 1S1MTTPAnjJ8 for <linux-lvm@redhat.com>;
	Wed, 20 Jun 2007 19:57:10 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 7781018229
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 19:57:08 +0200 (CEST)
Received: from [192.168.0.33] (82-170-10-11.dsl.ip.tiscali.nl [82.170.10.11])
	by soetens.vdberg.org (Postfix) with ESMTP id D38F814C04F
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2007 19:57:07 +0200 (CEST)
Message-ID: <46796A73.1000504@vdberg.org>
Date: Wed, 20 Jun 2007 19:57:07 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Does pv failure effect whole vg?
References: <46777A32.7060808@vdberg.org>
In-Reply-To: <46777A32.7060808@vdberg.org>
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

Richard van den Berg wrote:
> In the case of a pv failure, will the vg that uses that pv become
> unavailable? Or just the lv that uses the pv? How about at boot time?
> If a pv is unavailable at boot, will the complete vg be unavailable?
> Or just the lv using the pv?

To answer my own question: when a pv is not available at boot time, the
vg using that pv does not come up. So splitting vgs makes sense when you
want to minimize the impact of one disk failure.

Sincerely,

Richard van den Berg
