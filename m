Message-ID: <002701c13436$3f5b2220$0b01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
References: <20010903000930.T3385@pc.ilinx>
Subject: Re: [linux-lvm] LVM, defvs and initrd (for lvm rootfs)
Date: Mon, 3 Sep 2001 07:06:53 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Run vgscan (without parameters) at the end of rc.sysinit.

Bye,
Bas.

----- Original Message -----
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
To: <linux-lvm@sistina.com>
Sent: Monday, September 03, 2001 6:09 AM
Subject: [linux-lvm] LVM, defvs and initrd (for lvm rootfs)


> I have a system that I am trying to boot with an LVM root filesystem.
> The kernel is a 2.4.8 (Mandrake variant) and is using devfs.
>
> The LVM version is unfortunately only 0.9.1_beta3 because that is what
> is in the stock kernel at the moment (IIRC).  I am trying to get
> Mandrake to update to the latest 1.0.* release but they are resisting
> taking what is not the stock kernel until they have some internal
> expertise on LVM.  This would be a good reason for you guys to get the
> 1.0.* code pushed up to Linus.  :-)
>
> Anyhow, I am successfully booting the system fully with the root
> filesystem on LVM so I know my initrd is (somewhat :-) correct.  The
> problem I am having is that once I am booted, the /dev/<volume group/
> directory is empty.  I think this has something to do with the fact
> that when the lvm kernel module is actually loaded (and the devfs
> nodes registered), the system is booted on the initrd root filesystem
> which then gets thrown away (along with the devfs /dev/ directory)
> when the real root is mounted.
>
> Here is the order of operations during boot as I can determine them:
>
> 1.  mount initrd
> 2.  kernel mounts devfs
> 3   load lvm module (which creates devfs nodes)
> 3.  vgscan, vchange -a y
> 4.  mount real root (on lvm partition)
> 5.  kernel mounts devfs again (on real root)
> 6.  unmount initrd
>
> I think the lvm nodes are created successfully in step 3 but get lost
> when devfs is mounted a second time in step 5.
>
> Here is the (relevant) kernel output during the boot.  The line
> nubmers on the left of course were just added here so that I could
> annotate below.
>
> 1.  Linux version 2.4.8-11mdk (chmou@no.mandrakesoft.com) (gcc version
egcs-2.91.66 19990314/Linux (egcs-1.1.2 release / Linux-Mandrake 8.1)) #1
Wed Aug 22 16:22:21 CEST 2001
>     [ snip ]
> 2.  Kernel command line: BOOT_IMAGE=linux ro root=3a00 devfs=mount
>     [ snip ]
> 3.  devfs: v0.107 (20010709) Richard Gooch (rgooch@atnf.csiro.au)
> 4.  devfs: boot_options: 0x2
>     [ snip ]
> 5.  RAMDISK: Compressed image found at block 0
> 6.
Uncompressing...............................................................
................................................................done.
> 7.  Freeing initrd memory: 1282k freed
> 8.  VFS: Mounted root (ext2 filesystem).
> 9.  Mounted devfs on /dev
> 10. LVM version 0.9.1_beta3  by Heinz Mauelshagen  (25/01/2001)
> 11. lvm -- Module successfully initialized
> 12, devfs: devfs_register(): device already registered: "group"
> 13, devfs: devfs_register(): device already registered: "lvol1"
> 14, devfs: devfs_register(): device already registered: "1"
> 15, VFS: Mounted root (ext2 filesystem) readonly.
> 16, change_root: old root has d_count=2
> 17, Mounted devfs on /dev
> 18, Freeing unused kernel memory: 708k freed
>
> Notice in line 2, the kernel command line does include "devfs=mount".
> Notice in lines 5-8, the initial ramdisk is detected and mounted.  In
> line 9, the kernel mounts devfs.  Lines 10-11 are the loading of the
> lvm driver and lines 12-14 are errors from devfs about devices that
> exist, I guess.  I am not sure why I am getting these.
>
> See on line 15, the real root filesystem (on the LVM LV) is mounted
> successfully (yay!) and on line 17, devfs is mounted again -- by the
> kernel.
>
> The system boots fine onto the LVM based root filesystem.  The problem
> is that the device nodes in /dev/VG (group, lvol1 and 1) are missing
> an uncreatable.
>
> Is my theory correct?  Is there a way to work around this?
>
> Thanx,
> b.
>
> --
> Brian J. Murrell
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
