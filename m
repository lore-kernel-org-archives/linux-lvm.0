Message-ID: <20020529004818.35501.qmail@web10105.mail.yahoo.com>
From: Vahid Pazirandeh <vpaziran@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] can't use all VG free space for an LV stripe
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
Date: Tue May 28 19:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@sistina.com

hi all,

my volume group has 48396 PEs free using three disks.  whenever i try to se=
tup
a striped LV using 48396 PEs it fails with "please check, if physical volum=
es
are allocatable".  if i issue the same command without the "-i 3" parameter=
 the
LV is successfully created.  i tried specifying the LV size with -L instead=
 of
-l and it results in the same thing.  i have 189.05GB PE free, i issue "-i =
3 -L
180G" and it fails with the afformentioned message.  oddly if i issue "-i 3=
 -L
170G" it will get created and there are still free PEs to be used. =20

why can't i use all of the free PEs on my VG in a single LV?  i'm eventually
going to use this setup with over a 1TB VG so if i can't use the full drive
space then it would be a big loss i space.  any ideas?  appreciated guys and
gals!

look below for a log of my activity, it's very straight forward and shows t=
he
problems i encounter. :)


-- snip snip --

root@iron-y:~# pvcreate --version
pvcreate: Logical Volume Manager 1.0.4
Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)


root@iron-y:~# pvcreate /dev/hd[e-g]
pvcreate -- physical volume "/dev/hde" successfully created
pvcreate -- physical volume "/dev/hdf" successfully created
pvcreate -- physical volume "/dev/hdg" successfully created


root@iron-y:~# vgcreate vg0 /dev/hd[e-g]
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vg0"
vgcreate -- volume group "vg0" successfully created and activated


root@iron-y:~# vgdisplay -v
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               189.05 GB
PE Size               4 MB
Total PE              48396
Alloc PE / Size       0 / 0
Free  PE / Size       48396 / 189.05 GB
VG UUID               1EaNPQ-tf5q-YO17-icw0-Qe2V-y2Vc-hQ401T

--- No logical volumes defined in "vg0" ---


--- Physical volumes ---
PV Name (#)           /dev/hdg (3)
PV Status             available / allocatable
Total PE / Free PE    19078 / 19078

PV Name (#)           /dev/hde (1)
PV Status             available / allocatable
Total PE / Free PE    14659 / 14659

PV Name (#)           /dev/hdf (2)
PV Status             available / allocatable
Total PE / Free PE    14659 / 14659


root@iron-y:~# lvcreate -i 3 -l 48396 -n lv0 vg0
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- not enough allocatable/free physical volume space in "vg0"
lvcreate -- please check, if physical volumes are allocatable


root@iron-y:~# lvcreate -l 48396 -n lv0 vg0
lvcreate -- doing automatic backup of "vg0"
lvcreate -- logical volume "/dev/vg0/lv0" successfully created


root@iron-y:~# lvremove /dev/vg0/lv0
lvremove -- do you really want to remove "/dev/vg0/lv0"? [y/n]: y
lvremove -- doing automatic backup of volume group "vg0"
lvremove -- logical volume "/dev/vg0/lv0" successfully removed


root@iron-y:~# vgdisplay | grep PE =20
PE Size               4 MB
Total PE              48396
Alloc PE / Size       0 / 0
Free  PE / Size       48396 / 189.05 GB


root@iron-y:~# lvcreate -i 3 -L 180G -n lv0 vg0
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- not enough allocatable/free physical volume space in "vg0"
lvcreate -- please check, if physical volumes are allocatable


root@iron-y:~# lvcreate -i 3 -L 170G -n lv0 vg0
lvcreate -- INFO: using default stripe size 16 KB
lvcreate -- rounding to stripe boundary size
lvcreate -- doing automatic backup of "vg0"
lvcreate -- logical volume "/dev/vg0/lv0" successfully created


root@iron-y:~# vgdisplay | grep PE
PE Size               4 MB
Total PE              48396
Alloc PE / Size       43521 / 170 GB
Free  PE / Size       4875 / 19.04 GB


root@iron-y:~# lvremove /dev/vg0/lv0=20
lvremove -- do you really want to remove "/dev/vg0/lv0"? [y/n]: y
lvremove -- doing automatic backup of volume group "vg0"
lvremove -- logical volume "/dev/vg0/lv0" successfully removed


root@iron-y:~# vgdisplay | grep PE
PE Size               4 MB
Total PE              48396
Alloc PE / Size       0 / 0
Free  PE / Size       48396 / 189.05 GB


root@iron-y:~# lvcreate -L 180G -n lv0 vg0
lvcreate -- doing automatic backup of "vg0"
lvcreate -- logical volume "/dev/vg0/lv0" successfully created

-- snip snip --



regards,
vahid


=3D=3D=3D=3D=3D
< NPACI Education Center on Computational Science and Engineering >
< http://edcenter.sdsu.edu >

"Career is great, but you can=EF=BF=BDt run your hands through its hair."
=3D=3D=3D=3D=3D

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
