Message-ID: <3F0A9604.5000101@portrix.net>
From: Jan Dittmer <j.dittmer@portrix.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2, extending a physical volume
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
Date: Tue Jul  8 05:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

I posted this a while ago on lvm-devel, but received no answer.
I'm using kernel 2.5(.74-mm2) with LVM2 and have a RAID5 to which I 
added a new disk with raidreconf. This worked fine, but lvm doesn't 
recognize the extra disk space:

# pvdisplay
   --- Physical volume ---
   PV Name               /dev/md0
   VG Name               myraid
   PV Size               335.36 GB / not usable 0
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              85853
   Free PE               0
   Allocated PE          85853
   PV UUID               wZQg66-cWrF-VDi5-GcRN-aYVg-RQQ3-PPm5K5

but:

# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5] [multipath]

md0 : active raid5 hdc1[4] hdh1[3] hdf1[2] hdg1[1] hde1[0]
       468872704 blocks level 5, 4k chunk, algorithm 2 [5/5] [UUUUU]

which translates to ~480 GB (5x 120GB)

Somewhere I found a post, that with vgcfgbackup / vgcfgrestore one is 
able to resize the volume. But simply backing up and restoring the 
descriptor just gets me to the same situation.
As I've another partition (which isn't that important) I tried to change 
the backup manually, ie. I changed pe_count in the backup file and 
restored it. This works fine - but how do I figure the correct PE count 
for this bigger disk? I just don't want to poke around until it says, 
'hey, too big, trashing your data'. There has to be a simple way, I 
guess, which I totally overlook. It isn't that big of a change.
pvresize tells me it isn't implemented.

Thanks for any insight,

Jan

# vgdisplay --version
   LVM version:     1.95.15 (2003-01-10)
   Library version: 0.96.08-ioctl (2003-03-27)
   Driver version:  1.0.6

-- 
Linux rubicon 2.5.74-mm2-jd4 #1 SMP Sun Jul 6 09:55:20 CEST 2003 i686
