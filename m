From: Erkki Seppala <flux-lvm@inside.org>
Message-Id: <20020209142411.GA10226@xulfad.ton.tut.fi>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvmoving from a pv with bad sectors
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
Date: Sat Feb  9 08:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

It turns out that a 60GB disc I bought some months ago has regions
that cannot be read. I'm going to get the disc to warranty, but before
that I'd like to remove the disc from the VG. But, this happens:

[12:10] lectric(pts/1):/var/log% sudo pvmove /dev/ide/host0/bus0/target1/lun0/part1
pvmove -- moving physical extents in active volume group "archive"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR reading input physical volume "/dev/ide/host0/bus0/target1/lun0/part1" (still 1310720 bytes to read)
pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

/proc/lvm/global says:
VG:  archive  [3 PV, 6 LV/5 open]  PE Size: 16384 KB
  Usage [KB/PE]: 238665728 /14567 total  172032000 /10500 used  66633728 /4067 free
  PVs: [AN] ide/host0/bus0/target1/lun0/part1 60030976 /3664    21331968 /1302    38699008 /2362  
       [AA] ide/host0/bus1/target1/lun0/part1 58605568 /3577    58605568 /3577           0 /0     
       [AA] ide/host0/bus1/target0/lun0/part1 120029184 /7326    92094464 /5621    27934720 /1705  

The first PV is the one I'm trying to empty, and the last PV has the
space to hold it. Consequent attempt:

[16:06] lectric(pts/1):/var/log% sudo pvmove -v /dev/ide/host0/bus0/target1/lun0/part1
pvmove -- checking name of source physical volume "/dev/ide/host0/bus0/target1/lun0/part1"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/ide/host0/bus0/target1/lun0/part1"
pvmove -- ERROR "pv_read(): read" reading source physical volume "/dev/ide/host0/bus0/target1/lun0/part1"

Now, I know there's some data lost, but they don't seem to affect the
actual filesystem structure integrity, only data, which isn't really
that important in that VG. But if I don't have the device around, I
imagine I lose the whole volume group, not just the data's that is on
the one disc. I don't mind if the unreadable blocks are replaced with
zeroed blocks, as long as I can get rid of the device :-).

Any suggestions?

-- 
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
