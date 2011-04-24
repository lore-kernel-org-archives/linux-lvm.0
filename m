Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3OG9Vga027348
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2011 12:09:31 -0400
Received: from eastrmfepo101.cox.net (eastrmfepo101.cox.net [68.230.241.213])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3OG9RVU032507
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2011 12:09:28 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo101.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP
	id <20110424160927.FYKM3772.eastrmfepo101.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2011 12:09:27 -0400
Message-ID: <4DB44B37.6000501@cox.net>
Date: Sun, 24 Apr 2011 11:09:27 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Insufficient suitable allocatable extents for logical
	volume
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

Why does this happen?  I think it has something to do with the fact that 
I set the lv to striped.

TIA,
Ron

# lvm version
   LVM version:     2.02.54(1) (2009-10-26)
   Library version: 1.02.39 (2009-10-26)
   Driver version:  4.17.0

(Yes, I know it's old.  Blame Ubuntu)

# vgdisplay data_vg
   --- Volume group ---
   VG Name               data_vg
   System ID
   Format                lvm2
   Metadata Areas        12
   Metadata Sequence No  6
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                1
   Open LV               0
   Max PV                0
   Cur PV                12
   Act PV                12
   VG Size               5.46 TiB
   PE Size               8.00 MiB
   Total PE              715392
   Alloc PE / Size       476928 / 3.64 TiB
   Free  PE / Size       238464 / 1.82 TiB
   VG UUID               NPgp1H-6kkG-c4wL-KNyT-AVoh-Frlb-4nvfiT


# lvextend -v -l+100%FREE data_vg/data_lv
     Finding volume group data_vg
   Using stripesize of last segment 8.00 MiB
     Archiving volume group "data_vg" metadata (seqno 6).
   Extending logical volume data_lv to 5.46 TiB
   Insufficient suitable allocatable extents for logical volume data_lv: 
238464 more required


# lvextend -v -l+50%FREE data_vg/data_lv
     Finding volume group data_vg
   Using stripesize of last segment 8.00 MiB
     Archiving volume group "data_vg" metadata (seqno 6).
   Extending logical volume data_lv to 4.55 TiB
   Insufficient suitable allocatable extents for logical volume data_lv: 
119232 more required

# lvextend -v -l+10%FREE data_vg/data_lv
     Finding volume group data_vg
   Using stripesize of last segment 8.00 MiB
   Rounding size (500774 extents) down to stripe boundary size for 
segment (500768 extents)
     Archiving volume group "data_vg" metadata (seqno 6).
   Extending logical volume data_lv to 3.82 TiB
   Insufficient suitable allocatable extents for logical volume data_lv: 
23840 more required

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749
