Date: Fri, 12 Oct 2001 10:39:19 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011012103919.A26896@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Problems patching 2.4.12 with xfs _and_ lvm-1.0.1-rc4-2.4.12.patch
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
I think there is a problem with lvm,  xfs and 2.4.12.

I got a clean 2.4.12 kernel and applied
"patch -p1 < /home/fzzgrr/ftpdownload/linux-2.4.12-xfs-2001-10-11.patch"

Works fine.

Then I built a new patch as described in the dokus of 1.0.1-rc4 and
tryed it:
home:/usr/src/linux# patch -p1 <
/usr/local/src/LVM/1.0.1-rc4/PATCHES/lvm-1.0.1-rc4-2.4.12.patch
patching file include/linux/lvm.h
patching file drivers/md/lvm.c
patching file drivers/md/lvm-internal.h
patching file drivers/md/lvm-snap.c
patching file drivers/md/lvm-fs.c
patching file drivers/md/Makefile
Reversed (or previously applied) patch detected!  Assume -R? [n] y
patching file drivers/md/lvm-snap.h

(I tryed option [n] as well)

So I configured and kompiled the kernel, "make dep clean" works fine,
but "make bzImage" resaults as follows:
...
drivers/md/mddev.o: In function `lvm_init':
drivers/md/mddev.o(.text+0x86): undefined reference to `lvm_init_fs'
drivers/md/mddev.o: In function `lvm_cleanup':
drivers/md/mddev.o(.text+0x1bc): undefined reference to `lvm_fin_fs'
drivers/md/mddev.o: In function `lvm_do_vg_create':
drivers/md/mddev.o(.text+0x19f6): undefined reference to
`lvm_fs_create_vg'
drivers/md/mddev.o: In function `lvm_do_vg_rename':
drivers/md/mddev.o(.text+0x1f4c): undefined reference to
`lvm_fs_remove_vg'
drivers/md/mddev.o(.text+0x20fb): undefined reference to
`lvm_fs_create_vg'
drivers/md/mddev.o: In function `lvm_do_vg_remove':
drivers/md/mddev.o(.text+0x2159): undefined reference to
`lvm_fs_remove_vg'
drivers/md/mddev.o: In function `lvm_do_pv_create':
drivers/md/mddev.o(.text+0x2365): undefined reference to
`lvm_fs_create_pv'
drivers/md/mddev.o: In function `lvm_do_pv_remove':
drivers/md/mddev.o(.text+0x23a4): undefined reference to
`lvm_fs_remove_pv'
drivers/md/mddev.o: In function `lvm_do_lv_create':
drivers/md/mddev.o(.text+0x2d44): undefined reference to
`lvm_fs_create_lv'
drivers/md/mddev.o: In function `lvm_do_lv_remove':
drivers/md/mddev.o(.text+0x2e43): undefined reference to
`lvm_fs_remove_lv'
drivers/md/mddev.o: In function `lvm_do_lv_rename':
drivers/md/mddev.o(.text+0x3d5a): undefined reference to
`lvm_fs_remove_lv'
drivers/md/mddev.o(.text+0x3d7d): undefined reference to
`lvm_fs_create_lv'
make[1]: *** [kallsyms] Fehler 1
make[1]: Leaving directory `/usr/src/linux-2.4.12'
make: *** [vmlinux] Fehler 2


If I only apply one patch, it works fine. If I try the other way round,
first lvm then xfs patch, I get a lotta more mistakes applying the
patches.

Any ideas?
Regards
Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
