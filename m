Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6JIEUh8005070
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 14:14:30 -0400
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6JIESKw002084
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 14:14:28 -0400
Received: by mail-ee0-f51.google.com with SMTP id e52so2577956eek.10
	for <linux-lvm@redhat.com>; Fri, 19 Jul 2013 11:14:28 -0700 (PDT)
Received: from [192.168.1.14] ([37.131.0.86])
	by mx.google.com with ESMTPSA id i2sm29324260eeu.4.2013.07.19.11.14.17
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Jul 2013 11:14:27 -0700 (PDT)
Message-ID: <51E981EF.3020007@gmail.com>
Date: Fri, 19 Jul 2013 21:14:07 +0300
From: Martin Papik <mp6058@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove
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

Hi everyone

I'm new to the mailing list but not to LVM, until now everything was 
crystal clear and working fine. Now I'm either stuck or found a minor 
issue. I'm trying to move move extents on a physical volume. Not from 
one physical volume to another.

root@myhost# pvmove  /dev/md127:151808-152063 /dev/md127:152064-152319
   No extents available for allocation
root@myhost#

I also tried pvmove /dev/md127:151808-152063 /dev/md127:152064 and a few 
other combination. There are enough free extents. The volume I've 
created is 1G. There's 800 GB free. I made sure the destination blocks 
are available, I've tried different ranges.  Way below is the output of 
vgdisplay and a list of volumes and their extents.

Is this functionality (extent shuffling) supported? I mean is this a 
feature, bug or ignorance on my part?

PS, if you're wondering why would anyone want to move extents from a 
device to the very same device, you may notice in the output below that 
I have a few volumes spilt into pieces and I want to de-fragment it. I 
know it won't affect performance too much, probably at all. But it is 
going to help when (if?) I'm in dire need of dd if=/dev/xxx from the 
physical volume. Wouldn't be the first time (not the fault of LVM, 
disk+heat=bad blocks).

Thanks in advance for any ideas or scolding :-)

Martin

root@myhost# vgdisplay
   --- Volume group ---
   VG Name               volume
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  147
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                12
   Open LV               9
   Max PV                0
   Cur PV                1
   Act PV                1
   VG Size               3.35 TiB
   PE Size               4.00 MiB
   Total PE              878905
   Alloc PE / Size       666880 / 2.54 TiB
   Free  PE / Size       212025 / 828.22 GiB
   VG UUID Gv2rC8-sMgQ-xGGK-5swv-9Gck-QA1G-k50ABy

root@myhost# vgs --all -o 
+lv_name,lv_size,snap_percent,seg_pe_ranges,segtype,seg_size
   VG     #PV #LV #SN Attr   VSize VFree   LV      LSize Snap%  PE 
Ranges                Type   SSize
   volume   1  12   0 wz--n- 3.35t 828.22g home 150.00g        
/dev/md127:0-25599       linear 100.00g
   volume   1  12   0 wz--n- 3.35t 828.22g home 150.00g        
/dev/md127:72085-74495   linear   9.42g
   volume   1  12   0 wz--n- 3.35t 828.22g home 150.00g        
/dev/md127:309248-319636 linear  40.58g
   volume   1  12   0 wz--n- 3.35t 828.22g var 20.00g        
/dev/md127:25600-30719   linear  20.00g
   volume   1  12   0 wz--n- 3.35t 828.22g usr 20.00g        
/dev/md127:30720-35839   linear  20.00g
   volume   1  12   0 wz--n- 3.35t 828.22g tmp 2.00g        
/dev/md127:35840-36351   linear   2.00g
   volume   1  12   0 wz--n- 3.35t 828.22g p2p 300.00g        
/dev/md127:74496-151295  linear 300.00g
   volume   1  12   0 wz--n- 3.35t 828.22g boot 1.00g        
/dev/md127:151296-151551 linear   1.00g
   volume   1  12   0 wz--n- 3.35t 828.22g root 4.00g        
/dev/md127:152320-153343 linear   4.00g
   volume   1  12   0 wz--n- 3.35t 828.22g copy 2.00t        
/dev/md127:181248-309247 linear 500.00g
   volume   1  12   0 wz--n- 3.35t 828.22g copy 2.00t        
/dev/md127:606208-712298 linear 414.42g
   volume   1  12   0 wz--n- 3.35t 828.22g copy 2.00t        
/dev/md127:156672-181247 linear  96.00g
   volume   1  12   0 wz--n- 3.35t 828.22g copy 2.00t        
/dev/md127:36352-72084   linear 139.58g
   volume   1  12   0 wz--n- 3.35t 828.22g copy 2.00t        
/dev/md127:319637-549524 linear 898.00g
   volume   1  12   0 wz--n- 3.35t 828.22g swap 8.00g        
/dev/md127:153344-155391 linear   8.00g
   volume   1  12   0 wz--n- 3.35t 828.22g emulate 50.00g        
/dev/md127:549525-562324 linear  50.00g
   volume   1  12   0 wz--n- 3.35t 828.22g test 1.00g        
/dev/md127:151552-151807 linear   1.00g
   volume   1  12   0 wz--n- 3.35t 828.22g test2 1.00g        
/dev/md127:151808-152063 linear   1.00g
root@myhost#
