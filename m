Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6RCrBK5008713
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 08:53:11 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6RCr96h009129
	for <linux-lvm@redhat.com>; Fri, 27 Jul 2012 08:53:09 -0400
Message-ID: <50128F2C.4040308@profihost.ag>
Date: Fri, 27 Jul 2012 14:53:00 +0200
From: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] metadata problems while testing lvm2 git with
	dm_thin_pool
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
To: linux-lvm@redhat.com

Hello list,

lvm autogrow grows more than allowed virtual size.

Kernel: 3.5-rc7
lvm/dmeventd: up2date git version 186a2772

I created my thin disk like this:
lvcreate --poolmetadatasize 5G -L 10G -T thinvol/pool1 -V 100G --name disk1

After some autoresizing lvs looks like this:
# lvs
   LV    VG      Attr     LSize   Pool  Origin Data%  Move Log Copy% Convert
   disk1 thinvol Vwi-a-tz 100,00g pool1         22,95
   pool1 thinvol twi-a-tz  33,77g               67,97

When i copy constantly data to my device - i end up here:
# lvs
   LV    VG      Attr     LSize   Pool  Origin Data%  Move Log Copy% 
Convert
   disk1 thinvol Vwi-aotz 100,00g pool1         99,96 

   pool1 thinvol twi-a-tz 123,86g               80,71

So the pool is bigger than disk1 and the 23,86GB will never get used as 
the disk is FULL.

Is this expected?

Greets
Stefan
