Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4682022795
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 11:36:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A95A2811E8F
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 11:36:50 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id t15so4221681iob.3
	for <linux-lvm@redhat.com>; Sat, 22 Aug 2020 04:36:47 -0700 (PDT)
MIME-Version: 1.0
From: L A Walsh <lvm@tlinx.org>
Date: Sat, 22 Aug 2020 04:36:27 -0700
Message-ID: <CALOnQv5via9sF2FP81uGXe+CzLqX0it7T0NvRSVxV8TBbhUuvg@mail.gmail.com>
Subject: [linux-lvm] What to do about new lvm messages
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

I am trying to create a new pv/vg/+lvs setup but am getting some weird messages

pvcreate  -M2 --pvmetadatacopies 2 /dev/sda1
  Failed to clear hint file.
  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify
the VG to update.
  Physical volume "/dev/sda1" successfully created.

So why am I getting a message about not clearing a hint file (running s root)

and how do I modify a VG that I don't want to make any modifications to?

From an online man page, I should have been able to use -ff to
recreate a pv over
the top of a preexisting one, but that didn't seem to work.  I got:
 pvcreate -ff -M2 --pvmetadatacopies 2 /dev/sda1
  Failed to clear hint file.
  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify
the VG to update.
  Cannot access VG Space with system ID Ishtar with unknown local system ID.
  Device /dev/sda1 excluded by a filter.
---
   So it seems that is broken.  I was able to work around that with:
dd if=/dev/zero of=/dev/sda1 bs=4096 count=1
1+0 records in
1+0 records out
4096 bytes (4.1 kB, 4.0 KiB) copied, 0.000175409 s, 23.4 MB/s

I also ran into a problem on how to tell vgcreate to use the whole pv.
That was complicated by trying to specify my hostname as a system id:
vgcreate -A y --alloc contiguous --systemid Ishtar --dataalignment
64KiB Space /dev/sda1
  Failed to clear hint file.
  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify
the VG to update.
  Volume group "Space" successfully created with system ID Ishtar

vgs
  WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify
the VG to update.
  Cannot access VG Space with system ID Ishtar with unknown local system ID.
  VG     #PV #LV #SN Attr   VSize  VFree
Didn't know where the VG group ended up, which was why I needed to
redo creating the pv (vgremove didn't work):
vgremove Space
  Failed to clear hint file.
  Cannot access VG Space with system ID Ishtar with unknown local system ID.
  Cannot access VG Space with system ID Ishtar with unknown local system ID.

Version info:
pvcreate --version
  LVM version:     2.03.05(2) (2019-06-15)
  Library version: 1.03.01 (2019-06-15)
  Driver version:  4.42.0
  Configuration:   ./configure --host=x86_64-suse-linux-gnu
--build=x86_64-suse-linux-gnu --program-prefix=
--disable-dependency-tracking --prefix=/usr --exec-prefix=/usr
--bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
--datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64
--libexecdir=/usr/lib --localstatedir=/var --sharedstatedir=/var/lib
--mandir=/usr/share/man --infodir=/usr/share/info
--disable-dependency-tracking --enable-dmeventd --enable-cmdlib
--enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/
--enable-selinux --enable-pkgconfig --with-usrlibdir=/usr/lib64
--with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run
--with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal
--with-device-gid=6 --with-device-mode=0640 --with-device-uid=0
--with-dmeventd-path=/usr/sbin/dmeventd
--with-thin-check=/usr/sbin/thin_check
--with-thin-dump=/usr/sbin/thin_dump
--with-thin-repair=/usr/sbin/thin_repair --enable-blkid_wiping
--enable-lvmpolld --enable-realtime --with-cache=internal
--with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run
--with-default-run-dir=/run/lvm --enable-cmirrord --enable-fsadm
--disable-silent-rules --enable-write_install --with-vdo=internal
--with-vdo-format=/usr/bin/vdoformat

Anyway -- why does it keep failing to clear the hint file?  And how
can I modify a VG without changing it (just to remove the annoying
WARNING with every command).

Thanks!
