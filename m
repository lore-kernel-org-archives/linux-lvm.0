Date: Thu, 16 Nov 2000 13:48:52 -0800 (PST)
From: Bruno Kraychete da Costa <brunokc@kraychete.com>
Subject: [linux-lvm] Patch not applying cleanly in 2.4.0-test9
Message-ID: <Pine.LNX.4.21.0011161320200.2562-100000@duron.kraychete.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hi all,

Forgive me if this is a known issue, but I'm not being able to apply the
current Adilger's kernel 2.4 patch in kernel 2.4.0-test9. It seems to be a
very simple thing. Here is the lvm.h.rej:

***************
*** 597,606 ****
      __u32 lv_remap_end;
      __u32 lv_chunk_size;
      __u32 lv_snapshot_minor;
      struct kiobuf * lv_iobuf;
      struct semaphore lv_snapshot_sem;
      struct list_head * lv_snapshot_hash_table;
-     unsigned long lv_snapshot_hash_mask;
  } lv_v2_t;
  
  /* disk */
--- 558,571 ----
      __u32 lv_remap_end;
      __u32 lv_chunk_size;
      __u32 lv_snapshot_minor;
+ #ifdef __KERNEL__
      struct kiobuf * lv_iobuf;
      struct semaphore lv_snapshot_sem;
      struct list_head * lv_snapshot_hash_table;
+     ulong  lv_snapshot_hash_mask;
+ #else
+     char  dummy[200];
+ #endif
  } lv_v2_t;
  
  /* disk */



Changing all occurrences of '__u32' to 'uint32_t' makes the patch apply
cleanly, but trying to compile it results if the following error:


make[1]: Leaving directory `/usr/src/linux-2.4.0-test9/arch/i386/lib'
ld -m elf_i386 -T /usr/src/linux/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o \
        --start-group \
        arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o
mm/mm.o fs/fs.o ipc/ipc.o \
        drivers/block/block.o drivers/char/char.o drivers/misc/misc.o
drivers/net/net.o drivers/media/media.o drivers/parport/parport.a
drivers/ide/idedriver.o drivers/cdrom/cdrom.a drivers/pci/pci.a
drivers/pcmcia/pcmcia.o drivers/net/pcmcia/pcmcia_net.o drivers/pnp/pnp.o
drivers/video/video.o drivers/usb/usbdrv.o drivers/md/mddev.o \
        net/network.o \
        /usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a
/usr/src/linux/arch/i386/lib/lib.a \
        --end-group \
        -o vmlinux
drivers/md/mddev.o: In function `lvm_init':
drivers/md/mddev.o(.text.init+0x13c): undefined reference to `lvm_hd_name_ptr'
make: *** [vmlinux] Error 1


I found out that making a little change in include/linux/lvm.h solved this
problem. I just commented out the line:

#define      LVM_HD_NAME 

since LVM_HD_NAME was being undefined in the original lvm.h (before 
patching), and the kernel compiled successfully. I really don't know what
are the consequences of having this line out, though. Can some one make my
mind rest on this?

On a side note, I'm also seeing the following warning:

gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -pipe  -mpreferred-stack-boundary=2 -march=i686
-malign-functions=4  -fno-strict-aliasing    -c -o lvm.o lvm.c
lvm.c: In function `lvm_do_lv_create':
lvm.c:1931: warning: `lv_buf' might be used uninitialized in this function


I hope this report helps in some form.

Thanks,

Bruno.
