From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error on lvcreate or lvremove!
Message-ID: <20020522144651.F9107@sistina.com>
References: <004d01c20110$f2b8ff70$6501a8c0@bomoon>
Mime-Version: 1.0
In-Reply-To: <004d01c20110$f2b8ff70$6501a8c0@bomoon>; from bo@sosnetwork.net on Tue, May 21, 2002 at 02:46:22PM -0700
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
Date: Wed May 22 07:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 21, 2002 at 02:46:22PM -0700, bo wrote:
> Hello,
> 
> I did not have this kind of problem before but I installed LVM1.1-rc2,
> I am experiencing the following errors;
> 
> Problem1) could not create an LV from RAID1 vol group
>     [root@localhost /]# lvcreate -l 496 -n lvraid1 volRaid1
>     lvcreate -- ERROR "Operation not permitted" opening logical volume "/dev/volRaid1/lvraid1"

Looks like your logical volume numbers are invalid.

Take a VGDA backup with vgcfgbackup(8) and store /etc/lvmconf/*
in a safe location.

Run "vgscan -f" and retry.

> 
> Problem2) I could not remove it
>     [root@localhost /]# lvremove /dev/volRaid1/lvraid1
>     lvremove -- do you really want to remove "/dev/volRaid1/lvraid1"? [y/n]: y
>     lvremove -- ERROR "lv_release(): LV number" releasing logical volume "/dev/volRaid1/lvraid1"
> 
> Problem3) I could not create a striped LV
>     [root@localhost /]# lvcreate -l200 -i2 -I4 -n lvjb2s volDisk2
>     lvcreate -- not enough allocatable/free physical volume space in "volDisk2"
>     lvcreate -- please check, if physical volumes are allocatable

Could be caused by the assumed logical volume number problem but please
check that your physical volumes are allocatable with pvdisplay(8).

Regards,
Heinz    -- The LVM Guy --


> 
> Attched are more system information.
> 
> Please provide me your help,
> 
> Thanks,
> 
> Bo
> 
> [root@localhost /]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/md0"   of VG "volRaid0" [1.95 GB / 1.95 GB free]
> pvscan -- ACTIVE   PV "/dev/md1"   of VG "volRaid0" [1.95 GB / 1.95 GB free]
> pvscan -- ACTIVE   PV "/dev/md2"   of VG "volRaid0" [1.95 GB / 1.95 GB free]
> pvscan -- ACTIVE   PV "/dev/md3"   of VG "volRaid1" [992 MB / 992 MB free]
> pvscan -- ACTIVE   PV "/dev/md4"   of VG "volRaid1" [992 MB / 992 MB free]
> pvscan -- ACTIVE   PV "/dev/md5"   of VG "volRaid5" [1.95 GB / 1.95 GB free]
> pvscan -- ACTIVE   PV "/dev/md6"   of VG "volRaid5" [1.95 GB / 1.95 GB free]
> pvscan -- ACTIVE   PV "/dev/hdc9"  of VG "volDisk"  [992 MB / 992 MB free]
> pvscan -- ACTIVE   PV "/dev/hdc10" of VG "volDisk2" [992 MB / 992 MB free]
> pvscan -- ACTIVE   PV "/dev/hdd9"  of VG "volDisk"  [992 MB / 992 MB free]
> pvscan -- ACTIVE   PV "/dev/hdd10" of VG "volDisk2" [992 MB / 992 MB free]
> pvscan -- ACTIVE   PV "/dev/hda15" of VG "volDisk"  [996 MB / 996 MB free]
> pvscan -- ACTIVE   PV "/dev/hda16" of VG "volDisk2" [996 MB / 996 MB free]
> pvscan -- total: 13 [17.59 GB] / in use: 13 [17.59 GB] / in no VG: 0 [0]
> 
> [root@localhost /]# vgdisplay
> --- Volume group ---
> VG Name               volRaid0 
> VG Access             read/write
> VG Status             available/resizable
> VG #                  2
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               5.84 GB
> PE Size               4 MB
> Total PE              1496
> Alloc PE / Size       0 / 0
> Free  PE / Size       1496 / 5.84 GB
> VG UUID               89ZFBj-yaQ0-c26m-uKgF-YhvG-2lGR-C8cvWm
> 
> --- Volume group ---
> VG Name               volRaid1 
> VG Access             read/write
> VG Status             available/resizable
> VG #                  3
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               1.94 GB
> PE Size               4 MB
> Total PE              496
> Alloc PE / Size       0 / 0
> Free  PE / Size       496 / 1.94 GB
> VG UUID               3keDZ8-jgky-uhKS-q1bi-d1Jf-qmsq-hw7GUs
> 
> --- Volume group ---
> VG Name               volRaid5 
> VG Access             read/write
> VG Status             available/resizable
> VG #                  4
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               3.89 GB
> PE Size               4 MB
> Total PE              996
> Alloc PE / Size       0 / 0
> Free  PE / Size       996 / 3.89 GB
> VG UUID               U2l1OW-L3ha-r3kH-BPXw-IJP5-ksA7-77iRJB
> 
> --- Volume group ---
> VG Name               volDisk 
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               2.91 GB
> PE Size               4 MB
> Total PE              745
> Alloc PE / Size       0 / 0
> Free  PE / Size       745 / 2.91 GB
> VG UUID               7RhXUS-Pw5B-EBYN-GKIM-PO1d-4uD7-4apSvp
> 
> --- Volume group ---
> VG Name               volDisk2 
> VG Access             read/write
> VG Status             available/resizable
> VG #                  1
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               2.91 GB
> PE Size               4 MB
> Total PE              745
> Alloc PE / Size       0 / 0
> Free  PE / Size       745 / 2.91 GB
> VG UUID               VT6shD-P4lh-Rk2g-DUHi-T2ch-p14Q-kl3BuV
> 
> 

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
