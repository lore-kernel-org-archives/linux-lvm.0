Return-Path: <jweber@valinux.com>
Date: Mon, 22 Jan 2001 05:00:36 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] Bummer, another problem.
In-Reply-To: <Pine.LNX.4.30.0101191025380.29322-500000@beefcake.hdqt.valinux.com>
Message-ID: <Pine.LNX.4.30.0101220449120.9713-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Just following up on my prior posting on this problem.  I've successfully
reproduced it (pretty easy) using Andrea's 2.2.19pre7aa1 kernel also, as
well as, stock 2.2.18+lvm patches.  Also reproduced with ext2, so it's not
related to just ext3 in this case.

I'm including kdb backtrace from a fresh reboot and vgchange of my volume
to try and get it back online, hence, with no good results.  The prior
logs I posted should still be applicable, it all looks the same output
wise here.  vgchange fails immediately following the "creating VGDA ..."
message if you use -v.

Looking at the backtrace it appears to be fail somewhere when it's reading
in the snapshot information from the snapshot that was active when the box
hung/locked up.

Joe, noted your comments regarding can't reproduce in commit logs.  Is
this in regards to the scripting I posted?  If so, you'll probably want to
write a little loop that creates a snapshot, waits 15 or so, removes the
snapshot, waits 15, and so on.  I've reproduced the lockup several times
doing this and now am stuck with dead LVM devices. :)  You would run that
while you have IO active on the snapshot source volume.  Make sure that
IO is continuous as well.

Let me know if there's anything else you may need.

Thanks,

----
kdb backtrace:

Jan 22 05:02:22 localhost kernel: Unable to handle kernel NULL pointer
dereference at virtual address 000001b0
Jan 22 05:02:22 localhost kernel: current->tss.cr3 = 06bdc000, %cr3 =
06bdc000
Jan 22 05:02:22 localhost kernel: *pde = 07cdd067
Jan 22 05:02:22 localhost kernel: *pte = 00000000
Jan 22 05:02:22 localhost kernel: Entering kdb on processor 0 due to panic
@ 0xc82e1387
Jan 22 05:02:22 localhost kernel: eax = 0x00000000  ebx = 0xc7f900c0  ecx
= 0x00000100  edx = 0x00000000
Jan 22 05:02:22 localhost kernel: esi = 0xc7f900c0  edi = 0x0000ffff  esp
= 0x00000400  eip = 0xc82e1387
Jan 22 05:02:22 localhost kernel: ebp = 0xc6bd3b00   ss = 0x0000ffff   cs
= 0x00000010  eflags = 0x00010246
Jan 22 05:02:22 localhost kernel:  ds = 0x00000018   es = 0x00000018
origeax = 0xffffffff  &regs = 0xc6bd3ac0
Jan 22 05:02:22 localhost kernel: [0]kdb> bt
Jan 22 05:02:22 localhost kernel:     EBP       EIP         Function(args)
Jan 22 05:02:22 localhost kernel: 0xc6bd3b00 0xc82e1387
lvm_pv_get_number+0x3f( 0xc7f90000, 0xffff)
Jan 22 05:02:23 localhost kernel: 0xc6bd3b58 0xc82e161a
lvm_snapshot_fill_COW_page+0x10e( 0xc7f90000, 0xc6afea00, 0x0, 0x804df30,
0xc6bd3c00)
Jan 22 05:02:23 localhost kernel: 0xc6bd3ba4 0xc82dfa28
lvm_proc_read_pv_info+0x1920( 0x0, 0xc6bd3c00, 0xc6bd3c00, 0xc7b49da0,
0x15dce0)
Jan 22 05:02:23 localhost kernel: 0xc6bd3d98 0xc82deda1
lvm_proc_read_pv_info+0xc99( 0x0, 0x15dce0, 0xc7b49da0, 0xffffffe7,
0x15dce0)
Jan 22 05:02:23 localhost kernel: 0xc6bd3f84 0xc82dc6eb  lvm_init+0x64b(
0xc633ee58, 0xc7b49da0, 0x4004fe00, 0x15dce0, 0xc6bd2000)
Jan 22 05:02:23 localhost kernel: 0xc6bd3fbc 0xc0140249  sys_ioctl+0x1ad(
0x4, 0x4004fe00, 0x15dce0, 0x4, 0x15dce0)
Jan 22 05:02:23 localhost kernel: 0xbffffa38 0xc010c1dc  system_call
