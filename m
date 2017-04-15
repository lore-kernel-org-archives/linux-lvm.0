Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D0762925
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 17:48:46 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE0A961B9F
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 17:48:42 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id 1F7D6410218E
	for <linux-lvm@redhat.com>; Sat, 15 Apr 2017 19:48:41 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Apr 2017 19:48:41 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <cdaeb04f7f4d006db9ae61faa71f5a9c@xenhideout.nl>
Subject: [linux-lvm] thin snapshot actual usage
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

Short question.

When a snapshot is created of some thin volume its data_percent is 
typically the same as for its parent volume.

However that doesn't mean it actually uses those extents for itself.

How can I obtain actual information as to how much extents the thin 
volume uses?

I also realized that putting data on a thin volume does not have to 
cause the thin snapshot to allocate more of the previous extents were 
unused?

So for a thin volume that does not see a lot of data *changes* but only 
data *growth* it means all of this data is only allocated once right.

Regards.
