Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MAd8j12270
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 05:39:08 -0500
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MAd7WA017533
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 05:39:07 -0500
Date: Mon, 22 Mar 2004 11:39:02 +0100 (MET)
From: "Frank Fegert" <fra.nospam.nk@gmx.de>
MIME-Version: 1.0
Message-ID: <12638.1079951942@www42.gmx.net>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] ERROR "vg_read_with_pv_and_lv(): allocated LE of LV"
	can't get data of volume group "vg00" from physical volume(s)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello all,

i got into some trouble while moving some PVs off a disk i wanted to
replace. At first everything
seemed to work fine. The pvmove-commands:

    pvmove -v /dev/hdb9 /dev/hdc1
    pvmove -v /dev/hdb8 /dev/hdc1
    pvmove -v /dev/hdb7 /dev/hdc1

worked without any errors. But upon reboot i got this error message:

    vgscan -- reading all physical volumes (this may take a while...)
    vgscan -- only found 3375 of 4405 LEs for LV /dev/vg00/home (3)
    vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg00" from physical volume(s)
    vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
    vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

subsequently a "vgchange -ay vg00" gives me a non-existing vg error:

    vgchange -- volume group "vg00" does not exist

If i do a "pvdata -avP /dev/hdb[7|8|9]" on the source PVs i get:

    --- Physical volume ---
    PV Name               /dev/hdb9
    VG Name               vg00
    PV Size               4.01 GB [8401932 secs] / NOT usable 2.51 MB [LVM:
125 KB]
    PV#                   7
    PV Status             available
    Allocatable           yes
    Cur LV                0
    PE Size (KByte)       4096
    Total PE              1025
    Free PE               1025
    Allocated PE          0
    PV UUID               twzBh6-kf2U-9XUK-StON-yx68-8f1e-t3fP2C
    pv_dev                   0:3
    system_id                (none)1002881875
    pv_on_disk.base          0
    pv_on_disk.size          1024
    vg_on_disk.base          1024
    vg_on_disk.size          4608
    pv_uuidlist_on_disk.base 6144
    pv_uuidlist_on_disk.size 32896
    lv_on_disk.base          39424
    lv_on_disk.size          84296
    pe_on_disk.base          123904
    pe_on_disk.size          2503680


    --- Volume group ---
    VG Name
    VG Access             read/write
    VG Status             NOT available/resizable
    VG #                  0
    MAX LV                256
    Cur LV                3
    Open LV               0
    MAX LV Size           255.99 GB
    Max PV                256
    Cur PV                15
    Act PV                15
    VG Size               102.53 GB
    PE Size               4 MB
    Total PE              26247
    Alloc PE / Size       17323 / 67.67 GB
    Free  PE / Size       8924 / 34.86 GB
    VG UUID               erEqvq-G6wX-ANzg-QhNp-V1Mf-TwG5-HaespP

    --- List of logical volumes ---

    --- Logical volume ---
    LV Name                /dev/vg00/usr
    VG Name                vg00
    LV Write Access        read/write
    LV Status              NOT available
    LV #                   1
    # open                 0
    LV Size                1.50 GB
    Current LE             384
    Allocation             next free
    Read ahead sectors     120
    Block device           58:0
    read_ahead: 120

    --- Logical volume ---
    LV Name                /dev/vg00/opt
    VG Name                vg00
    LV Write Access        read/write
    LV Status              NOT available
    LV #                   2
    # open                 0
    LV Size                48.96 GB
    Current LE             12534
    Allocated LE           12534
    Allocation             next free
    Read ahead sectors     120
    Block device           58:1
    read_ahead: 120

    pvdata -- logical volume struct at offset   2 is empty
    --- Logical volume ---
    LV Name                /dev/vg00/home
    VG Name                vg00
    LV Write Access        read/write
    LV Status              NOT available
    LV #                   4
    # open                 0
    LV Size                17.21 GB
    Current LE             4405
    Allocated LE           4405
    Allocation             next free
    Read ahead sectors     120
    Block device           58:3
    read_ahead: 120

    pvdata -- logical volume struct at offset   4 is empty
    ...
    pvdata -- logical volume struct at offset 255 is empty

    --- List of physical extents ---

    PE: 00000  LV: ---  LE: -----
    PE: 00001  LV: ---  LE: -----
    ...
    PE: 01024  LV: ---  LE: -----




which is kinda strange, because all PEs are gone (OK, they're supposed to
be, but
they don't appear at the target PV - see below) and there is a LV #1 i
deleted
before the pvmove process. If i look at the target PV, i can see that the
PEs have
not arrived there. I recall the origianl size of the /dev/hdc1 PV to be
around 50x
PEs. A "pvdata -avP /dev/hdc1" on the target PV gives me:

    --- Physical volume ---
    PV Name               /dev/hdc1
    VG Name               vg00
    PV Size               9.32 GB [19542033 secs] / NOT usable 4.18 MB [LVM:
133 KB]
    PV#                   8
    PV Status             available
    Allocatable           yes
    Cur LV                2
    PE Size (KByte)       4096
    Total PE              2384
    Free PE               1877
    Allocated PE          507
    PV UUID               vtJ9s4-9Gda-F4gT-00qd-eG73-KI6A-PauvsX
    pv_dev                   0:22
    system_id                ID-584581050615878
    pv_on_disk.base          0
    pv_on_disk.size          1024
    vg_on_disk.base          1024
    vg_on_disk.size          4608
    pv_uuidlist_on_disk.base 6144
    pv_uuidlist_on_disk.size 32896
    lv_on_disk.base          39424
    lv_on_disk.size          84296
    pe_on_disk.base          126976
    pe_on_disk.size          4259840

    ...

    pvdata -- logical volume struct at offset   4 is empty
    ...
    pvdata -- logical volume struct at offset 255 is empty

    --- List of physical extents ---

    PE: 00000  LV: 004  LE: 01030
    ...
    PE: 00505  LV: 004  LE: 01535
    PE: 00506  LV: 002  LE: 00000
    PE: 00507  LV: ---  LE: -----
    PE: 00508  LV: ---  LE: -----
    ...
    PE: 02383  LV: ---  LE: -----


which is double strange, because inbetween the "pvmove"s i did a "vgdisplay
-v",
which showed me a number of allocated PEs in /dev/hdc1 around 50x plus the
moved PVs size!
Ok, admittidly i did no backup this time, because the same procedure worked
a couple of times in the past, when i had a backup (Murphy). So basically my
question is, if the vg00 is screwed beyond repair? Needless to say this
would
be REALLY nasty. Or is there some kind of LVM-magic i can apply to fix the
problem?

Regards,

        Frank

-- 
+++ NEU bei GMX und erstmalig in Deutschland: T�V-gepr�fter Virenschutz +++
100% Virenerkennung nach Wildlist. Infos: http://www.gmx.net/virenschutz
