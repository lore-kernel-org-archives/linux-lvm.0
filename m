From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011026005405.A21775@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm-1.0.1-rc4 and 2.4.13
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
Date: Thu Oct 25 17:52:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
I untared 2.4.13, applied the official xfs patch, then the fresh created
lvm patch.

No mistakes.
Then I configured the kernel and did a "make dep clean bzImage" which
fails with this error msg (the last lines):
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
make[1]: Leaving directory `/usr/src/linux'
make: *** [vmlinux] Fehler 2

Any ideas?

Thanks
Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
