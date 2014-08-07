Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s77J6BC6031594
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 15:06:11 -0400
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s77J67wK011647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 15:06:10 -0400
Received: from [192.168.4.12] (athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	s77J62iV005849
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 12:06:05 -0700
Message-ID: <53E3CE1C.4050506@tlinx.org>
Date: Thu, 07 Aug 2014 12:06:04 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove: Physical Volume "/dev/sdc1" not found in Volume
	Group + minor bug
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

I'm trying to move an LV from one VG on 1 PV to another VG on another PV,
but it doesn't seem to like my syntax. Isn't it: " -n LV FROMPV TOPV"

>  sudo pvmove -n Win /dev/sda1 /dev/sdc1
  Physical Volume "/dev/sdc1" not found in Volume Group "HnS"


Pertinent details:
>  lvs  #(From volume in HnS)
  LV                       VG      Attr      LSize  
  Sys                      HnS     -wc-a----  96.00g

>  pvs  #(from VG HnS on PV /dev/sda1, destination PV = /dev/sdc1
  PV         VG      Fmt  Attr PSize  PFree
  /dev/sda1  HnS     lvm2 a--  21.83t 10.20t
  /dev/sdc1  Data    lvm2 a--  43.66t 39.46t

----
Before I got to that point:
>  sudo pvmove -n Win /dev/sda1 /dev/sdc1
  Required device-mapper target(s) not detected in your kernel
(for some reason kernel module isn't auto-loaded???  (the minor bug..))
So:
>  sudo modprobe dm-mirror

-- Don't know if any other modules are needed?  I have:
>  ls -d  /sys/module/dm*
/sys/module/dm_bufio/  /sys/module/dm_mirror/  /sys/module/dm_region_hash/
/sys/module/dm_log/    /sys/module/dm_mod/     /sys/module/dm_snapshot/
---
Available (not loaded):
>  sudo modprobe dm-<COMPLETE>
dm-bio-prison       dm-raid             dm-zero
dm-persistent-data  dm-thin-pool

I'm assuming I only needed the dm-mirror so it could do the
mirroring?  What syntax should I be using?

Thanks!
       
