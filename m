From: Andreas Dilger <adilger@enel.ucalgary.ca>
Message-Id: <199907260704.BAA00752@webber.adilger.net>
Subject: [linux-lvm] Online ext2 resize available (alpha)
Date: Mon, 26 Jul 1999 01:04:42 -0600 (MDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux FS development list <linux-fsdevel@vger.rutgers.edu>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Hello All,
This is to announce the first availability of a patch for 2.0.36 to allow
"safely" growing of an ext2 filesystem WHILE IT IS MOUNTED.  The growth
of the filesystem can happen while the FS is in use, with open files, and
no impact to programs reading or writing to the filesystem.  I only quote
"safely" because the patch is new - there is no danger that I found in my
limited testing, but since you are playing with your disk always have a
backup!

Since this is a first release, not all of the functionality for resizing
the filesystem is available yet.  The changes are confined to two files,
fs/ext2/super.c and fs/ext2/balloc.c, about 200 lines including comments
and some debugging.  The full functionality is pretty much there, but to
use it I will need to have some user-space tools (likely a modified
mke2fs, and/or a modified offline resize tool like Lennert Buytenhek's
ext2resize utility).

The good news is that the kernel patch is pretty much independent from
the e2fsutils, so they can be rolled out separately.  I haven't looked
at a 2.2.x kernel yet (don't hit me ;-), so I can't say how much needs to
change for it, but the implementation will be mostly the same.

This patch DOES NOT give you the ability to resize "DOS" partitions.
That capability comes from LVM or MD devices, or hardware RAID units.

Right now (with a patched kernel) you can:
Grow any mounted ext2 FS to the end of a group (8MB for 1k blocks,
128MB for 4k blocks) without any preparation at all.  Examples shown below.

With a modified mke2fs + patched kernel you can:
Grow any mounted ext2 FS to the end of EXT2_DESC_PER_BLOCK groups
(32 => 256MB for 1k, 128 => 16GB for 4k) without having to unmount the
filesystem.  This again would work on any filesystem when you have the
patched kernel running.  The modified mke2fs will create group descriptors,
and groups in the new areas of the disk without touching the running
filesystem, and then the online kernel resize will start using these new
groups.

With a "prepared" ext2 filesystem you can:
Grow a mounted prepared filesystem to the limits of what you prepare for
(up to 2? TB).  The reason for the "prepared" part is the need to add a
group descriptor block after the next multiple of 32/128 groups are used
up.  However, I believe it is relatively straight forward (my next
project) to modify mke2fs or ext2resize to "prepare" a filesystem for
this growth by reserving blocks in the filesystem for this growth - the
kernel should already handle this now.  The good news is that a
"prepared" filesystem should be compatible with old kernels and old
e2fsutils, so it can be rolled out any time.  Since each reserved block
will give 256MB, 4GB, or 16GB for 1k, 2k or 4k block sizes respectively,
not much space needs to be reserved in order to grow for most needs.

I've started working on mke2fs to do this, but I'll be testing the
current resize capabilities first.

BUGS/CAVEATS:
- Currently, if you could resize past a group boundary, you would get the
  entire next group rather than the size you specify - shouldn't be a big
  problem anyways, since most people won't resize a partition and then
  not use all of the available space.
- I think my calculation for the "reserved blocks percentage" is wrong,
  but this isn't fatal either.

Patch is available at my web site, along with the full output of the testing.
http://www-mddsp.enel.ucalgary.ca/People/adilger/ext2grow/

The code was inspired in by Miguel de Icaza's ext2volume patch, but while
Miguel worked with whole disks, I can use LVM to handle the growth for me.

Cheers, Andreas
--- test resize output ---
### it is strange, but /dev/hda1 is my TEST partition!!! ###
Script started on Sun Jul 25 23:31:47 1999
### Obliterate any part of old filesystem on the disk ###
webber:~# dd if=/dev/urandom of=/dev/hda1 bs=1k count=10000
10000+0 records in
10000+0 records out
### Make new, small filesystem on test partition - note old v1.12 mke2fs ###
webber:~# mke2fs /dev/hda1 1000
mke2fs 1.12, 9-Jul-98 for EXT2 FS 0.5b, 95/08/09
Linux ext2 filesystem format
Filesystem label=
256 inodes, 1000 blocks
50 blocks (5.00%) reserved for the super user
First data block=1
Block size=1024 (log=0)
Fragment size=1024 (log=0)
1 block group
8192 blocks per group, 8192 fragments per group
256 inodes per group

Writing inode tables:    done
Writing superblocks and filesystem accounting information: done
### Mount filesystem, go there, we have 900k free - let's use it up ###
webber:~# mount -o debug,check=strict /dev/hda1 /mnt/tmp
webber:~# cd /mnt/tmp
webber:/mnt/tmp# df .
Filesystem         1024-blocks  Used Available Capacity Mounted on
/dev/hda1                963      13      900      1%   /mnt/tmp
webber:/mnt/tmp# dd if=/dev/zero of=tempfile bs=1k count=900
900+0 records in
900+0 records out
### There goes all the free space in this partition ###
webber:/mnt/tmp# df .
Filesystem         1024-blocks  Used Available Capacity Mounted on
/dev/hda1                963     918        0    100%   /mnt/tmp
### Let's resize the filesystem while we are using it ###
webber:/mnt/tmp# mount -o remount,resize=2000 /dev/hda1
### Yahoo!!!  Now we have more space without doing anything ###
webber:/mnt/tmp# df .
Filesystem         1024-blocks  Used Available Capacity Mounted on
/dev/hda1               1963     918      933     50%   /mnt/tmp
webber:/mnt/tmp# ls -la
total 1857
drwxr-xr-x   3 root     root         1024 Jul 25 23:36 .
drwxr-xr-x   3 root     root         1024 Jul 25 13:44 ..
drwxr-xr-x   2 root     root        12288 Jul 25 23:34 lost+found
-rw-r--r--   1 root     root       921600 Jul 25 23:35 tempfile
[more resizing, testing removed]
webber:/mnt/tmp# sync
webber:/mnt/tmp# cd /
webber:/# umount /mnt/tmp
webber:/# e2fsck -f /dev/hda1
e2fsck 1.12, 9-Jul-98 for EXT2 FS 0.5b, 95/08/09
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/hda1: 14/256 files (0.0% non-contiguous), 7718/8193 blocks
--- test resize output ---

Cheers, Andreas
-- 
Andreas Dilger  University of Calgary \ "If a man ate a pound of pasta and
                Micronet Research Group \ a pound of antipasto, would they
Dept of Electrical & Computer Engineering \  cancel out, leaving him still
http://www-mddsp.enel.ucalgary.ca/People/adilger/      hungry?" -- Dogbert
