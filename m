Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48FFD60C9C
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 10:53:29 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CD99356D9
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 10:53:28 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id C76BC64E76
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 11:53:28 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Nov 2017 11:53:26 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <181942124.99954.1511342208833@mail.yahoo.com>
References: <181942124.99954.1511342208833.ref@mail.yahoo.com>
	<181942124.99954.1511342208833@mail.yahoo.com>
Message-ID: <e6c6a86869d69be7d2d32662a441b1f0@xenhideout.nl>
Subject: Re: [linux-lvm] Reattach cache
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

matthew patton schreef op 22-11-2017 10:16:
> by definition when you detach a cache it is now entirely invalid and
> will (should) be treated as empty.

Yeah but it wasn't.

Within seconds the rootfs was readonly and because I was running some 
apt thing at the same time, now a large bunch of packages became 
corrupted in the apt index (dpkg index).

A bunch are still missing md5 files but I am on limited bandwidth so not 
reinstalling.

So I assumed the above that you write.

But it bit me once more.
