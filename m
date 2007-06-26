Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5QLTvt4006687
	for <linux-lvm@redhat.com>; Tue, 26 Jun 2007 17:29:57 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5QLTtKe016209
	for <linux-lvm@redhat.com>; Tue, 26 Jun 2007 17:29:55 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 1DC7C1823D
	for <linux-lvm@redhat.com>; Tue, 26 Jun 2007 23:29:54 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 6esaTX47uMP0 for <linux-lvm@redhat.com>;
	Tue, 26 Jun 2007 23:29:34 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 2F4BE1823B
	for <linux-lvm@redhat.com>; Tue, 26 Jun 2007 23:29:33 +0200 (CEST)
Received: from [192.168.0.14] (82-170-10-11.dsl.ip.tiscali.nl [82.170.10.11])
	by soetens.vdberg.org (Postfix) with ESMTP id 58AEF14C2C8
	for <linux-lvm@redhat.com>; Tue, 26 Jun 2007 23:29:32 +0200 (CEST)
Message-ID: <4681853F.1050901@vdberg.org>
Date: Tue, 26 Jun 2007 23:29:35 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2, kernel 2.6.18 and pvmove
References: <4680A5B0.1000109@siptelecom.ru>
In-Reply-To: <4680A5B0.1000109@siptelecom.ru>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Владимир wrote:
> Is it safe to use pvmove on 2.6.18 kernel (debian 4.0)? I need to
> remove the old disk from LV.

I just did this and a bunch of other operations online using a custom
2.6.19 kernel on Debian 4.0, and it all went fine.

Sincerely,

Richard van den Berg
