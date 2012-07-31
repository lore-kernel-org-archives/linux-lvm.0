Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VLFQfJ004477
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 17:15:26 -0400
Received: from mail-gg0-f174.google.com (mail-gg0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VLFOZQ017447
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 17:15:24 -0400
Received: by gglu4 with SMTP id u4so7090611ggl.33
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 14:15:24 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 Jul 2012 22:15:23 +0100
Message-ID: <CAMU1PDgZWYqphkRww-0WsdE93_yVAgA5k_0OvyPsiyPbDP57jQ@mail.gmail.com>
From: Mike Fleetwood <mike.fleetwood@googlemail.com>
Subject: [linux-lvm] Incorrect PV displayed for VG with two missing PVs
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Mike Fleetwood <mike.fleetwood@googlemail.com>

Hi,

I have found what I think is a display bug from lvm pvs.

Steps to recreate:
1) Create VG spanning 3 PVs
2) Loose 2 PVs
3) Use lvm pvs to display columns including lv ones

Output includes one of the unknown devices duplicated rather than both
of the unknown devices.

# lvm pvs -o pv_name,pv_uuid,pv_size,lv_name
  Couldn't find device with uuid JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv.
  Couldn't find device with uuid BCj73p-w7vN-T0s7-Or9G-vXYr-9zkW-3R3u6n.
  PV             PV UUID                                PSize   LV
  /dev/sda11     CcVFFD-yc6u-h06D-OLAW-xkBJ-0Hl7-RKgEn0 104.00m
  unknown device JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv 204.00m
  unknown device JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv 204.00m

Also is there an official location for reporting LVM bugs?  Red Hat's
bugzilla perhaps?

Full recreation steps below.
Thanks,
Mike


1) Create VG spanning 3 PVs

# lvm pvcreate /dev/sda11 /dev/sda12 /dev/sda13
  Physical volume "/dev/sda11" successfully created
  Physical volume "/dev/sda12" successfully created
  Physical volume "/dev/sda13" successfully created
# lvm vgcreate Test-VG /dev/sda11 /dev/sda12 /dev/sda13
  Volume group "Test-VG" successfully created
# lvm pvs -o pv_name,pv_uuid,pv_size,vg_name,vg_attr
  PV         PV UUID                                PSize   VG      Attr
  /dev/sda11 CcVFFD-yc6u-h06D-OLAW-xkBJ-0Hl7-RKgEn0 104.00m Test-VG wz--n-
  /dev/sda12 JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv 204.00m Test-VG wz--n-
  /dev/sda13 BCj73p-w7vN-T0s7-Or9G-vXYr-9zkW-3R3u6n 304.00m Test-VG wz--n-

Notice the sizes of the PVs: 104M, 204M and 304M.


2) Loose 2 PVs

# wipefs -a /dev/sda12
8 bytes were erased at offset 0x218 (LVM2_member)
they were: 4c 56 4d 32 20 30 30 31
# wipefs -a /dev/sda13
8 bytes were erased at offset 0x218 (LVM2_member)
they were: 4c 56 4d 32 20 30 30 31
# lvm pvs -o pv_name,pv_uuid,pv_size,vg_name,vg_attr
  Couldn't find device with uuid JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv.
  Couldn't find device with uuid BCj73p-w7vN-T0s7-Or9G-vXYr-9zkW-3R3u6n.
  PV             PV UUID                                PSize   VG      Attr
  /dev/sda11     CcVFFD-yc6u-h06D-OLAW-xkBJ-0Hl7-RKgEn0 104.00m Test-VG wz-pn-
  unknown device JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv 204.00m Test-VG wz-pn-
  unknown device BCj73p-w7vN-T0s7-Or9G-vXYr-9zkW-3R3u6n 304.00m Test-VG wz-pn-

Two separate unknown device PVs displayed with separate UUIDs and sizes.


3) Use pvs to display columns which include lv based ones

# lvm pvs -o pv_name,pv_uuid,pv_size,vg_name,vg_attr,lv_name
  Couldn't find device with uuid JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv.
  Couldn't find device with uuid BCj73p-w7vN-T0s7-Or9G-vXYr-9zkW-3R3u6n.
  PV             PV UUID                                PSize   VG
 Attr   LV
  /dev/sda11     CcVFFD-yc6u-h06D-OLAW-xkBJ-0Hl7-RKgEn0 104.00m Test-VG wz-pn-
  unknown device JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv 204.00m Test-VG wz-pn-
  unknown device JWGqaR-B3A9-fJKt-KuHY-MiER-3e7d-isOzhv 204.00m Test-VG wz-pn-

Second PV, size 204M with UUID starting JWGqaR-, has been displayed
twice and the thrid PV, size 304M with UUID starting BCj73p-, is not
displayed.
