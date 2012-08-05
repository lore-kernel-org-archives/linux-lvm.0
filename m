Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q75LZ7hs029523
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2012 17:35:07 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q75LZ3Cp026276
	for <linux-lvm@redhat.com>; Sun, 5 Aug 2012 17:35:04 -0400
Message-ID: <501EE710.9070703@profihost.ag>
Date: Sun, 05 Aug 2012 23:35:12 +0200
From: Stefan Priebe <s.priebe@profihost.ag>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dm thinp: pool get's bigger than allowd virtual disk
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

Hello list,

i created a thinp device with a maximum size of 100G and an initial size 
of 10G.

I started to copy 100GB to this disk and end up like this:

# lvs
     LV    VG      Attr     LSize   Pool  Origin Data%  Move Log Copy%
  Convert
     disk1 thinvol Vwi-aotz 100,00g pool1         99,96
     pool1 thinvol twi-a-tz 123,86g               80,71

this will waste 123,86g for all the time ?! As i can't use them.

Is this known? Is there a fix / solution?

Greets,
Stefan
