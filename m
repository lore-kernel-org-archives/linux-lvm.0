Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5MESHu31954
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 10:28:17 -0400
Received: from quantik.adsis.local (asi-87.asi256ip.easynet.fr [212.180.39.87])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5MESGVP024264
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 10:28:17 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by quantik.adsis.local (Postfix) with ESMTP id 28C70514F7B
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 16:28:05 +0200 (CEST)
Received: from quantik.adsis.local ([127.0.0.1])
	by localhost (quantik [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 28103-01 for <linux-lvm@redhat.com>;
	Wed, 22 Jun 2005 16:27:59 +0200 (CEST)
Received: from [192.168.0.101] (pc101.s000.adsis.local [192.168.0.101])
	by quantik.adsis.local (Postfix) with ESMTP id 80972514F67
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 16:27:59 +0200 (CEST)
Message-ID: <42B9757C.8020302@adsis.fr>
Date: Wed, 22 Jun 2005 16:28:12 +0200
From: =?ISO-8859-1?Q?Gr=E9gory_Duchatelet?= <greg@adsis.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM is low
References: <42B6ECDB.8050100@adsis.fr>
	<42B95A45.1080308@adsis.fr>	<42B96078.8090504@dsvr.net>
	<42B96CFF.9050505@adsis.fr> <42B96F3E.9090402@berbee.com>
In-Reply-To: <42B96F3E.9090402@berbee.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alan Jurgensen a �crit :

> Why dont you create a 'regular' reiserfs partition on the same server 
> and re-try your transfer.
>
> Comparing to another server isnt really fair; too many other factors: 
> OS level, Network, Config, Server Load, Hardware, Disks, etc.
>
> Scp isn't a good gauge of disk performance, as its bottlenecks are 
> network and CPU (decryption). Why not try 'bonnie', a disk benchmarker.

This server has a regular reiserfs partition earlier, i just reinstall 
it with LVM, and now i didn't need benchmarkers to see that write access 
is really really low !! :-(

-- 
Gr�gory Duchatelet <gregory@adsis.fr>
Ing�nieur syst�mes & r�seaux
ADSiS - Technologies Open-Source
http://www.adsis.fr/ - <contact@adsis.fr>
