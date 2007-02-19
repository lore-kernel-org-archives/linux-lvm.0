Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1JNxx8n014632
	for <linux-lvm@redhat.com>; Mon, 19 Feb 2007 18:59:59 -0500
Received: from smtp.retaggio.net (q.retaggio.net [80.88.84.22])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1JNxsHl000601
	for <linux-lvm@redhat.com>; Mon, 19 Feb 2007 18:59:55 -0500
Received: from localhost (q.retaggio.net [127.0.0.1])
	by smtp.retaggio.net (Postfix) with ESMTP id E8D5CE63B5
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 00:59:39 +0100 (CET)
Received: from smtp.retaggio.net ([127.0.0.1])
	by localhost (smtp.retaggio.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ginQnuKCSHZ for <linux-lvm@redhat.com>;
	Tue, 20 Feb 2007 00:59:28 +0100 (CET)
Received: from [192.168.0.38]
	(host69-180-dynamic.61-82-r.retail.telecomitalia.it [82.61.180.69])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.retaggio.net (Postfix) with ESMTP id CF57EE6350
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 00:59:27 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Message-Id: <A3E3F4BC-B0FA-4248-BB4D-DADA85185573@retaggio.net>
From: Daniele Palumbo <daniele@retaggio.net>
Date: Tue, 20 Feb 2007 00:59:22 +0100
Subject: [linux-lvm] mirror error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

hi.

i have a problem, found also online without resolution.

i have compiled lvm2 2.0.22 without mirror (--with-mirror=none), but  
for every lv command i have an error:
"Unrecognised segment type mirror"

now look at that:
--
backuphost ~ # vgchange -cy XenBackupVolume
   Unrecognised segment type mirror
   Unrecognised segment type mirror
   Volume group "XenBackupVolume" is already clustered
backuphost ~ # lv
-bash: lv: command not found
backuphost ~ # lvs
   Unrecognised segment type mirror
   Unrecognised segment type mirror
   LV            VG              Attr   LSize   Origin Snap%  Move  
Log Copy%
   gentoo-mirror XenBackupVolume -wi-a- 100.00G
   prova         XenBackupVolume -wi-a-   4.00G
backuphost ~ #
--



This is the log of creation:
---
backuphost ~ # pvcreate -vv /dev/md0
       Setting global/locking_type to 2
       External locking selected.
       Setting global/locking_library to liblvm2clusterlock.so
       Opening shared locking library liblvm2clusterlock.so
     Loaded external locking library liblvm2clusterlock.so
       Locking P_orphans at 0x4
       /dev/md0: No label detected
       /dev/md0: size is 1758343680 sectors
       metadata/pvmetadatasize not found in config: defaulting to 255
       metadata/pvmetadatacopies not found in config: defaulting to 1
       /dev/md0: size is 1758343680 sectors
     Set up physical volume for "/dev/md0" with 1758343680 available  
sectors
       Scanning for labels to wipe from /dev/md0
     Zeroing start of device /dev/md0
       Writing physical volume data to disk "/dev/md0"
       /dev/md0: Writing label to sector 1
   Physical volume "/dev/md0" successfully created
       Locking P_orphans at 0x6
backuphost ~ #

backuphost ~ # vgcreate -cy XenBackupVolume /dev/md0
   Volume group "XenBackupVolume" successfully created
backuphost ~ # lvcreate -n gentoo-mirror -L 100G XenBackupVolume
   Logical volume "gentoo-mirror" created
backuphost ~ # lvs
   Unrecognised segment type mirror
   LV            VG              Attr   LSize   Origin Snap%  Move  
Log Copy%
   gentoo-mirror XenBackupVolume -wi-a- 100.00G
backuphost ~ # lvs -vvv
         Processing: lvs -vvv
         O_DIRECT will be used
       Setting global/locking_type to 2
       External locking selected.
       Setting global/locking_library to liblvm2clusterlock.so
       Opening shared locking library liblvm2clusterlock.so
     Loaded external locking library liblvm2clusterlock.so
       report/aligned not found in config: defaulting to 1
       report/buffered not found in config: defaulting to 1
       report/headings not found in config: defaulting to 1
       report/separator not found in config: defaulting to
       report/lvs_sort not found in config: defaulting to  
vg_name,lv_name
       report/lvs_cols_verbose not found in config: defaulting to  
lv_name,vg_name,seg_count,lv_attr,lv_size,lv_major,lv_minor,lv_kernel_ma 
jor,lv_kernel_minor,origin,snap_percent,move_pv,copy_percent,mirror_log, 
lv_uuid
     Finding all logical volumes
         Opened /dev/md0 RO O_DIRECT
         /dev/md0: block size is 4096 bytes
       /dev/md0: lvm2 label detected
         lvmcache: /dev/md0: now orphaned
         /dev/md0: Found metadata at 5632 size 888 for  
XenBackupVolume (A5ggLy-HnIT-qnIy-4JRe-2jfL-DrOE-X6HBTj)
         lvmcache: /dev/md0: now in VG XenBackupVolume
         lvmcache: /dev/md0: setting XenBackupVolume VGID to  
A5ggLyHnITqnIy4JRe2jfLDrOEX6HBTj
         lvmcache: /dev/md0: VG XenBackupVolume: Set creation host to  
backuphost.
         Closed /dev/md0
         Opened /dev/md1 RO O_DIRECT
         /dev/md1: block size is 4096 bytes
       /dev/md1: No label detected
         Closed /dev/md1
         Opened /dev/md2 RO O_DIRECT
         /dev/md2: block size is 4096 bytes
       /dev/md2: No label detected
         Closed /dev/md2
         Opened /dev/md3 RO O_DIRECT
         /dev/md3: block size is 4096 bytes
       /dev/md3: No label detected
         Closed /dev/md3
         Opened /dev/md5 RO O_DIRECT
         /dev/md5: block size is 4096 bytes
       /dev/md5: No label detected
         Closed /dev/md5
       Locking V_XenBackupVolume at 0x1
         Opened /dev/md0 RO O_DIRECT
         /dev/md0: block size is 4096 bytes
       /dev/md0: lvm2 label detected
         /dev/md0: Found metadata at 5632 size 888 for  
XenBackupVolume (A5ggLy-HnIT-qnIy-4JRe-2jfL-DrOE-X6HBTj)
         Closed /dev/md0
         Opened /dev/md0 RO O_DIRECT
         /dev/md0: block size is 4096 bytes
       /dev/md0: lvm2 label detected
         /dev/md0: Found metadata at 5632 size 888 for  
XenBackupVolume (A5ggLy-HnIT-qnIy-4JRe-2jfL-DrOE-X6HBTj)
   Unrecognised segment type mirror
         Read XenBackupVolume metadata (2) from /dev/md0 at 5632 size  
888
         Closed /dev/md0
         /dev/md0 0:      0  25600: gentoo-mirror(0:0)
         /dev/md0 1:  25600 189041: NULL(0:0)
         Getting device info for XenBackupVolume-gentoo--mirror
         dm version   OF   [16384]
         dm info  LVM- 
A5ggLyHnITqnIy4JRe2jfLDrOEX6HBTjj1T5K6WOzPAvylORuxWkoXkihSMca3l7 OF    
[16384]
         Getting device info for XenBackupVolume-gentoo--mirror
         dm info  LVM- 
A5ggLyHnITqnIy4JRe2jfLDrOEX6HBTjj1T5K6WOzPAvylORuxWkoXkihSMca3l7 NF    
[16384]
         Getting device info for XenBackupVolume-gentoo--mirror
         dm info  LVM- 
A5ggLyHnITqnIy4JRe2jfLDrOEX6HBTjj1T5K6WOzPAvylORuxWkoXkihSMca3l7 NF    
[16384]
       Locking V_XenBackupVolume at 0x6
   LV            VG              #Seg Attr   LSize   Maj Min KMaj  
KMin Origin Snap%  Move Copy%  Log LV UUID
   gentoo-mirror XenBackupVolume    1 -wi-a- 100.00G  -1  -1 253   
0                                  j1T5K6-WOzP-Avyl-ORux-WkoX-kihS- 
Mca3l7
backuphost ~ #
---

bye
d.
