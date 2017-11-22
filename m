Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E11D12A74
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 08:55:30 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C386C057FA8
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 08:55:26 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id E8D586F81F
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2017 09:55:26 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Nov 2017 09:55:24 +0100
From: Xen <list@xenhideout.nl>
Message-ID: <3c2aefc590d9dc46c5b366437bab30bd@xenhideout.nl>
Subject: [linux-lvm] Reattach cache
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
To: Linux lvm <linux-lvm@redhat.com>

Ehm,

When you split a cache and later reattach it, LVM ensures it is in a 
consistent state right?

LVM is a bit old, I mean Ubuntu 16.04 version, so something about 133.
