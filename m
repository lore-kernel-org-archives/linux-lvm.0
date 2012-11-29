Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAT37qLI023733
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 22:07:52 -0500
Received: from smtp3.pacifier.net (smtp3.pacifier.net [64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAT37pOj002687
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 22:07:51 -0500
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp3.pacifier.net (Postfix) with ESMTPS id 4D9C838F09
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2012 19:07:51 -0800 (PST)
From: ben <benscott@nwlink.com>
Date: Wed, 28 Nov 2012 19:07:49 -0800
Message-ID: <2726839.KTFC4Ya9jJ@laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] Questions about thin pools and segment properties
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
To: linux-lvm@redhat.com

If I start with a pool like this:

lvs --all --segments -o +chunksize,discards
  LV            VG   Attr      #Str Type      SSize   Chunk  Discards
  pool1         vg1  twi-a-tz-    1 thin-pool 100.00m 64.00k passdown
  [pool1_tdata] vg1  Twi-aot--    1 linear     50.00m     0          
  [pool1_tdata] vg1  Twi-aot--    1 linear     50.00m     0          
  [pool1_tmeta] vg1  ewi-aot--    1 linear      2.00m     0 

My first question is if I look at "pool1" with liblvm2pp will
there ever be more than one segment? I know "pool1_tdata"
can have more but it looks like "pool1" is just one.
My second question is if discards and chunksize are segment
properties, can a pool have more than one setting of either?

Thank you.

Thank you.
