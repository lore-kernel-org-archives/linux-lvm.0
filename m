From: "Dr. David Alan Gilbert" <gilbertd@treblig.org>
Message-ID: <20030302150724.GB745@gallifrey>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvm2: VG data differs between PVs /dev/hda3 and /dev/hdg3
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
Date: Sun Mar  2 09:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
  (I'm not on this list - because LVM just works for me normally! - so
	please cc me)

	I'm trying to move from 2.4.x to 2.5.x and in the process move
=66rom lvm1 to lvm2 but when I install lvm2 I get the error:

  VG data differs between PVs /dev/hda3 and /dev/hdg3
  1 PV(s) found for VG totality: expected 2
  Logical volume (cross) contains an incomplete mapping table.
  VG data differs between PVs /dev/hda3 and /dev/hdg3

This was from running the 'pvs' command in lvm2; this seg'd at that
point (a backtrace showed it was in ttree_creat, report_object,pvscan,
process_each_pv, pvscan, pvs, help, main). However the main error
(VG data differs) happened with most commands. I guess what would be
useful would be a way to display the VG data off each PV - how would I
do this?

The setup is a pair of IDE drives with a striped lvm set accross
the drives for speed.

This is a Debian/sid system running the lvm10 package (1.0.6-2)
and failing on the lvm2 package (1.95.10-2)

Below I've included the output of a few commands from the working=20
lvm1 installation - more info available as required.

Thanks in advance,

Dave

{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->}{->=
}{->}
vgdisplay -v

--- Volume group ---
VG Name               totality
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                255
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                255
Cur PV                2
Act PV                2
VG Size               81.12 GB
PE Size               4 MB
Total PE              20768
Alloc PE / Size       20768 / 81.12 GB
Free  PE / Size       0 / 0
VG UUID               Ld6QsX-6b3y-I1UW-7U97-25za-21oU-PaZUEe

--- Logical volume ---
LV Name                /dev/totality/misc
VG Name                totality
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                25.39 GB
Current LE             6500
Allocated LE           6500
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/totality/cross
VG Name                totality
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                25.39 GB
Current LE             6500
Allocated LE           6500
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/totality/local
VG Name                totality
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                30.34 GB
Current LE             7768
Allocated LE           7768
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     120
Block device           58:2


--- Physical volumes ---
PV Name (#)           /dev/hdg3 (2)
PV Status             available / allocatable
Total PE / Free PE    10384 / 0

PV Name (#)           /dev/hda3 (1)
PV Status             available / allocatable
Total PE / Free PE    10384 / 0

{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-}{<-=
}{<-}
gallifrey:~# pvdisplay /dev/hda3
--- Physical volume ---
PV Name               /dev/hda3
VG Name               totality
PV Size               40.57 GB [85080240 secs] / NOT usable 4.18 MB
[LVM: 164 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       4096
Total PE              10384
Free PE               0
Allocated PE          10384
PV UUID               oqvvl9-ursZ-TaJJ-gsJJ-Zy2D-NI52-FM5cH3

gallifrey:~# pvdisplay /dev/hdg3
--- Physical volume ---
PV Name               /dev/hdg3
VG Name               totality
PV Size               40.57 GB [85080240 secs] / NOT usable 4.18 MB
[LVM: 164 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       4096
Total PE              10384
Free PE               0
Allocated PE          10384
PV UUID               MpCKD6-ZbRe-LqqN-fZNO-WFhV-w9p9-1JKXI8

 ---------------- Have a happy GNU millennium! ----------------------  =20
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \=20
\ gro.gilbert @ treblig.org | MIPS,x86,ARM,SPARC,PPC & HPPA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
