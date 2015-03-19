Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2J70KM0027974
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 03:00:20 -0400
Received: from mx201.easyname.com (mx201.easyname.com [212.232.28.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2J70FAl031703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 03:00:16 -0400
Received: from chello084114179012.16.15.vie.surfer.at ([84.114.179.12]
	helo=[192.168.0.50])
	by mx.easyname.eu with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <roman@dissauer.net>) id 1YYUR9-0003Sn-SG
	for linux-lvm@redhat.com; Thu, 19 Mar 2015 08:00:14 +0100
From: Roman Dissauer <roman@dissauer.net>
Message-Id: <69F9DBD7-BF38-480E-8628-E6FE070DA17D@dissauer.net>
Date: Thu, 19 Mar 2015 08:00:06 +0100
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Millions of mismatches after scrubbing raid
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
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi all,

I’m on centos 7 and have several logical volumes on my machine. Yesterday I scrubbed the raid1/raid10 logical volumes for the first time after 6 months. Scrubbing reported multi million mismatches on three of my logical volumes (the older ones). Recently created lvs didn’t have any mismatches though. Now I raised some questions:

1. Is this a normal behaviour of raid1/raid10 to have this much mismatches?
2. Is it safe to do "lvchange --syncaction repair“ on this logical volumes?
3. How does lvm know which one is the „good“ side of the raid1?
4. Is it a good idea to do „lvchange --resync“ from time to time?
5. Is it more reliable to change the lvm from raid10 to raid6?

maybe someone can help me answering my questions.
enclosed you’ll find some more information.

Thanks,
Roman Dissauer


Here is the scrub output:
  LV       VG     Attr       Start SSize   #Str Type    Stripe  Chunk Mismatches SyncAction Cpy%Sync
  data     vg0    rwi-aor-m-    0    3,49t    4 raid10  512,00k    0   895444480 idle         100,00
  owncloud vg0    rwi-aor-m-    0  250,00g    2 raid1        0     0   285961472 idle         100,00
  root     vg0    rwi-aor-m-    0   30,00g    4 raid1        0     0    16501376 idle         100,00

on data this is about 0.1% mismatch of the volume
on owncloud this is about 0.4% mismatch of the volume
on root this is about 0.2% mismatch of the volume


And here the output of the system storage manager:
---------------------------------------------------------------
Device          Free       Used      Total  Pool    Mount point
---------------------------------------------------------------
/dev/sda                           2.73 TB          PARTITIONED
/dev/sda1  873.50 GB    1.88 TB    2.73 TB  vg0                
/dev/sdb                           2.73 TB                     
/dev/sdb1  860.84 GB    1.89 TB    2.73 TB  vg0                
/dev/sdc                           2.73 TB                     
/dev/sdc1   10.82 GB    2.72 TB    2.73 TB  vg0                
/dev/sdd                           2.73 TB                     
/dev/sdd1   10.82 GB    2.72 TB    2.73 TB  vg0                
/dev/sde                           7.32 GB                     
/dev/sde1                        500.00 MB          /boot      
/dev/sdg     0.00 KB  931.51 GB  931.51 GB  backup             
/dev/sdh     0.00 KB    2.73 TB    2.73 TB  backup             
---------------------------------------------------------------
-------------------------------------------------
Pool    Type  Devices     Free     Used     Total  
-------------------------------------------------
backup  lvm   2        0.00 KB  3.64 TB   3.64 TB  
vg0     lvm   4        1.71 TB  9.20 TB  10.92 TB  
-------------------------------------------------
-------------------------------------------------------------------------------------------
Volume              Pool    Volume size  FS      FS size       Free  Type     Mount point  
-------------------------------------------------------------------------------------------
/dev/backup/backup  backup      3.64 TB  ext4    3.64 TB  509.38 GB  linear   /backup      
/dev/vg0/data       vg0         3.49 TB  ext4    3.49 TB  595.34 GB  raid10   /data        
/dev/vg0/home       vg0       200.00 GB  ext4  200.00 GB  128.58 GB  raid10   /home        
/dev/vg0/owncloud   vg0       250.00 GB  xfs   249.99 GB  145.01 GB  raid1    /var/owncloud
/dev/vg0/jail       vg0        10.00 GB  ext4   10.00 GB    6.71 GB  raid1    /jail        
/dev/vg0/fotos      vg0       500.00 GB  ext4  500.00 GB  456.07 GB  raid1    /fotos       
/dev/vg0/virtswap   vg0        20.00 GB  ext4   20.00 GB   17.89 GB  striped  /virt/swap   
/dev/vg0/iso        vg0        10.00 GB  ext4   10.00 GB    8.05 GB  linear   /virt/iso    
/dev/vg0/images     vg0       100.00 GB  ext4  100.00 GB   83.09 GB  raid1    /virt/images 
/dev/vg0/root       vg0        30.00 GB  xfs    29.99 GB    5.79 GB  raid1    /            
/dev/vg0/swap       vg0         8.00 GB                              striped               
/dev/sde1                     500.00 MB  xfs   496.67 MB  240.59 MB           /boot        
-------------------------------------------------------------------------------------------

Disks are WD RED 3TB

and here some revision numbers:
uname -r
3.10.0-123.20.1.el7.x86_64

lvm version
  LVM version:     2.02.105(2)-RHEL7 (2014-03-26)
  Library version: 1.02.84-RHEL7 (2014-03-26)
  Driver version:  4.27.0
