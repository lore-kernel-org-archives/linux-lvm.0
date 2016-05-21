Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4LFcthr027806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 21 May 2016 11:38:55 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EBA23B70E
	for <linux-lvm@redhat.com>; Sat, 21 May 2016 15:38:52 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 5268E7FB42
	for <linux-lvm@redhat.com>; Sat, 21 May 2016 17:38:50 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 21 May 2016 17:38:49 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <1953f85f68fef3b30d5efeef85aec94d@dds.nl>
Subject: [linux-lvm] separate vg create, or merge?
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

If I can ask.

Can you separately create two PVs, put a VG to them, and fill them with 
LVs, when these VGs would have the same name, and then at some later 
point, in that sense, you would combine them?

I guess in practice if that happens you would have the ability to just 
use vgextend.

But what if you allowed two pre-existing PVs/VGs when the VGs had the 
same name, in the same system? I believe it wouldn't work very well?

Currently I just gave them different names and plan on merging them.

Regards.
