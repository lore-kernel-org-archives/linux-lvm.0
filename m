Message-ID: <OF7F8BBE56.E90222AB-ONC1256D69.005BFA8E-C1256D69.0078AB48@falkonline.nu>
From: patrik@falkonline.nu
MIME-Version: 1.0
Subject: [linux-lvm] ERROR: no physical volumes usable to extend volume group "movies"
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
Date: Sun Jul 20 16:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com




Hey!

I have a problem that I hope you could help me with.
To make a long story short, I have installed a brand new linux (mandrake)
system and got my old Volume up and running. It works very well, except for
one thing. When I try to extend my vg with a new harddrive it says
following:

vgextend -v movies /dev/sda
vgextend -- locking logical volume manager
vgextend -- checking volume group name "movies"
vgextend -- checking volume group "movies" existence
vgextend -- checking for inactivity of volume group
vgextend -- reading data of volume group "movies" from lvmtab
vgextend -- INFO: maximum logical volume size is 2 Terabyte
vgextend -- reading data for all physical volumes from disk(s)
vgextend -- extending VGDA structures of volume group "movies"
vgextend -- ERROR: no physical volumes usable to extend volume group
"movies"

I cant locate the problem, everything looks allright but there is maybe
something I am missing?
I am trying to extend the volume group by two discs as you can see from my
cut n paste from a pvscan. Everything like pvdisplay and such seem to work.
What to do?

--- Volume group ---
VG Name               movies
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           2 TB
Max PV                256
Cur PV                4
Act PV                4
VG Size               377.16 GB
PE Size               32 MB
Total PE              12069
Alloc PE / Size       12069 / 377.16 GB
Free  PE / Size       0 / 0
VG UUID               joYSOs-THNu-lelx-XAsN-5SPg-EAI9-Yv8Kxs


pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/scsi/host0/bus0/target0/lun0/disc" is in no VG
[33.90 GB]
pvscan -- ACTIVE   PV "/dev/scsi/host0/bus0/target1/lun0/disc" of VG
"movies" [33.84 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/ide/host0/bus1/target0/lun0/disc"  of VG
"movies" [114.44 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/ide/host0/bus1/target1/lun0/disc"  of VG
"movies" [114.44 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/ide/host0/bus0/target0/lun0/disc"  of VG
"movies" [114.44 GB / 0 free]
pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part7" is in no VG
[98.68 GB]
pvscan -- total: 6 [509.98 GB] / in use: 4 [377.40 GB] / in no VG: 2
[132.58 GB]

Respectfully,
Patrik
