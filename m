Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u79A8Bph002998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 9 Aug 2016 06:08:12 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E9D04E324
	for <linux-lvm@redhat.com>; Tue,  9 Aug 2016 10:08:10 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id D0F2D40B2382
	for <linux-lvm@redhat.com>; Tue,  9 Aug 2016 11:58:34 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Aug 2016 11:58:35 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <16a575c3fb60f2579ab1687540cea01e@dds.nl>
Subject: [linux-lvm] sata cable disconnect + hotplug after
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

What am I supposed to do when a sata cable disconnects and reconnects as 
another device?

I had a disk at probably /dev/sda.

At a certain point the filesystem had become read-only. I realized the 
cable must have disconnected and after fixing it the same device was now 
at /dev/sdf.

Now the device had gone missing from the system but it would not refind 
it.

# pvscan
   WARNING: Device for PV fEGbBn-tbIp-rL7y-m22b-1rQh-r9i5-Qwlqz7 not 
found or rejected by a filter.
   PV unknown device                VG xenpc1          lvm2 [600,00 GiB / 
158,51 GiB free]

pvck clearly found it and lvmdiskscan also found it. Nothing happened 
until I did pvscan --cache /dev/sdf:

# pvscan --cache /dev/sdf
# vgscan
   Reading all physical volumes.  This may take a while...
   Duplicate of PV fEGbBn-tbIp-rL7y-m22b-1rQh-r9i5-Qwlqz7 dev /dev/sdf 
exists on unknown device 8:0
   Found volume group "xenpc1" using metadata type lvm2

Now I was able to activate it again and it was no longer flagged as 
partial (but now it is duplicate).

The unknown device 8:0 is clearly going to be /dev/sda, which is no 
longer there.

How can I dump this reference to 8:0 or should something else be done?

Oh right.... pvscan --cache without a parameter....

I wonder if I can run this while the thing is still activated....

I was beginning to think there'd be some hidden filter rule, but it was 
"just" the cache.

Should this thing be automatically resolved? Is running pvscan --cache 
enough?
