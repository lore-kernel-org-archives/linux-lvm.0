From: Rene Schumann <rene@athome.dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210041125.25719.rene@athome.dyndns.org>
Subject: [linux-lvm] vgscan cant find my vg
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
Date: Fri Oct  4 04:30:16 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: rene@athome.dyndns.org

Hello!

I have a volumegroup with name vg01 (sda1,sda2) since long time wich hold=
 all=20
my userdata.
Since yesterday my OS cant find this vg anymore.
I remember the last thing was i did add hda9 to vg01.
I did this while installing Mandrake9.0 for testing.
I couldnt find a error from LVM but vgscan fails to find my vg.
Laterly i created a second Volumegroup with name vg (hda9) but vg01 still=
 not=20
working.
I also did a vgcfgrestore of vg01 from a 2 weeks old backup but it change=
s=20
nothing.=20
It would be hard for me if i loose my data.
Can someone please help me?

[root@desktop rene]# pvdata /dev/sda1 | head -n 45
--- Physical volume ---
PV Name               /dev/sda1
VG Name               vg01
PV Size               34.18 GB / NOT usable 4.96 MB [LVM: 158.00 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              8749
Free PE               0
Allocated PE          8749
PV UUID               qb35Q0-7Jd6-4c6X-3hgZ-VSGU-B9cd-uPL3VO

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                5
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                2
Act PV                2
VG Size               74.52 GB
PE Size               4.00 MB
Total PE              19078
Alloc PE / Size       17864 / 69.78 GB
Free  PE / Size       1214 / 4.74 GB
VG UUID               V4Gc4e-80dY-HT04-lZ03-QfI1-X45j-QwSRmn

--- List of logical volumes ---

pvdata -- logical volume "/dev/vg01/usr" at offset   0
pvdata -- logical volume "/dev/vg01/swap" at offset   1
pvdata -- logical volume "/dev/vg01/share" at offset   2
pvdata -- logical volume "/dev/vg01/home" at offset   3
pvdata -- logical volume "/dev/vg01/var" at offset   4
pvdata -- logical volume struct at offset   5 is empty
pvdata -- logical volume struct at offset   6 is empty
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
pvdata -- logical volume struct at offset   9 is empty




[root@desktop rene]# pvdata /dev/sda2 | head -n 45
--- Physical volume ---
PV Name               /dev/sda2
VG Name               vg01
PV Size               40.35 GB / NOT usable 7.45 MB [LVM: 164.00 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                5
PE Size (KByte)       4096
Total PE              10329
Free PE               1214
Allocated PE          9115
PV UUID               lRD1KV-Irwg-2wtl-OwDG-xDv9-WBP0-hhLYjb

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                5
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                2
Act PV                2
VG Size               74.52 GB
PE Size               4.00 MB
Total PE              19078
Alloc PE / Size       17864 / 69.78 GB
Free  PE / Size       1214 / 4.74 GB
VG UUID               V4Gc4e-80dY-HT04-lZ03-QfI1-X45j-QwSRmn

--- List of logical volumes ---

pvdata -- logical volume "/dev/vg01/usr" at offset   0
pvdata -- logical volume "/dev/vg01/swap" at offset   1
pvdata -- logical volume "/dev/vg01/share" at offset   2
pvdata -- logical volume "/dev/vg01/home" at offset   3
pvdata -- logical volume "/dev/vg01/var" at offset   4
pvdata -- logical volume struct at offset   5 is empty
pvdata -- logical volume struct at offset   6 is empty
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
pvdata -- logical volume struct at offset   9 is empty



[root@desktop rene]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/scsi/host0/bus0/target0/lun0/part1"  is assoc=
iated=20
to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/scsi/host0/bus0/target0/lun0/part2"  is assoc=
iated=20
to an unknown VG (run vgscan)
pvscan -- ACTIVE   PV "/dev/ide/host0/bus0/target0/lun0/part9"  of VG "vg=
"  =20
[28.51 GB / 28.51 GB free]
pvscan -- total: 3 [103.05 GB] / in use: 3 [103.05 GB] / in no VG: 0 [0]


[root@desktop rene]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group
