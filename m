Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8RHgca2009301
	for <linux-lvm@redhat.com>; Sat, 27 Sep 2014 13:42:38 -0400
Received: from smtp1.businessgrade.com (smtp1.businessgrade.com
	[208.92.31.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8RHgZ8m009037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 27 Sep 2014 13:42:36 -0400
From: Errol Neal <eneal@businessgrade.com>
Date: Sat, 27 Sep 2014 13:42:34 -0400
Message-ID: <1411839754687039500@businessgrade.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Why is my LVM Mirror performance so bad?
Reply-To: eneal@businessgrade.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi There. Hoping to get some clarity on some performance woes in a little testing environment that I've setup. 

I am experimenting with LVM mirrors on a CentOS 6.5 cluster. 

I have two VMs running on ESX5.5 that are sharing two RDM luns from an SRP target server running SCST. 

Performance however seems to take a huge hit compared to a vanilla volume


[root@scst1 ~]# vgs
  VG       #PV #LV #SN Attr   VSize   VFree
  hadata     2   5   0 wz--nc 999.99g 149.99g
  vg_scst1   1   2   0 wz--n-  39.51g      0

[root@scst1 ~]# lvs -a -o +devices
  LV                 VG       Attr       LSize   Pool Origin Data%  Move Log Cpy%Sync Convert Devices
  mirror1            hadata   mwi-a-m--- 100.00g                               100.00         mirror1_mimage_0(0),mirror1_mimage_1(0)
  [mirror1_mimage_0] hadata   iwi-aom--- 100.00g                                              /dev/sdb1(0)
  [mirror1_mimage_1] hadata   iwi-aom--- 100.00g                                              /dev/sdc1(0)
  mirror2            hadata   mwi-a-m--- 100.00g                               100.00         mirror2_mimage_0(0),mirror2_mimage_1(0)
  [mirror2_mimage_0] hadata   iwi-aom--- 100.00g                                              /dev/sdb1(25600)
  [mirror2_mimage_1] hadata   iwi-aom--- 100.00g                                              /dev/sdc1(25600)
  mirror3            hadata   mwi-a-m--- 100.00g                               100.00         mirror3_mimage_0(0),mirror3_mimage_1(0)
  [mirror3_mimage_0] hadata   iwi-aom--- 100.00g                                              /dev/sdb1(51200)
  [mirror3_mimage_1] hadata   iwi-aom--- 100.00g                                              /dev/sdc1(51200)
  mirror4            hadata   mwi-a-m--- 100.00g                               100.00         mirror4_mimage_0(0),mirror4_mimage_1(0)
  [mirror4_mimage_0] hadata   iwi-aom--- 100.00g                                              /dev/sdb1(76800)
  [mirror4_mimage_1] hadata   iwi-aom--- 100.00g                                              /dev/sdc1(76800)
  test               hadata   -wi-a-----  50.00g                                              /dev/sdb1(102400)
  lv_root            vg_scst1 -wi-ao----  31.65g                                              /dev/sda2(0)
  lv_swap            vg_scst1 -wi-ao----   7.86g                                              /dev/sda2(8102)

[root@scst1 ~]# dd if=/dev/sdb1 of=/dev/null bs=1M count=20000
20000+0 records in
20000+0 records out
20971520000 bytes (21 GB) copied, 41.0031 s, 511 MB/s

[root@scst1 ~]# dd if=/dev/hadata/test of=/dev/null bs=1M count=20000
20000+0 records in
20000+0 records out
20971520000 bytes (21 GB) copied, 44.344 s, 473 MB/s

[root@scst1 ~]# dd if=/dev/hadata/mirror1 of=/dev/null bs=1M count=20000
20000+0 records in
20000+0 records out
20971520000 bytes (21 GB) copied, 365.685 s, 57.3 MB/s


Is this just the life of a LVM mirror and the performance here is about as good as it gets?
