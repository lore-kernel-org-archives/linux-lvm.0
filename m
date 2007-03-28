Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2SJuk5S021645
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2007 15:56:46 -0400
Received: from vpn-15-3.rdu.redhat.com (vpn-15-3.rdu.redhat.com [10.11.15.3])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l2SJujME028587
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2007 15:56:45 -0400
Subject: Re: [linux-lvm] LVM2 problem, volume group seems to dissapear
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <000f01c7703b$fd928d90$3200000a@kolno.local>
References: <000f01c7703b$fd928d90$3200000a@kolno.local>
Date: Wed, 28 Mar 2007 15:57:02 -0400
Message-Id: <1175111823.4362.20.camel@linux-cxyg.rtp.netapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2007-03-27 at 08:48 +0200, Maciej S=C5=82ojewski wrote:
> Dear Group,
>=20
> I don't have any idea what happened. Yesterdany after routine power on wh=
ich
> is scheduled for my machine twice a day (power saving), LVM2 volumes were
> not detected by system. For security system all data of critical importan=
ce
> are stored on separate software raid (mdm), managed by LVM2 driver. I won=
der
> how to recover the data.=20
>=20
> What system said during boot up procedure:
>=20
> Fsck.ext3: No such file or directory while trying to open
> /dev/mapper/pv-zasoby1
> /dev/mapper/pv-zasoby1:
> The superblock could not be read or does not describe a correct ext2
> filesystem. If the device is valid and it really contains an ext2 filesys=
tem
> (and not swap or ufs or something else), then the superblock is corrupt, =
and
> you might try running e2fsck with an alternate superblock:
> E2fsck -b 8193 <device>
> (...)
> The same info was displayed about the other pv created volumes.
> (...)
> Fsck died with exit status 8 [fail]
>=20
> * File system check failed
> A log is being saved in /var/log/fsck/checkfs if that location is writabl=
e.
> Please repair the file system manually.
>=20
> Please repair the file system manually
>=20
> * A maintenance shell will now be started.
> CONTROL-D will terminate this shell and resume system boot. Give root
> password for maintenance (or type Control-D to continue)
>=20
>=20
>=20
> Some info about my system:
> maciej@gucek2:~$ sudo lvmdiskscan
> Password:
>     Logging initialised at Mon Mar 26 23:03:53 2007
>=20
>     Set umask to 0077
>     Wiping cache of LVM-capable devices
>   /dev/ram0      [       64,00 MB]
>   /dev/md0       [       74,53 GB] LVM physical volume
>   /dev/evms/hde1 [      101,94 MB]
>   /dev/ram1      [       64,00 MB]
>   /dev/hde1      [      101,94 MB]
>   /dev/evms/hde2 [        1,87 GB]
>   /dev/ram2      [       64,00 MB]
>   /dev/hde2      [        1,87 GB]
>   /dev/evms/hde3 [       24,99 GB]
>   /dev/ram3      [       64,00 MB]
>   /dev/hde3      [       24,99 GB]
>   /dev/evms/hde4 [       28,94 GB]
>   /dev/ram4      [       64,00 MB]
>   /dev/hde4      [       28,94 GB]
>   /dev/ram5      [       64,00 MB]
>   /dev/ram6      [       64,00 MB]
>   /dev/ram7      [       64,00 MB]
>   /dev/ram8      [       64,00 MB]
>   /dev/ram9      [       64,00 MB]
>   /dev/ram10     [       64,00 MB]
>   /dev/ram11     [       64,00 MB]
>   /dev/ram12     [       64,00 MB]
>   /dev/ram13     [       64,00 MB]
>   /dev/ram14     [       64,00 MB]
>   /dev/ram15     [       64,00 MB]
>   0 disks
>   24 partitions
>   0 LVM physical volume whole disks
>   1 LVM physical volume
>     Wiping internal VG cache
>=20
> maciej@gucek2:~$ sudo vgdisplay
>     Logging initialised at Mon Mar 26 23:04:38 2007
>=20
>     Set umask to 0077
>     Finding all volume groups
>     Finding volume group "sys"
>   --- Volume group ---
>   VG Name               sys
>   System ID
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  1
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                0
>   Open LV               0
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               74,53 GB
>   PE Size               4,00 MB
>   Total PE              19079
>   Alloc PE / Size       0 / 0
>   Free  PE / Size       19079 / 74,53 GB
>   VG UUID               l8ADwh-VTnb-qJa1-3Vdg-CX1J-TaSK-kp3nNY
>=20
>     Wiping internal VG cache
>=20
> lvm> version
>   LVM version:     2.02.06 (2006-05-12)
>   Library version: 1.02.07 (2006-05-11)
>   Driver version:  4.6.0
>=20
>=20
> maciej@gucek2:~$ uname -r
> 2.6.17-11-386
>=20
> # /etc/fstab: static file system information.
> #
> # <file system>         <mount point>           <type>         <options>
> <dump>  <pass>
> proc                    /proc                    proc          defaults
> 0       0
> # /dev/hde3 -- converted during upgrade to edgy
> UUID=3Dd6738631-13a8-4593-a89b-b51803d16ee3 / ext3 defaults,errors=3Dremo=
unt-ro
> 0 1
> # /dev/hde1 -- converted during upgrade to edgy
> UUID=3D87fecd19-1110-46b1-be4c-4f8c20370bee /boot ext3 defaults 0 2
> /dev/mapper/pv-boot     /media/mapper_pv-boot    ext3          defaults
> 0       2
> /dev/mapper/pv-home     /media/mapper_pv-home    ext3          defaults
> 0       2
> /dev/mapper/pv-root     /media/mapper_pv-root    ext3          defaults
> 0       2
> /dev/mapper/pv-zasoby1  /media/mapper_pv-zasoby1 ext3          defaults
> 0       2
> /dev/mapper/pv-zasoby2  /media/mapper_pv-zasoby2 ext3          defaults
> 0       2
> # /dev/hde2 -- converted during upgrade to edgy
> UUID=3D2eddb05e-61a2-4639-9cd3-0c4ab948abd3 none swap sw 0 0
> /dev/mapper/pv-swap     none                     swap          sw
> 0       0
> /dev/hda                /media/cdrom0            udf,iso9660   user,noauto
> 0       0
> /dev/hdc                /media/cdrom1            udf,iso9660   user,noauto
> 0       0
>=20
>=20
>=20
> I tried to do vgcfgrestore as I have backup and archive subfolders in
> /etc/lvm:
>=20
> maciej@gucek2:~$ sudo vgcfgrestore -f /etc/lvm/archive/pv_00000.vg -n pv0
> /dev/md0 -t
> Password:
>     Logging initialised at Mon Mar 26 23:20:00 2007
>=20
>     Set umask to 0077
>   Test mode: Metadata will NOT be updated.
>     Wiping cache of LVM-capable devices
>   Couldn't find device with uuid 'z93Y68-sV42-coHo-5RxV-WnC8-UFhj-D490Jn'.
>   Couldn't find all physical volumes for volume group pv.
>   Restore failed.
>     Test mode: Wiping internal cache
>     Wiping internal VG cache
>     Wiping internal VG cache
>=20
>=20
> I've no idea what to do next. Please give detailed clues, if possible.
>=20

I'm guessing that this line:
  Couldn't find device with uuid
'z93Y68-sV42-coHo-5RxV-WnC8-UFhj-D490Jn'.
is your md device for your missing filesystem
volume, /dev/mapper/pv-zasoby1?

Your lvm backups (look for the latest one in /etc/lvm/backup) should
confirm whether this is the case.  If it is, find out why that md device
isn't being created (maybe a disk didn't come up?)
