From: Mike Williams <mike@gaima.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_K5bh/gcHxo2Hppi"
Message-Id: <200310092100.11002.mike@gaima.co.uk>
Subject: [linux-lvm] inconsistent metadata
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
Date: Fri Oct 10 08:15:06 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-00=_K5bh/gcHxo2Hppi
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi guys,

As you may have guessed, from my posting, I'm having some LVM trouble.

Basically this is what has happened.
I got a new 200gig drive, and created an lvm1 pv/vg/lv. Copied loads of dat=
a=20
onto it, then put the drive into another machine.
After this worked I changed the metadata to lvm2.
Added another drive to the machine and extended the LV and extended the=20
filesystem, I then added another drive but created a new LV in the same VG,=
=20
then a third drive was added to a third LV.
And all was well, until...

Yesterday, even though everything was working, I was getting errors like:
Couldn't find device with uuid 'CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc'.
Had to swap out the PSU this evening and then upon restarting couldn't=20
activate my VG :(

gandalf root # pvdisplay
  Couldn't find device with uuid 'CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc'.
  Couldn't find device with uuid 'CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc'.
  Couldn't find device with uuid 'CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc'.
  Physical volume "unknown device" of volume group "filestore" is exported
  --- Physical volume ---
  PV Name               unknown device
  VG Name               filestore (exported)
  PV Size               189.88 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              6076
  Free PE               0
  Allocated PE          6076
  PV UUID               CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc

"unknown device" is /dev/hde, my new 200gig drive, which IS working fine, a=
nd=20
IS exactly where is was before. So, after some googling, and practice on=20
another empty drive I decided to do:

gandalf root # pvcreate --uuid CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc /dev/=
hde
  No physical volume label read from /dev/hde
  Physical volume "/dev/hde" successfully created
Which fixed pvdisplay, woo (not)

gandalf root # pvdisplay |head
  Physical volume "/dev/hde" of volume group "filestore" is exported
  --- Physical volume ---
  PV Name               /dev/hde
  VG Name               filestore (exported)
  PV Size               189.88 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              6076
  Free PE               0
  Allocated PE          6076
gandalf root # vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "filestore" using metadata type lvm2
gandalf root # vgchange -a y
  Volume group filestore metadata is inconsistent
  Volume group for uuid not found:=20
3InK3jOE71aeco40b7L5c1cfU78EJpsk00000000000000000000000000000000
  Volume group filestore metadata is inconsistent
  Volume group for uuid not found:=20
3InK3jOE71aeco40b7L5c1cfU78EJpskPVV5#Hyv1z60d#OVfdcJC9TbA3tfsCV6
  Volume group filestore metadata is inconsistent
  Volume group for uuid not found:=20
3InK3jOE71aeco40b7L5c1cfU78EJpskp3dZg9RLNdmdRZFx96sbzQ9PEsZ37Wbn
  0 logical volume(s) in volume group "filestore" now active

Aargggh!

Can someone suggest a course of action to get at my data, please?
I just need to iron out this kink in the road and my life long devotion to =
LVM=20
will be complete! :)
Cheers

p.s. gandalf is an Athlon 1.4GHz (at 1GHz), with a gig of ram, on board ATA=
133=20
and a Promise PCI ATA66, running 2.6.0-test6, and LVM 2.00.06. The 3 drives=
=20
IDE drives are on the PCI card (with an additional drive), 4 drives on the=
=20
on-board controller, and 2 SCSI disks is on an Adaptec AIC-7892A U160.
Attached is (hopefully) the full output of {pv,vg,lv}display and=20
{pv,vg,lv}scan.

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/hb5KInuLMrk7bIwRAuiuAJ9Fc+jSWmwIz3M7ztHAyZVWA8JgxwCfb6Io
XgtkwLcYwFSPOHkAB+5GHGI=3D
=3DRukW
=2D----END PGP SIGNATURE-----

--Boundary-00=_K5bh/gcHxo2Hppi
Content-Type: text/x-diff;
  charset="us-ascii";
  name="lvm-grr"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="lvm-grr"

gandalf root # pvdisplay
  Physical volume "/dev/hde" of volume group "filestore" is exported
  --- Physical volume ---
  PV Name               /dev/hde
  VG Name               filestore (exported)
  PV Size               189.88 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              6076
  Free PE               0
  Allocated PE          6076
  PV UUID               CrijJ6-qPj1-cSYX-HzQF-D4M8-TUkA-yK3FYc

  Physical volume "/dev/hdg" of volume group "filestore" is exported
  --- Physical volume ---
  PV Name               /dev/hdg
  VG Name               filestore (exported)
  PV Size               76.28 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              2441
  Free PE               0
  Allocated PE          2441
  PV UUID               PdVjWD-7uc7-G7oT-s55m-1JXo-UXIf-bkWZOv

  --- Physical volume ---
  PV Name               /dev/hdf
  VG Name               filestore
  PV Size               74.50 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              2384
  Free PE               0
  Allocated PE          2384
  PV UUID               WYGR#I-IkRH-mwfV-nv2O-ga2B-P#zI-gm0etL

  --- Physical volume ---
  PV Name               /dev/sda2
  VG Name               filestore
  PV Size               16.22 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              519
  Free PE               519
  Allocated PE          0
  PV UUID               g4n1Mw-5Pal-#Hjq-OvDd-RLUA-J06m-O8RV2f

gandalf root # vgdisplay
  --- Volume group ---
  VG Name               filestore
  System ID             legolas.home.gaima.co.uk1064954139
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  9
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                3
  Open LV               0
  Max PV                256
  Cur PV                4
  Act PV                4
  VG Size               356.88 GB
  PE Size               32.00 MB
  Total PE              11420
  Alloc PE / Size       10901 / 340.66 GB
  Free  PE / Size       519 / 16.22 GB
  VG UUID               3InK3j-OE71-aeco-40b7-L5c1-cfU7-8EJpsk

gandalf root # lvdisplay
  --- Logical volume ---
  LV Name                /dev/filestore/movies
  VG Name                filestore
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                241.16 GB
  Current LE             7717
  Segments               2
  Allocation             next free
  Read ahead sectors     1024

  --- Logical volume ---
  LV Name                /dev/filestore/star-trek
  VG Name                filestore
  LV UUID                PVV5#H-yv1z-60d#-OVfd-cJC9-TbA3-tfsCV6
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                74.50 GB
  Current LE             2384
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0

  --- Logical volume ---
  LV Name                /dev/filestore/usr
  VG Name                filestore
  LV UUID                p3dZg9-RLNd-mdRZ-Fx96-sbzQ-9PEs-Z37Wbn
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                25.00 GB
  Current LE             800
  Segments               1
  Allocation             next free (default)
  Read ahead sectors     0


gandalf root # pvscan
  PV /dev/hde     is in exported VG filestore [189.88 GB / 0    free]
  PV /dev/hdg     is in exported VG filestore [76.28 GB / 0    free]
  PV /dev/hdf    VG filestore   lvm2 [74.50 GB / 0    free]
  PV /dev/sda2   VG filestore   lvm2 [16.22 GB / 16.22 GB free]
  Total: 4 [16.22 GB] / in use: 4 [16.22 GB] / in no VG: 0 [0   ]
gandalf root # vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "filestore" using metadata type lvm2
gandalf root # lvscan
  inactive          '/dev/filestore/movies' [241.16 GB] next free
  inactive          '/dev/filestore/star-trek' [74.50 GB] next free (default)
  inactive          '/dev/filestore/usr' [25.00 GB] next free (default)


--Boundary-00=_K5bh/gcHxo2Hppi--
