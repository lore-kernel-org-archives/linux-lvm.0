Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2R6nPNT012791
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2007 02:49:25 -0400
Received: from smtp7k.poczta.onet.pl (smtp7k.poczta.onet.pl [213.180.130.85])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2R6nMIk020520
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2007 02:49:23 -0400
From: =?iso-8859-2?Q?Maciej_S=B3ojewski?= <mslonik@poczta.onet.pl>
Date: Tue, 27 Mar 2007 08:48:45 +0200
Message-ID: <000f01c7703b$fd928d90$3200000a@kolno.local>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <46086CAD.2030402@ce.jp.nec.com>
Subject: [linux-lvm] LVM2 problem, volume group seems to dissapear
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
Content-Type: text/plain; charset="iso-8859-1"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Dear Group,

I don't have any idea what happened. Yesterdany after routine power on which
is scheduled for my machine twice a day (power saving), LVM2 volumes were
not detected by system. For security system all data of critical importance
are stored on separate software raid (mdm), managed by LVM2 driver. I wonder
how to recover the data.=20

What system said during boot up procedure:

Fsck.ext3: No such file or directory while trying to open
/dev/mapper/pv-zasoby1
/dev/mapper/pv-zasoby1:
The superblock could not be read or does not describe a correct ext2
filesystem. If the device is valid and it really contains an ext2 filesystem
(and not swap or ufs or something else), then the superblock is corrupt, and
you might try running e2fsck with an alternate superblock:
E2fsck -b 8193 <device>
(...)
The same info was displayed about the other pv created volumes.
(...)
Fsck died with exit status 8 [fail]

* File system check failed
A log is being saved in /var/log/fsck/checkfs if that location is writable.
Please repair the file system manually.

Please repair the file system manually

* A maintenance shell will now be started.
CONTROL-D will terminate this shell and resume system boot. Give root
password for maintenance (or type Control-D to continue)



Some info about my system:
maciej@gucek2:~$ sudo lvmdiskscan
Password:
    Logging initialised at Mon Mar 26 23:03:53 2007

    Set umask to 0077
    Wiping cache of LVM-capable devices
  /dev/ram0      [       64,00 MB]
  /dev/md0       [       74,53 GB] LVM physical volume
  /dev/evms/hde1 [      101,94 MB]
  /dev/ram1      [       64,00 MB]
  /dev/hde1      [      101,94 MB]
  /dev/evms/hde2 [        1,87 GB]
  /dev/ram2      [       64,00 MB]
  /dev/hde2      [        1,87 GB]
  /dev/evms/hde3 [       24,99 GB]
  /dev/ram3      [       64,00 MB]
  /dev/hde3      [       24,99 GB]
  /dev/evms/hde4 [       28,94 GB]
  /dev/ram4      [       64,00 MB]
  /dev/hde4      [       28,94 GB]
  /dev/ram5      [       64,00 MB]
  /dev/ram6      [       64,00 MB]
  /dev/ram7      [       64,00 MB]
  /dev/ram8      [       64,00 MB]
  /dev/ram9      [       64,00 MB]
  /dev/ram10     [       64,00 MB]
  /dev/ram11     [       64,00 MB]
  /dev/ram12     [       64,00 MB]
  /dev/ram13     [       64,00 MB]
  /dev/ram14     [       64,00 MB]
  /dev/ram15     [       64,00 MB]
  0 disks
  24 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume
    Wiping internal VG cache

maciej@gucek2:~$ sudo vgdisplay
    Logging initialised at Mon Mar 26 23:04:38 2007

    Set umask to 0077
    Finding all volume groups
    Finding volume group "sys"
  --- Volume group ---
  VG Name               sys
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               74,53 GB
  PE Size               4,00 MB
  Total PE              19079
  Alloc PE / Size       0 / 0
  Free  PE / Size       19079 / 74,53 GB
  VG UUID               l8ADwh-VTnb-qJa1-3Vdg-CX1J-TaSK-kp3nNY

    Wiping internal VG cache

lvm> version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.6.0


maciej@gucek2:~$ uname -r
2.6.17-11-386

# /etc/fstab: static file system information.
#
# <file system>         <mount point>           <type>         <options>
<dump>  <pass>
proc                    /proc                    proc          defaults
0       0
# /dev/hde3 -- converted during upgrade to edgy
UUID=3Dd6738631-13a8-4593-a89b-b51803d16ee3 / ext3 defaults,errors=3Dremoun=
t-ro
0 1
# /dev/hde1 -- converted during upgrade to edgy
UUID=3D87fecd19-1110-46b1-be4c-4f8c20370bee /boot ext3 defaults 0 2
/dev/mapper/pv-boot     /media/mapper_pv-boot    ext3          defaults
0       2
/dev/mapper/pv-home     /media/mapper_pv-home    ext3          defaults
0       2
/dev/mapper/pv-root     /media/mapper_pv-root    ext3          defaults
0       2
/dev/mapper/pv-zasoby1  /media/mapper_pv-zasoby1 ext3          defaults
0       2
/dev/mapper/pv-zasoby2  /media/mapper_pv-zasoby2 ext3          defaults
0       2
# /dev/hde2 -- converted during upgrade to edgy
UUID=3D2eddb05e-61a2-4639-9cd3-0c4ab948abd3 none swap sw 0 0
/dev/mapper/pv-swap     none                     swap          sw
0       0
/dev/hda                /media/cdrom0            udf,iso9660   user,noauto
0       0
/dev/hdc                /media/cdrom1            udf,iso9660   user,noauto
0       0



I tried to do vgcfgrestore as I have backup and archive subfolders in
/etc/lvm:

maciej@gucek2:~$ sudo vgcfgrestore -f /etc/lvm/archive/pv_00000.vg -n pv0
/dev/md0 -t
Password:
    Logging initialised at Mon Mar 26 23:20:00 2007

    Set umask to 0077
  Test mode: Metadata will NOT be updated.
    Wiping cache of LVM-capable devices
  Couldn't find device with uuid 'z93Y68-sV42-coHo-5RxV-WnC8-UFhj-D490Jn'.
  Couldn't find all physical volumes for volume group pv.
  Restore failed.
    Test mode: Wiping internal cache
    Wiping internal VG cache
    Wiping internal VG cache


I've no idea what to do next. Please give detailed clues, if possible.

Kind regards,
Maciej S=EF=BF=BDojewski (mslonik)
