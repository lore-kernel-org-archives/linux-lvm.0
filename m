From: Todd Underwood <todd@osogrande.com>
Message-ID: <Pine.LNX.4.10.10112101106430.12116-100000@staff>
MIME-Version: 1.0
Subject: [linux-lvm] more odd problems
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
Date: Mon Dec 10 12:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

folx,

i've just discovered another problem (which was preventing me from
pvcreating one of my partitions):  fdisk seems to be confused about the
partition table:

Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1      1020   8193118+  83  Linux
/dev/hda2          1021      3675  21326287+  8e  Linux LVM
/dev/hda3          3676      3722    377527+  82  Linux swap

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Re-read table failed with error 16: Device or resource busy.
Reboot your system to ensure the partition table is updated.

WARNING: If you have created or modified any DOS 6.x
partitions, please see the fdisk manual page for additional
information.
Syncing disks.
[root@villa root]# fdisk -s /dev/hda1
8193118
[root@villa root]# fdisk -s /dev/hda2
265072
[root@villa root]# fdisk -s /dev/hda3
0


v. odd.  i believe that this is a separate problem from the one i reported
earlier, but i thought that i would mention it.



todd underwood, vp & cto
oso grande technologies, inc.
todd@osogrande.com

"Those who give up essential liberties for temporary safety deserve
neither liberty nor safety." - Benjamin Franklin
