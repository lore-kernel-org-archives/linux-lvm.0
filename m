From: Frank Joerdens <frank@joerdens.de>
Message-ID: <20020831201710.B17207@superfly.archi-me-des.de>
Mime-Version: 1.0
Subject: [linux-lvm] compile error with lvm_1.1-rc2
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
Date: Sat Aug 31 13:17:31 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

These are the errors I get:

In file included from basename.c:36:
../../tools/lib/liblvm.h:61: linux/autoconf.h: No such file or directory

and

In file included from ../tools/lvm_user.h:47,
                 from e2fsadm.c:60:
../tools/lib/liblvm.h:61: linux/autoconf.h: No such file or directory

My kernel sources are in the default location /usr/src/linux and I also
tried to explicitly give this path to configure with

./configure --with-kernel_dir=/usr/src/linux

I am using 2.4.18 with Reiser and quota patches . . . and I apparently
need this LVM version because I ran into the pvmove issue trying to move
~30GB of stuff:

imedes:~ # pvmove /dev/sdc1 /dev/hdd
pvmove -- moving physical extents in active volume group "funkadelic"
pvmove -- WARNING: if you lose power during the move you may need to
restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR "Invalid argument" remapping

pvmove -- ERROR "pv_move(): LE of LV remap" pv_move_pe

pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents

weirdly, I've got exactly one PE allocated left on this PV:

limedes:~ # pvdisplay /dev/sdc1
--- Physical volume ---
PV Name               /dev/sdc1
VG Name               funkadelic
PV Size               30.64 GB / NOT usable 944 KB [LVM: 151 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              7844
Free PE               7843
Allocated PE          1
PV UUID               mPFcyy-wTUk-X3OI-fczK-XzHN-lkdF-nDrH3q

what I didn't understand either was whether the kernel needed to be
patched as well to get the cast fix for the llseek function?

Regards, Frank
