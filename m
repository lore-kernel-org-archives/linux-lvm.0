From: Christian Hammers <ch@westend.com>
Message-Id: <20020209161547.GA16631@westend.com>
References: <20020209150809.GC28694@westend.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020209150809.GC28694@westend.com>
Subject: [linux-lvm] SOLUTION: error moving last PE away
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
Date: Sat Feb  9 10:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

On Sat, Feb 09, 2002 at 04:08:09PM +0100, Christian Hammers wrote:
> # pvmove   -v   /dev/hda10  /dev/hda8
> ...
> pvmove -- /dev/hda10 [PE 999 [lvol5 [LE 1365]] -> /dev/hda8 [PE 560] [1/1]
> pvmove -- ERROR reading input physical volume "/dev/hda10" (still 65536
> bytes to read)
> pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

A friend gave me the hint to enlarge the partition by one block. It helped,
after rebooting to let the kernel reload the partition table, pvmove ran
successfully.

The partition in question looked like:
$ LC_ALL=C fdisk -l

Disk /dev/hda: 255 heads, 63 sectors, 4867 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1             1         8     64228+  83  Linux
/dev/hda2   *         9       518   4096575    b  Win95 FAT32
/dev/hda3           519      4867  34933342+   5  Extended
/dev/hda5           519       773   2048256   83  Linux
/dev/hda6           774      1283   4096543+  8e  Linux LVM
/dev/hda7          1284      1793   4096543+  8e  Linux LVM
/dev/hda8          1794      2303   4096543+  8e  Linux LVM
/dev/hda9          2304      2813   4096543+  8e  Linux LVM

/dev/hda10         2814      3323   4096543+  8e  Linux LVM    NOT WORKING
/dev/hda10         2814      3324   4096543+  8e  Linux LVM        WORKING
[the rest of the drive was already empty]

bye,

-christian-
