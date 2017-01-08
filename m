Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v08J7Rsu024797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 8 Jan 2017 14:07:28 -0500
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52F933F158
	for <linux-lvm@redhat.com>; Sun,  8 Jan 2017 19:07:25 +0000 (UTC)
Received: from [192.168.0.229] (p5DE005BF.dip0.t-ipconnect.de [93.224.5.191])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: cvoelker)
	by mail.knebb.de (Postfix) with ESMTPSA id 26D539C01E1
	for <linux-lvm@redhat.com>; Sun,  8 Jan 2017 19:59:36 +0100 (CET)
From: knebb@knebb.de
Message-ID: <a1e0bd1c-65fa-0f77-d530-a898c707e59b@knebb.de>
Date: Sun, 8 Jan 2017 19:58:42 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------BD578EF60D7C6F1B7CDD75C7"
Subject: [linux-lvm] LVM on top of DRBD
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------BD578EF60D7C6F1B7CDD75C7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi all,


I have to cross-post to LVM as well to DRBD mailing list as I have no
clue where the issue is- if it's not a bug...

I can not get working LVM  on top of drbd- I am getting I/O erros
followed by "diskless" state.

Steps to reproduce:

Two machine2.

A: CentOS7 x64; epel-providedd packages
kmod-drbd84-8.4.9-1.el7.elrepo.x86_64
drbd84-utils-8.9.8-1.el7.elrepo.x86_64

B: CentOS6 x64; epel-provided packages
kmod-drbd83-8.3.16-3.el6.elrepo.x86_64
drbd83-utils-8.3.16-1.el6.elrepo.x86_64

drbd1.res:
resource drbd1 {
  protocol A;
  startup {
        wfc-timeout 240;
        degr-wfc-timeout     120;
        become-primary-on backuppc;
        }
  net {
        max-buffers 8000;
        max-epoch-size 8000;
        sndbuf-size 128k;
        shared-secret "13Lue=3";
        }
  syncer {
        rate 500M;
        }
  on backuppc {
    device /dev/drbd1;
    disk /dev/sdc;
    address 192.168.0.1:7790;
    meta-disk internal;
  }
  on drbd {
    device /dev/drbd1;
    disk /dev/sda;
    address 192.168.2.16:7790;
    meta-disk internal;
  }
}

I was able to create the drbd as expected (see first line of following
syslog), it gets in sync.
So I set up LVM and create filter rules so LVM should ignore the
underlying physical device:
/etc/lvm/lvm.conf [node1]:
filter = ["r|/dev/sdc|"];
/etc/lvm/lvm.conf [node2]:
filter = [ "r|/dev/sda|" ]

LVM ignores sda as expected:
#>  pvscan
  PV /dev/sda2   VG cl              lvm2 [15,00 GiB / 0    free]
  Total: 1 [15,00 GiB] / in use: 1 [15,00 GiB] / in no VG: 0 [0   ]

Now creating PV, VG, LV:
[root@backuppc etc]# pvcreate /dev/drbd1
  Physical volume "/dev/drbd1" successfully created.
[root@backuppc etc]# vgcreate test /dev/drbd1
  Volume group "test" successfully created
[root@backuppc etc]# lvcreate test -n test  -L 3G
  Volume group "test" has insufficient free space (767 extents): 768
required.
[root@backuppc etc]# lvcreate test -n test  -L 2.9G
  Rounding up size to full physical extent 2,90 GiB
  Logical volume "test" created.
[root@backuppc etc]# vgdisplay -v test
  --- Volume group ---
  VG Name               test
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               3,00 GiB
  PE Size               4,00 MiB
  Total PE              767
  Alloc PE / Size       743 / 2,90 GiB
  Free  PE / Size       24 / 96,00 MiB
  VG UUID               pUPkxh-oS0f-MEUY-yIeJ-3zPb-Fkg1-TW1fgh
  --- Logical volume ---
  LV Path                /dev/test/test
  LV Name                test
  VG Name                test
  LV UUID                X0wpkL-niZ7-XT7u-zjT0-ETzC-hYbI-yyv13F
  LV Write Access        read/write
  LV Creation host, time backuppc, 2017-01-07 10:57:29 +0100
  LV Status              available
  # open                 0
  LV Size                2,90 GiB
  Current LE             743
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2
  --- Physical volumes ---
  PV Name               /dev/drbd1
  PV UUID               3tcvkG-Keqk-vplB-f9zY-1X34-ZxCI-eFYPio
  PV Status             allocatable
  Total PE / Free PE    767 / 24

Creating filesystem (sorry, output in German):
[root@backuppc etc]# mkfs.ext4  /dev/test/test
mke2fs 1.42.9 (28-Dec-2013)
Dateisystem-Label=
OS-Typ: Linux
Blockgröße=4096 (log=2)
Fragmentgröße=4096 (log=2)
Stride=0 Blöcke, Stripebreite=0 Blöcke
190464 Inodes, 760832 Blöcke
38041 Blöcke (5.00%) reserviert für den Superuser
Erster Datenblock=0
Maximale Dateisystem-Blöcke=780140544
24 Blockgruppen
32768 Blöcke pro Gruppe, 32768 Fragmente pro Gruppe
7936 Inodes pro Gruppe
Superblock-Sicherungskopien gespeichert in den Blöcken:
        32768, 98304, 163840, 229376, 294912

Platz für Gruppentabellen wird angefordert: erledigt
Inode-Tabellen werden geschrieben: erledigt
Erstelle Journal (16384 Blöcke): erledigt
Schreibe Superblöcke und Dateisystem-Accountinginformationen: erledigt

Mounting and start to use:
[root@backuppc etc]# mount /dev/test/test /mnt
[root@backuppc etc]# cd /mnt/
[root@backuppc mnt]# cd ..

I immediately get I/O errors in syslog (and NO, the physical disk is not
damaged. Both are virtual machines (VMware ESXi 5.x) running on HW-RAID):

Jan  7 10:42:07 backuppc kernel: block drbd1: Resync done (total 166
sec; paused 0 sec; 18948 K/sec)
Jan  7 10:42:07 backuppc kernel: block drbd1: updated UUIDs
2C441CCF3B27BA41:0000000000000000:C9022D0F617A83BA:0000000000000004
Jan  7 10:42:07 backuppc kernel: block drbd1: conn( SyncSource ->
Connected ) pdsk( Inconsistent -> UpToDate )
Jan  7 10:58:44 backuppc kernel: EXT4-fs (dm-2): mounted filesystem with
ordered data mode. Opts: (null)
Jan  7 10:58:48 backuppc kernel: block drbd1: local WRITE IO error
sector 5296+3960 on sdc
Jan  7 10:58:48 backuppc kernel: block drbd1: disk( UpToDate -> Failed )
Jan  7 10:58:48 backuppc kernel: block drbd1: Local IO failed in
__req_mod. Detaching...
Jan  7 10:58:48 backuppc kernel: block drbd1: 0 KB (0 bits) marked
out-of-sync by on disk bit-map.
Jan  7 10:58:48 backuppc kernel: block drbd1: disk( Failed -> Diskless )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: sock was shut down by peer
Jan  7 10:58:48 backuppc kernel: drbd drbd1: peer( Secondary -> Unknown
) conn( Connected -> BrokenPipe ) pdsk( UpToDate -> DUnknown )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: short read (expected size 8)
Jan  7 10:58:48 backuppc kernel: drbd drbd1: meta connection shut down
by peer.
Jan  7 10:58:48 backuppc kernel: drbd drbd1: ack_receiver terminated
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Terminating drbd_a_drbd1
Jan  7 10:58:48 backuppc kernel: block drbd1: helper command:
/sbin/drbdadm pri-on-incon-degr minor-1
Jan  7 10:58:48 backuppc kernel: block drbd1: helper command:
/sbin/drbdadm pri-on-incon-degr minor-1 exit code 0 (0x0)
Jan  7 10:58:48 backuppc kernel: block drbd1: Should have called
drbd_al_complete_io(, 5296, 2027520), but my Disk seems to have failed 
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Connection closed
Jan  7 10:58:48 backuppc kernel: drbd drbd1: conn( BrokenPipe ->
Unconnected )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: receiver terminated
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Restarting receiver thread
Jan  7 10:58:48 backuppc kernel: drbd drbd1: receiver (re)started
Jan  7 10:58:48 backuppc kernel: drbd drbd1: conn( Unconnected ->
WFConnection )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Not fencing peer, I'm not
even Consistent myself.
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29096+3968
Jan  7 10:58:48 backuppc kernel: dm-2: WRITE SAME failed. Manually zeroing.
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29096+256
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29352+256
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29608+256
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29864+256
Jan  7 10:58:49 backuppc kernel: drbd drbd1: Handshake successful:
Agreed network protocol version 97
Jan  7 10:58:49 backuppc kernel: drbd drbd1: Feature flags enabled on
protocol level: 0x0 none.
Jan  7 10:58:49 backuppc kernel: drbd drbd1: conn( WFConnection ->
WFReportParams )
Jan  7 10:58:49 backuppc kernel: drbd drbd1: Starting ack_recv thread
(from drbd_r_drbd1 [22367])
Jan  7 10:58:49 backuppc kernel: block drbd1: receiver updated UUIDs to
effective data uuid: 2C441CCF3B27BA40
Jan  7 10:58:49 backuppc kernel: block drbd1: peer( Unknown -> Secondary
) conn( WFReportParams -> Connected ) pdsk( DUnknown -> UpToDate )

In the end my /proc/drbd looks like this:

version: 8.4.9-1 (api:1/proto:86-101)
GIT-hash: 9976da086367a2476503ef7f6b13d4567327a280 build by
akemi@Build64R7, 2016-12-04 01:08:48
 1: cs:Connected ro:Primary/Secondary ds:Diskless/UpToDate A r-----
    ns:3212879 nr:0 dw:67260 dr:3149797 al:27 bm:0 lo:0 pe:0 ua:0 ap:0
ep:1 wo:f oos:0

pvscan is still fine:

[root@backuppc log]# pvscan
  PV /dev/sda2    VG cl              lvm2 [15,00 GiB / 0    free]
  PV /dev/drbd1   VG test            lvm2 [3,00 GiB / 96,00 MiB free]
  Total: 2 [17,99 GiB] / in use: 2 [17,99 GiB] / in no VG: 0 [0   ]

So anyone having an idea what is going wrong here?


Greetings


Christian









_______________________________________________
drbd-user mailing list
drbd-user@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-user


--------------BD578EF60D7C6F1B7CDD75C7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>
    </p>
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 14px;" lang="x-unicode">
      <pre wrap="">Hi all,


I have to cross-post to LVM as well to DRBD mailing list as I have no
clue where the issue is- if it's not a bug...

I can not get working LVM  on top of drbd- I am getting I/O erros
followed by "diskless" state.

Steps to reproduce:

Two machine2.

A: CentOS7 x64; epel-providedd packages
kmod-drbd84-8.4.9-1.el7.elrepo.x86_64
drbd84-utils-8.9.8-1.el7.elrepo.x86_64

B: CentOS6 x64; epel-provided packages
kmod-drbd83-8.3.16-3.el6.elrepo.x86_64
drbd83-utils-8.3.16-1.el6.elrepo.x86_64

drbd1.res:
resource drbd1 {
  protocol A;
  startup {
        wfc-timeout 240;
        degr-wfc-timeout     120;
        become-primary-on backuppc;
        }
  net {
        max-buffers 8000;
        max-epoch-size 8000;
        sndbuf-size 128k;
        shared-secret "13Lue=3";
        }
  syncer {
        rate 500M;
        }
  on backuppc {
    device /dev/drbd1;
    disk /dev/sdc;
    address 192.168.0.1:7790;
    meta-disk internal;
  }
  on drbd {
    device /dev/drbd1;
    disk /dev/sda;
    address 192.168.2.16:7790;
    meta-disk internal;
  }
}

I was able to create the drbd as expected (see first line of following
syslog), it gets in sync.
So I set up LVM and create filter rules so LVM should ignore the
underlying physical device:
/etc/lvm/lvm.conf [node1]:
filter = ["r|/dev/sdc|"];
/etc/lvm/lvm.conf [node2]:
filter = [ "r|/dev/sda|" ]

LVM ignores sda as expected:
#&gt;  pvscan
  PV /dev/sda2   VG cl              lvm2 [15,00 GiB / 0    free]
  Total: 1 [15,00 GiB] / in use: 1 [15,00 GiB] / in no VG: 0 [0   ]

Now creating PV, VG, LV:
[root@backuppc etc]# pvcreate /dev/drbd1
  Physical volume "/dev/drbd1" successfully created.
[root@backuppc etc]# vgcreate test /dev/drbd1
  Volume group "test" successfully created
[root@backuppc etc]# lvcreate test -n test  -L 3G
  Volume group "test" has insufficient free space (767 extents): 768
required.
[root@backuppc etc]# lvcreate test -n test  -L 2.9G
  Rounding up size to full physical extent 2,90 GiB
  Logical volume "test" created.
[root@backuppc etc]# vgdisplay -v test
  --- Volume group ---
  VG Name               test
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               3,00 GiB
  PE Size               4,00 MiB
  Total PE              767
  Alloc PE / Size       743 / 2,90 GiB
  Free  PE / Size       24 / 96,00 MiB
  VG UUID               pUPkxh-oS0f-MEUY-yIeJ-3zPb-Fkg1-TW1fgh
  --- Logical volume ---
  LV Path                /dev/test/test
  LV Name                test
  VG Name                test
  LV UUID                X0wpkL-niZ7-XT7u-zjT0-ETzC-hYbI-yyv13F
  LV Write Access        read/write
  LV Creation host, time backuppc, 2017-01-07 10:57:29 +0100
  LV Status              available
  # open                 0
  LV Size                2,90 GiB
  Current LE             743
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:2
  --- Physical volumes ---
  PV Name               /dev/drbd1
  PV UUID               3tcvkG-Keqk-vplB-f9zY-1X34-ZxCI-eFYPio
  PV Status             allocatable
  Total PE / Free PE    767 / 24

Creating filesystem (sorry, output in German):
[root@backuppc etc]# mkfs.ext4  /dev/test/test
mke2fs 1.42.9 (28-Dec-2013)
Dateisystem-Label=
OS-Typ: Linux
Blockgröße=4096 (log=2)
Fragmentgröße=4096 (log=2)
Stride=0 Blöcke, Stripebreite=0 Blöcke
190464 Inodes, 760832 Blöcke
38041 Blöcke (5.00%) reserviert für den Superuser
Erster Datenblock=0
Maximale Dateisystem-Blöcke=780140544
24 Blockgruppen
32768 Blöcke pro Gruppe, 32768 Fragmente pro Gruppe
7936 Inodes pro Gruppe
Superblock-Sicherungskopien gespeichert in den Blöcken:
        32768, 98304, 163840, 229376, 294912

Platz für Gruppentabellen wird angefordert: erledigt
Inode-Tabellen werden geschrieben: erledigt
Erstelle Journal (16384 Blöcke): erledigt
Schreibe Superblöcke und Dateisystem-Accountinginformationen: erledigt

Mounting and start to use:
[root@backuppc etc]# mount /dev/test/test /mnt
[root@backuppc etc]# cd <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>mnt<span class="moz-txt-tag">/</span></i>
[root@backuppc mnt]# cd ..

I immediately get I/O errors in syslog (and NO, the physical disk is not
damaged. Both are virtual machines (VMware ESXi 5.x) running on HW-RAID):

Jan  7 10:42:07 backuppc kernel: block drbd1: Resync done (total 166
sec; paused 0 sec; 18948 K/sec)
Jan  7 10:42:07 backuppc kernel: block drbd1: updated UUIDs
2C441CCF3B27BA41:0000000000000000:C9022D0F617A83BA:0000000000000004
Jan  7 10:42:07 backuppc kernel: block drbd1: conn( SyncSource -&gt;
Connected ) pdsk( Inconsistent -&gt; UpToDate )
Jan  7 10:58:44 backuppc kernel: EXT4-fs (dm-2): mounted filesystem with
ordered data mode. Opts: (null)
Jan  7 10:58:48 backuppc kernel: block drbd1: local WRITE IO error
sector 5296+3960 on sdc
Jan  7 10:58:48 backuppc kernel: block drbd1: disk( UpToDate -&gt; Failed )
Jan  7 10:58:48 backuppc kernel: block drbd1: Local IO failed in
__req_mod. Detaching...
Jan  7 10:58:48 backuppc kernel: block drbd1: 0 KB (0 bits) marked
out-of-sync by on disk bit-map.
Jan  7 10:58:48 backuppc kernel: block drbd1: disk( Failed -&gt; Diskless )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: sock was shut down by peer
Jan  7 10:58:48 backuppc kernel: drbd drbd1: peer( Secondary -&gt; Unknown
) conn( Connected -&gt; BrokenPipe ) pdsk( UpToDate -&gt; DUnknown )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: short read (expected size 8)
Jan  7 10:58:48 backuppc kernel: drbd drbd1: meta connection shut down
by peer.
Jan  7 10:58:48 backuppc kernel: drbd drbd1: ack_receiver terminated
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Terminating drbd_a_drbd1
Jan  7 10:58:48 backuppc kernel: block drbd1: helper command:
/sbin/drbdadm pri-on-incon-degr minor-1
Jan  7 10:58:48 backuppc kernel: block drbd1: helper command:
/sbin/drbdadm pri-on-incon-degr minor-1 exit code 0 (0x0)
Jan  7 10:58:48 backuppc kernel: block drbd1: Should have called
drbd_al_complete_io(, 5296, 2027520), but my Disk seems to have failed <span class="moz-smiley-s2" title=":("></span>
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Connection closed
Jan  7 10:58:48 backuppc kernel: drbd drbd1: conn( BrokenPipe -&gt;
Unconnected )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: receiver terminated
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Restarting receiver thread
Jan  7 10:58:48 backuppc kernel: drbd drbd1: receiver (re)started
Jan  7 10:58:48 backuppc kernel: drbd drbd1: conn( Unconnected -&gt;
WFConnection )
Jan  7 10:58:48 backuppc kernel: drbd drbd1: Not fencing peer, I'm not
even Consistent myself.
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29096+3968
Jan  7 10:58:48 backuppc kernel: dm-2: WRITE SAME failed. Manually zeroing.
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29096+256
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29352+256
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29608+256
Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
nor remote data, sector 29864+256
Jan  7 10:58:49 backuppc kernel: drbd drbd1: Handshake successful:
Agreed network protocol version 97
Jan  7 10:58:49 backuppc kernel: drbd drbd1: Feature flags enabled on
protocol level: 0x0 none.
Jan  7 10:58:49 backuppc kernel: drbd drbd1: conn( WFConnection -&gt;
WFReportParams )
Jan  7 10:58:49 backuppc kernel: drbd drbd1: Starting ack_recv thread
(from drbd_r_drbd1 [22367])
Jan  7 10:58:49 backuppc kernel: block drbd1: receiver updated UUIDs to
effective data uuid: 2C441CCF3B27BA40
Jan  7 10:58:49 backuppc kernel: block drbd1: peer( Unknown -&gt; Secondary
) conn( WFReportParams -&gt; Connected ) pdsk( DUnknown -&gt; UpToDate )

In the end my /proc/drbd looks like this:

version: 8.4.9-1 (api:1/proto:86-101)
GIT-hash: 9976da086367a2476503ef7f6b13d4567327a280 build by
akemi@Build64R7, 2016-12-04 01:08:48
 1: cs:Connected ro:Primary/Secondary ds:Diskless/UpToDate A r-----
    ns:3212879 nr:0 dw:67260 dr:3149797 al:27 bm:0 lo:0 pe:0 ua:0 ap:0
ep:1 wo:f oos:0

pvscan is still fine:

[root@backuppc log]# pvscan
  PV /dev/sda2    VG cl              lvm2 [15,00 GiB / 0    free]
  PV /dev/drbd1   VG test            lvm2 [3,00 GiB / 96,00 MiB free]
  Total: 2 [17,99 GiB] / in use: 2 [17,99 GiB] / in no VG: 0 [0   ]

So anyone having an idea what is going wrong here?


Greetings


Christian









_______________________________________________
drbd-user mailing list
<a class="moz-txt-link-abbreviated" href="mailto:drbd-user@lists.linbit.com">drbd-user@lists.linbit.com</a>
<a class="moz-txt-link-freetext" href="http://lists.linbit.com/mailman/listinfo/drbd-user">http://lists.linbit.com/mailman/listinfo/drbd-user</a>
</pre>
    </div>
  </body>
</html>

--------------BD578EF60D7C6F1B7CDD75C7--
