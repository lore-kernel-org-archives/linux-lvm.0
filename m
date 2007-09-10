Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8A7OCwI028641
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 03:24:12 -0400
Received: from postman.formosahost.com (postman.formosahost.com [203.190.4.19])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8A7O27b001331
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 03:24:02 -0400
Received: from localhost (localhost [127.0.0.1])
	by postman.formosahost.com (Postfix) with ESMTP id 68C3D8A28C
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 15:20:33 +0800 (CST)
Received: from postman.formosahost.com ([127.0.0.1])
	by localhost (postman.formosahost.com [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id onUv2eU6IatT for <linux-lvm@redhat.com>;
	Mon, 10 Sep 2007 15:20:30 +0800 (CST)
Received: from [192.168.0.99] (unknown [203.190.4.13])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postman.formosahost.com (Postfix) with ESMTP id CEC4F8A28E
	for <linux-lvm@redhat.com>; Mon, 10 Sep 2007 15:20:30 +0800 (CST)
Message-ID: <46E4F110.6040003@ezpear.com>
Date: Mon, 10 Sep 2007 15:24:00 +0800
From: hans <hans@ezpear.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm HA problem with  file descriptor left open 
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi!
I'm trying to use Openfiler with setup LVM+ DRBD+failover.
I have problem with LVM error when server shutdown and another should
take over.

1. If I will shutdown main, Secondary start up with no problem.
2. But when I shutdown Secondary (now Master), main (now backup) cannot
start up and shows errors with descriptor.
LVM[8796]:      2007/09/10_14:55:26 INFO: Deactivating volume group
vg0_sites
LVM[8796]:      2007/09/10_14:55:26 INFO: File descriptor 3 left open
File descriptor 5 left open File descriptor 6 left open File descriptor
7 left open File descriptor 8 left open File descriptor 9 left open File
descriptor 10 left open File descriptor 11 left open File descriptor 12
left open 0 logical volume(s) in volume group "vg0_sites" now active

Later if I will manually take over drbd I cannot see files created on
another machine.

Does anybody know solution for this problem? Is it possible to force LVM
to close descriptors?

Regards,
Hans
