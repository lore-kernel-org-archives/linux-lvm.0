Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6Q8ABV01779
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 04:10:11 -0400
Received: from mail.x-cellent.com (www.x-cellent.com [212.121.145.100])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6Q8A4aQ009571
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 04:10:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.x-cellent.com (Postfix) with ESMTP id F423A879DB
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 10:10:03 +0200 (CEST)
Received: from mail.x-cellent.com ([127.0.0.1])
	by localhost (torre [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 17901-01 for <linux-lvm@redhat.com>;
	Tue, 26 Jul 2005 10:09:59 +0200 (CEST)
Message-ID: <42E5EFD6.5020102@x-cellent.com>
Date: Tue, 26 Jul 2005 10:09:58 +0200
From: Sven Landtrachtinger <sven.landtrachtinger@x-cellent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM-DRBD problem
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

we tried to create a new lv with lvcreate -L 440G vg00 -n lv_datenarchiv.
The lvcreate failed. It seems that lvm can't handle a second drdb device.
It allocates space on nb0 and nb1, but the lvcreate fails with an error
and it is not possible to make a mkreiserfs.

Is this problem fixed in a newer version of lvm?

Thanks in advance
Sven Landtrachtinger

lxf2s:/tmp # lvm version
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.07-ioctl (2003-11-21)
  Driver version:  4.0.5

lxf2s:~ # uname -a
Linux lxf2s 2.4.23 #4 SMP Tue Dec 16 16:44:35 CET 2003 i686 i686 i386
GNU/Linux


Before lvscreate:

lxf2s:/tmp # vgs
VG   #PV #LV #SN Attr VSize VFree
vg00   2   2   0 wz-- 1.19T 760.60G

lxf2s:/tmp # pvs
PV         VG   Fmt  Attr PSize   PFree
/dev/nb0   vg00 lvm2 a-   815.71G 360.22G
/dev/nb1   vg00 lvm2 a-   400.38G 400.38G

After lvscreate:

lxf2s:/dev # lvcreate -L 440G vg00 -n lv_datenarchiv

dmesg:
drbd0: blksize=1024 B
drbd0: blksize=4096 B
device-mapper: device /dev/nb0 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table
device-mapper: device /dev/nb0 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table
device-mapper: device /dev/nb0 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table
device-mapper: device /dev/nb0 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table
device-mapper: device /dev/nb0 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table


lxf2s:/dev # pvs
PV         VG   Fmt  Attr PSize   PFree
/dev/nb0   vg00 lvm2 a-   815.71G      0
/dev/nb1   vg00 lvm2 a-   400.38G 320.60G


lxf2s:/dev # vgdisplay
  --- Logical volume ---
  LV Name                /dev/vg00/lv_datenarchiv
  VG Name                vg00
  LV UUID                bv56rP-1rEv-cnou-9JrJ-iCPq-peuM-4dfoZ3
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                440.00 GB
  Current LE             112640
  Segments               4
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:0




lxf2s:/tmp # cat /etc/lvm/lvm.conf
devices {
    dir = "/dev"
    scan = [ "/dev" ]
    filter = [ "a/nb.*/" ,"r/.*/" ]
    cache = "/etc/lvm/.cache"
    write_cache_state = 1
    types = [ "drbd", 16 ]

}

log {
    verbose = 0
    syslog = 1
    overwrite = 0
    level = 0
    indent = 1
    command_names = 0
    prefix = "  "
}
backup {
    backup = 1
    backup_dir = "/etc/lvm/backup"
    archive = 1
    archive_dir = "/etc/lvm/archive"
    retain_min = 10
    retain_days = 30
}
shell {
    history_size = 100
}
global {
    umask = 077
    test = 0
    activation = 1
    proc = "/proc"
    locking_type = 1
    locking_dir = "/var/lock/lvm"
}

activation {
    missing_stripe_filler = "/dev/ioerror"
    mirror_region_size = 512
    reserved_stack = 256
    reserved_memory = 8192
    process_priority = -18
}


lxf2s:/tmp # cat /etc/drbd.conf
resource drbd0 {

  protocol = C
  fsckcmd  = /bin/true
  inittimeout = -10
  skip-wait
  disk {
    do-panic
    disk-size = 855330000
  }

  net {
    sync-nice   = -3
    sync-min    = 500k
    sync-max    = 200M    # maximal average syncer bandwidth
    tl-size     = 5000  # transfer log size, ensures strict write ordering
    timeout     = 60    # 0.1 seconds
    connect-int = 10    # seconds
    ping-int    = 10    # seconds
  }

  on lxf2p {
    device  = /dev/nb0
    disk    = /dev/sda
    address = lxf2p-drbd
    port    = 7788
  }

  on lxf2s {
    device  = /dev/nb0
    disk    = /dev/sda
    address = lxf2s-drbd
    port    = 7788
  }

}

resource drbd1 {

  protocol = C
  fsckcmd  = /bin/true
  inittimeout = -10
  skip-wait

  disk {
    do-panic
    disk-size = 419830000
  }

  net {
    sync-nice   = -3
    sync-min    = 500k
    sync-max    = 200M    # maximal average syncer bandwidth
    tl-size     = 5000  # transfer log size, ensures strict write ordering
    timeout     = 60    # 0.1 seconds
    connect-int = 10    # seconds
    ping-int    = 10    # seconds
  }

  on lxf2p {
    device  = /dev/nb1
    disk    = /dev/sdb
    address = lxf2p-drbd
    port    = 7789
  }

  on lxf2s {
    device  = /dev/nb1
    disk    = /dev/sdb
    address = lxf2s-drbd
    port    = 7789
  }

}
