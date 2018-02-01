Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE8DD80DB
	for <linux-lvm@redhat.com>; Thu,  1 Feb 2018 16:45:19 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B6944E4C3
	for <linux-lvm@redhat.com>; Thu,  1 Feb 2018 16:45:16 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id A84F3407F2DC
	for <linux-lvm@redhat.com>; Thu,  1 Feb 2018 17:45:13 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 01 Feb 2018 17:45:14 +0100
From: Xen <list@xenhideout.nl>
Message-ID: <483f0010a2bb04054c8434d70e0248a2@xenhideout.nl>
Subject: [linux-lvm] Saying goodbye to LVM
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

You are probably happy about this, but...

I managed to get LVM to corrupt my data on Ubuntu Xenial 3 times now.

All of that is related to:

- LVM not checking or behaving correctly when a duplicate PV appears
- LVM not checking or behaving correctly when a cache volume is out of 
sync with its origin.

In addition the thin DM target of kernel 3.x was so buggy I couldn't 
compile anything big without the system hanging.

I will probably become a ZFS user.

Goodbye, and thanks for all the fish.
