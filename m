Return-Path: <riel@conectiva.com.br>
Date: Thu, 4 Jan 2001 20:01:10 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [lvm-devel] Re: [linux-lvm] LVM 0.9 vgscan problem
In-Reply-To: <Pine.LNX.4.21.0101041545590.1281-300000@duckman.distro.conectiva>
Message-ID: <Pine.LNX.4.21.0101041959040.1295-100000@duckman.distro.conectiva>
MIME-Version: 1.0
Content-ID: <Pine.LNX.4.21.0101041959042.1295@duckman.distro.conectiva>
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
To: lvm-devel@sistina.com
Cc: linux-lvm@sistina.com

On Thu, 4 Jan 2001, Rik van Riel wrote:
> On Wed, 3 Jan 2001, Rik van Riel wrote:
> 
> > The latest LVM utils + the latest kernel works just fine on my
> > test machine, but breaks horribly on my workstation.
> 
> OK, here's some more debugging output...

OK, so it gets worse ...

A simple (from an older kernel) vgreduce -a vg0
removed the unused hda5 PV from the VG and now
2.4.0-prerelease boots fine and vgscan no longer
segfaults...

But when I type (with the IOP10 tools) the following
all hell breaks loose:

# vgextend vg0 /dev/hda5    (the previously removed PV)

The oops is below.

regards,

Rik
--
Hollywood goes for world dumbination,
	Trailer at 11.

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com.br/


Jan  4 19:54:29 duckman kernel: Unable to handle kernel NULL pointer dereference at virtual address 0000002c
Jan  4 19:54:29 duckman kernel:  printing eip:
Jan  4 19:54:29 duckman kernel: c01bf477
Jan  4 19:54:29 duckman kernel: *pde = 00000000
Jan  4 19:54:29 duckman kernel: Oops: 0000
Jan  4 19:54:29 duckman kernel: CPU:    0
Jan  4 19:54:29 duckman kernel: EIP:    0010:[lvm_do_create_proc_entry_of_pv+27/104]
Jan  4 19:54:29 duckman kernel: EFLAGS: 00010246
Jan  4 19:54:29 duckman kernel: eax: 00002f2f   ebx: 00000000   ecx: 00000000   edx: 0000002f
Jan  4 19:54:29 duckman kernel: esi: 0000002c   edi: 0000002c   ebp: 00000000   esp: c7bd1d88
Jan  4 19:54:29 duckman kernel: ds: 0018   es: 0018   ss: 0018
Jan  4 19:54:29 duckman kernel: Process vgextend (pid: 1092, stackpage=c7bd1000)
Jan  4 19:54:29 duckman kernel: Stack: 00000000 cbc71000 0806a520 cbc71000 cbc71000 c01bd382 cbc71000 00000000 
Jan  4 19:54:29 duckman kernel:        0806a520 cbc71000 00000002 4004fe03 c02b8620 c01bae7b cbc71000 0806a520 
Jan  4 19:54:29 duckman kernel:        c8b23a80 0806a520 4004fe03 00000004 cbe3af40 00006a45 00000282 0806a520 
Jan  4 19:54:29 duckman kernel: Call Trace: [lvm_do_vg_extend+86/168] [lvm_chr_ioctl+691/1660] [timer_bug_msg+31680/32576] [handle_mm_fault+269/392] [inactive_shortage+44/64] [__find_get_page+58/132] [filemap_nopage+171/1444] 
Jan  4 19:54:29 duckman kernel:        [do_no_page+77/192] [dput+25/356] [permission+151/160] [chrdev_open+103/172] [dentry_open+192/344] [filp_open+74/84] [sys_ioctl+464/548] [system_call+55/64] 
Jan  4 19:54:29 duckman kernel: Code: ac 38 e0 75 03 8d 6e ff 84 c0 75 f4 89 ea 85 d2 75 07 89 fa 
