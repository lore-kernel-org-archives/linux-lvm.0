Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2AE95807373
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 09:09:05 -0500
Received: from Cantor.suse.de (ns.suse.de [195.135.220.2])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2AE9207003518
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 09:09:02 -0500
Received: from extimap.suse.de (extimap.suse.de [195.135.220.6])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(No client certificate requested)
	by Cantor.suse.de (Postfix) with ESMTP id E42152C8693
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 15:08:56 +0100 (CET)
Received: from watt.suse.com (unknown [24.169.15.66])
	(using TLSv1 with cipher EDH-RSA-DES-CBC3-SHA (168/168 bits))
	(Client did not present a certificate)
	by extimap.suse.de (Postfix) with ESMTP id 1EED283DDC
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 15:08:45 +0100 (CET)
From: Chris Mason <mason@suse.com>
Message-Id: <1078927858.25064.1468.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [PATCH] calc_max_buckets bug
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar 10 09:07:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello everyone,

This is in both 2.4.x lvm and 2.6.x dm code, calc_max_buckets is broken
for 32bit machines with > 4GB of ram.  This leads to -ENOMEM errors
during snapshot creation.

The patch below just changes things to allocate 2MB worth of hash
buckets all the time.  Has anyone done benchmarking into how much cpu
time snapshots spend on hash table lookups?

-chris

Index: linux.24/drivers/md/lvm-snap.c
===================================================================
--- linux.24.orig/drivers/md/lvm-snap.c	2004-03-09 18:07:59.000000000 -0500
+++ linux.24/drivers/md/lvm-snap.c	2004-03-09 20:20:34.000000000 -0500
@@ -504,13 +504,9 @@ out:
 
 static int calc_max_buckets(void)
 {
-	unsigned long mem;
-
-	mem = num_physpages << PAGE_SHIFT;
-	mem /= 100;
-	mem *= 2;
+	/* use a fixed size of 2MB */
+	unsigned long mem = 2 * 1024 * 1024;
 	mem /= sizeof(struct list_head);
-
 	return mem;
 }
 
