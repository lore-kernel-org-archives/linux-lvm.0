Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7O2XpV23870
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 22:33:51 -0400
Received: from luce.ui.ac.id (luce.ui.ac.id [152.118.24.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7O2Xec2012833
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 22:33:44 -0400
Received: from luce.ui.ac.id (morpheus.cso.ui.ac.id [152.118.24.28])
	by luce.ui.ac.id (Postfix) with ESMTP id 0738B2A4067
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:34:37 +0700 (WIT)
Received: from phoenix.ui.edu (phoenix.ui.ac.id [152.118.24.99])
	by luce.ui.ac.id (Postfix) with ESMTP id EFCED2A4064
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:34:35 +0700 (WIT)
Received: from [152.118.37.61] (athena.staf.cso.ui.ac.id [152.118.37.61])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by phoenix.ui.edu (Postfix) with ESMTP id 7035043024
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:37:35 +0700 (WIT)
Message-ID: <430BDC79.9000407@ui.edu>
Date: Wed, 24 Aug 2005 09:33:29 +0700
From: Arianto C Nugroho <arianto.nugroho@ui.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] creating snapshot
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

Hi ...

I'm trying to create a read-only snapshot for backup purpose, but i'm 
getting this error :

snapshot: Required device-mapper target(s) not detected in your kernel

problem is i already compiled the device-mapper inside the kernel (not 
as module).

I'm using a debian sarge and linux-2.6.12 kernel.

What seems to be the problem ??

Thanks before for any help.
