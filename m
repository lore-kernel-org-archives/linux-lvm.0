Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0SMsFd9015866
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 17:54:16 -0500
Received: from sneak2.sneakemail.com (sneak2.sneakemail.com [38.113.6.65])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s0SMsCSL029224
	for <linux-lvm@redhat.com>; Tue, 28 Jan 2014 17:54:13 -0500
Date: Tue, 28 Jan 2014 22:54:11 +0000
Message-ID: <16647-1390949651-817374@sneakemail.com>
MIME-Version: 1.0
From: "Seb A" <4jngrhkk3c@snkmail.com>
Subject: [linux-lvm] Full DRDB device on LVM is now unusable
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

I'm not sure if this is more of an LVM issue or a DRDB issue, but maybe someone here can help me...

My DRDB device on LVM filled up with data and now it is unusable after a power cycle.  The DRDB device that was not on LVM is fine (but it did not fill up).

I configured two DRDB nodes running Openfiler with corosync and pacemaker as per the instructions here [http://www.howtoforge.com/openfiler-2.99-active-passive-with-corosync-pacemaker-and-drbd] over two years ago.  At one point it swapped over to what was originally the secondary node "Openfiler2" and I left it like that and all was fine (AFAIK).  (I did have a few issues in the early days with it losing sync on reboot / power failure, but that's ancient history.)  Eventually the DRBD data partition filled up as there are processes that ftp files onto it.  There were lots of proftpd processes that were stuck trying to do a CWD into the data partition and therefore the cpu 'load' went really high.  I tried to start a process to delete old files and it got stuck.  It wasn't doing anything, and I couldn't cancel or kill it.  kill -9 <pid> did not work on that process or any of the stuck proftpd processes.  So I could not unmount the drive and when I tried fuser it just killed m!
 y ssh session and failed to kill the proftpd processes.  I restarted sshd via the console, and, as there had been some kernel panics I decided to reboot, hardly expecting it to succeed.  It didn't - it got stuck and I had to kill the virtual power.  When it came back up it could not mount the DRBD data partition (that uses LVM).  Both the DRBD partitions were synchronized before and after the reboot - they reconnected and the primary stayed on 'Openfiler2'.

The first errors after the reboot were in here:

daemon.info<30>: Jan 28 15:26:34 Openfiler2 LVM[3228]: INFO: Activating volume group vg0drbd
daemon.info<30>: Jan 28 15:26:34 Openfiler2 LVM[3228]: INFO: Reading all physical volumes. This may take a while... Found volume group "localvg" using metadata type lvm2 Found volume group "vg0drbd" using metadata type lvm2
kern.err<3>: Jan 28 15:26:34 Openfiler2 kernel: device-mapper: table: 253:1: linear: dm-linear: Device lookup failed
kern.warn<4>: Jan 28 15:26:34 Openfiler2 kernel: device-mapper: ioctl: error adding target to table
daemon.err<27>: Jan 28 15:26:34 Openfiler2 LVM[3228]: ERROR: device-mapper: reload ioctl failed: Invalid argument 1 logical volume(s) in volume group "vg0drbd" now active
daemon.info<30>: Jan 28 15:26:34 Openfiler2 crmd: [1284]: info: process_lrm_event: LRM operation lvmdata_start_0 (call=26, rc=1, cib-update=31, confirmed=true) unknown error

I tried to mount it manually but the device is missing.  Any suggestions on how I can get this volume mounted?  Thanks!

For reference:
kern.info<6>: Jan 28 17:28:11 Openfiler2 kernel: device-mapper: uevent: version 1.0.3
kern.info<6>: Jan 28 17:28:11 Openfiler2 kernel: device-mapper: ioctl: 4.17.0-ioctl (2010-03-05) initialised: dm-devel@redhat.com

Linux Openfiler2 2.6.32-71.18.1.el6-0.20.smp.gcc4.1.x86_64 #1 SMP Fri Mar 25 23:12:47 EDT 2011 x86_64 x86_64 x86_64 GNU/Linux

My last line of /etc/fstab is commented out as it is controlled by pacemaker:
#/dev/vg0drbd/filer /mnt/vg0drbd/filer xfs defaults,usrquota,grpquota 0 0


Right now I have:

[root@Openfiler2 ~]# service drbd status
drbd driver loaded OK; device status:
version: 8.3.10 (api:88/proto:86-96)
GIT-hash: 5c0b0469666682443d4785d90a2c603378f9017b build by phil@fat-tyre, 2011-01-28 12:17:35
m:res               cs         ro                 ds                 p  mounted            fstype
0:cluster_metadata  Connected  Primary/Secondary  UpToDate/UpToDate  C  /cluster_metadata  ext3
1:vg0_drbd          Connected  Primary/Secondary  UpToDate/UpToDate  C

[root@Openfiler2 ~]# crm status
============
Last updated: Tue Jan 28 20:11:19 2014
Stack: openais
Current DC: Openfiler1 - partition with quorum
Version: 1.1.2-c6b59218ee949eebff30e837ff6f3824ed0ab86b
2 Nodes configured, 2 expected votes
2 Resources configured.
============

Online: [ Openfiler1 Openfiler2 ]

 Resource Group: g_services
     MetaFS     (ocf::heartbeat:Filesystem):    Started Openfiler2
     lvmdata    (ocf::heartbeat:LVM):   Stopped
     DataFS     (ocf::heartbeat:Filesystem):    Stopped
     openfiler  (lsb:openfiler):        Stopped
     ClusterIP  (ocf::heartbeat:IPaddr2):       Stopped
     iscsi      (lsb:iscsi-target):     Stopped
     ldap       (lsb:ldap):     Stopped
     samba      (lsb:smb):      Stopped
     nfs        (lsb:nfs):      Stopped
     nfslock    (lsb:nfslock):  Stopped
     ftp        (lsb:proftpd):  Stopped
 Master/Slave Set: ms_g_drbd
     Masters: [ Openfiler2 ]
     Slaves: [ Openfiler1 ]

Failed actions:
    lvmdata_start_0 (node=Openfiler2, call=28, rc=1, status=complete): unknown error

######

More reference:

[root@Openfiler2 ~]# pvdisplay
  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               localvg
  PV Size               975.93 GiB / not usable 2.32 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              249837
  Free PE               0
  Allocated PE          249837
  PV UUID               OPFfsk-LXkz-3Voc-CQbj-Qf8d-YmHs-cR4Xjt

  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               localvg
  PV Size               975.44 GiB / not usable 3.32 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              249712
  Free PE               25600
  Allocated PE          224112
  PV UUID               yG1gfI-1HRb-AdCS-RqUV-Cm2j-pdqe-ZcB10j

  --- Physical volume ---
  PV Name               /dev/dm-0
  VG Name               vg0drbd
  PV Size               1.81 TiB / not usable 1.11 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              473934
  Free PE               0
  Allocated PE          473934
  PV UUID               u8Au1m-U1pJ-RMik-bZGk-7NPA-3EOL-P21MHW

[root@Openfiler2 ~]# pvscan
  PV /dev/sdc1         VG localvg   lvm2 [975.93 GiB / 0    free]
  PV /dev/sdb2         VG localvg   lvm2 [975.44 GiB / 100.00 GiB free]
  PV /dev/localvg/r1   VG vg0drbd   lvm2 [1.81 TiB / 0    free]
  Total: 3 [3.71 TiB] / in use: 3 [3.71 TiB] / in no VG: 0 [0   ]

[root@Openfiler2 ~]# vgdisplay
  --- Volume group ---
  VG Name               localvg
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  23
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.91 TiB
  PE Size               4.00 MiB
  Total PE              499549
  Alloc PE / Size       473949 / 1.81 TiB
  Free  PE / Size       25600 / 100.00 GiB
  VG UUID               5knbwX-LaJ5-1fEd-OD1R-59jZ-Otmy-8IKtVl

  --- Volume group ---
  VG Name               vg0drbd
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               1.81 TiB
  PE Size               4.00 MiB
  Total PE              473934
  Alloc PE / Size       473934 / 1.81 TiB
  Free  PE / Size       0 / 0
  VG UUID               4pgyVr-Eduj-2CVD-rUhf-Sr7L-Q814-45BE2N

[root@Openfiler2 ~]# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "localvg" using metadata type lvm2
  Found volume group "vg0drbd" using metadata type lvm2

[root@Openfiler2 ~]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/localvg/r1
  VG Name                localvg
  LV UUID                eSuNJr-yFDC-WCET-sIgi-IgTf-JRYz-Ack7oe
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                1.81 TiB
  Current LE             473949
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/vg0drbd/filer
  VG Name                vg0drbd
  LV UUID                eSuNJr-yFDC-WCET-sIgi-IgTf-JRYz-Ack7oe
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                1.81 TiB
  Current LE             473934
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto

[root@Openfiler2 ~]# lvscan
  ACTIVE            '/dev/localvg/r1' [1.81 TiB] inherit
  inactive          '/dev/vg0drbd/filer' [1.81 TiB] inherit

[root@Openfiler2 ~]# lvchange -ay /dev/vg0drbd/filer
  device-mapper: reload ioctl failed: Invalid argument

[root@Openfiler2 ~]# lvdisplay
  --- Logical volume ---
  LV Name                /dev/localvg/r1
  VG Name                localvg
  LV UUID                eSuNJr-yFDC-WCET-sIgi-IgTf-JRYz-Ack7oe
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                1.81 TiB
  Current LE             473949
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/vg0drbd/filer
  VG Name                vg0drbd
  LV UUID                eSuNJr-yFDC-WCET-sIgi-IgTf-JRYz-Ack7oe
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1.81 TiB
  Current LE             473934
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1

[root@Openfiler2 ~]# lvscan
  ACTIVE            '/dev/localvg/r1' [1.81 TiB] inherit
  ACTIVE            '/dev/vg0drbd/filer' [1.81 TiB] inherit

[root@Openfiler2 ~]# ls -l /dev/dm-*
brw-rw---- 1 root disk 253, 0 Jan 28 17:39 /dev/dm-0
brw-rw---- 1 root disk 253, 1 Jan 28 21:00 /dev/dm-1

[root@Openfiler2 ~]# dmsetup ls
localvg-r1      (253, 0)
vg0drbd-filer   (253, 1)

[root@Openfiler2 ~]# dmsetup info
Name:              localvg-r1
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        2
Event number:      0
Major, minor:      253, 0
Number of targets: 2
UUID: LVM-5knbwXLaJ51fEdOD1R59jZOtmy8IKtVleSuNJryFDCWCETsIgiIgTfJRYzAck7oe

Name:              vg0drbd-filer
State:             ACTIVE
Read Ahead:        256
Tables present:    None
Open count:        0
Event number:      0
Major, minor:      253, 1
Number of targets: 0
UUID: LVM-4pgyVrEduj2CVDrUhfSr7LQ81445BE2NeSuNJryFDCWCETsIgiIgTfJRYzAck7oe

[root@Openfiler2 ~]# dmsetup deps
localvg-r1: 2 dependencies      : (8, 18) (8, 33)
vg0drbd-filer: 0 dependencies   :

[root@Openfiler2 ~]# dmsetup table
localvg-r1: 0 2046664704 linear 8:33 2048
localvg-r1: 2046664704 1835925504 linear 8:18 2048
vg0drbd-filer:

[root@Openfiler2 ~]# drbdsetup /dev/drbd1 show
disk {
        size                    0s _is_default; # bytes
        on-io-error             detach;
        fencing                 dont-care _is_default;
        max-bio-bvecs           0 _is_default;
}
net {
        timeout                 60 _is_default; # 1/10 seconds
        max-epoch-size          2048 _is_default;
        max-buffers             2048 _is_default;
        unplug-watermark        128 _is_default;
        connect-int             10 _is_default; # seconds
        ping-int                10 _is_default; # seconds
        sndbuf-size             0 _is_default; # bytes
        rcvbuf-size             0 _is_default; # bytes
        ko-count                0 _is_default;
        after-sb-0pri           disconnect _is_default;
        after-sb-1pri           disconnect _is_default;
        after-sb-2pri           disconnect _is_default;
        rr-conflict             disconnect _is_default;
        ping-timeout            5 _is_default; # 1/10 seconds
        on-congestion           block _is_default;
        congestion-fill         0s _is_default; # byte
        congestion-extents      127 _is_default;
}
syncer {
        rate                    112640k; # bytes/second
        after                   0;
        al-extents              127 _is_default;
        on-no-data-accessible   io-error _is_default;
        c-plan-ahead            0 _is_default; # 1/10 seconds
        c-delay-target          10 _is_default; # 1/10 seconds
        c-fill-target           0s _is_default; # bytes
        c-max-rate              102400k _is_default; # bytes/second
        c-min-rate              4096k _is_default; # bytes/second
}
protocol C;
_this_host {
        device                  minor 1;
        disk                    "/dev/localvg/r1";
        meta-disk               internal;
        address                 ipv4 192.168.100.159:7789;
}
_remote_host {
        address                 ipv4 192.168.100.158:7789;
}

[root@Openfiler2 ~]# crm configure show
node Openfiler1 \
        attributes standby="off"
node Openfiler2 \
        attributes standby="off"
primitive ClusterIP ocf:heartbeat:IPaddr2 \
        params ip="192.168.4.157" cidr_netmask="32" \
        op monitor interval="30s"
primitive DataFS ocf:heartbeat:Filesystem \
        params device="/dev/vg0drbd/filer" directory="/mnt/vg0drbd/filer" fstype="xfs" \
        meta target-role="started"
primitive MetaFS ocf:heartbeat:Filesystem \
        params device="/dev/drbd0" directory="/cluster_metadata" fstype="ext3" \
        meta target-role="started"
primitive drbd_data ocf:linbit:drbd \
        params drbd_resource="vg0_drbd" \
        op monitor interval="15s"
primitive drbd_meta ocf:linbit:drbd \
        params drbd_resource="cluster_metadata" \
        op monitor interval="15s"
primitive ftp lsb:proftpd \
        meta target-role="stopped"
primitive iscsi lsb:iscsi-target
primitive ldap lsb:ldap
primitive lvmdata ocf:heartbeat:LVM \
        params volgrpname="vg0drbd" \
        meta target-role="started"
primitive nfs lsb:nfs
primitive nfslock lsb:nfslock
primitive openfiler lsb:openfiler
primitive samba lsb:smb
group g_drbd drbd_meta drbd_data
group g_services MetaFS lvmdata DataFS openfiler ClusterIP iscsi ldap samba nfs nfslock ftp
ms ms_g_drbd g_drbd \
        meta master-max="1" master-node-max="1" clone-max="2" clone-node-max="1" clone-max="2" clone-node-max="1" notify="true"
location cli-prefer-ClusterIP ClusterIP \
        rule $id="cli-prefer-rule-ClusterIP" inf: #uname eq Openfiler1
location cli-standby-g_services g_services \
        rule $id="cli-standby-rule-g_services" -inf: #uname eq Openfiler1
location cli-standby-ms_g_drbd ms_g_drbd \
        rule $id="cli-standby-ms_g_drbd-rule" $role="Master" -inf: #uname eq Openfiler1
colocation c_g_services_on_g_drbd inf: g_services ms_g_drbd:Master
order o_g_servicesafter_g_drbd inf: ms_g_drbd:promote g_services:start
property $id="cib-bootstrap-options" \
        dc-version="1.1.2-c6b59218ee949eebff30e837ff6f3824ed0ab86b" \
        cluster-infrastructure="openais" \
        expected-quorum-votes="2" \
        stonith-enabled="false" \
        no-quorum-policy="ignore" \
        last-lrm-refresh="1390944138"
rsc_defaults $id="rsc-options" \
        resource-stickiness="100"

I intentially stopped proftpd (ftp) via the Linux Cluster Management Console 1.5.14 so that I didn't get more proftpd processes starting up if you are wondering why it says stopped above.

Many thanks and regards, 

Seb A
