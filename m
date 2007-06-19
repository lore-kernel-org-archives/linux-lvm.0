Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5J6dxer013688
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 02:39:59 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5J6dwAg003496
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 02:39:58 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 9E27C18229
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 08:39:56 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 2Jyt9V6jqIA9 for <linux-lvm@redhat.com>;
	Tue, 19 Jun 2007 08:39:52 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id D258918228
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 08:39:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by soetens.vdberg.org (Postfix) with ESMTP id 8DAE614C492
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 08:39:51 +0200 (CEST)
Received: from soetens.vdberg.org ([127.0.0.1])
	by localhost (soetens.vdberg.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uutBafdm668q for <linux-lvm@redhat.com>;
	Tue, 19 Jun 2007 08:39:50 +0200 (CEST)
Received: from [192.168.0.11] (82-170-10-11.dsl.ip.tiscali.nl [82.170.10.11])
	by soetens.vdberg.org (Postfix) with ESMTP id 0066C14C35E
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2007 08:39:49 +0200 (CEST)
Message-ID: <46777A32.7060808@vdberg.org>
Date: Tue, 19 Jun 2007 08:39:46 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Does pv failure effect whole vg?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

In the case of a pv failure, will the vg that uses that pv become 
unavailable? Or just the lv that uses the pv? How about at boot time? If 
a pv is unavailable at boot, will the complete vg be unavailable? Or 
just the lv using the pv?

I'm trying to decide if I should plan a reboot to split my current vg. 
Currently my vg00 uses pv md2 (raid1 mirror) and sdb3. If sdb fails, I 
don't want to loose the lvs using the mirror. Is a vg split required to 
achieve this?

Sincerely,

Richard van den Beg
