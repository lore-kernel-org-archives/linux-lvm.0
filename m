From: Theo Van Dinter <felicity@kluge.net>
Message-Id: <20020111230034.D26851@kluge.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM Snapshot/XFS caused system hang/VG corruption
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
Date: Fri Jan 11 22:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

As I am planning to put LVM/XFS into place on my "production" system in the
next few weeks, I decided to start playing around with things like snapshots.
Unfortunately, my first attempt to create a snapshot failed miserably and the
machine locked up cold:

# pvcreate /dev/sda4
# vgcreate t /dev/sda4
# lvcreate -n 1 -L 1G t
# mkfs -t xfs /dev/t/1
# mount /dev/t/1 /mnt/test
# <put some data on /mnt/test>
# lvcreate -s -n 1.snap -L 1G /dev/t/1
# mount -t xfs -o ro,nouuid,norecovery /dev/t/1.snap /mnt/testsnap

At this point, everything was mounted and things looked good.  Then I tried
to write some more data to /mnt/test, and the machine locked up cold.  After
rebooting, the VG "t" won't activate:

# vgchange -a y t
vgchange -- ERROR "parameter error" setting up snapshot copy on write
exception table for "/dev/t/1.snap"



In a quick google/lvm-archive search, I've found that the suggested solution
is to recover the backup metadata file:

# vgcfgrestore -n t /dev/sda4
vgcfgrestore -- VGDA for "t" successfully restored to physical volume
"/dev/sda4"
# vgchange -a y t
vgchange -- volume group "t" already active
# lvscan
lvscan -- ACTIVE            "/dev/kluge/swap" [128.00 MB]
lvscan -- ACTIVE            "/dev/kluge/var" [128.00 MB]
lvscan -- ACTIVE            "/dev/kluge/mp3s" [9.49 GB]
lvscan -- ACTIVE            "/dev/kluge/swap" [128.00 MB]
lvscan -- ACTIVE            "/dev/kluge/var" [128.00 MB]
lvscan -- ACTIVE            "/dev/kluge/mp3s" [9.49 GB]
lvscan -- 6 logical volumes with 19.48 GB total in 2 volume groups
lvscan -- 6 active logical volumes


So I'm now missing the non-snapshot volume in VG "t", and the other LVs I
have in a different VG are listed twice.  After doing some investigation
("vgdisplay -v kluge"), I found that there are, in fact, only 1 of each in
VG kluge, and via "vgdisplay -v t", all three are listed there too:

# vgdisplay -v t
--- Volume group ---
VG Name               kluge
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                255
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               13.48 GB
PE Size               4.00 MB
Total PE              3450
Alloc PE / Size       2493 / 9.74 GB
Free  PE / Size       957 / 3.74 GB
VG UUID               YbiqZe-PRyl-xzg9-oEuD-lmgs-r8xt-3tE7Qy

--- Logical volume ---
LV Name                /dev/kluge/swap
VG Name                kluge
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                128.00 MB
Current LE             32
Allocated LE           32
Allocation             next free
Read ahead sectors     120
Block device           58:2

--- Logical volume ---
LV Name                /dev/kluge/var
VG Name                kluge
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                128.00 MB
Current LE             32
Allocated LE           32
Allocation             next free
Read ahead sectors     120
Block device           58:3

--- Logical volume ---
LV Name                /dev/kluge/mp3s
VG Name                kluge
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                9.49 GB
Current LE             2429
Allocated LE           2429
Allocation             next free
Read ahead sectors     120
Block device           58:4


--- Physical volumes ---
PV Name (#)           /dev/hda4 (1)
PV Status             available / allocatable
Total PE / Free PE    3450 / 957


And looking in the /dev/t area:

dilbert  10:55pm  [/dev/t/] # ls -la /dev/t
total 172
dr-xr-xr-x    2 root     root           39 Jan 11 22:46 .
drwxr-xr-x   19 root     root        98304 Jan 11 22:46 ..
brw-rw----    1 root     disk      58,   3 Jan 11 22:46 1
brw-rw----    1 root     disk      58,   4 Jan 11 22:46 1.snap
crw-r-----    1 root     disk     109,   1 Jan 11 22:46 group



So things are confused.  I'm not 100%, but I'm thinking it's related to
conflicting major/minor numbers:

dilbert  10:56pm  [/dev/t/] # ls -la /dev/kluge/
total 172
dr-xr-xr-x    2 root     root           50 Jan 11 22:30 .
drwxr-xr-x   19 root     root        98304 Jan 11 22:46 ..
crw-r-----    1 root     disk     109,   1 Jan 11 22:30 group
brw-rw----    1 root     disk      58,   4 Jan 11 22:30 mp3s
brw-rw----    1 root     disk      58,   2 Jan 11 22:30 swap
brw-rw----    1 root     disk      58,   3 Jan 11 22:30 var



There are no log entries after the snapshot mount and before the hard
reboot, and there are no log entries about the "recovery".

So, what to do now?  I can't deactivate VG "t" because it thinks it has 3
active LVs.

I'm running LVM 1.0.1-rc4, kernel 2.4.9-13SGI_XFS_1.0.2, on an Athlon-based
system.  The test VG is stored on a new 3ware RAID card.


Thanks. :)

-- 
Randomly Generated Tagline:
"As I uploaded the resultant kernel, a specter of the holy penguin
 appeared before me, and said "It is Good. It is Bugfree". As if wanting
 to re-assure me that yes, it really =was= the holy penguin, it finally
 added "Do you have any Herring?" before fading out in a puff of holy
 penguin-smoke." - Linus Torvalds
