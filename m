Message-ID: <3BB14C43.B62B32AB@bellatlantic.net>
Date: Tue, 25 Sep 2001 23:32:19 -0400
From: Uday Bhaskar Sarma Seetamraju <sarma@bellatlantic.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RAID1 on TOP of LVM
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I have had LVM for a little while now.
I have even successfully extended an LV.  Moved PVs.
And better yet.  Destroyed and recreated an LV containing Data :-)
The final step, RAID1.  But I stumbled.
Can someone help?

========= /etc/raidtab file =========
raiddev /dev/md0
        raid-level      1
        nr-raid-disks   2
        nr-spare-disks  0
        chunk-size      4
        persistent-superblock 0
        device          /dev/MKP/1
        failed-disk     0
        device          /dev/MKP.1/1
        raid-disk       1

========= output of mkraid in single user mode =========

    # mkraid /dev/md0
    Hadling MD device /dev/md0
    analyzing super-block
    disk 0: /dev/MKP/1, failed

returned a status of 0.

    # mkraid --version
    mkraid version 0.90.0
    # uname -a
    Linux linux1.localdomain 2.4.3-20mdk #1 Sun Apr 15 23:03:10 CEST 2001 i686 unknown
            (Mandrake 8.0 distribution downloaded from web site).

========= the LVM info =========

Logical Volume Manager 0.9
Heinz Mauelshagen, Sistina Software  13/11/2000  (IOP 10)

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "MKP"
vgscan -- found active volume group "MKP.1"
vgscan -- found active volume group "MGA"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual VGDA backup of your volume groups


lvscan -- ACTIVE           "/dev/MKP/1" [3.99 GB]
lvscan -- ACTIVE           "/dev/MGA/1" [2 GB]
lvscan -- ACTIVE           "/dev/MKP.1/1" [4 GB]
lvscan -- 3 logical volumes with 9.99 GB total in 3 volume groups
lvscan -- 3 active logical volumes


pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda6"  of VG "MKP"   [2 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hda10" of VG "MKP"   [2 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdc6"  of VG "MKP.1" [2.04 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdc10" of VG "MKP.1" [2.04 GB / 88 MB free]
pvscan -- ACTIVE   PV "/dev/hda7"  of VG "MGA"    [2 GB / 0 free]
pvscan -- total: 5 [10.09 GB] / in use: 5 [10.09 GB] / in no VG: 0 [0]

[EoInfo]
