From: "Glenn Shannon" <warl0k@lvcm.com>
Message-ID: <000001c24d67$78d30220$3200a8c0@warl0k>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Cannot create an lvm.
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
Date: Mon Aug 26 20:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all.

I am having a problem creating a new LVM on my system.

I currently have one on there, and am trying to replace it with a
bigger set of drives.

It is failing when I go to lvcreate a logical volume.

Vgdisplay reports:

root@warlock:~# vgdisplay
- --- Volume group ---
VG Name               filebase
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               110.05 GB
PE Size               4 MB
Total PE              28172
Alloc PE / Size       28172 / 110.05 GB
Free  PE / Size       0 / 0
VG UUID               MIDbTY-fCGM-o42J-KyGD-upKl-1q6P-S5IrQY

- --- Volume group ---
VG Name               mass
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               95.41 GB
PE Size               4 MB
Total PE              24426
Alloc PE / Size       0 / 0
Free  PE / Size       24426 / 95.41 GB
VG UUID               NxrOxe-GXEF-Cslo-D3NH-oXBg-mlxu-jsqdMo

Where filebase is the active LVM, and mass is the new disk in the new
LVM.

The results of the lvcreate command:

root@warlock:~# lvcreate -l24426 mass -n storage
lvcreate -- can't create logical volume: volume group "mass" isn't
active

Any ideas?
Yes, I already did a vgscan;vgchange =96a y
It says mass is already active (along with filebase)

Looking forward to a fresh perspective on this ?

Current system specs:

root@warlock:~# uname -a
Linux warlock 2.4.19 #3 Mon Aug 26 17:19:37 MST 2002 i686 unknown

root@warlock:~# vgdisplay
- --- Volume group ---
VG Name               filebase
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               110.05 GB
PE Size               4 MB
Total PE              28172
Alloc PE / Size       28172 / 110.05 GB
Free  PE / Size       0 / 0
VG UUID               MIDbTY-fCGM-o42J-KyGD-upKl-1q6P-S5IrQY

- --- Volume group ---
VG Name               mass
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               95.41 GB
PE Size               4 MB
Total PE              24426
Alloc PE / Size       0 / 0
Free  PE / Size       24426 / 95.41 GB
VG UUID               NxrOxe-GXEF-Cslo-D3NH-oXBg-mlxu-jsqdMo


root@warlock:~# vgdisplay --version
vgdisplay: Logical Volume Manager 1.1-rc2
Heinz Mauelshagen, Sistina Software  23/04/2002 (IOP 10)

root@warlock:~#

root@warlock:~# dmesg|grep LVM
LVM version 1.1-rc2(23/04/2002)
root@warlock:~#



-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 7.0.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBPWrTEqhwBN5wZKACEQL6lACfRRFik6icPXEplLYTlCalkeVKGjUAn0xq
sCVTctvjaAOO1Ybo+9GAgYaU
=3Da8qa
-----END PGP SIGNATURE-----
