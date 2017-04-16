Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B64441810A
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 09:47:05 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C804080F6C
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 09:47:02 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id E190340C0A24
	for <linux-lvm@redhat.com>; Sun, 16 Apr 2017 11:47:00 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 16 Apr 2017 11:47:00 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <c896c680a406c4b3b788b244c3d05948@xenhideout.nl>
Subject: [linux-lvm] thin volume usage report
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

So I concocted another thing:

     name             pct      size
     ------------------------------
     data          38.66%    15.43g
     home           8.22%     3.28g
     sites         33.55%    13.39g
     ------------------------------ +
     total         80.43%    32.11g

     reported      80.50%    32.13g
     available     19.50%     7.78g
     ------------------------------ +
     full size    100.00%    39.91g

This script will take a thin pool as a parameter (or search for all 
existing)
and obtain all non-snapshot volumes.

It then counts the PE usage of all segments of those volumes together.
Then based on the usage % it will calculate the number of extents in 
use.

It will turn that into a percentage of the total amount of extents in 
the pool.

Then it will calculate the size in use and turn it into a human readable 
form based on the LVM xxx.xxs format meaning that megabytes are also 
displayed 123.00m with a max of 999.00m but typically you would see 
0.99g or 2.23g figures.

Goes upto exa :p.

It obtains the VG PE_size (normally 4MB) for size calculations.

The discrepancy between "total" and "reported" is not yet used but 
typically this difference would sit in snapshots...

It would become:

     name             pct      size
     ------------------------------
     data          38.66%    15.43g
     home           8.22%     3.28g
     sites         33.55%    13.39g
     ------------------------------ +
     total         80.43%    32.11g
     unaccounted    0.07%    20.00m
     ------------------------------ +
     reported      80.50%    32.13g
     available     19.50%     7.78g
     ------------------------------ +
     full size    100.00%    39.91g

Or something of the kind.

The idea for this thing is of course to be used in reports but you could 
also run it manually.
