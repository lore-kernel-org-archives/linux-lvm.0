content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Recovering from a hard crash
Message-ID: <8075D5C3061B9441944E137377645118012E6B@cinshrexc03.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
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
Date: Mon Feb 24 09:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well, unless I'm reading this wrong, it looks as if /dev/md0 and
/dev/md10 have the same pvdata for some reason.  /dev/md0 is the first
part of /dev/md10.  Any ideas as to what's going on and how to resolve
this issue?=20

Below are pvdisplay and my raidtab

[root@cinshrinft1 /proc/lvm/VGs]# pvdisplay /dev/md0
--- Physical volume ---
PV Name               /dev/md0
VG Name               cubsvg1
PV Size               339.16 GB [711273728 secs] / NOT usable 16.25 MB
[LVM: 212 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       16384
Total PE              21705
Free PE               12105
Allocated PE          9600
PV UUID               RXNxAi-v6g0-e1Ro-8U1z-1xER-9Fbv-9M1PMo


[root@cinshrinft1 /proc/lvm/VGs]# pvdisplay /dev/md10
--- Physical volume ---
PV Name               /dev/md10
VG Name               cubsvg1
PV Size               339.16 GB [711273728 secs] / NOT usable 16.25 MB
[LVM: 212 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                2
PE Size (KByte)       16384
Total PE              21705
Free PE               8905
Allocated PE          12800
PV UUID               RXNxAi-v6g0-e1Ro-8U1z-1xER-9Fbv-9M1PMo



raiddev /dev/md0
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdc1
        raid-disk               0

        device                  /dev/sdf1
        raid-disk               1

raiddev /dev/md1
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdd1
        raid-disk               0

        device                  /dev/sdg1
        raid-disk               1

raiddev /dev/md2
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sde1
        raid-disk               0

        device                  /dev/sdh1
        raid-disk               1

raiddev /dev/md3
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdi1
        raid-disk               0

        device                  /dev/sdp1
        raid-disk               1

raiddev /dev/md4
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdj1
        raid-disk               0

        device                  /dev/sdq1
        raid-disk               1

raiddev /dev/md5
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdk1
        raid-disk               0

        device                  /dev/sdr1
        raid-disk               1

raiddev /dev/md6
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdl1
        raid-disk               0

        device                  /dev/sds1
        raid-disk               1

raiddev /dev/md7
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdm1
        raid-disk               0

        device                  /dev/sdt1
        raid-disk               1

raiddev /dev/md8
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdn1
        raid-disk               0

        device                  /dev/sdu1
        raid-disk               1


raiddev /dev/md9
        raid-level              1
        nr-raid-disks           2
        persistent-superblock   1
        chunk-size              64

        device                  /dev/sdo1
        raid-disk               0

        device                  /dev/sdv1
        raid-disk               1


raiddev /dev/md10
        raid-level              0
        nr-raid-disks           10
        persistent-superblock   1
        chunk-size              64

        device                  /dev/md0
        raid-disk               0

        device                  /dev/md1
        raid-disk               1

        device                  /dev/md2
        raid-disk               2

        device                  /dev/md3
        raid-disk               3

        device                  /dev/md4
        raid-disk               4

        device                  /dev/md5
        raid-disk               5

        device                  /dev/md6
        raid-disk               6

        device                  /dev/md7
        raid-disk               7

        device                  /dev/md8
        raid-disk               8

        device                  /dev/md9
        raid-disk               9

-----Original Message-----
From: Rechenberg, Andrew=20
Sent: Monday, February 24, 2003 9:56 AM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] Recovering from a hard crash



As a followup, pvscan shows the following:

[root@cinshrinft1 ~]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0"   is associated to unknown VG "cubsvg1"
(run vgscan)
pvscan -- inactive PV "/dev/md10"  is associated to unknown VG "cubsvg1"
(run vgscan)
pvscan -- total: 2 [678.32 GB] / in use: 2 [678.32 GB] / in no VG: 0 [0]

I never ran pvcreate on /dev/md0 so how is it associated with my volume
group?

-----Original Message-----
From: Rechenberg, Andrew=20
Sent: Monday, February 24, 2003 9:49 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] Recovering from a hard crash


Good day,

I am testing LVM on some test hardware and I'm trying to break it to see
if I can recover from a hard crash.  Well, I've broke it :)  I've
checked on the HOWTO and I'm subscribed to the mailing list and checked
the archives and I can't find anything to assist me recover so here
goes.

Here's my setup:

Red Hat 7.3 - kernel 2.4.18-24
lvm-1.0.3-4.i386.rpm

20 SCSI's disks in a Linux software RAID10
One volume group (vgcreate -s 16M cubsvg1 /dev/md10)
One logical volume with space left over for snapshots (lvcreate -L150G
-ncubslv1 cubsvg1)
Ext3 on top of mylv1

Here's how I "broke" it - I mounted the filesystem (mount
/dev/myvg1/mylv1 /mnt/test) and then while I was doing a large dd (dd
if=3D/dev/zero of=3Dtestfile bs=3D64k count=3D10000) I powered down the =
server.
When the server came back up I received the following error when trying
to do a vgscan:

vgscan -- reading all physical volumes (this may take a while ...)
vgscan -- only found 0 of 9600 Les for LV /dev/cubsvg1/cubslv1 (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "cubsvg1" from physical volume(s)

Here is what pvdata shows:

--- Physical volume ---
PV Name               /dev/md10
VG Name               cubsvg1
PV Size               339.16 GB [711273728 secs] / NOT usable 16.25 MB
[LVM: 212 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       16384
Total PE              21705
Free PE               12105
Allocated PE          9600
PV UUID               RXNxAi-v6g0-e1Ro-8U1z-1xER-9Fbv-9M1PMo

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               339.14 GB
PE Size               16 MB
Total PE              21705
Alloc PE / Size       9600 / 150 GB
Free  PE / Size       12105 / 189.14 GB
VG UUID               lKSEyp-1O2N-H1w3-V26c-jcwP-WV1z-x7Vgyu

--- List of logical volumes ---

pvdata -- logical volume "/dev/cubsvg1/cubslv1" at offset   0
pvdata -- logical volume struct at offset   1 is empty
pvdata -- logical volume struct at offset   2 is empty
pvdata -- logical volume struct at offset   3 is empty
pvdata -- logical volume struct at offset   4 is empty
pvdata -- logical volume struct at offset   5 is empty

... [snip] ...

--- List of physical volume UUIDs ---

001: RXNxAi-v6g0-e1Ro-8U1z-1xER-9Fbv-9M1PMo


I've tried using vgcfgrestore to put back the VGDA (am I using the
correct terminology?) but I can't get vgscan to get going.

Can anyone point me in the right direction on how to get my volume
group/logical volume back?  I want to make sure that if something like
this happens in production (and you know it will ;), that I can get us
back up with no data loss.

If you need any more information please let me know.

Thanks for your help,
Andy.

Andrew Rechenberg
Infrastructure Team, Sherman Financial Group


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
