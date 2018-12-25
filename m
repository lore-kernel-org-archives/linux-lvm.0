Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A66375D757
	for <linux-lvm@redhat.com>; Tue, 25 Dec 2018 05:52:56 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0E28C04DBEE
	for <linux-lvm@redhat.com>; Tue, 25 Dec 2018 05:52:54 +0000 (UTC)
Message-Id: <5C21C5B0020000F90004A3CB@prv1-mh.provo.novell.com>
Date: Mon, 24 Dec 2018 22:52:48 -0700
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Subject: [linux-lvm] lvmetad cannot handle md device with big minor number
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
To: linux-lvm@redhat.com

Hello Guys,

I create a md device with a big minor number, and add this md device as PV disk.
Then, pvdisplay can not display this PV.
But, if I disable lvmetad via changing the configuration setting "use_lvmetad = 1" to "use_lvmetad = 0",
pvdisplay can display this PV, then I can do the next things, e.g. create a VG on this PV, etc.
It looks that lvmetad cannot handle md device with big minor number (e.g. /dev/md606099).
If I create a md device like "/dev/md0", lvmetad can work.

The whole reproduce steps are as below,
1) # mdadm -C /dev/md606099 -l 1 -n 2 /dev/sdb2 /dev/sda2

2) # pvcreate /dev/md606099
  Physical volume "/dev/md606099" successfully created.
    # lsblk
NAME         MAJ:MIN    RM  SIZE RO TYPE  MOUNTPOINT
sda            8:0       0  160G  0 disk
├─sda1         8:1       0  120G  0 part
├─sda2         8:2       0   30G  0 part
│ └─md606099   9:606099  0   30G  0 raid1
└─sda3         8:3       0   10G  0 part
sdb            8:16      0  500G  0 disk
├─sdb1         8:17      0  120G  0 part
├─sdb2         8:18      0   30G  0 part
│ └─md606099   9:606099  0   30G  0 raid1
└─sdb3         8:19      0  350G  0 part

3) # pvdisplay
  WARNING: Device for PV GIAOmw-SOu7-8ZaH-qWBw-MwfR-Jb6j-wxSM1a not found or rejected by a filter. <<== here, the PV
can not be displayed

4) # lvm version
  LVM version:     2.02.180(2) (2018-07-19)
  Library version: 1.03.01 (2018-07-19)
  Driver version:  4.39.0
  Configuration:   ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu --program-prefix=
--disable-dependency-tracking --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
--datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64 --libexecdir=/usr/lib --localstatedir=/var
--sharedstatedir=/var/lib --mandir=/usr/share/man --infodir=/usr/share/info --disable-dependency-tracking
--enable-dmeventd --enable-cmdlib --enable-udev_rules --enable-udev_sync --with-udev-prefix=/usr/ --enable-selinux
--enable-pkgconfig --with-usrlibdir=/usr/lib64 --with-usrsbindir=/usr/sbin --with-default-dm-run-dir=/run
--with-tmpfilesdir=/usr/lib/tmpfiles.d --with-thin=internal --with-device-gid=6 --with-device-mode=0640
--with-device-uid=0 --with-dmeventd-path=/usr/sbin/dmeventd --with-thin-check=/usr/sbin/thin_check
--with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-applib --enable-blkid_wiping
--enable-cmdlib --enable-lvmetad --enable-lvmpolld --enable-realtime --with-cache=internal
--with-default-locking-dir=/run/lock/lvm --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --enable-cmirrord

5) # tb1213-nd1:/sys/dev/block # ll
total 0
lrwxrwxrwx 1 root root 0 Dec 25 13:35 11:0 ->
../../devices/pci0000:00/0000:00:01.1/ata1/host0/target0:0:0/0:0:0:0/block/sr0
lrwxrwxrwx 1 root root 0 Dec 25 13:35 253:0 -> ../../devices/pci0000:00/0000:00:04.0/virtio1/block/vda
lrwxrwxrwx 1 root root 0 Dec 25 13:35 253:1 -> ../../devices/pci0000:00/0000:00:04.0/virtio1/block/vda/vda1
lrwxrwxrwx 1 root root 0 Dec 25 13:35 253:2 -> ../../devices/pci0000:00/0000:00:04.0/virtio1/block/vda/vda2
lrwxrwxrwx 1 root root 0 Dec 25 13:35 253:3 -> ../../devices/pci0000:00/0000:00:04.0/virtio1/block/vda/vda3
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:0 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:0/block/sda
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:1 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:0/block/sda/sda1
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:16 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:1/block/sdb
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:17 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:1/block/sdb/sdb1
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:18 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:1/block/sdb/sdb2
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:19 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:1/block/sdb/sdb3
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:2 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:0/block/sda/sda2
lrwxrwxrwx 1 root root 0 Dec 25 13:35 8:3 -> ../../devices/platform/host2/session1/target2:0:0/2:0:0:0/block/sda/sda3
lrwxrwxrwx 1 root root 0 Dec 25 13:35 9:606099 -> ../../devices/virtual/block/md606099   <<== this md device

Thanks
Gang
