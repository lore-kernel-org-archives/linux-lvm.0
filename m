Return-Path: <raheesom@navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 08 May 2001 19:11:14 -0400
Message-Id: <989363474.1329.2.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Patching my kernel.
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
To: Mauelshagen@sistina.com
Cc: linux-lvm@sistina.com

I had previously patched the kernel (stock 2.4.3) with the beta 6 patch.

Now I'm trying to update to beta 7.  I tried patching the kernel is
exactly the same way as before (maybe a mistake).  Most of the output is
pasted in here (at the end).  I'm concerned about the prompts I got -

"Reversed (or previously applied) patch detected!  Assume -R? [n]"

As you can see, I decided to reply "Y".  Was that a correct assumption?

Afterwards I read the man page on "patch" and am now even less sure that
I did the right thing.

I don't want to compile the kernel modules (I have lvm as a module)
until I know that the source is in good condition.

patching file drivers/md/Makefile
Reversed (or previously applied) patch detected!  Assume -R? [n] y
The next patch would delete the file drivers/md/lvm-snap.h,
which does not exist!  Assume -R? [n] y
patching file drivers/md/lvm-snap.h
patching file Documentation/ioctl-number.txt
Reversed (or previously applied) patch detected!  Assume -R? [n] y
Hunk #1 succeeded at 187 (offset 1 line).

I've now just tried compiling the kernel modules anyway (not the main
kernel file), using make modules, make modules_install.

At the end of the "make modules_install", I got these msgs -



find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{}
pcmcia
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.3; fi
depmod: *** Unresolved symbols in
/lib/modules/2.4.3/kernel/drivers/md/lvm-mod.odepmod: 	lvm_init_fs
depmod: 	lvm_fs_remove_vg
depmod: 	lvm_fin_fs
depmod: 	lvm_fs_remove_lv
depmod: 	lvm_fs_remove_pv
depmod: 	lvm_fs_create_vg
depmod: 	lvm_fs_create_lv
depmod: 	lvm_fs_create_pv


Do I assume that I did the wrong thing if the lvm-mod file is now (I
assume) incorrectly built?

How do I patch the kernel correctly???

-- 
regs
rupert
