Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5993F202450A
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:41:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 032328E6997
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 19:41:29 +0000 (UTC)
Date: Wed, 9 Sep 2020 21:41:20 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <695805084.5038574.1599680480630.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Looking ahead - tiering with LVM?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm <linux-lvm@redhat.com>
Cc: =?utf-8?Q?H=C3=A5kon?= <hawken@thehawken.org>

>> First, filelevel is usually useless. Say you have 50 VMs with Windows
>> server something. A lot of them are bound to have a ton of equal
>> If you look at IOPS instead of just sequencial speed, you'll see the
>> difference. A set of 10 drives in a RAID-6 will perhaps, maybe, give
>> you 1kIOPS, while a single SSD might give you 50kIOPS or even more.
>> This makes a huge impact.
> 
> IOPs are already well server by LVM cache. So, I genuinely ask: what
> would be tiering advantage here? I'll love to ear a reasonable use case.

LVMcache only helps if the cache is there in the first place and IIRC it's cleared after a reboot. It help won't that much over time with large storage. It also wastes space.

Vennlig hilsen

roy
-- 
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
