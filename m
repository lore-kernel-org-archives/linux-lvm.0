From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <000001c18f8d$7e915920$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011228011524.C27880@colombina.comedia.it>
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
Date: Fri Dec 28 04:47:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> try modifying /sbin/mkinitrd
>
[snip]

modified as instructed to include lvmdiskscan

Same problems when I boot, but I also get:

****

lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- no disks / partitions found

ERROR: /sbin/lvmdiskscan exited abnormally

****

When I run it from the install boot (where I can mount the LV's), I get:

****

[root@firewall root]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part1 [      14.73 MB]
Primary  LINUX native partition [0x83]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part2 [       2.66 GB] DOS
extended partition [0x05]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part4 [      53.22 GB]
Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part5 [     243.60 MB]
Extended LINUX swap partition [0x82]
lvmdiskscan -- /dev/ide/host0/bus0/target0/lun0/part6 [       2.42 GB]
Extended LINUX native partition [0x83]
lvmdiskscan -- 1 disk
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 5 partitions
lvmdiskscan -- 1 LVM physical volume partition

****

The DOS extended partition is actually part of the Linux install partition,
as can be seen from fdisk:

****

Disk /dev/hda: 240 heads, 63 sectors, 7753 cylinders
Units = cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1         2     15088+  83  Linux
/dev/hda2             3       371   2789640    5  Extended
/dev/hda4           372      7753  55807920   8e  Linux LVM
/dev/hda5             3        35    249448+  82  Linux swap
/dev/hda6            36       371   2540128+  83  Linux

****

Cheers,

Ben
