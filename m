From: Eike Bernhardt <eike@unorganized.net>
Message-Id: <20020405172933.GA71085@unorganized.homeip.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Known Issues with FreeBSD Slices on Disks?
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
Date: Fri Apr  5 11:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello!

Are there any known Problems when you want to use a Partition from a
Disk also containg a FreeBSD Slice as a PV?

The disk has four Partitions at the Moment:
$ fdisk -l /dev/hda

Disk /dev/hda: 255 heads, 63 sectors, 7297 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       765   6144831    b  Win95 FAT32
/dev/hda2           766      2040  10241437+  a5  FreeBSD
/dev/hda3          2041      3315  10241437+   c  Win95 FAT32 (LBA)
/dev/hda4          3316      7297  31985415   8e  Linux LVM

/dev/hda2 is a FreeBSD Partition/Slice and is detected by the Kernel
(which has Support for BSD-Disklabels) as:
 hda: hda1 hda2 hda3 hda4
 hda2: <bsd: hda5 hda6 hda7 hda8 hda9 hda10 >

System is Debian Unstable with:
ii  lvm10          1.1rc1-1       The Logical Volume Manager for Linux
and Kernel 2.4.19-pre5.

When I add this Partiton to a existing VG and then try to lvcreate
another LV from the added Space, I get a

lvcreate -- ERROR "Operation not permitted" opening logical volume
"/dev/pile/test"

(Attached is a Logfile which shows this in Context, and more Info)

Since this worked without Problems on the other Disks in this System,
and the only difference I can see is the FreeBSD Slice on hda -- might
this be a Problem?

I already tried repartitioning in case there was something wrong -- hda3
and hda4 were a single partition before.


I'm relativly new to LVM, so I don't really know if I'm doing something
wrong here.

TIA, Eike
-- 
Eike Bernhardt              http://unorganized.net/                ICQ: 11256658
"Every man dies, not every man really lives."     -- William Wallace, Braveheart
