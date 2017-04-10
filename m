Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DDFE8FE2B
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 09:29:17 +0000 (UTC)
Received: from nm30-vm5.bullet.mail.ir2.yahoo.com
	(nm30-vm5.bullet.mail.ir2.yahoo.com [212.82.97.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 762CC81245
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 09:29:15 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <2048a92a-0505-78c3-da00-8bf2043f4cbf@yahoo.co.uk>
Date: Mon, 10 Apr 2017 10:29:13 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] stripped LV with segments vs one segment
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
To: LVM general discussion and development <linux-lvm@redhat.com>

hi there

I could not extend my stripped LV, had 3 stripes and wanted 
to add one more.
Only way LVM let me do it was where I ended up with this:

   --- Segments ---
   Logical extents 0 to 751169:
     Type        striped
     Stripes        3
     Stripe size        16.00 KiB
     Stripe 0:
       Physical volume    /dev/sdd
       Physical extents    0 to 250389
     Stripe 1:
       Physical volume    /dev/sde
       Physical extents    0 to 250389
     Stripe 2:
       Physical volume    /dev/sdc
       Physical extents    0 to 250389

   Logical extents 751170 to 1001559:
     Type        linear
     Physical volume    /dev/sdf
     Physical extents    0 to 250389

1st question - was this really the only way LVM would extend?
2nd - is there performance penalty with segments like above 
vs one stripped segment?

many thanks,
L.
