From: Peter Samek <samek@upc.uniba.sk>
Message-ID: <20030709130201.GA19698@pec.upc.uniba.sk>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] pvmove problem: Inappropriate ioctl for device
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
Date: Wed Jul  9 09:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello.

I have a RedHat 7.3 system with a 2.4.20 kernel and lvm version 1.0.3.

===
[root@noe root]# pvmove --version
pvmove: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
===

The machine has two 80GB disks and there are three RAID arrays.

===
[root@noe root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md/1" of VG "mirror" [20 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/md/2" of VG "strip"  [97.65 GB / 2.50 GB free]
pvscan -- ACTIVE   PV "/dev/md/3" of VG "strip"  [13.34 GB / 12.34 GB free]
pvscan -- total: 3 [131.01 GB] / in use: 3 [131.01 GB] / in no VG: 0 [0]
===

/dev/md/1 is a raid1, /dev/md/2 and /dev/md/3 are raid0s.

I'm trying to move all PE from /dev/md/3 to /dev/md/2, so I could remove
/dev/md/3. But "pvmove -v /dev/md/3" spits out this error message:

===
[root@noe root]# pvmove -vv /dev/md/3
pvmove -- checking name of source physical volume "/dev/md/3"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/md/3"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "strip" from lvmtab
pvmove -- checking volume group consistency of "strip"
pvmove -- searching for source physical volume "/dev/md/3" in volume group "strip"
pvmove -- building list of possible destination physical volumes
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "strip"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/md/3"
pvmove -- checking for enough free physical extents in "strip"
lv: /dev/strip/usr[1]  old_dev: 09:03  new_dev: 09:02  old_pe_sector: 14688640  new_pe_sector: 8397312
pvmove -- opening output physical volume "/dev/md/2"
pvmove -- llseeking input physical volume "/dev/md/3"
pvmove -- llseeking output physical volume "/dev/md/2"
pvmove -- /dev/md/3 [PE 1792 [usr [LE 1024]] -> /dev/md/2 [PE 1024] [1/256]
pvmove -- copying extent from /dev/md/3::/dev/strip/usr(0x0903):14688640 to /dev/md/2(0x0902):8397312 on disk
/dev/strip/group::/dev/strip/usr: 0903 14688640, 0902 8397312
pvmove -- ERROR "Inappropriate ioctl for device" copying extent from "/dev/md/3"

pvmove -- ERROR "Inappropriate ioctl for device" moving physical extents
===

Is there something I am missing or is it a known bug in this version?

Thanks for any help.

Peter
-- 
 Peter Samek
 samek@upc.uniba.sk
 jabber: chaeldi@jabber.sk / icq: 81758305
