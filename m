Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i51GaI001457
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2004 12:36:18 -0400
Received: from mail.shadowconnect.com ([213.239.201.226])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i51GaGi5007944
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2004 12:36:17 -0400
Received: from pd9e0a27b.dip.t-dialin.net ([217.224.162.123]
	helo=[192.168.1.52])
	by mail.shadowconnect.com with asmtp (TLSv1:AES256-SHA:256)
	(Exim 4.34) id 1BVCFH-0002Gy-Qp
	for linux-lvm@redhat.com; Tue, 01 Jun 2004 18:36:12 +0200
Message-ID: <40BCB207.7090404@shadowconnect.com>
Date: Tue, 01 Jun 2004 18:42:47 +0200
From: Markus Lidel <Markus.Lidel@shadowconnect.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050900030703020200080905"
Subject: [linux-lvm] [PATCH] to create a PV on a I2O RAID array
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------050900030703020200080905
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

attached is a patch, which makes it possible to create a PV on a I2O 
RAID array.

For further questions feel free to contact me.


Best regards,


Markus Lidel
------------------------------------------
Markus Lidel (Senior IT Consultant)

Shadow Connect GmbH
Carl-Reisch-Weg 12
D-86381 Krumbach
Germany

Phone:  +49 82 82/99 51-0
Fax:    +49 82 82/99 51-11

E-Mail: Markus.Lidel@shadowconnect.com
URL:    http://www.shadowconnect.com


--------------050900030703020200080905
Content-Type: text/x-patch;
 name="lvm2-i2o.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvm2-i2o.patch"

diff -ur LVM2.2.00.15/lib/filters/filter.c LVM2.2.00.15.new/lib/filters/filter.c
--- LVM2.2.00.15/lib/filters/filter.c	2004-04-14 19:33:51.000000000 +0200
+++ LVM2.2.00.15.new/lib/filters/filter.c	2004-05-07 04:13:01.534026664 +0200
@@ -54,6 +54,7 @@
 	{"ataraid", 16},	/* ATA Raid */
 	{"drbd", 16},		/* Distributed Replicated Block Device */
 	{"power2", 16},		/* EMC Powerpath */
+	{"i2o_block", 16},	/* I2O block disk */
 	{NULL, 0}
 };
 

--------------050900030703020200080905--
