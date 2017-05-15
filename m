Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46E7617DEF
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 03:16:55 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 169264E357
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 03:16:52 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 6169A40C1ABD
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 05:16:50 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 15 May 2017 05:16:50 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <f6fc4140fc2dc768e9eb18080f8442a5@xenhideout.nl>
Subject: [linux-lvm] on discards
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

On discards,

I have a thin pool that filled up when there was enough space, because 
the filesystem hadn't issued discards.

I have ext4 mounted with the discard option, I hope, because it is in 
the list of default mount options of tune2fs:

Default mount options:    user_xattr acl discard

What can I do to ensure that it won't happen again?

Is the filesystem really mounted with discard?

It doesn't say so anywhere.

Regards.
