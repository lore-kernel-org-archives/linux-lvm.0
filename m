Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAGLti7w023231
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 16:55:45 -0500
Received: from oxmail.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAGLtTu7015572
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 16:55:29 -0500
Received: from [10.255.0.156] (fw.iplink.net [192.139.81.98])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by oxmail.iplink.net (Postfix) with ESMTP id 4EED5A68F75
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 16:55:24 -0500 (EST)
Message-ID: <4B01CA4B.2060909@alteeve.com>
Date: Mon, 16 Nov 2009 16:55:23 -0500
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Backing up clustered LVM... options?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Well this threw a monkey wrench in my plans:

root@vsh02:~# lvcreate --size=230G -s -n res01_snap 
/dev/dom0_vg0/res01.disk.xm
   Clustered snapshots are not yet supported.

What options do I have?

I'm running a two-node cluster with the LVM PV on a DRBD partition in 
Primary/Primary mode with, obviously, clustering enabled. Each Xen 
virtual machine has a dedicated LV (ie: res01.disk.xm above). One VM has 
a very large DB and I was planning to use LVM snapshots to keep the DB 
lock time to a minimum...

Thanks for any advice.

Madi
