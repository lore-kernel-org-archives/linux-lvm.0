Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F33D600C0
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 16:48:36 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6ACD1C13DA10
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 16:48:33 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id B5665401A646
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 18:48:31 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Oct 2017 16:48:31 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <9c0c63e3-096a-2547-914a-36b680f3e745@yahoo.co.uk>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<9c0c63e3-096a-2547-914a-36b680f3e745@yahoo.co.uk>
Message-ID: <7ad2a4bffddffb25a1e90ba7e95af523@xenhideout.nl>
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

lejeczek schreef op 20-10-2017 16:20:

> I would - if bigger part of a storage subsystem resides in the
> hardware - stick to the hardware, use CacheCade, let the hardware do
> the lot.

In other words -- keep it simple (smart person) ;-).

Complicatedness is really the biggest reason for failure everywhere....
