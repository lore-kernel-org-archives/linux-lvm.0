Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m239Q3Dr031098
	for <linux-lvm@redhat.com>; Mon, 3 Mar 2008 04:26:03 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m239PT1R005819
	for <linux-lvm@redhat.com>; Mon, 3 Mar 2008 04:25:30 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 8F7E960AC0
	for <linux-lvm@redhat.com>; Mon,  3 Mar 2008 10:25:23 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id BD043933D
	for <linux-lvm@redhat.com>; Mon,  3 Mar 2008 10:25:22 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id rtqpSv6c6Erw for <linux-lvm@redhat.com>;
	Mon,  3 Mar 2008 10:25:07 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b7817.pool.mediaWays.net
	[77.11.120.23]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon,  3 Mar 2008 10:25:07 +0100 (CET)
Message-ID: <47CBC3F2.70301@wpkg.org>
Date: Mon, 03 Mar 2008 10:25:06 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot of a Snapshot
References: <A374F37068535C46BFCF8D48CF29AA7FA60102@zen.zetex.com>
In-Reply-To: <A374F37068535C46BFCF8D48CF29AA7FA60102@zen.zetex.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Karl Wagner schrieb:
> Not quite, although this would also be nice. Maybe I should explain my
> current setup better.
> 
> Firstly, I have a Xen DomU machine running several Dom0's.

Just to use correct terms: in a Xen world, one runs domU (or, a guest) 
on top of dom0 (a.k.a host), not the other way around.

So you have a Xen dom0 running several domUs.


-- 
Tomasz Chmielewski
http://wpkg.org
