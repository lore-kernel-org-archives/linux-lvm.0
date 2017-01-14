Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0E6NBMO026640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 01:23:11 -0500
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FD4C8553C
	for <linux-lvm@redhat.com>; Sat, 14 Jan 2017 06:23:10 +0000 (UTC)
References: <07fb8e78-2050-a2ba-3e71-c21e989d57f3@knebb.de>
	<20170110094258.GB4322@soda.linbit>
From: knebb@knebb.de
Message-ID: <43b3e997-3abd-abdc-7f66-84f87be6a2bf@knebb.de>
Date: Sat, 14 Jan 2017 07:13:36 +0100
MIME-Version: 1.0
In-Reply-To: <20170110094258.GB4322@soda.linbit>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM on top of DRBD [actually: mkfs.ext4 then mount
 results in detach on RHEL 7 on VMWare]
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
To: linux-lvm@redhat.com, drbd-user@lists.linbit.com

Hi all,

sorry to be so stubborn- still no real explanation for the behaviour.

I did some test meanwhile:

Created drbd device, set up LV.

When using xfs instead of ext4 --> runs fine.
On CentOS6: mkfs.ext4- no matter on which host I mount it the first time
--> runs fine.
On CentOS7: mkfs.ext4- mounted on CentOS6 --> runs fine.
On CentOS7: mkfs.ext4- mounted on CentOS7 --> disk detached.

Now I skipped LVM in-between.

On CentOS7: mkfs.ext4- mounted on CentOS7 --> runs fine (detached with LVM!)

If this is related to the lazy writes it appears to me LVM shows
different capabilities to mkfs than DRBD does.

Lars wrote:

What really happens is that the file system code calls
blkdev_issue_zeroout(),
which will try discard, if discard is available and discard zeroes data,
or, if discard (with discard zeroes data) is not available or returns
failure, tries write-same with ZERO_PAGE,
or, if write-same is not available or returns failure,
tries __blkdev_issue_zeroout() (which uses "normal" writes).

At least in "current upstream", probably very similar in your
almost-3.10.something kernel.

DRBD sits in between, sees the failure return of write-same,
and handles it by detaching.

blkdev_issue_zeroout() is called. Which tries different possibilities.
DRBD sees the error on write-same (after discard failed/ is not
available) and detaches. Sounds reasonable.

If I skip LVM usage everything is fine. Means, mkfs.ext4 succeeds in
using discard or uses "normal" writes without trying first discard and
write-same.

In first case- why does it succedd with write-same (or discard?) when
there is no LVM in-between?

In the second case- why does it not try to use the faster ones? Does
DRBD not offer these capabilities? If so, why does LVM if the underlying
device does not?

Greetings

Christian






Am 10.01.2017 um 10:42 schrieb Lars Ellenberg:
> On Sat, Jan 07, 2017 at 11:16:09AM +0100, Christian V�lker wrote:
>> Hi all,
>>
>>
>> I have to cross-post to LVM as well to DRBD mailing list as I have no
>> clue where the issue is- if it's not a bug...
>>
>> I can not get working LVM  on top of drbd- I am getting I/O erros
>> followed by "diskless" state.
> For some reason, (some? not only?) VMWare virtual disks tend to pretend
> to support "write same", even if they fail such requests later.
>
> DRBD treats such failed WRITE-SAME the same way as any other backend
> error, and by default detaches.
>
> mkfs.ext4 by default uses "lazy_itable_init" and "lazy_journal_init",
> which makes it complete faster, but delays initialization of some file system
> meta data areas until first mount, where some kernel daemon will zero-out the
> relevant areas in the background.
>
> Older kernels (RHEL 6) and also older drbd (8.3) are not affected, because they
> don't know about write-same.
>
> Workarounds exist:
>
> Don't use the "lazy" mkfs.
> During normal operation, write-same is usually not used.
>
> Or tell the system that the backend does not support write-same:
> Check setting:
> 	grep ^ /sys/block/*/device/scsi_disk/*/max_write_same_blocks
> disable:
> 	echo 0 | tee /sys/block/*/device/scsi_disk/*/max_write_same_blocks
>
> You then need to re-attach DRBD (drbdadm down all; drbdadm up all)
> to make it aware of this change.
>
> Fix:
>
> Well, we need to somehow add some ugly heuristic to better detect
> wether some backend really supports write-same. [*]
>
> Or, more likely, add an option to tell DRBD to ignore any pretend-only
> write-same support.
>
> Thanks,
>
>     Lars
>
> [*] No, it is not as easy as "just ignore any IO error if it was a write-same
> request", because we try to "guarantee" that during normal operation, all
> replicas are in sync (within the limits defined by the replication protocol).
> If replicas fail in different ways, we can not do that (at least not without
> going through some sort of "recovery" first).
>
>> Steps to reproduce:
>>
>> Two machine2.
>>
>> A: CentOS7 x64; epel-providedd packages
>> kmod-drbd84-8.4.9-1.el7.elrepo.x86_64
>> drbd84-utils-8.9.8-1.el7.elrepo.x86_64
>>
>> B: CentOS6 x64; epel-provided packages
>> kmod-drbd83-8.3.16-3.el6.elrepo.x86_64
>> drbd83-utils-8.3.16-1.el6.elrepo.x86_64
>>
>> drbd1.res:
>> resource drbd1 {
>>   protocol A;
>>   startup {
>>         wfc-timeout 240;
>>         degr-wfc-timeout     120;
>>         become-primary-on backuppc;
>>         }
>>   net {
>>         max-buffers 8000;
>>         max-epoch-size 8000;
>>         sndbuf-size 128k;
>>         shared-secret "13Lue=3";
>>         }
>>   syncer {
>>         rate 500M;
>>         }
>>   on backuppc {
>>     device /dev/drbd1;
>>     disk /dev/sdc;
>>     address 192.168.0.1:7790;
>>     meta-disk internal;
>>   }
>>   on drbd {
>>     device /dev/drbd1;
>>     disk /dev/sda;
>>     address 192.168.2.16:7790;
>>     meta-disk internal;
>>   }
>> }
>>
>> I was able to create the drbd as expected (see first line of following
>> syslog), it gets in sync.
>> So I set up LVM and create filter rules so LVM should ignore the
>> underlying physical device:
>> /etc/lvm/lvm.conf [node1]:
>> filter = ["r|/dev/sdc|"];
>> /etc/lvm/lvm.conf [node2]:
>> filter = [ "r|/dev/sda|" ]
>>
>> LVM ignores sda as expected:
>> #>  pvscan
>>   PV /dev/sda2   VG cl              lvm2 [15,00 GiB / 0    free]
>>   Total: 1 [15,00 GiB] / in use: 1 [15,00 GiB] / in no VG: 0 [0   ]
>>
>> Now creating PV, VG, LV:
>> [root@backuppc etc]# pvcreate /dev/drbd1
>>   Physical volume "/dev/drbd1" successfully created.
>> [root@backuppc etc]# vgcreate test /dev/drbd1
>>   Volume group "test" successfully created
>> [root@backuppc etc]# lvcreate test -n test  -L 3G
>>   Volume group "test" has insufficient free space (767 extents): 768
>> required.
>> [root@backuppc etc]# lvcreate test -n test  -L 2.9G
>>   Rounding up size to full physical extent 2,90 GiB
>>   Logical volume "test" created.
>> [root@backuppc etc]# vgdisplay -v test
>>   --- Volume group ---
>>   VG Name               test
>>   System ID
>>   Format                lvm2
>>   Metadata Areas        1
>>   Metadata Sequence No  2
>>   VG Access             read/write
>>   VG Status             resizable
>>   MAX LV                0
>>   Cur LV                1
>>   Open LV               0
>>   Max PV                0
>>   Cur PV                1
>>   Act PV                1
>>   VG Size               3,00 GiB
>>   PE Size               4,00 MiB
>>   Total PE              767
>>   Alloc PE / Size       743 / 2,90 GiB
>>   Free  PE / Size       24 / 96,00 MiB
>>   VG UUID               pUPkxh-oS0f-MEUY-yIeJ-3zPb-Fkg1-TW1fgh
>>   --- Logical volume ---
>>   LV Path                /dev/test/test
>>   LV Name                test
>>   VG Name                test
>>   LV UUID                X0wpkL-niZ7-XT7u-zjT0-ETzC-hYbI-yyv13F
>>   LV Write Access        read/write
>>   LV Creation host, time backuppc, 2017-01-07 10:57:29 +0100
>>   LV Status              available
>>   # open                 0
>>   LV Size                2,90 GiB
>>   Current LE             743
>>   Segments               1
>>   Allocation             inherit
>>   Read ahead sectors     auto
>>   - currently set to     8192
>>   Block device           253:2
>>   --- Physical volumes ---
>>   PV Name               /dev/drbd1
>>   PV UUID               3tcvkG-Keqk-vplB-f9zY-1X34-ZxCI-eFYPio
>>   PV Status             allocatable
>>   Total PE / Free PE    767 / 24
>>
>> Creating filesystem (sorry, output in German):
>> [root@backuppc etc]# mkfs.ext4  /dev/test/test
>> mke2fs 1.42.9 (28-Dec-2013)
>> Dateisystem-Label=
>> OS-Typ: Linux
>> Blockgr��e=4096 (log=2)
>> Fragmentgr��e=4096 (log=2)
>> Stride=0 Bl�cke, Stripebreite=0 Bl�cke
>> 190464 Inodes, 760832 Bl�cke
>> 38041 Bl�cke (5.00%) reserviert f�r den Superuser
>> Erster Datenblock=0
>> Maximale Dateisystem-Bl�cke=780140544
>> 24 Blockgruppen
>> 32768 Bl�cke pro Gruppe, 32768 Fragmente pro Gruppe
>> 7936 Inodes pro Gruppe
>> Superblock-Sicherungskopien gespeichert in den Bl�cken:
>>         32768, 98304, 163840, 229376, 294912
>>
>> Platz f�r Gruppentabellen wird angefordert: erledigt
>> Inode-Tabellen werden geschrieben: erledigt
>> Erstelle Journal (16384 Bl�cke): erledigt
>> Schreibe Superbl�cke und Dateisystem-Accountinginformationen: erledigt
>>
>> Mounting and start to use:
>> [root@backuppc etc]# mount /dev/test/test /mnt
>> [root@backuppc etc]# cd /mnt/
>> [root@backuppc mnt]# cd ..
>>
>> I immediately get I/O errors in syslog (and NO, the physical disk is not
>> damaged. Both are virtual machines (VMware ESXi 5.x) running on HW-RAID):
>>
>> Jan  7 10:42:07 backuppc kernel: block drbd1: Resync done (total 166
>> sec; paused 0 sec; 18948 K/sec)
>> Jan  7 10:42:07 backuppc kernel: block drbd1: updated UUIDs
>> 2C441CCF3B27BA41:0000000000000000:C9022D0F617A83BA:0000000000000004
>> Jan  7 10:42:07 backuppc kernel: block drbd1: conn( SyncSource ->
>> Connected ) pdsk( Inconsistent -> UpToDate )
>> Jan  7 10:58:44 backuppc kernel: EXT4-fs (dm-2): mounted filesystem with
>> ordered data mode. Opts: (null)
>> Jan  7 10:58:48 backuppc kernel: block drbd1: local WRITE IO error
>> sector 5296+3960 on sdc
>> Jan  7 10:58:48 backuppc kernel: block drbd1: disk( UpToDate -> Failed )
>> Jan  7 10:58:48 backuppc kernel: block drbd1: Local IO failed in
>> __req_mod. Detaching...
>> Jan  7 10:58:48 backuppc kernel: block drbd1: 0 KB (0 bits) marked
>> out-of-sync by on disk bit-map.
>> Jan  7 10:58:48 backuppc kernel: block drbd1: disk( Failed -> Diskless )
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: sock was shut down by peer
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: peer( Secondary -> Unknown
>> ) conn( Connected -> BrokenPipe ) pdsk( UpToDate -> DUnknown )
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: short read (expected size 8)
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: meta connection shut down
>> by peer.
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: ack_receiver terminated
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: Terminating drbd_a_drbd1
>> Jan  7 10:58:48 backuppc kernel: block drbd1: helper command:
>> /sbin/drbdadm pri-on-incon-degr minor-1
>> Jan  7 10:58:48 backuppc kernel: block drbd1: helper command:
>> /sbin/drbdadm pri-on-incon-degr minor-1 exit code 0 (0x0)
>> Jan  7 10:58:48 backuppc kernel: block drbd1: Should have called
>> drbd_al_complete_io(, 5296, 2027520), but my Disk seems to have failed :(
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: Connection closed
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: conn( BrokenPipe ->
>> Unconnected )
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: receiver terminated
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: Restarting receiver thread
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: receiver (re)started
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: conn( Unconnected ->
>> WFConnection )
>> Jan  7 10:58:48 backuppc kernel: drbd drbd1: Not fencing peer, I'm not
>> even Consistent myself.
>> Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
>> nor remote data, sector 29096+3968
>> Jan  7 10:58:48 backuppc kernel: dm-2: WRITE SAME failed. Manually zeroing.
>> Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
>> nor remote data, sector 29096+256
>> Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
>> nor remote data, sector 29352+256
>> Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
>> nor remote data, sector 29608+256
>> Jan  7 10:58:48 backuppc kernel: block drbd1: IO ERROR: neither local
>> nor remote data, sector 29864+256
>> Jan  7 10:58:49 backuppc kernel: drbd drbd1: Handshake successful:
>> Agreed network protocol version 97
>> Jan  7 10:58:49 backuppc kernel: drbd drbd1: Feature flags enabled on
>> protocol level: 0x0 none.
>> Jan  7 10:58:49 backuppc kernel: drbd drbd1: conn( WFConnection ->
>> WFReportParams )
>> Jan  7 10:58:49 backuppc kernel: drbd drbd1: Starting ack_recv thread
>> (from drbd_r_drbd1 [22367])
>> Jan  7 10:58:49 backuppc kernel: block drbd1: receiver updated UUIDs to
>> effective data uuid: 2C441CCF3B27BA40
>> Jan  7 10:58:49 backuppc kernel: block drbd1: peer( Unknown -> Secondary
>> ) conn( WFReportParams -> Connected ) pdsk( DUnknown -> UpToDate )
>>
>> In the end my /proc/drbd looks like this:
>>
>> version: 8.4.9-1 (api:1/proto:86-101)
>> GIT-hash: 9976da086367a2476503ef7f6b13d4567327a280 build by
>> akemi@Build64R7, 2016-12-04 01:08:48
>>  1: cs:Connected ro:Primary/Secondary ds:Diskless/UpToDate A r-----
>>     ns:3212879 nr:0 dw:67260 dr:3149797 al:27 bm:0 lo:0 pe:0 ua:0 ap:0
>> ep:1 wo:f oos:0
>>
>> pvscan is still fine:
>>
>> [root@backuppc log]# pvscan
>>   PV /dev/sda2    VG cl              lvm2 [15,00 GiB / 0    free]
>>   PV /dev/drbd1   VG test            lvm2 [3,00 GiB / 96,00 MiB free]
>>   Total: 2 [17,99 GiB] / in use: 2 [17,99 GiB] / in no VG: 0 [0   ]
>>
>> So anyone having an idea what is going wrong here?
