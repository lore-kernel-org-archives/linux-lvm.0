Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l726WV3G027509
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2007 02:32:31 -0400
Received: from mail.berlin.i-dmedia.com (mail.i-dmedia.com [62.159.214.249])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l726WQ8r020501
	for <linux-lvm@redhat.com>; Thu, 2 Aug 2007 02:32:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.berlin.i-dmedia.com (Postfix) with ESMTP id AF3BC49D19D
	for <linux-lvm@redhat.com>; Thu,  2 Aug 2007 08:37:56 +0200 (CEST)
Received: from mail.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (mail.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id nhSe9-V4MagE for <linux-lvm@redhat.com>;
	Thu,  2 Aug 2007 08:37:54 +0200 (CEST)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by mail.berlin.i-dmedia.com (Postfix) with ESMTP id DCF7D49D19C
	for <linux-lvm@redhat.com>; Thu,  2 Aug 2007 08:37:54 +0200 (CEST)
Message-ID: <46B17A68.4070700@idmedia.com>
Date: Thu, 02 Aug 2007 08:32:08 +0200
From: Falko Zurell <falko.zurell@idmedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Can't create snapshot
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello group,

I still have problems creating snapshots on my Ubuntu Linux box. Most of=20
the time, snapshots can't be created with an strange error message. I=20
startet the lvcreate with very verbose output, so you can see all the=20
gory details.

+ /sbin/lvcreate -vvvv --snapshot --size 10G --name daily-snap-opt -v=20
vg0/opt
#lvmcmdline.c:850         Processing: /sbin/lvcreate -vvvv --snapshot=20
--size 10G --name daily-snap-opt -v vg0/opt
#lvmcmdline.c:853         O_DIRECT will be used
#config/config.c:778       Setting global/locking_type to 1
#config/config.c:763       Setting global/locking_dir to /var/lock/lvm
#locking/locking.c:139       File-based locking enabled.
#lvcreate.c:355     Setting chunksize to 16 sectors.
#activate/activate.c:293       Getting target version for snapshot
#ioctl/libdm-iface.c:1566         dm version   O   [16384]
#ioctl/libdm-iface.c:1566         dm versions   O   [16384]
#activate/activate.c:293       Getting target version for snapshot-origin
#ioctl/libdm-iface.c:1566         dm versions   O   [16384]
#config/config.c:778       Setting activation/mirror_region_size to 512
#locking/file_locking.c:164       Locking /var/lock/lvm/V_vg0 WB
#lvcreate.c:494     Finding volume group "vg0"
#device/dev-io.c:389         /dev/ram0: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram0 RW
#device/dev-io.c:134         /dev/ram0: block size is 1024 bytes
#label/label.c:180       /dev/ram0: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram0
#filters/filter-sysfs.c:251         /dev/loop0: Skipping (sysfs)
#filters/filter-regex.c:185         /dev/cdrom: Skipping (regex)
#device/dev-io.c:439         Opened /dev/cciss/c0d0 RO
#device/dev-io.c:264       /dev/cciss/c0d0: size is 3906830384 sectors
#device/dev-io.c:341         WARNING: /dev/cciss/c0d0 already opened=20
read-only
#device/dev-io.c:515         /dev/cciss/c0d0: Immediate close attempt=20
while still referenced
#device/dev-io.c:485         Closed /dev/cciss/c0d0
#device/dev-io.c:439         Opened /dev/cciss/c0d0 RW O_DIRECT
#device/dev-io.c:134         /dev/cciss/c0d0: block size is 4096 bytes
#filters/filter.c:112         /dev/cciss/c0d0: Skipping: Partition table=20
signature found
#device/dev-io.c:485         Closed /dev/cciss/c0d0
#device/dev-io.c:439         Opened /dev/vg0/root RW O_DIRECT
#device/dev-io.c:134         /dev/vg0/root: block size is 512 bytes
#label/label.c:180       /dev/vg0/root: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/vg0/root
#device/dev-io.c:389         /dev/ram1: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram1 RW
#device/dev-io.c:134         /dev/ram1: block size is 1024 bytes
#label/label.c:180       /dev/ram1: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram1
#device/dev-io.c:439         Opened /dev/cciss/c0d0p1 RW O_DIRECT
#device/dev-io.c:134         /dev/cciss/c0d0p1: block size is 1024 bytes
#label/label.c:180       /dev/cciss/c0d0p1: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/cciss/c0d0p1
#device/dev-io.c:389         /dev/ram2: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram2 RW
#device/dev-io.c:134         /dev/ram2: block size is 1024 bytes
#label/label.c:180       /dev/ram2: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram2
#device/dev-io.c:439         Opened /dev/cciss/c0d0p2 RW O_DIRECT
#device/dev-io.c:134         /dev/cciss/c0d0p2: block size is 4096 bytes
#label/label.c:180       /dev/cciss/c0d0p2: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/cciss/c0d0p2
#device/dev-io.c:439         Opened /dev/vg0/home RW O_DIRECT
#device/dev-io.c:134         /dev/vg0/home: block size is 512 bytes
#label/label.c:180       /dev/vg0/home: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/vg0/home
#device/dev-io.c:389         /dev/ram3: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram3 RW
#device/dev-io.c:134         /dev/ram3: block size is 1024 bytes
#label/label.c:180       /dev/ram3: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram3
#device/dev-io.c:439         Opened /dev/cciss/c0d0p3 RW O_DIRECT
#device/dev-io.c:134         /dev/cciss/c0d0p3: block size is 512 bytes
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#cache/lvmcache.c:651         lvmcache: /dev/cciss/c0d0p3: now orphaned
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 31232 size 1790 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#cache/lvmcache.c:651         lvmcache: /dev/cciss/c0d0p3: now in VG vg0
#cache/lvmcache.c:465         lvmcache: /dev/cciss/c0d0p3: setting vg0=20
VGID to Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBo
#cache/lvmcache.c:686         lvmcache: /dev/cciss/c0d0p3: VG vg0: Set=20
creation host to konrad.
#device/dev-io.c:439         Opened /dev/vg0/opt RW O_DIRECT
#device/dev-io.c:134         /dev/vg0/opt: block size is 512 bytes
#label/label.c:180       /dev/vg0/opt: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/vg0/opt
#device/dev-io.c:389         /dev/ram4: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram4 RW
#device/dev-io.c:134         /dev/ram4: block size is 1024 bytes
#label/label.c:180       /dev/ram4: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram4
#device/dev-io.c:389         /dev/ram5: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram5 RW
#device/dev-io.c:134         /dev/ram5: block size is 1024 bytes
#label/label.c:180       /dev/ram5: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram5
#device/dev-io.c:389         /dev/ram6: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram6 RW
#device/dev-io.c:134         /dev/ram6: block size is 1024 bytes
#label/label.c:180       /dev/ram6: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram6
#device/dev-io.c:389         /dev/ram7: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram7 RW
#device/dev-io.c:134         /dev/ram7: block size is 1024 bytes
#label/label.c:180       /dev/ram7: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram7
#device/dev-io.c:389         /dev/ram8: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram8 RW
#device/dev-io.c:134         /dev/ram8: block size is 1024 bytes
#label/label.c:180       /dev/ram8: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram8
#device/dev-io.c:389         /dev/ram9: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram9 RW
#device/dev-io.c:134         /dev/ram9: block size is 1024 bytes
#label/label.c:180       /dev/ram9: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram9
#device/dev-io.c:389         /dev/ram10: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram10 RW
#device/dev-io.c:134         /dev/ram10: block size is 1024 bytes
#label/label.c:180       /dev/ram10: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram10
#device/dev-io.c:439         Opened /dev/mapper/vg0-home-real RW O_DIRECT
#device/dev-io.c:134         /dev/mapper/vg0-home-real: block size is=20
4096 bytes
#label/label.c:180       /dev/mapper/vg0-home-real: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/mapper/vg0-home-real
#device/dev-io.c:389         /dev/ram11: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram11 RW
#device/dev-io.c:134         /dev/ram11: block size is 1024 bytes
#label/label.c:180       /dev/ram11: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram11
#device/dev-io.c:439         Opened=20
/dev/mapper/vg0-daily--snap--home-cow RW O_DIRECT
#device/dev-io.c:134         /dev/mapper/vg0-daily--snap--home-cow:=20
block size is 4096 bytes
#label/label.c:180       /dev/mapper/vg0-daily--snap--home-cow: No label=20
detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/mapper/vg0-daily--snap--home-cow
#device/dev-io.c:389         /dev/ram12: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram12 RW
#device/dev-io.c:134         /dev/ram12: block size is 1024 bytes
#label/label.c:180       /dev/ram12: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram12
#device/dev-io.c:439         Opened /dev/vg0/daily-snap-home RW O_DIRECT
#device/dev-io.c:134         /dev/vg0/daily-snap-home: block size is 512=20
bytes
#label/label.c:180       /dev/vg0/daily-snap-home: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/vg0/daily-snap-home
#device/dev-io.c:389         /dev/ram13: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram13 RW
#device/dev-io.c:134         /dev/ram13: block size is 1024 bytes
#label/label.c:180       /dev/ram13: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram13
#device/dev-io.c:389         /dev/ram14: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram14 RW
#device/dev-io.c:134         /dev/ram14: block size is 1024 bytes
#label/label.c:180       /dev/ram14: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram14
#device/dev-io.c:389         /dev/ram15: Not using O_DIRECT
#device/dev-io.c:439         Opened /dev/ram15 RW
#device/dev-io.c:134         /dev/ram15: block size is 1024 bytes
#label/label.c:180       /dev/ram15: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:485         Closed /dev/ram15
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 31232 size 1790 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 31232 size 1790 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#format_text/format-text.c:323         Read vg0 metadata (337) from=20
/dev/cciss/c0d0p3 at 31232 size 1790
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 0:      0   2560:=20
root(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 1:   2560  25600:=20
home(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 2:  28160  25600:=20
opt(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 3:  53760 209920:=20
NULL(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 4: 263680   2560:=20
daily-snap-home(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 5: 266240 208736:=20
NULL(0:0)
#format_text/archiver.c:129     Archiving volume group "vg0" metadata=20
(seqno 337).
#metadata/lv_manip.c:1279     Creating logical volume daily-snap-opt
#metadata/pv_map.c:46         Allowing allocation on /dev/cciss/c0d0p3=20
start PE 53760 length 209920
#metadata/pv_map.c:46         Allowing allocation on /dev/cciss/c0d0p3=20
start PE 266240 length 208736
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 0:      0   2560:=20
root(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 1:   2560  25600:=20
home(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 2:  28160  25600:=20
opt(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 3:  53760   2560:=20
daily-snap-opt(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 4:  56320 207360:=20
NULL(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 5: 263680   2560:=20
daily-snap-home(0:0)
#metadata/pv_manip.c:241         /dev/cciss/c0d0p3 6: 266240 208736:=20
NULL(0:0)
#format_text/format-text.c:417         Writing vg0 metadata to=20
/dev/cciss/c0d0p3 at 33280 len 2035
#format_text/format-text.c:519         Pre-Committing vg0 metadata (338)=20
to /dev/cciss/c0d0p3 header at 4096
#format_text/archiver.c:364     Creating volume group backup=20
"/etc/lvm/backup/vg0" (seqno 338).
#format_text/format-text.c:714         Writing vg0 metadata to=20
/etc/lvm/backup/.lvm_konrad_21005_2140062144
#format_text/format-text.c:758         Committing vg0 metadata (338)
#format_text/format-text.c:759         Renaming /etc/lvm/backup/vg0.tmp=20
to /etc/lvm/backup/vg0
#format_text/format-text.c:519         Committing vg0 metadata (338) to=20
/dev/cciss/c0d0p3 header at 4096
#locking/file_locking.c:247         Locking LV=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C (R)
#metadata/metadata.c:1202       Finding volume group for uuid=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 33280 size 2035 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 33280 size 2035 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#format_text/format-text.c:323         Read vg0 metadata (338) from=20
/dev/cciss/c0d0p3 at 33280 size 2035
#metadata/metadata.c:1208     Found volume group "vg0"
#activate/activate.c:370         Getting device info for=20
vg0-daily--snap--opt
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C N=20
  [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C N   [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt  N   [16384]
#mm/memlock.c:99       Locking memory
#mm/memlock.c:130         memlock_count inc to 1
#config/config.c:763       Setting activation/missing_stripe_filler to=20
/dev/ioerror
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C O=20
  [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C O   [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt  O   [16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt-real=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-real]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-real=20
O   [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-real O=20
   [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt-real  O=20
  [16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt-cow=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-cow]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-cow=20
O   [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-cow O=20
  [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt-cow  O=20
[16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt_mlog=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-_mlog]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-_mlog =

O   [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-_mlog O=20
   [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt_mlog  O=20
  [16384]
#activate/activate.c:293       Getting target version for linear
#ioctl/libdm-iface.c:1566         dm versions   O   [16384]
#activate/activate.c:293       Getting target version for striped
#ioctl/libdm-iface.c:1566         dm versions   O   [16384]
#libdm-deptree.c:1167     Creating vg0-daily--snap--opt
#ioctl/libdm-iface.c:1566         dm create vg0-daily--snap--opt=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C N=20
  [16384]
#libdm-deptree.c:1447     Loading vg0-daily--snap--opt table
#libdm-deptree.c:1398         Adding target: 0 20971520 linear 104:3=20
440402304
#ioctl/libdm-iface.c:1566         dm table   (254:1) O   [16384]
#ioctl/libdm-iface.c:1566         dm reload   (254:1) N   [16384]
#libdm-deptree.c:900     Resuming vg0-daily--snap--opt (254:1)
#ioctl/libdm-iface.c:1566         dm resume   (254:1) N   [16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C O=20
  [16384]
#ioctl/libdm-iface.c:1566         dm deps   (254:1) O   [16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt-real=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-real]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-real=20
O   [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-real O=20
   [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt-real  O=20
  [16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt-cow=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-cow]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-cow=20
O   [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-cow O=20
  [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt-cow  O=20
[16384]
#activate/dev_manager.c:589         Getting device info for=20
vg0-daily--snap--opt_mlog=20
[LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-_mlog]
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-_mlog =

O   [16384]
#ioctl/libdm-iface.c:1566         dm info=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C-_mlog O=20
   [16384]
#ioctl/libdm-iface.c:1566         dm info vg0-daily--snap--opt_mlog  O=20
  [16384]
#mm/memlock.c:118       Unlocking memory
#mm/memlock.c:137         memlock_count dec to 0
#activate/fs.c:172       Linking /dev/vg0/daily-snap-opt..tmp ->=20
/dev/mapper/vg0-daily--snap--opt
#activate/fs.c:185       Installing symlink /dev/vg0/daily-snap-opt..tmp=20
as /dev/vg0/daily-snap-opt
#activate/activate.c:863         <backtrace>
#toollib.c:1144     Clearing start of logical volume "daily-snap-opt"
#device/dev-cache.c:225         /dev/vg0/daily-snap-opt: Added to device=20
cache
#device/dev-io.c:439         Opened /dev/vg0/daily-snap-opt RW O_DIRECT
#device/dev-io.c:623         Wiping /dev/vg0/daily-snap-opt at sector 0=20
length 8 sectors
#device/dev-io.c:134         /dev/vg0/daily-snap-opt: block size is 4096=20
bytes
#device/dev-io.c:485         Closed /dev/vg0/daily-snap-opt
#locking/file_locking.c:242         Locking LV=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C (NL)
#metadata/metadata.c:1202       Finding volume group for uuid=20
Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 33280 size 2035 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#label/label.c:158       /dev/cciss/c0d0p3: lvm2 label detected
#format_text/format-text.c:954         /dev/cciss/c0d0p3: Found metadata=20
at 33280 size 2035 for vg0 (Lw0OiY-teNf-jRuy-Ck2s-mqv7-A4BL-8EIzBo)
#format_text/format-text.c:323         Read vg0 metadata (338) from=20
/dev/cciss/c0d0p3 at 33280 size 2035
#metadata/metadata.c:1208     Found volume group "vg0"
#activate/activate.c:370         Getting device info for=20
vg0-daily--snap--opt
#ioctl/libdm-iface.c:1566         dm info=20
LVM-Lw0OiYteNfjRuyCk2smqv7A4BL8EIzBotGlkGIQrbNTODCMAHKFxb5si5SAfIn0C O=20
  [16384]
#activate/activate.c:762   LV vg0/daily-snap-opt in use: not deactivating
#lvcreate.c:772   Couldn't deactivate new snapshot.
#lvcreate.c:834         <backtrace>
#locking/file_locking.c:59       Unlocking /var/lock/lvm/V_vg0
#device/dev-io.c:485         Closed /dev/cciss/c0d0p3


I don't have an idea why "deactivating" of the snapshot wont work and=20
what this for.

I'm using Kernel 2.6.20-16-server

dmsetup -v version
Library version:   1.02.08 (2006-07-17)
Driver version:    4.11.0



Any hints?

thanks in advance

--=20

Falko Zurell
Head of Application Management



/i-d media AG
Ohlauer Stra=EF=BF=BDe 43
D-10999 Berlin

Tel +49 (0)30 - 2 59 47 - 357
Fax +49 (0)30 - 2 59 47 - 471
www.idmedia.com

_______________________________________________

Board: Regine Haschka-Helmer (CEO), Franz Klose (CFO)
Chairman of the Supervisory Board: Christian A. Hufnagl
Headquarters: Berlin, Place of Jurisdiction: Berlin HRB 76342
UST-Id. DE812698340
_______________________________________________


This message may contain confidential information and must not be=20
copied, disclosed or used by anybody other than the intended recipient.=20
If you have received this message in error, please notify us immediately=20
by reply e-mail and delete all records of the message from your=20
computer. The views represented in this message are solely those of the=20
author. Neither the author nor I-D Media AG accepts any liability for=20
the contents of this message.
