From: Andres Salomon <dilinger@mp3revolution.net>
Message-ID: <20020611200040.GA21603@chunk.voxel.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV resizing problems
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
Date: Wed Jun 12 06:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@lists.sistina.com

This VG in general has been giving me problems; I had to vgcfgrestore
last night.  I added a 160 gig drive; pvcreated, vgextended..  I then
tried to lvextend and resize2fs, but resize2fs thought that it was
already at max size.  After removing and readding the partition from the
VG, I tried e2fsadm, and got:


[dilinger@incandescent dilinger]$ sudo e2fsadm -l 28208 /dev/site/lvol1
 e2fsck 1.27 (8-Mar-2002)
 Pass 1: Checking inodes, blocks, and sizes
 Pass 2: Checking directory structure
 Pass 3: Checking directory connectivity
 Pass 4: Checking reference counts
 Pass 5: Checking group summary information
/dev/site/lvol1: 21960/37765120 files (5.0% non-contiguous), 70450278/75526144 blocks
 lvextend -- extending logical volume "/dev/site/lvol1" to 440.75 GB
 lvextend -- doing automatic backup of volume group "site"
 lvextend -- logical volume "/dev/site/lvol1" successfully extended
 resize2fs 1.27 (8-Mar-2002)
 The containing partition (or device) is only 75526144 blocks.
 You requested a new size of 115539968 blocks.

The LV remains at the old size (284 gigs) when mounted; lvdisplay shows:

--- Logical volume ---
LV Name                /dev/site/lvol1
VG Name                site
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                440.75 GB
Current LE             28208
Allocated LE           28208
Allocation             next free
Read ahead sectors     120
Block device           58:0


Has anyone seen/solved this problem?

-- 
<dilinger> people fear what they don't understand
<zinx> that is not true
<zinx> most people fear what they don't understand, and the rest get killed
	by those people
