Return-Path: <tim4mail@gmx.de>
Message-Id: <5.0.0.25.2.20010126011403.00a9d4f8@pop.gmx.net>
Date: Fri, 26 Jan 2001 01:34:46 +0100
From: tim <tim4mail@gmx.de>
Mime-Version: 1.0
Content-Type: text/html; charset="us-ascii"
Subject: [linux-lvm] Big trouble with 2.4.0 and lvm-0.9.1.*
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

<html>
Hi!<br>
first at all i want to excuse my bad english...:-(<br>
<br>
I decided today to upgrad from 2.4-test10 to 2.4.0. I was running lvm-8
final without any patches under the TEST 10 kernel (NOT the 2.4.1test10).
Now i downloaded both the new kernel (2.4.0) and the beta version of
lvm-0.9.1-beta2. i applied the kernel patch build the new tools and
rebooted. everything worked fine (exept of the wrong dir prefix so i had
to reinstall the tools and rebooted again).<br>
so far so good....my volume group (name is cabinet) consists of 4 drives
2x60gig and 2x80gig (all from maxtor) and he whole space is used for one
lv named &quot;a&quot;. e2fsck tooks nearly 30 mins so i wanted to move
the ext2 files to a reiserfs lv. i applied the patch and rebooted.<br>
now i began to shrink my ext2 partion on /dev/cabinet/a about 30 gigs;
everything without a problem...i took those 30 gigs and created a new lv
named &quot;jfs&quot; (also the mkreiserfs ran without any problesm) .i
mounted both and started coping the files from the ext2 to the reiserfs
and my system crashed....i wasn't able to switch to another console nor
to use the magic sys keys. so i had to shut it off. after rebooting the
same problem occured. so i rebooted again. and since this time i'm unable
to access the &quot;old&quot; lv &quot;/dev/cabinet/a&quot; (bad
superblock..so i tried other superblocks without any luck with e2fsck).
so i tried to export and reimport the vg and vgimport stoped with and
segfault. i checked the mailing list and recognized a new version was out
(beta 3). i also installed it as written above, but i got the same
segfault. Any ideas how i can rescue any files?<br>
<br>
Thanks <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tim<br>
<br>
PS: Here is the part of the segfault from my message-logfile:<br>
<br>
<font face="Courier New, Courier">Jan 26 01:07:08 tux kernel: Trying to
vfree() bad address (0808aac8)<br>
Jan 26 01:07:08 tux kernel: Unable to handle kernel NULL pointer
dereference at virtual address 0000006c<br>
Jan 26 01:07:08 tux kernel:&nbsp; printing eip:<br>
Jan 26 01:07:08 tux kernel: c01286df<br>
Jan 26 01:07:08 tux kernel: *pde = 00000000<br>
Jan 26 01:07:08 tux kernel: Oops: 0000<br>
Jan 26 01:07:08 tux kernel: CPU:&nbsp;&nbsp;&nbsp; 1<br>
Jan 26 01:07:08 tux kernel: EIP:&nbsp;&nbsp;&nbsp;
0010:[kfree+63/152]<br>
Jan 26 01:07:08 tux kernel: EFLAGS: 00010002<br>
Jan 26 01:07:08 tux kernel: eax: 00000004&nbsp;&nbsp; ebx:
c50720c0&nbsp;&nbsp; ecx: 00000000&nbsp;&nbsp; edx: 0004805b<br>
Jan 26 01:07:08 tux kernel: esi: 0805bdc0&nbsp;&nbsp; edi:
00000206&nbsp;&nbsp; ebp: c5072000&nbsp;&nbsp; esp: c4c2bb84<br>
Jan 26 01:07:08 tux kernel: ds: 0018&nbsp;&nbsp; es: 0018&nbsp;&nbsp; ss:
0018<br>
Jan 26 01:07:08 tux kernel: Process vgimport (pid: 675,
stackpage=c4c2b000)<br>
Jan 26 01:07:08 tux kernel: Stack: c50720c0 0805bdc0 00003bf0 0805bdc0
c01f3b30 0805bdc0 c5072000 0805bdc0 <br>
Jan 26 01:07:08 tux kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
00000001 c5072000 c4c2a000 00000000 c50724c4 00000004 000003c0 c01f2ff5
<br>
Jan 26 01:07:08 tux kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
00000000 00000000 00000001 c4c2bc14 0805bd30 c5072000 00000000 00000000
<br>
Jan 26 01:07:08 tux kernel: Call Trace: [lvm_do_lv_remove+584/620]
[lvm_do_vg_remove+197/312] [lvm_do_vg_create+767/1052]
[ne:__insmod_ne_O/lib/modules/2.4.0/kernel/drivers/net/ne.o_M3A+-249856/96]
[lvm_chr_ioctl+665/1652] [ext2_getblk+101/212] [sock_recvmsg+61/172]
<br>
Jan 26 01:07:08 tux kernel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
[ext2_bread+35/272] [dput+25/356] [permission+139/148]
[chrdev_open+100/172] [dentry_open+189/332] [filp_open+82/92]
[sys_ioctl+443/532] [system_call+51/56] <br>
Jan 26 01:07:08 tux kernel: <br>
Jan 26 01:07:08 tux kernel: Code: 8b 5c 08 68 85 db 74 39 8b 13 89 d0 3b
43 04 73 08 89 74 83 <br>
<br>
<br>
</font></html>
