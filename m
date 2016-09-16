Received: from o.ww.redhat.com (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8GED763006888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2016 10:13:08 -0400
References: <CAEMJtDsvR-70bVC2E=aMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmail.com>
	<c5f4003c-f3ea-1aac-1727-d14ba3281d13@redhat.com>
	<e2f9476f73b7ab05cc1e7a21643ed29e@dds.nl>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <7308a436-1459-6097-3d02-239797867e8f@redhat.com>
Date: Fri, 16 Sep 2016 16:13:06 +0200
MIME-Version: 1.0
In-Reply-To: <e2f9476f73b7ab05cc1e7a21643ed29e@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2 raid volumes
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


On 08/15/2016 03:38 PM, Xen wrote:
> Heinz Mauelshagen schreef op 03-08-2016 15:10:
>
>> The Cyp%Sync field tells you about the resynchronization progress,
>> i.e. the initial mirroring of
>> all data blocks in a raid1/10 or the initial calculation and storing
>> of parity blocks in raid4/5/6.
>
> Heinz, can I perhaps ask you here. If I can.
>
> I have put a root volume on raid 1. Maybe "of course" the second disk 
> (LVM volumes) are not available at system boot:
>
> aug 15 14:09:19 xenpc2 kernel: device-mapper: raid: Loading target 
> version 1.7.0
> aug 15 14:09:19 xenpc2 kernel: device-mapper: raid: Failed to read 
> superblock of device at position 1

Yes, looks like you don't have the 2nd PV accessible by the time when 
the raid1 is being discovered and initially activated,
hence the superblock can't be retrieved.

These messages seem to be coming from initramfs, so check which driver 
is missing/not loaded to access the 2nd PV.

The fact that you gain access to the raid1 completely after reboot (as 
you mention further down) tells the
aforementioned fact is reasoning this degraded activation.
I.e. disk driver loaded after root pivot.
Please ensure it is available in the initramfs and loaded.

Heinz

> aug 15 14:09:19 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2 
> mirrors
> aug 15 14:09:19 xenpc2 kernel: created bitmap (15 pages) for device mdX
> aug 15 14:09:19 xenpc2 kernel: mdX: bitmap initialized from disk: read 
> 1 pages, set 19642 of 30040 bits
> aug 15 14:09:19 xenpc2 kernel: EXT4-fs (dm-6): mounted filesystem with 
> ordered data mode. Opts: (null)
>
>
> This could be because I am using PV directly on disk (no partition 
> table) for *some* volumes (actually the first disk, that is booted 
> from), however, I force a start of LVM2 service by enabling it in 
> SystemD:
>
> aug 15 14:09:19 xenpc2 systemd[1]: Starting LVM2...
>
> This is further down the log, so LVM is actually started after the 
> RAID is loading.
>
> At that point normally, from my experience, only the root LV is 
> available.
>
> Then at a certain point more devices become available:
>
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/mapper/msata-boot.
> aug 15 14:09:22 xenpc2 systemd[1]: Started LVM2.
>
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/tmp.
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/swap.
> aug 15 14:09:22 xenpc2 systemd[1]: Found device /dev/raid/var.
>
> But just before that happens, there are some more RAID1 errors:
>
> aug 15 14:09:22 xenpc2 kernel: device-mapper: raid: Failed to read 
> superblock of device at position 1
> aug 15 14:09:22 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2 
> mirrors
> aug 15 14:09:22 xenpc2 kernel: created bitmap (1 pages) for device mdX
> aug 15 14:09:22 xenpc2 kernel: mdX: bitmap initialized from disk: read 
> 1 pages, set 320 of 480 bits
> aug 15 14:09:22 xenpc2 kernel: device-mapper: raid: Failed to read 
> superblock of device at position 1
> aug 15 14:09:22 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2 
> mirrors
> aug 15 14:09:22 xenpc2 kernel: created bitmap (15 pages) for device mdX
> aug 15 14:09:22 xenpc2 kernel: mdX: bitmap initialized from disk: read 
> 1 pages, set 19642 of 30040 bits
>
> Well small wonder if the device isn't there yet. There are no messages 
> for it, but I will assume the mirror LVs came online at the same time 
> as the other "raid" volume group LVs, which means the RAID errors 
> preceded that.
>
> Hence, no secondary mirror volumes available, cannot start the raid, 
> right.
>
> However after logging in, the Cpy%Sync behaviour seems normal:
>
>   boot     msata  rwi-aor--- 
> 240,00m                                    100,00
>   root     msata  rwi-aor--- 14,67g                                    
> 100,00
>
> Devices are shown as:
>
>   boot msata rwi-aor--- 240,00m 100,00           
> boot_rimage_0(0),boot_rimage_1(0)
>   root msata rwi-aor---  14,67g 100,00           
> root_rimage_0(0),root_rimage_1(0)
>
> dmsetup table seems normal:
>
> # dmsetup table | grep msata | sort
> coll-msata--lv: 0 60620800 linear 8:36 2048
> msata-boot: 0 491520 raid raid1 3 0 region_size 1024 2 252:14 252:15 - -
> msata-boot_rimage_0: 0 491520 linear 8:16 4096
> msata-boot_rimage_1: 0 491520 linear 252:12 10240
> msata-boot_rimage_1-missing_0_0: 0 491520 error
> msata-boot_rmeta_0: 0 8192 linear 8:16 495616
> msata-boot_rmeta_1: 0 8192 linear 252:12 2048
> msata-boot_rmeta_1-missing_0_0: 0 8192 error
> msata-root: 0 30760960 raid raid1 3 0 region_size 1024 2 252:0 252:1 - -
> msata-root_rimage_0: 0 30760960 linear 8:16 512000
> msata-root_rimage_1: 0 30760960 linear 252:12 509952
> msata-root_rimage_1-missing_0_0: 0 30760960 error
> msata-root_rmeta_0: 0 8192 linear 8:16 503808
> msata-root_rmeta_1: 0 8192 linear 252:12 501760
> msata-root_rmeta_1-missing_0_0: 0 8192 error
>
> But actually it's not because it should reference 4 devices, not two. 
> Apologies.
>
> It only references the volumes of the first disk (image and meta).
>
> E.g. 252:0 and 252:1 are:
>
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rmeta_0 -> ../dm-0
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rimage_0 -> 
> ../dm-1
>
> Whereas the volumes from the other disk are:
>
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rmeta_1 -> ../dm-3
> lrwxrwxrwx 1 root root       7 aug 15 14:09 msata-root_rimage_1 -> 
> ../dm-5
>
> If I dismount /boot, lvchange -an msata/boot, lvchange -ay msata/boot, 
> it loads correctly:
>
> aug 15 14:56:23 xenpc2 kernel: md/raid1:mdX: active with 1 out of 2 
> mirrors
> aug 15 14:56:23 xenpc2 kernel: created bitmap (1 pages) for device mdX
> aug 15 14:56:23 xenpc2 kernel: mdX: bitmap initialized from disk: read 
> 1 pages, set 320 of 480 bits
> aug 15 14:56:23 xenpc2 kernel: RAID1 conf printout:
> aug 15 14:56:23 xenpc2 kernel:  --- wd:1 rd:2
> aug 15 14:56:23 xenpc2 kernel:  disk 0, wo:0, o:1, dev:dm-15
> aug 15 14:56:23 xenpc2 kernel:  disk 1, wo:1, o:1, dev:dm-19
> aug 15 14:56:23 xenpc2 kernel: RAID1 conf printout:
> aug 15 14:56:23 xenpc2 kernel:  --- wd:1 rd:2
> aug 15 14:56:23 xenpc2 kernel:  disk 0, wo:0, o:1, dev:dm-15
> aug 15 14:56:23 xenpc2 kernel:  disk 1, wo:1, o:1, dev:dm-19
> aug 15 14:56:23 xenpc2 kernel: md: recovery of RAID array mdX
> aug 15 14:56:23 xenpc2 kernel: md: minimum _guaranteed_  speed: 1000 
> KB/sec/disk.
> aug 15 14:56:23 xenpc2 kernel: md: using maximum available idle IO 
> bandwidth (but not more than 200000 KB/sec) for recovery.
> aug 15 14:56:23 xenpc2 kernel: md: using 128k window, over a total of 
> 245760k.
> aug 15 14:56:23 xenpc2 systemd[1]: Starting File System Check on 
> /dev/mapper/msata-boot...
> aug 15 14:56:23 xenpc2 systemd[1]: Started File System Check Daemon to 
> report status.
> aug 15 14:56:23 xenpc2 systemd-fsck[6938]: /dev/mapper/msata-boot: 
> clean, 310/61440 files, 121269/245760 blocks
> aug 15 14:56:23 xenpc2 systemd[1]: Started File System Check on 
> /dev/mapper/msata-boot.
> aug 15 14:56:23 xenpc2 systemd[1]: Mounting /boot...
> aug 15 14:56:23 xenpc2 kernel: EXT4-fs (dm-20): mounting ext2 file 
> system using the ext4 subsystem
> aug 15 14:56:23 xenpc2 kernel: EXT4-fs (dm-20): mounted filesystem 
> without journal. Opts: (null)
> aug 15 14:56:23 xenpc2 systemd[1]: Mounted /boot.
> aug 15 14:56:26 xenpc2 kernel: md: mdX: recovery done.
> aug 15 14:56:26 xenpc2 kernel: RAID1 conf printout:
> aug 15 14:56:26 xenpc2 kernel:  --- wd:2 rd:2
> aug 15 14:56:26 xenpc2 kernel:  disk 0, wo:0, o:1, dev:dm-15
> aug 15 14:56:26 xenpc2 kernel:  disk 1, wo:0, o:1, dev:dm-19
>
>
>
> Maybe this whole thing is just caused by the first disk being 
> partitionless.
>
> msata-boot: 0 491520 raid raid1 3 0 region_size 1024 2 252:14 252:15 
> 252:17 252:19
>
>
> I don't know how LVM is activated under SystemD. This is currently the 
> initial startup:
>
>   dev-mapper-msata\x2droot.device (2.474s)
>   init.scope
>   -.mount
>   -.slice
>   swap.target
>   dm-event.socket
>   system.slice
>   lvm2-lvmpolld.socket
>   systemd-udevd-kernel.socket
>   systemd-initctl.socket
>   systemd-journald-audit.socket
>   lvm2-lvmetad.socket
>   systemd-journald.socket
>   systemd-modules-load.service (199ms)
>   dev-mqueue.mount (66ms)
>   ufw.service (69ms)
>   systemd-fsckd.socket
>   proc-sys-fs-binfmt_misc.automount
>   lvm2.service (3.237s)
>
> I have had to enable the SysV lvm2 service and replace vgchange -aay 
> --sysinit with just vgchange -aay or it wouldn't work.
>
> lvmetad is started later, but without the manual lvm2 activation, my 
> devices just wouldn't get loaded (on multiple systems, ie. when using 
> a PV directly on disk to boot from).
>
> No one else boots directly from PV, so I may be the only one to ever 
> have experienced this.
>
>
>
> But at this point, my mirrors don't work. They do work when not 
> started as the main system. So If I boot from another disk, they work.
>
> At least I think they do.
>
>
> Basically all my LVM volumes are not loaded fast enough before the 
> RAID is getting started.
>
> LVM itself gives no indication of error. lvchange --syncaction check 
> msata/root does not produce any data. It seems it doesn't notice that 
> the RAID hasn't been started.
>
> Again, there is zero output from commands such as lvs -a -o+lv_all and 
> yet this is the output from dmsetup table:
>
> msata-root: 0 30760960 raid raid1 3 0 region_size 1024 2 252:0 252:1 - -
>
>
> So my first question is really: can I restore the RAID array while the 
> system is running? E.g. while root is mounted?
>
> I haven't explored the initramfs yet to see why my LVM volumes are not 
> getting loaded.
>
> Regards.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
