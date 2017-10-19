Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13CE16031A
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 18:13:20 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A13620271
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 18:13:17 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id D500240BAE5A
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 20:13:15 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 19 Oct 2017 20:13:15 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
Message-ID: <e1f18d05e7670e9d63075854195a2c70@xenhideout.nl>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: linux-lvm@redhat.com

Oleg Cherkasov schreef op 19-10-2017 19:54:

> Any ideas what may be wrong?

All I know myself in the past have tried to cache an embedded encrypted 
LVM in a regular home system.

The problem was probably caused by the SSD not clearing write caches 
fast enough but I too got some 2 minute "hanging process" outputs on the 
console.

So it was probably a queueing issue within the kernel and might not have 
been related to the cache,

but I'm still not sure if there wasn't an interplay at work.

The main cause was a way too slow SSD but at the same time... that sorta 
thing still shouldn't happen, locking up the entire system.

I haven't had a chance to try again with a faster SSD.

Regards...
