From: Marc MERLIN <marc_lvm@merlins.org>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020131030417.GN8651@merlins.org>
References: <20020125233533.GK26045@merlins.org>
    <20020128104258.A24830@sistina.com> <20020129215738.GA8651@merlins.org>
    <20020130131205.A3769@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020130131205.A3769@sistina.com>
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
Date: Wed Jan 30 21:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 30, 2002 at 01:12:05PM +0100, Heinz J . Mauelshagen wrote:
> > Unfortunately, that doesn't work because I  had a cron job that was creating
> > daily snapshots (in an attempt to emulate ONTAP's snapshot's feature), so my
> > 10 backups contain snapshot LVs
> 
> Well, in this case you might still have a consistent backup with snapshots
> which you can use like mentioned above.

I tried a few and none seemed to work, but I restored one from before I made
snapshots and recovered from this.
I now have my system back (/usr, /var)

As  for  /home,  as soon  as  I  tried  to  access it  (e2fsck,  tune2fs  -O
^has_journal, or whatever), the process hung in "wait_o" according to ps.

I tried to  restore the VG to  its state before I added  snapshots, but that
only made it go away :-(
 
mechastreisand:/etc/lvmconf# vgchange -a n /dev/BigAssLVMRaid 
vgchange -- volume group "BigAssLVMRaid" successfully deactivated

mechastreisand:/etc/lvmconf# vgcfgrestore -f /etc/lvmconf/GoodBigAssLVMRaid.conf -n BigAssLVMRaid -ll 
--- Volume group ---
VG Name               BigAssLVMRaid
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           1.00 TB
Max PV                255
Cur PV                9
Act PV                9
VG Size               868.69 GB
PE Size               64.00 MB
Total PE              13899
Alloc PE / Size       13120 / 820.00 GB
Free  PE / Size       779 / 48.69 GB
VG UUID               VgCZzh-ldUN-Ix1n-mZL3-EWsj-ATke-7Y4RQj

--- Logical volume ---
LV Name                /dev/BigAssLVMRaid/BigAssLVMPartition
VG Name                BigAssLVMRaid
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                820.00 GB
Current LE             13120
Allocated LE           13120
Allocation             next free
Read ahead sectors     32
Block device           58:0


--- Physical volume ---
PV Name               /dev/rd/disc0/part7
VG Name               BigAssLVMRaid
PV Size               72.31 GB / NOT usable 121.73 MB [LVM: 128.00 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       65536
Total PE              1155
Free PE               0
Allocated PE          1155
PV UUID               Eriv40-q8V1-jgaS-ZXKh-8xwm-Wq7V-H9tVrl
(...)
mechastreisand:/etc/lvmconf# vgcfgrestore -f /etc/lvmconf/GoodBigAssLVMRaid.conf -n BigAssLVMRaid -ll | grep PV | grep rd | sed "s/.*\/dev/\/dev/"
/dev/rd/disc0/part7
/dev/rd/disc1/part1
/dev/rd/disc2/part1
/dev/rd/c1d0p1
/dev/rd/c1d1p1
/dev/rd/c2d0p1
/dev/rd/c2d1p1
/dev/rd/c3d0p1
/dev/rd/c3d1p1
mechastreisand:/etc/lvmconf# vgcfgrestore -f /etc/lvmconf/GoodBigAssLVMRaid.conf -n BigAssLVMRaid -ll | grep PV | grep rd | sed "s/.*\/dev/\/dev/" > /tmp/partlist
mechastreisand:/etc/lvmconf# pvcreate -yff `cat /tmp/partlist `
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/disc0/part7" of volume group "BigAssLVMRaid"
pvcreate -- removing lvmtab entry
pvcreate -- physical volume "/dev/rd/disc0/part7" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/disc1/part1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/disc1/part1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/disc2/part1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/disc2/part1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/c1d0p1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/c1d0p1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/c1d1p1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/c1d1p1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/c2d0p1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/c2d0p1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/c2d1p1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/c2d1p1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/c3d0p1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/c3d0p1" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/rd/c3d1p1" of volume group "BigAssLVMRaid"
pvcreate -- physical volume "/dev/rd/c3d1p1" successfully created

mechastreisand:/etc/lvmconf# for pv in `cat /tmp/partlist `
> do
> vgcfgrestore -f /etc/lvmconf/GoodBigAssLVMRaid.conf -n BigAssLVMRaid $pv
> done
vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/disc0/part7"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/disc1/part1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/disc2/part1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/c1d0p1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/c1d1p1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/c2d0p1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/c2d1p1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/c3d0p1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical volume "/dev/rd/c3d1p1"
vgcfgrestore -- you may not have an actual backup of restored volume group "BigAssLVMRaid"

mechastreisand:/etc/lvmconf# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "System"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


-> My BigAssLVMRaid VG is gone :-(

Did I just lose my data?

Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
