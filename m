Message-ID: <20031202022043.e3vt68s0c8g4g4ck@horde.peino.de>
From: "Jens A. Tkotz" <jens@peino.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] (no subject)
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
Date: Mon Dec  1 19:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hallo,

ich habe mir vermutlich eine meiner Volume Groups zerschossen und hoffe nun,
da=DF noch nicht alles verloren ist.
Ich hab bereits die Mailingliste durchsucht, da auch =E4nlich Probleme gefun=
den,
dennoch komme ich nicht weiter.

Falls ich an die falsche Email-Adresse geschrieben habe, k=F6nnte Sie mir di=
e
Emailadresse geben, die die richtige ist ?

Hier also nun Infos zu meinem Problem. Das Problem ist lvm1.


OS: SuSE 9.0 (nach Update von 8.2)

rudi8:~ # vgscan --help
Logical Volume Manager 1.0.7(mp-v6)

rudi8:~ # vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found active volume group "lvm1"
vgscan -- reading data of volume group "lvm1" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of vol=
ume
group "lvm1" from physical volume(s)
vgscan -- found active volume group "lvm2"
vgscan -- reading data of volume group "lvm2" from physical volume(s)
vgscan -- inserting "lvm2" into lvmtab
vgscan -- backing up volume group "lvm2"
vgscan -- checking volume group name "lvm2"
vgscan -- checking volume group consistency of "lvm2"
vgscan -- checking existence of "/etc/lvmtab.d"
vgscan -- storing volume group data of "lvm2" in "/etc/lvmtab.d/lvm2.tmp"
vgscan -- storing physical volume data of "lvm2" in "/etc/lvmtab.d/lvm2.tmp"
vgscan -- storing logical volume data of volume group "lvm2" in
"/etc/lvmtab.d/lvm2.tmp"
vgscan -- renaming "/etc/lvmtab.d/lvm2.tmp" to "/etc/lvmtab.d/lvm2"
vgscan -- removing special files and directory for volume group "lvm2"
vgscan -- creating directory and group character special file for "lvm2"
vgscan -- creating block device special files for lvm2
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume gro=
ups


rudi8:~ # pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- ACTIVE   PV "/dev/hde1" of VG "lvm2" [149 GB / 96 MB free]
pvscan -- ACTIVE   PV "/dev/hdc1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "lvm1" (run
vgscan)
pvscan -- total: 5 [476.69 GB] / in use: 5 [476.69 GB] / in no VG: 0 [0]

rudi8:~ # lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hdg1   [      28.63 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdh1   [      38.16 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hde1   [     149.04 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdc1   [     111.81 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hda1   [     258.83 MB] Primary  LINUX swap partition [0=
x82]
lvmdiskscan -- /dev/hda2   [          5 GB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/hda3   [       2.61 GB] Primary  LINUX native partition
[0x83]
lvmdiskscan -- /dev/hdb1   [     149.04 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- 6 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 8 partitions
lvmdiskscan -- 5 LVM physical volume partitions


mit freundlichen Gr=FC=DFen,

Jens Tkotz
