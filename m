Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0510C649B7
	for <linux-lvm@redhat.com>; Thu,  8 Feb 2018 04:00:28 +0000 (UTC)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08C813683B
	for <linux-lvm@redhat.com>; Thu,  8 Feb 2018 04:00:28 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id a7so2945455otk.9
	for <linux-lvm@redhat.com>; Wed, 07 Feb 2018 20:00:28 -0800 (PST)
MIME-Version: 1.0
From: Etienne Champetier <champetier.etienne@gmail.com>
Date: Wed, 7 Feb 2018 20:00:06 -0800
Message-ID: <CAOdf3gosSdSs+ZmZUkyAfQapcyjtb4wZwH4r5Lt_MX=iMM2M5A@mail.gmail.com>
Subject: [linux-lvm] replacing missing disk thin pool raid1
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

Hi All,

I'm doing some experiments before using lvm raid features, and I'm
stuck on a basic use case, replacing a disk :D

All my tests are done using an ubuntu 17.10 server vm
# lvs --version
  LVM version:     2.02.168(2) (2016-11-30)
  Library version: 1.02.137 (2016-11-30)
  Driver version:  4.37.0
# uname -a
Linux ubuntu 4.13.0-21-generic #24-Ubuntu SMP Mon Dec 18 17:29:16 UTC
2017 x86_64 x86_64 x86_64 GNU/Linux

If I just have a normal raid1 lv, for exemple my root
# lvconvert -m1 ubuntu-vg/root

if I wipe 1 of the disks and reboot (simulating a dead disk)
# dd if=/dev/zero of=/dev/vdb status=progress
# reboot

My recovery procedure would be:
# sfdisk -d /dev/vda | sfdisk /dev/vdb
# pvcreate /dev/vdb1
# vgextend ubuntu-vg /dev/vdb1
# lvconvert --repair ubuntu-vg/root
# vgreduce --removemissing ubuntu-vg


Now if I want to use lvm thin pool + raid1

# lvcreate -m1 --type raid1 -L1G ubuntu-vg -n thin_pool
# lvcreate -m1 --type raid1 -L8MB ubuntu-vg -n thin_meta
# lvconvert --thinpool ubuntu-vg/thin_pool --poolmetadata ubuntu-vg/thin_meta
# lvcreate -T ubuntu-vg/thin_pool -V300M -n thinlv

If I redo my recovery procedure, trying repair the thin_pool give me
# lvconvert --repair ubuntu-vg/thin_pool
  WARNING: Device for PV XiQsNI-J6CS-rpQa-yX1H-DA43-13SL-fxeSlf not
found or rejected by a filter.
  Using default stripesize 64,00 KiB.
  WARNING: recovery of pools without pool metadata spare LV is not automated.
  WARNING: If everything works, remove ubuntu-vg/thin_pool_meta0 volume.
  WARNING: Use pvmove command to move ubuntu-vg/thin_pool_tmeta on the
best fitting PV.

I've tried random commands but I'm stuck

My questions:
1) is my first recovery procedure "best practice" ?
2) what is the procedure to recover my thin pool + raid1 ?
3) Is thin pool + raid1 too new / should I stick to dmraid raid1 + lvm on top ?

Thanks in advance
Etienne
