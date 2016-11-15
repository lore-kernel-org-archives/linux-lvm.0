Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAFER8nv026259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2016 09:27:09 -0500
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id C777761BB6
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2016 14:27:05 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr001msb.fastweb.it
	(8.5.140.05) id 579B4F7505289798 for linux-lvm@redhat.com;
	Tue, 15 Nov 2016 15:27:04 +0100
Received: from [172.31.255.5] (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id E8ED92C1C35
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2016 15:27:03 +0100 (CET)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <08e2dced-aa3e-165c-366b-0676a30cd20a@assyoma.it>
Date: Tue, 15 Nov 2016 15:27:03 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Underlying physical volume resized?!
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

Dear all,
I have a question about a warning message LVM is showing. I am using 
CentOS 6.8 x86_64. Here is my pvs/vgs/lvs configuration:

pvs:
   PV         VG   Fmt  Attr PSize   PFree
   /dev/sda2  vg   lvm2 a--u   9,51g    0
   /dev/sda3  vg   lvm2 a--u 110,00g    0
   /dev/sdb1  vg   lvm2 a--u 120,00g 4,00g

vgs:
   VG   #PV #LV #SN Attr   VSize   VFree
   vg     3   2   0 wz--n- 239,50g 4,00g

lvs:
   LV      VG   Attr       LSize   Pool Origin Data%  Meta%  Move Log 
Cpy%Sync Convert
   lv_root vg   -wi-ao---- 233,56g
   lv_swap vg   -wi-ao----   1,94g

Both at kernel discovery (during boot) and when issuing lvs or other LVM 
commands I have the warning:

"Device /dev/sda2 has size of 19945392 sectors which is smaller than 
corresponding PV size of 19945472 sectors. Was device resized? One or 
more devices used as PVs in VG vg have changed sizes."

However, my partitions where never shrunk. fdisk on /dev/sda:

Disk /dev/sda: 128.8 GB, 128849018880 bytes
255 heads, 63 sectors/track, 15665 cylinders, total 251658240 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000a3c73

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     1026047      512000   83  Linux
/dev/sda2         1026048    20971439     9972696   8e  Linux LVM
/dev/sda3        20971440   251658239   115343400   8e  Linux LVM

By fdisk output, lvm is right: 20971439-1026048+1=19945392, so sda2 is 
80 sectors (40 KB) smaller than lvm expects (19945472 sectors). I 
expanded the root volume quite a few times; however, I *never* resized 
sda2: at each expansion I took a snapshot of the disk's MBR, so I 
already checked that I did not mess with sda2 in the past.

By using lvm metadata archived in /etc/lvm/archive, I think that the 
missing 80 sectors are squarely in the swap space (lv_swap, which used 
the last physical extents when lv_root was much smaller), but I am 
somewhat worried that, given some process write to these "missing" 80 
sectors, something bad can happen to the next adjacent physical extent 
(where live data are store, as it is part of lv_root now).

In short:

1) can someone point me on what happen here, and why lvs only recently 
started to complain?

2) do you think my data are at risk?

3) what I can do to solve the problem? I can think of two different 
approach: a) run pvreside /dev/sda2 to shrunk the physical volume or b) 
shrunk the swap partition to be sure nobody will ever write to the last 
80 sectors.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
