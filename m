Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v06Itwj3005534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 6 Jan 2017 13:55:58 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EBCC61BB6
	for <linux-lvm@redhat.com>; Fri,  6 Jan 2017 18:55:56 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 5055B8E52F
	for <linux-lvm@redhat.com>; Fri,  6 Jan 2017 19:55:53 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jan 2017 19:55:53 +0100
From: Xen <list@xenhideout.nl>
Message-ID: <ea995d2fb8e2be94ab44e870c88a5be8@xenhideout.nl>
Subject: [linux-lvm] duplicate pv change uuid
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

I want to ask again,

How can I change the UUID of a duplicated PV?

I mirrored a partition to another disk and tried to change its UUID with 
pvchange -u.

But I think LVM had already decided to replace the reference to the PV 
(partition) on the old disk by the reference to the new disk, or 
something.

For some reason it always prefers the wrong one.

Now I booted with just one disk but I cannot change the UUID of the 
running system, but if I connect the other disk I am afraid I won't be 
able to change it also.

How does one do this, again?
