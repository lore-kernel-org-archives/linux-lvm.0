Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HN0buF028749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 18:00:37 -0500
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 620F081240
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 23:00:36 +0000 (UTC)
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	v1HN0W7r022345
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2017 15:00:34 -0800
Message-ID: <58A78089.7020202@tlinx.org>
Date: Fri, 17 Feb 2017 15:00:25 -0800
From: L A Walsh <lvm@tlinx.org>
MIME-Version: 1.0
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>	<1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>	<58A64774.10004@tlinx.org>
	<2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove speed
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Roy Sigurd Karlsbakk wrote:
> I get 200MB on a cold day and 500 on a nice one from this SAN. These 40-50MB/s seem really being limited by pvmove alone. Nothing else shows this limit. That's why I'm asking.
>   
---
    200-500... impressive for a SAN... but considering the bandwidth
you have to the box (4x1+10), I'd hope for at least 200 (what I get
w/just a 10)... so must be some parallel TCP channels there... he..
What showed those speeds?  I'm _guessing_, but its likely that pvmove
is single threaded.  So could be related to the I/O transfer size as
@pattonme was touching on, since multi-threaded I/O can slow things
down for local I/O when local I/O is in the .5-1GBps and higher range.

    Curious -- do you know your network's cards' MTU size?
I know that even w/1Gb cards I got 2-4X speed improvement over
standard 1500 packets (run 9000/9014 byte MTU's over local net).

    I'd have to look at the source for more info...

-l
