Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5ODmm008073
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 09:48:48 -0400
Received: from smtp.sys.beep.pl (exim@smtp.sys.beep.pl [195.245.198.13])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5ODmeXn007386
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 09:48:41 -0400
Received: from [156.17.236.105] (helo=[192.168.2.2] ident=arekm-m1)
	by maja.beep.pl with asmtp (TLSv1:RC4-MD5:128) (Exim 4.34)
	id 1BdUZy-0002dx-Vh
	for linux-lvm@redhat.com; Thu, 24 Jun 2004 15:47:59 +0200
From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Date: Thu, 24 Jun 2004 15:48:25 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200406241548.26342.arekm@pld-linux.org>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] rootfs on lvm2 and vgchange: Can't deactivate volume
	group "vg_sys" with 4 open logical volume(s)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi,

I'm using kernel 2.6.7 with lvm2:
[root@anduril /root]# lvm version
  LVM version:     2.00.17 (2004-06-20)
  Library version: 1.00.17-ioctl (2004-04-19)
  Driver version:  4.1.0

[root@anduril /root]# lvdisplay -C
  LV      VG     Attr   LSize  Origin Snap%  Move Copy%
  lv_home vg_sys -wi-ao 25.00G
  lv_root vg_sys -wi-ao  3.00G
  lv_tmp  vg_sys -wi-ao  2.00G
  lv_var  vg_sys -wi-ao 15.00G

root filesystem is on LVM (on lv_root) so I'm starting lvm from initrd:
LVM_SYSTEM_DIR=3D/tmp lvm vgscan --ignorelockingfailure
LVM_SYSTEM_DIR=3D/tmp lvm vgchange --ignorelockingfailure -a y vg_sys
it works fine.

Then when my initrscripts run vgscan && vgchange -a y to activate potential=
=20
other vgs it complains:
Can't deactivate volume group "vg_sys" with 4 open logical volume(s)

I have no idea why it want's deactivate it if the command is ,,-a y'' so th=
e=20
task it to activate it. Reasonable would be: if active then do not touch.

[root@anduril /root]# vgchange -ay vg_sys
  Can't deactivate volume group "vg_sys" with 4 open logical volume(s)
[root@anduril /root]# lvchange -a y vg_sys/lv_tmp
[root@anduril /root]# lvchange -a y vg_sys/lv_home
[root@anduril /root]# lvchange -a y vg_sys/lv_var
[root@anduril /root]# lvchange -a y vg_sys/lv_root

vgchange -ay with verbose below.

(tested cvs version of lvm2 from today, too - same results)

      Setting log/indent to 1
      Setting log/prefix to
      Setting log/command_names to 0
      Setting global/test to 0
      Setting log/overwrite to 0
      log/activation not found in config: defaulting to 0
    Logging initialised at Thu Jun 24 15:33:55 2004

      Setting global/umask to 63
    Set umask to 0077
      Setting devices/dir to /dev
      Setting global/proc to /proc
      Setting global/activation to 1
      global/suffix not found in config: defaulting to 1
      global/units not found in config: defaulting to h
        Matcher built with 3 dfa states
      Setting devices/cache to /etc/lvm/.cache
      Setting devices/write_cache_state to 1
        Opened /etc/lvm/.cache
        Closed /etc/lvm/.cache
        /dev/md5: Added to device cache
        /dev/md10: Added to device cache
        /dev/md6: Added to device cache
        /dev/md11: Added to device cache
        /dev/md13: Added to device cache
        /dev/md14: Added to device cache
        /dev/md12: Added to device cache
        /dev/md3: Added to device cache
        /dev/md4: Added to device cache
        /dev/md7: Added to device cache
        /dev/md2: Added to device cache
        /dev/md8: Added to device cache
        /dev/md9: Added to device cache
        /dev/md0: Added to device cache
        /dev/md15: Added to device cache
        /dev/md1: Added to device cache
        /dev/sda3: Added to device cache
     Loaded persistent filter cache from /etc/lvm/.cache
      Setting activation/reserved_stack to 256
      Setting activation/reserved_memory to 8192
      Setting activation/process_priority to -18
      global/format not found in config: defaulting to lvm2
      Setting backup/retain_days to 30
      Setting backup/retain_min to 10
      Setting backup/archive_dir to /etc/lvm/archive
      Setting backup/backup_dir to /etc/lvm/backup
      global/fallback_to_lvm1 not found in config: defaulting to 0
        Processing: vgchange -ay
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all volume groups
        Opened /dev/md0
      /dev/md0: lvm2 label detected
        Closed /dev/md0
        Opened /dev/md0
        Closed /dev/md0
        Opened /dev/md1
      /dev/md1: No label detected
        Closed /dev/md1
        Opened /dev/md2
        /dev/md2: Failed to read label area
        Closed /dev/md2
        Opened /dev/sda3
      /dev/sda3: No label detected
        Closed /dev/sda3
        Opened /dev/md3
        /dev/md3: Failed to read label area
        Closed /dev/md3
        Opened /dev/md4
        /dev/md4: Failed to read label area
        Closed /dev/md4
        Opened /dev/md5
        Closed /dev/md5
        Opened /dev/md6
        /dev/md6: Failed to read label area
        Closed /dev/md6
        Opened /dev/md7
        /dev/md7: Failed to read label area
        Closed /dev/md7
        Opened /dev/md8
        /dev/md8: Failed to read label area
        Closed /dev/md8
        Opened /dev/md9
        /dev/md9: Failed to read label area
        Closed /dev/md9
        Opened /dev/md10
        /dev/md10: Failed to read label area
        Closed /dev/md10
        Opened /dev/md11
        /dev/md11: Failed to read label area
        Closed /dev/md11
        Opened /dev/md12
        /dev/md12: Failed to read label area
        Closed /dev/md12
        Opened /dev/md13
        /dev/md13: Failed to read label area
        Closed /dev/md13
        Opened /dev/md14
        /dev/md14: Failed to read label area
        Closed /dev/md14
        Opened /dev/md15
        /dev/md15: Failed to read label area
        Closed /dev/md15
        Opened /dev/sdb3
      /dev/sdb3: No label detected
        Closed /dev/sdb3
      Locking /var/lock/lvm/V_vg_sys RB
    Finding volume group "vg_sys"
       Opened /dev/md0
      /dev/md0: lvm2 label detected
        Read vg_sys metadata (8) from /dev/md0 at 12800 size 1526
      Setting activation/missing_stripe_ filler to /dev/ioerror
        Getting device info for vg_sys-lv_root
        dm version
        dm info =20
7b2WBEINyPBBRuKukOXhSWueVI3JB5e4FwgXeHy0sAYxJflPHN9DvBjabZxkYffR
        Getting device info for vg_sys-lv_tmp
        dm info =20
7b2WBEINyPBBRuKukOXhSWueVI3JB5e4bqO2jZql5IkzuwrXfs0D6HC6Z7NbYW72
        Getting device info for vg_sys-lv_var
        dm info =20
7b2WBEINyPBBRuKukOXhSWueVI3JB5e4DKzs8YXx6YeA32MhS1p7wQlTkv7VvJMV
        Getting device info for vg_sys-lv_home
        dm info =20
7b2WBEINyPBBRuKukOXhSWueVI3JB5e4UqLQ7XDesIb6t7u5wJNVx9c9VScs83Lx
      Unlocking /var/lock/lvm/V_vg_sys
        Closed /dev/md0
      Dumping persistent device cache to /etc/lvm/.cache


--=20
Arkadiusz Mi=EF=BF=BDkiewicz     CS at FoE, Wroclaw University of Technology
arekm.pld-linux.org, 1024/3DB19BBD, JID: arekm.jabber.org, PLD/Linux
