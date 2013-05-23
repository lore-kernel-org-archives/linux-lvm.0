Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4N6j6OH002506
	for <linux-lvm@redhat.com>; Thu, 23 May 2013 02:45:07 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4N6j4af004291
	for <linux-lvm@redhat.com>; Thu, 23 May 2013 02:45:05 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1UfPGp-0007KY-PR
	for linux-lvm@redhat.com; Thu, 23 May 2013 08:45:03 +0200
Received: from 212.175.96.91 ([212.175.96.91])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 23 May 2013 08:45:03 +0200
Received: from alexis.pellicier by 212.175.96.91 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 23 May 2013 08:45:03 +0200
From: Alexis <alexis.pellicier@nds.k12.tr>
Date: Thu, 23 May 2013 09:31:23 +0300
Message-ID: <knkd3m$5kr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Subject: [linux-lvm] snapshot an lvm disk containing ext4 partitions
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I was use to snapshot an LVM volume containing ext4 partitions for backup 
purpose. This is a disk for Xen DomU paravirtualized linux box.

With lvm-2.02.98 and kernel  3.4.11 from opensuse 12.2 the ext4 partitions 
inside  the snapshot were clean.

Now I've upgraded to opensuse 12.3 (kernel 3.7.10 lvm-2.02.98)

Is lvm supposed to keep my inside ext4 partitions clean when snapshotting my 
volume? If not is theire any way of doing this?

Any advices welcome.

Thyank you.

Here some informations on my volume
#lvdisplay /dev/mes_volumes/serveur2
  --- Logical volume ---
  LV Path                /dev/mes_volumes/serveur2
  LV Name                serveur2
  VG Name                mes_volumes
  LV UUID                RcWN3e-oBYI-OnhW-Hdi5-eHjR-pe6R-ldpKDU
  LV Write Access        read/write
  LV Creation host, time , 
  LV Status              available
  # open                 1
  LV Size                100,00 GiB
  Current LE             25600
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     1024
  Block device           253:1

#kpartx /dev/mes_volumes/serveur2
mes_volumes-serveur2p1 : 0 4176837 /dev/mes_volumes/serveur2 63
mes_volumes-serveur2p2 : 0 41913585 /dev/mes_volumes/serveur2 4176900
mes_volumes-serveur2p3 : 0 142303770 /dev/mes_volumes/serveur2 46090485
mes_volumes-serveur2p4 : 0 21237930 /dev/mes_volumes/serveur2 188394255
