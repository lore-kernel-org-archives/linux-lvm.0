From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM inaccessible after OS reinstall
Message-ID: <20031104080103.GB23581@percy.comedia.it>
References: <5.2.0.9.0.20031103225927.01cbecb0@mail.mame.net> <5.2.0.9.0.20031103225927.01cbecb0@mail.mame.net> <5.2.0.9.0.20031104105325.01d1a430@mail.mame.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.2.0.9.0.20031104105325.01d1a430@mail.mame.net>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Nov  4 02:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Karl Stenerud <kstenerud@mame.net>
Cc: linux-lvm@sistina.com

uhm,
either there is a problem with the driver for your sata controller, or
your hdj is hosed.
could you test if you can read all of the disks with dd (keeping an eye
on syslog/dmesg)?

Regards,
L.

On Tue, Nov 04, 2003 at 11:06:32AM +0900, Karl Stenerud wrote:
>Sorry if that wasn't useful enough.  I'm not an expert on these commands 
>and the faq didn't seem to offer much assistance in this area.
>
>[root@localhost etc]# vgchange -a y
>vgchange -- volume group "group1" already active
>
>[root@localhost etc]# vgdisplay -v
>--- Volume group ---
>VG Name               group1
>VG Access             read/write
>VG Status             available/resizable
>VG #                  0
>MAX LV                256
>Cur LV                1
>Open LV               0
>MAX LV Size           2 TB
>Max PV                256
>Cur PV                4
>Act PV                4
>VG Size               465.75 GB
>PE Size               32 MB
>Total PE              14904
>Alloc PE / Size       14904 / 465.75 GB
>Free  PE / Size       0 / 0
>VG UUID               QnY93d-dypP-OLTs-5122-BVT4-4Zjk-wGY7rC
>
>--- Logical volume ---
>LV Name                /dev/group1/vol1
>VG Name                group1
>LV Write Access        read/write
>LV Status              available
>LV #                   1
># open                 0
>LV Size                465.75 GB
>Current LE             14904
>Allocated LE           14904
>Allocation             next free
>Read ahead sectors     1024
>Block device           58:0
>
>
>--- Physical volumes ---
>PV Name (#)           /dev/ide/host4/bus1/target0/lun0/disc (3)
>PV Status             available / allocatable
>Total PE / Free PE    2383 / 0
>
>PV Name (#)           /dev/ide/host4/bus0/target0/lun0/disc (4)
>PV Status             available / allocatable
>Total PE / Free PE    2985 / 0
>
>PV Name (#)           /dev/ide/host4/bus0/target1/lun0/disc (2)
>PV Status             available / allocatable
>Total PE / Free PE    4768 / 0
>
>PV Name (#)           /dev/ide/host2/bus0/target0/lun0/disc (1)
>PV Status             available / allocatable
>Total PE / Free PE    4768 / 0
>
>
>
>[root@localhost etc]#
>
>
>
>Here's part of syslog that shows something with reiserfs:
>
>Nov  3 08:04:55 localhost kernel: reiserfs: found format "3.6" with 
>standard journal
>Nov  3 08:04:59 localhost kernel: reiserfs: using ordered data mode
>Nov  3 08:04:59 localhost kernel: reiserfs: checking transaction log 
>(device ide0(3,3)) ...
>Nov  3 08:04:59 localhost kernel: for (ide0(3,3))
>Nov  3 08:05:00 localhost kernel: ide0(3,3):Using r5 hash to sort names
>Nov  3 08:08:10 localhost kernel: hdj: dma_timer_expiry: dma status == 0x61
>Nov  3 08:09:27 localhost kernel: hdj: dma_timer_expiry: dma status == 0x61
>Nov  3 08:12:43 localhost kernel: hdj: dma_timer_expiry: dma status == 0x61
>Nov  3 08:16:18 localhost last message repeated 2 times
>Nov  3 08:17:51 localhost kernel: hdj: dma_timer_expiry: dma status == 0x61
>Nov  3 08:18:01 localhost kernel: hdj: error waiting for DMA
>Nov  3 08:18:01 localhost kernel: hdj: dma timeout retry: status=0xd1 { 
>Busy }
>Nov  3 08:18:01 localhost kernel:
>Nov  3 08:18:01 localhost kernel: hdi: DMA disabled
>Nov  3 08:18:01 localhost kernel: hdj: DMA disabled
>Nov  3 08:18:01 localhost kernel: ide4: reset: success
>Nov  3 08:18:09 localhost kernel: blk: queue c0181fac, I/O limit 4095Mb 
>(mask 0xffffffff)
>Nov  3 08:18:16 localhost kernel: hdj: read_intr: status=0x59 { DriveReady 
>SeekComplete DataRequest Error }
>Nov  3 08:18:16 localhost kernel: hdj: read_intr: error=0x40 { 
>UncorrectableError }, LBAsect=103350672, high=6, low=2687376, 
>sector=103350672
>Nov  3 08:18:16 localhost kernel: end_request: I/O error, cmd 0 dev 38:40 
>(hdj), sector 103350672
>Nov  3 08:18:20 localhost kernel: hdj: dma_intr: status=0x51 { DriveReady 
>SeekComplete Error }
>Nov  3 08:18:20 localhost kernel: hdj: dma_intr: error=0x40 { 
>UncorrectableError }, LBAsect=103350676, high=6, low=2687380, 
>sector=103350674
>Nov  3 08:18:20 localhost kernel: end_request: I/O error, cmd 0 dev 38:40 
>(hdj), sector 103350674
>Nov  3 08:18:24 localhost kernel: hdj: dma_intr: status=0x51 { DriveReady 
>SeekComplete Error }
>Nov  3 08:18:24 localhost kernel: hdj: dma_intr: error=0x40 { 
>UncorrectableError }, LBAsect=103350676, high=6, low=2687380, 
>sector=103350676
>Nov  3 08:18:24 localhost kernel: end_request: I/O error, cmd 0 dev 38:40 
>(hdj), sector 103350676
>Nov  3 08:18:54 localhost kernel: hdj: dma_intr: status=0x51 { DriveReady 
>SeekComplete Error }
>Nov  3 08:18:54 localhost kernel: hdj: dma_intr: error=0x40 { 
>UncorrectableError }, LBAsect=108855680, high=6, low=8192384, 
>sector=108855680
>Nov  3 08:18:54 localhost kernel: end_request: I/O error, cmd 0 dev 38:40 
>(hdj), sector 108855680 low=8192384, sector=108855680
>Nov  3 08:18:54 localhost kernel: end_request: I/O error, cmd 0 dev 38:40 
>(hdj), sector 108855680
>Nov  3 09:01:00 localhost CROND[2241]: (root) CMD (nice -n 19 run-parts 
>/etc/cron.hourly)
>Nov  3 09:17:57 localhost kernel: hdj: dma_timer_expiry: dma status == 0x41
>Nov  3 09:18:04 localhost proftpd[2258]: localhost 
>(main.internal[192.168.10.10]) - FTP session opened.
>Nov  3 09:18:53 localhost kernel: hdj: dma_intr: status=0x51 { DriveReady 
>SeekComplete Error }
>Nov  3 09:18:53 localhost kernel: hdj: dma_intr: error=0x40 { 
>UncorrectableError }, LBAsect=40960394, high=2,low=7405962, sector=40960384
>Nov  3 09:18:53 localhost kernel: end_request: I/O error, cmd 0 dev 38:40 
>(hdj), sector 40960384
>

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
