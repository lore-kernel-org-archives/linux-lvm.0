Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBK0gHp9020906
	for <linux-lvm@redhat.com>; Sat, 19 Dec 2009 19:42:17 -0500
Received: from mail-ew0-f218.google.com (mail-ew0-f218.google.com
	[209.85.219.218])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBK0g3mr008425
	for <linux-lvm@redhat.com>; Sat, 19 Dec 2009 19:42:04 -0500
Received: by ewy10 with SMTP id 10so128344ewy.30
	for <linux-lvm@redhat.com>; Sat, 19 Dec 2009 16:42:03 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 20 Dec 2009 01:42:02 +0100
Message-ID: <784f9de10912191642u482a0141teb09d3958bd7b680@mail.gmail.com>
From: Maurizio Marini Gmail <marini.maurizio@gmail.com>
Subject: [linux-lvm] repair a damaged vg
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
Cc: maumar@datalogica.com

sorry for cross-posting with fedora mlists.

after  pvcreate /dev/sdc
  Physical volume "/dev/sdc" successfully created


sadly i issued:
 vgextend /dev/mapper/VolGroup01 /dev/sdc
  Volume group "VolGroup01" successfully extended

instead of doing:

 vgextend VolGroup01 /dev/sdc
  Volume group "VolGroup01" successfully extended

I used the wrong syntax.

then i tryied to extend lv

lvextend -l 100%VG  /dev/mapper/VolGroup01-lvol0
  Couldn't find device with uuid
'qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF'.
  Extending logical volume lvol0 to 329,99 GB
  Cannot update volume group VolGroup01 while physical volumes are missing.

now i tried to assign that uuid to /dev/sdb, sadly w/out success:

================
pvcreate -u qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF --restorefile
/etc/lvm/archive/VolGroup01_00002.vg /dev/sdb
  Couldn't find device with uuid
'qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF'.
  Device /dev/sdb not found (or ignored by filtering).
================
 pvcreate -ff -u qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF --restorefile
/etc/lvm/archive/VolGroup01_00002.vg /dev/sdb
  Couldn't find device with uuid
'qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF'.
  Device /dev/sdb not found (or ignored by filtering).
================

 vgreduce -t --removemissing VolGroup01
  Test mode: Metadata will NOT be updated.
  Couldn't find device with uuid
'qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF'.
  Couldn't find device with uuid
'qf0ApW-42u1-nlyq-2TTn-MIgB-3dT1-BNe3GF'.
  WARNING: Partial LV lvol0 needs to be repaired or removed.
  WARNING: There are still partial LVs in VG VolGroup01.
  To remove them unconditionally use: vgreduce --removemissing
--force.
  Proceeding to remove empty missing PVs.


================

is there a clean solution to my fault?

tia

Maurizio
