Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D79560FA6
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 15:16:16 +0000 (UTC)
Received: from mklab.ph.rhul.ac.uk (mklab.ph.rhbnc.ac.uk [134.219.128.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 198573CA25
	for <linux-lvm@redhat.com>; Wed, 31 Jul 2019 15:16:04 +0000 (UTC)
Date: Wed, 31 Jul 2019 15:36:01 +0100 (BST)
From: Tom Crane <TPClvm@mklab.ph.rhul.ac.uk>
Message-ID: <alpine.LNX.2.21.1907311500020.29444@mklab.ph.rhul.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] System hangs after snapshot autoextend,
 'dmsetup info' confirms device is SUSPENDED
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Tom Crane <TPClvm@mklab.ph.rhul.ac.uk>

For some time I have suffered occasional system hangs following a snapshot 
autoextend operation.  The system becomes unusable, with many processes 
stuck in the uninterruptible 'D' wait state.

My setup is quite basic: bare metal system, plain HD, conventional/thick 
volumes, no lvmetad, plenty of free space on the PV & VG. eg.,

# pvs
   PV         VG  Fmt  Attr PSize  PFree
   /dev/sda2  VG0 lvm2 a--  <1.82t <368.47g
# vgs
   VG  #PV #LV #SN Attr   VSize  VFree
   VG0   1  15  10 wz--n- <1.82t <368.47g
# lvs
   LV                     VG  Attr       LSize   Pool Origin Data%  Meta% 
Move Log Cpy%Sync Convert
   data                   VG0 -wi-ao---- 600.00g
   home                   VG0 owi-aos--- 100.00g
   home_daily_snapshot    VG0 swi-a-s---   5.00g      home   27.29
   home_daily_snapshot2   VG0 swi-a-s---   5.00g      home   41.83
   home_monthly_snapshot  VG0 swi-a-s--- <27.86g      home   45.95
   home_monthly_snapshot2 VG0 swi-a-s---  40.80g      home   48.52
   root                   VG0 owi-aos--- 100.00g
   root_daily_snapshot    VG0 swi-a-s---   5.00g      root   8.84
   root_daily_snapshot2   VG0 swi-a-s---   5.00g      root   26.53
   root_monthly_snapshot  VG0 swi-a-s--- <37.09g      root   45.83
   root_monthly_snapshot2 VG0 swi-a-s---  53.43g      root   45.60
   swap                   VG0 -wi-ao----  10.00g
   tmp                    VG0 owi-aos--- 400.00g
   tmp_daily_snapshot     VG0 swi-a-s---  35.44g      tmp    47.81
   tmp_daily_snapshot2    VG0 swi-a-s---  69.08g      tmp    49.72

I have the following config in /etc/lvm/lvm.conf activation{},

         snapshot_autoextend_threshold=50
         snapshot_autoextend_percent=10

Typically the last thing I see in syslog before the hang is, eg.,

lvm[1028]: Size of logical volume VG0/root_monthly_snapshot changed from 33.71 GiB (8631 extents) to <37.09 GiB (9495 extents).

To investigate the problem I setup a job to start@boot time which does 
a 'dmsetup info' hourly, around the clock and logs the O/P to /data (which 
has no snapshots).  It showed the root LV had been suspended after the 
hang/resize, remaining in that state indefinitely, eg.

Name:              VG0-root
State:             SUSPENDED
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 1
Number of targets: 1
UUID: LVM-hVoK8kkkqDj1vfBDfvIhg7vdMospBTT4a9rD2V1t3dKHgp4igXP0uny8bFOQ2sya

All the other devices were in the ACTIVE state as normal.

Any thoughts on further diagnosis/fixing this problem?

Additional system/lvm details;
# lvm version
   LVM version:     2.02.177(2) (2017-12-18)
   Library version: 1.02.146 (2017-12-18)
   Driver version:  4.39.0
   Configuration:   ./configure --disable-readline --enable-cmdlib 
--enable-dmeventd --enable-applib --libdir=/usr/lib64 
--with-usrlibdir=/usr/lib64 --mandir=/usr/man --enable-realtime 
--with-lvm1=internal --enable-pkgconfig --enable-udev_sync 
--enable-udev_rules --with-udev-prefix= --with-device-uid=0 
--with-device-gid=6 --with-device-mode=0660 
--with-default-locking-dir=/run/lock/lvm --with-default-run-dir=/run/lvm 
--with-default-dm-run-dir=/run/lvm --with-clvmd-pidfile=/run/lvm/clvmd.pid 
--with-cmirrord-pidfile=/run/lvm/cmirrord.pid 
--with-dmeventd-pidfile=/run/lvm/dmeventd.pid 
--build=x86_64-slackware-linux

# uname -a
Linux mklab.ph.rhul.ac.uk 4.19.59 #2 SMP Sun Jul 14 16:07:23 CDT 2019 
x86_64 AMD FX-8320E Eight-Core Processor AuthenticAMD GNU/Linux

Thanks
Tom Crane
-- 
Tom Crane, Dept. Physics, Royal Holloway, University of London, Egham Hill,
Egham, Surrey, TW20 0EX, England.
Email:  T.Crane@rhul.ac.uk
