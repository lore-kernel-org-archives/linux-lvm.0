Return-Path: <fzzgrr@gmx.net>
Date: Tue, 21 Aug 2001 00:43:15 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20010821004315.B5358@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgcfgbackup
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,
looking for a solution in the mailinglist-archive I found something, so
I reinstalled an older lvm-version:
~ $ dpkg --list | grep lvm
ii  lvm-common     1.2            The Logical Volume Manager for Linux
ii  lvm10          0.9.1-final-1  The Logical Volume Manager for Linux

I did a=20
home:# vgcfgrestore -l -n vg01
--- Volume group ---
VG Name               vg01
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                5
Act PV                5
VG Size               49.15 GB
PE Size               4 MB
Total PE              12583
Alloc PE / Size       12583 / 49.15 GB
Free  PE / Size       0 / 0
VG UUID               p8KJS0-eei7-s10H-61hT-7uJS-Euiq-bXhlNs

And restored the vg01 using "vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01=
 /dev/XXX"
for every pv I use, output is like
home:# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/hda2
vgcfgrestore -- VGDA for "vg01" successfully restored to physical volume
"/dev/hda2"
vgcfgrestore -- you may not have an actual backup of restored volume
group "vg01"

What should I do now?
vgchange still won=B4t find a volume group, vgcfgbackup show this:
home:# vgcfgbackup -v vg01
vgcfgbackup -- using volume group(s) on command line
vgcfgbackup -- locking logical volume manager
vgcfgbackup -- checking volume group name "vg01"
vgcfgbackup -- checking existence of volume group "vg01"
vgcfgbackup -- ERROR: volume group "vg01" has an invalid number of
physical volumes
vgcfgbackup -- ERROR "vg_cfgbackup(): vg_check_exist" backing up volume
group vg01

and:
home:# pvscan         =20
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1" of VG "vg01" [8.51 GB / 0 free]
pvscan -- inactive PV "/dev/sdc1" of VG "vg01" [4.23 GB / 0 free]
pvscan -- inactive PV "/dev/hda2" of VG "vg01" [19.1 GB / 0 free]
pvscan -- inactive PV "/dev/hdb1" of VG "vg01" [7.87 GB / 0 free]
pvscan -- inactive PV "/dev/hdd1" of VG "vg01" [9.44 GB / 0 free]
pvscan -- total: 5 [49.17 GB] / in use: 5 [49.17 GB] / in no VG: 0 [0]

How can I continue?
Thanks for your hints.

Uli


P.S.: I haven=B4t written the last email to this list because I need an inf=
ormation about the meaning
of unstable.

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
