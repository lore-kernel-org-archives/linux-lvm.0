From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Sun, 26 Aug 2001 21:28:48 +0200
Message-ID: <20010826212848.B3043@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] non-removable snapshotted Snapshots and inconsistent LVs
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello, all!

The following problem: 
I use snapshots extensively to generate backups for my (home)
system[1].

After a crash (reason unknown, no log messages, not
neccessarily LVM related) I tried to remove the persistant
snapshots that were active before the crash.  Most of them
remove themselves OK, however 2 have been left over:

[Sorry for any long lines, but I think it's better not to wrap
program output]

$ cat /proc/lvm/global 
LVM driver LVM version 1.0(14/08/2001)

Total:  1 VG  1 PV  21 LVs (19 LVs open 19 times)

Global: 191327 bytes malloced   IOP version: 10   0:30:07 active

VG:  main_vg  [1 PV, 21 LV/19 open]  PE Size: 4096 KB
  Usage [KB/PE]: 35233792 /8602 total  24416256 /5961 used  10817536 /2641 free
  PV:  [AA] hde8                  35233792 /8602    24416256 /5961    10817536 /2641  
    LVs: [AWDL  ] amanda_holding_disk        6291456 /1536     1x open
[snip long list]
         [ARDL  ] SNAP-usr                   6291456 /1536     close
         [AWDL  ] var_lib_amanda              307200 /75       1x open
         [ARDL  ] SNAP-usr_local_games_Heroes3
                                6291456 /1536     close

    [UH! The sizes of the snapshots SNAP-* do look wrong!!]


$ lvremove /dev/main_vg/SNAP-usr
lvremove -- can't remove logical volume "/dev/main_vg/SNAP-usr" under snapshot

    [UH!  SNAP-usr is the snapshot of usr, and I did not
     snapshot THAT snapshot!  (I do this by scripts, so I know
     I did not mistype something.)]

$ lvremove /dev/main_vg/SNAP-usr_local_games_Heroes3 
lvremove -- do you really want to remove "/dev/main_vg/SNAP-usr_local_games_Heroes3"? [y/n]: y    
Segmentation fault

    [Hmmm.  Ok, let's rename them, so the backup system will
     work again]

$ lvrename /dev/main_vg/SNAP-usr_local_games_Heroes3 /dev/main_vg/SCHROTT1
lvrename -- doing automatic backup of volume group "main_vg"
lvrename -- logical volume "/dev/main_vg/SNAP-usr_local_games_Heroes3" successfully renamed to "/dev/main_vg/SCHROTT1"

$ lvrename /dev/main_vg/SNAP-usr /dev/main_vg/SCHROTT2
lvrename -- doing automatic backup of volume group "main_vg"
lvrename -- logical volume "/dev/main_vg/SNAP-usr" successfully renamed to "/dev/main_vg/SCHROTT2"

    [Ok, let's look at them...]

$ lvdisplay /dev/main_vg/SCHROTT1
--- Logical volume ---
LV Name                /dev/main_vg/SCHROTT1
VG Name                main_vg
LV Write Access        read only
LV snapshot status     active destination for /dev/main_vg/SCHROTT2
LV Status              available
LV #                   23
# open                 0
LV Size                6.00 GB
Current LE             1536
Allocated LE           1536
snapshot chunk size    64.00 KB
Allocated to snapshot  15.24% [3.00 MB/19.69 MB]
Allocated to COW-table 320.00 KB
Allocation             next free
Read ahead sectors     120
Block device           58:22

$ lvdisplay /dev/main_vg/SCHROTT2
lvdisplay -- ERROR "lv_check_consistency(): LV access" logical volume "/dev/main_vg/SCHROTT2" is inconsistent



What should I do now to debug help to debug that problem?
Want any dd-output or similar?

--debug says nothing new, AFAICS.  The snapshots have been
generated under V1.0.

-Wolfgang

[1] Dual Processor, this might or might not make a difference.
