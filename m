Date: Wed, 14 Jun 2000 20:45:54 +0200
From: Nils Juergens <nils@muon.de>
Subject: [linux-lvm] Problems with pvmove
Message-ID: <20000614204554.A654@guldukat.muon>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM List <linux-lvm@msede.com>

Hi Folks,

i'v got a volume group with three physical volumes (see below for
details) and one logical volume in it. Now i want to remove one PV.

I try to empty the PV with

 > pvmove /dev/hdb5
 > pvmove -- moving physical extents in active volume group "meine_volumes"
 > pvmove -- WARNING: moving of active logical volumes may cause data loss!
 > pvmove -- do you want to continue? [y/n] y
 > pvmove -- ERROR reading input physical volume "/dev/hdb5"

 > pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

 > pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

On the other hand - i was able to clear another PV (/dev/hdc5) from the
same PG with the above command and then remove it from the VG.

I'm using SuSEs 2.2.14-Kernel on a Debian 2.2 i386 with lvm-0.8final.

any ideas?

Nils

------------------------------------------------------------------------
--- Volume group ---
VG Name               meine_volumes
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               20.17 GB
PE Size               4 MB
Total PE              5163
Alloc PE / Size       3871 / 15.12 GB
Free  PE / Size       1292 / 5.05 GB

--- Physical volumes ---
PV Name (#)           /dev/hda5 (2)
PV Status             available / allocatable
Total PE / Free PE    2415 / 0

PV Name (#)           /dev/hdb5 (1)
PV Status             available / allocatable
Total PE / Free PE    503 / 60

PV Name (#)           /dev/hdc11 (3)
PV Status             available / allocatable
Total PE / Free PE    2245 / 1232

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >    Yes, Sir. Deathmatch _is_ a marketing term   <
 >        for "online brainstorming session"       <
