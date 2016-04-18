Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3IEPbfT006583
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 10:25:37 -0400
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 6021F62649
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 14:25:35 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr003msb.fastweb.it
	(8.5.140.03) id 5704D5F200CE018B for linux-lvm@redhat.com;
	Mon, 18 Apr 2016 16:25:34 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id E2E392E1E1F
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 16:25:33 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <5714EE58.8080400@assyoma.it>
Date: Mon, 18 Apr 2016 16:25:28 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Testing ThinLVM metadata exhaustion
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

Hi all,
I'm testing the various metadata exhaustion cases and how to cope with 
them. Specifically, I would like to fully understand what to expect 
after a metadata space exhaustion and the relative check/repair. To such 
extents, metadata autoresize is disabled.

I'm using a fully updated CentOS 6.7 x84_64 virtual machine, with a 
virtual disk (vdb) dedicated to the thin pool / volumes. This is what 
pvs reports:

PV         VG          Fmt  Attr PSize  PFree
/dev/vda2  vg_hvmaster lvm2 a--  63.51g    0
/dev/vdb   vgtest      lvm2 a--  32.00g    0

I did the following operations:
vgcreate vgtest /dev/vdb
lvcreate --thin vgtest/ThinPool -L 1G 	# 4MB tmeta
lvchange -Zn vgtest
lvcreate --thin vgtest/ThinPool --name ThinVol -V 32G
lvresize vgtest/ThinPool -l +100%FREE # 31.99GB, 4MB tmeta, not resized

With 64 KB chunks, the 4 MB tmeta volume is good for mapping ~8 GB, so 
any other writes trigger a metadata space exhaustion. Then, I did:

a) a first 8 GB write to almost fill the entire metadata space:
[root@hvmaster ~]# dd if=/dev/zero of=/dev/vgtest/ThinVol bs=1M count=8192
8192+0 records in
8192+0 records out
8589934592 bytes (8.6 GB) copied, 101.059 s, 85.0 MB/s
[root@hvmaster ~]# lvs -a
   LV               VG          Attr       LSize  Pool     Origin Data% 
  Meta%  Move Log Cpy%Sync Convert
   lv_root          vg_hvmaster -wi-ao---- 59.57g 

   lv_swap          vg_hvmaster -wi-ao----  3.94g 

   ThinPool         vgtest      twi-aot-M- 31.99g                 21.51 
  92.09
   [ThinPool_tdata] vgtest      Twi-ao---- 31.99g 

   [ThinPool_tmeta] vgtest      ewi-ao----  4.00m 

   ThinVol          vgtest      Vwi-a-t--- 32.00g ThinPool        23.26 

   [lvol0_pmspare]  vgtest      ewi-------  4.00m
[root@hvmaster ~]# thin_dump /dev/mapper/vgtest-ThinPool_tmeta
<superblock uuid="" time="0" transaction="1" data_block_size="128" 
nr_data_blocks="524096">
   <device dev_id="1" mapped_blocks="121968" transaction="0" 
creation_time="0" snap_time="0">
     <range_mapping origin_begin="0" data_begin="0" length="121968" 
time="0"/>
   </device>
</superblock>

b) a second non-synched 16 GB write to totally trash the tmeta volume:
# Second write
[root@hvmaster ~]# dd if=/dev/zero of=/dev/vgtest/ThinVol bs=1M count=8192
8192+0 records in
8192+0 records out
8589934592 bytes (8.6 GB) copied, 101.059 s, 85.0 MB/s
[root@hvmaster ~]# lvs -a
   LV               VG          Attr       LSize  Pool     Origin Data% 
  Meta%  Move Log Cpy%Sync Convert
   lv_root          vg_hvmaster -wi-ao---- 59.57g 

   lv_swap          vg_hvmaster -wi-ao----  3.94g 

   ThinPool         vgtest      twi-aot-M- 31.99g                 21.51 
  92.09
   [ThinPool_tdata] vgtest      Twi-ao---- 31.99g 

   [ThinPool_tmeta] vgtest      ewi-ao----  4.00m 

   ThinVol          vgtest      Vwi-a-t--- 32.00g ThinPool        23.26 

   [lvol0_pmspare]  vgtest      ewi-------  4.00m
[root@hvmaster ~]# thin_dump /dev/mapper/vgtest-ThinPool_tmeta
<superblock uuid="" time="0" transaction="1" data_block_size="128" 
nr_data_blocks="524096">
   <device dev_id="1" mapped_blocks="121968" transaction="0" 
creation_time="0" snap_time="0">
     <range_mapping origin_begin="0" data_begin="0" length="121968" 
time="0"/>
   </device>
</superblock>

c) a third, synched 16 GB write to see how the system behave with 
fsync-rich filling:
[root@hvmaster ~]# dd if=/dev/zero of=/dev/vgtest/ThinVol bs=1M 
count=16384 oflag=sync
dd: writing `/dev/vgtest/ThinVol': Input/output error
7624+0 records in
7623+0 records out
7993294848 bytes (8.0 GB) copied, 215.808 s, 37.0 MB/s
[root@hvmaster ~]# lvs -a
   Failed to parse thin params: Error.
   Failed to parse thin params: Error.
   Failed to parse thin params: Error.
   Failed to parse thin params: Error.
   LV               VG          Attr       LSize  Pool     Origin Data% 
  Meta%  Move Log Cpy%Sync Convert
   lv_root          vg_hvmaster -wi-ao---- 59.57g 

   lv_swap          vg_hvmaster -wi-ao----  3.94g 

   ThinPool         vgtest      twi-aot-M- 31.99g                 21.51 
  92.09
   [ThinPool_tdata] vgtest      Twi-ao---- 31.99g 

   [ThinPool_tmeta] vgtest      ewi-ao----  4.00m 

   ThinVol          vgtest      Vwi-a-t--- 32.00g ThinPool 

   [lvol0_pmspare]  vgtest      ewi-------  4.00m
[root@hvmaster ~]# thin_dump /dev/mapper/vgtest-ThinPool_tmeta
<superblock uuid="" time="0" transaction="1" data_block_size="128" 
nr_data_blocks="524096">
metadata contains errors (run thin_check for details).
perhaps you wanted to run with --repair

It is the last scenario (c) that puzzle me: rebooting the machine left 
the thinpool inactive and inactivable (as expected), but executing 
lvconvert --repair I can see that _all_ metadatas are gone (the pool 
seems empty). Is that the expected behavior?

Even more puzzling (for me) is that by skipping test a and b, and going 
directly for c, I have a different behavior: the metadata volume is 
(rightfully) completely filled, and the thin pool went in read-only 
mode. Again, it that the expected behavior?

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
