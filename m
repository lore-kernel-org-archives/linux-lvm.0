Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l65Gs78t008061
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:54:08 -0400
Received: from vps.decarpentier.com (vps.decarpentier.com [208.78.99.7])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l65Gs0dc000587
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:54:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by vps.decarpentier.com (Postfix) with ESMTP id 1C9FB805E5
	for <linux-lvm@redhat.com>; Thu,  5 Jul 2007 18:54:01 +0200 (CEST)
Received: from vps.decarpentier.com ([127.0.0.1])
	by localhost (vps.decarpentier.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id KkaGUeu4pQFV for <linux-lvm@redhat.com>;
	Thu,  5 Jul 2007 18:53:56 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by vps.decarpentier.com (Postfix) with ESMTP id EA67B805E4
	for <linux-lvm@redhat.com>; Thu,  5 Jul 2007 18:53:55 +0200 (CEST)
Received: from [192.168.0.34] (h8441201224.dsl.speedlinq.nl [84.41.201.224])
	by soetens.vdberg.org (Postfix) with ESMTP id B6CDB14C35F
	for <linux-lvm@redhat.com>; Thu,  5 Jul 2007 18:53:53 +0200 (CEST)
Message-ID: <468D2221.7000004@vdberg.org>
Date: Thu, 05 Jul 2007 18:53:53 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Pvmove Cannot Be Aborted
References: <20070704140438.8BE0177702@mail.futurelabusa.com>
In-Reply-To: <20070704140438.8BE0177702@mail.futurelabusa.com>
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

Jim Schatzman wrote:
> So... I have learned my lesson - never use pvmove on a bad drive. 

Your VG and LVs are not in worse shape now (after the stuck pvmove) than
they would have been if you did not attempt the pvmove, right? I guess
you did not use use raid on top of or under lvm?

Sincerely,

Richard van den Berg
