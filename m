Message-ID: <3F5E4BBD.7080107@yahoo.fr>
From: guillaume <foulmetal@yahoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 and initrd
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
Date: Tue Sep  9 16:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I wonder if my initrd affects the system, because after running the 
initrd, the VFS is unable to detect any partition of my group volume. 
Although "vgscan" and "vgchange -a y" detect the group volume.

Here is what initrd is doing (and me) :
 >>
Found volume group "vglfs" using metadata type lvm2
6 logical volume(s) in volume group "vglfs" now active
sh: no job control in this shell
ls -l /dev/mapper/{control,vglfs-racine}
crw-------   1 0            0             10, 63 Sep 9 23:19 control
brw-------   1 0            0            254,  0 Sep 9 23:20 vglfs-racine

sh-2.05b# mount /dev/mapper/vglfs-racine /tmp/
found reiserfs format "3.6" with standard journal
Reiserfs journal params: device dm-0, size 8192, journal first block 18, 
max tra
ns len 1024, max batch 908, max commit age 30, max trans age 30
reiserfs: checking transaction log (dm-0) for (dm-0)
Using r5 hash to sort names

sh-2.05b# exit
VFS: Cannot open root device "mapper/vglfs-racine" or unknown-block(0,0)
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0)
<<

Anyone got an idea ?

Guillaume.
