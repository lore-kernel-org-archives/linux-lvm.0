Message-ID: <3DB53F96.BC133713@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035237601"
 doesn't exist
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
Date: Tue Oct 22 07:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm mailinglist <linux-lvm@sistina.com>

Cron Daemon wrote:
> 
> lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035237601" doesn't exist

This is what i get from a script i run every minute to make the
snapshots larger
if they are not big enough to hold the space.
Further more i take a snapshot every hour, 8 hour, day and week.
(another cronscript does that)

It works with a find /dev/optVG/*snapshot* -exec script {} \;
where script contains a lvdisplay $1 | perlscript
where the perlscript actualy finds out if it is too small and makes it
bigger.

However, at the same time another script run every hour
makes a new snapshot (date +%s)
finds the old, umounts it, mounts the new, and removes the old snapshot
with -f
However, sometimes it doesnt actualy remove it, and leaves the file in
/dev/optVG.
So, now i have 800+ emails (all night) from this cronjob that says the
snapshot doesnt exist.
brw-rw----    1 root     disk      58,   4 Oct 22 00:00
1hour_snapshot_opt_1035237601
brw-rw----    1 root     disk      58,   4 Oct 22 06:00
1hour_snapshot_opt_1035259201
brw-rw----    1 root     disk      58,   4 Oct 22 08:00
1hour_snapshot_opt_1035266401
brw-rw----    1 root     disk      58,   3 Oct 22 13:00
1hour_snapshot_opt_1035284401


ve:/dev/optVG# lvdisplay /dev/optVG/1hour_snapshot_opt_10352*
lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035237601"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035259201"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035266401"
doesn't exist

--- Logical volume ---
LV Name                /dev/optVG/1hour_snapshot_opt_1035284401
VG Name                optVG
LV Write Access        read only
LV snapshot status     active destination for /dev/optVG/opt
LV Status              available
LV #                   4
# open                 1
LV Size                40 GB
Current LE             2560
Allocated LE           2560
snapshot chunk size    64 KB
Allocated to snapshot  0.01% [64 KB/1020 MB]
Allocated to COW-table 4 MB
Allocation             next free
Read ahead sectors     1024
Block device           58:3


i cant remove it
----------------
ve:/dev/optVG# lvremove /dev/optVG/1hour_snapshot_opt_1035237601
lvremove -- do you really want to remove
"/dev/optVG/1hour_snapshot_opt_1035237601"? [y/n]: y
lvremove -- ERROR "lv_release(): LV number" releasing logical volume
"/dev/optVG/1hour_snapshot_opt_1035237601"

i cant force it
---------------
ve:/dev/optVG# lvremove -f /dev/optVG/1hour_snapshot_opt_1035237601
lvremove -- ERROR "lv_release(): LV number" releasing logical volume
"/dev/optVG/1hour_snapshot_opt_1035237601"


it doesnt exist on disk
-----------------------
ve:/dev/optVG# lvdisplay -D /dev/optVG/1hour_snapshot_opt_1035237601 
lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035237601"
doesn't exist


i'm loosing disk space
----------------------
ve:/dev/optVG# ls
1hour_snapshot_opt_1035237601	 1G	doesnt exist
1hour_snapshot_opt_1035259201 	 1G	doesnt exist
1hour_snapshot_opt_1035266401	 1G	doesnt exist
1hour_snapshot_opt_1035284401	 1G
8hours_snapshot_opt_1035266401 	 1G
day_snapshot_opt_1035259201	 1G
group
home				50G
opt				40G
samba				 5G
week_snapshot_opt_1035207494	 1G
-----------------------------------
				99G + those 3 that doesnt exist

which "doesnt" add up with the 102 allocated
------------------------------------------
ve:/dev/optVG# vgdisplay 
--- Volume group ---
VG Name               optVG 
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                10
Open LV               7
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               222.06 GB
PE Size               16 MB
Total PE              14212
Alloc PE / Size       6528 / 102 GB		<-------- ### ERROR ERROR ####
Free  PE / Size       7684 / 120.06 GB
VG UUID               FLuF75-RT7G-xecV-pN2X-OqSv-CXH6-YMOgaE


Yesterday i did an rm -rf on one of the 1hour snapshots that "didnt
exists", 
and that seemed to work okay. I'd just like that i dont have to do that


ve:/dev/optVG# vgchange -a n optVG
vgchange -- volume group "optVG" successfully deactivated

ve:/dev/optVG# vgchange -a y optVG
vgchange -- volume group "optVG" successfully activated

ve:/dev/optVG# vgdisplay 
--- Volume group ---
VG Name               optVG 
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                7
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               222.06 GB
PE Size               16 MB
Total PE              14212
Alloc PE / Size       6336 / 99 GB
Free  PE / Size       7876 / 123.06 GB
VG UUID               FLuF75-RT7G-xecV-pN2X-OqSv-CXH6-YMOgaE


So, i stopped the VG, and the size fits with those files in /dev/optVG/
BUT i still cant see those 1hour snapshots :(
	
ve:/dev/optVG# lvdisplay /dev/optVG/1hour_snapshot_opt_10352*
lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035237601"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035259201"
doesn't exist

lvdisplay -- logical volume "/dev/optVG/1hour_snapshot_opt_1035266401"
doesn't exist


So, i removed them, and it does appear to be working. How come it
repports them as
non existing, but doesnt remove the "file" in /dev/optVG/





JonB
