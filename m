Return-Path: <Robert_Macaulay@Dell.com>
Message-ID: <8F120FA493CAD743B30EEB8F356985B5BB57D5@AUSXMBT102VS1.amer.dell.com>
From: Robert_Macaulay@Dell.com
Subject: RE: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Date: Thu, 28 Jun 2001 16:46:10 -0500
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

About the Raid 1.

I had a 4G RAM box(HIMEM64 enabled) with Hardware RAID 1 and LVM beta7,
kernel is from RH 7.1, version 2.4.3-6.

I added 4GB of RAM, kept the kernel the same, and switched to Software RAID
1. Now, I'm getting all sorts of instabilities. For example, I had a APIC
error fly by. umount core dumped. pvscan crashed twice and worked on the
third try(but saw a fraction to the disks, the 4th shot saw them all).
crond randomly crashed. I have the oops from the crond dump, but looked
fairly innocent of lvm code.

I know I changed 2 variables(RAM and RAID). I'm going to go back to HW raid
1 for now, and see if it makes a difference.

Just wondering if this has been seen, and if anyone knows what could have
caused it. The oops follows.

Robert



Unable to handle kernel paging request at virtual address 2e2e3e83
c0144078
Oops: 0000
CPU:    0
EIP:    0010:[<c0144078>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax: 2e2e3e5b   ebx: ccf0dd60   ecx: e839d700   edx: e8123f54
esi: 00000000   edi: e81832c0   ebp: e821f00c   esp: e8123f34
ds: 0018   es: 0018   ss: 0018
Process crond (pid: 817, stackpage=e8123000)
Stack: 000041ed 00000009 00000000 ccf0dd60 00000000 00001000 fffffff4
e821f000
       e821f005 00000007 0af98a86 0804c702 00000000 e821f000 e8123f9c
bffff758
       c014462a e821f000 e8123f9c e8122000 bffffbe0 00000003 c0140ff3
0804c702
Call Trace: [<c014462a>] [<c0140ff3>] [<c012035b>] [<c0106f3b>]
Code: 8b 40 28 85 c0 74 71 be 00 e0 ff ff 21 e6 8b 86 40 03 00 00

>>EIP; c0144078 <path_walk+748/8b0>   <=====
Trace; c014462a <__user_walk+3a/60>
Trace; c0140ff3 <sys_stat64+13/70>
Trace; c012035b <sys_nanosleep+11b/190>
Trace; c0106f3b <system_call+33/38>
Code;  c0144078 <path_walk+748/8b0>
00000000 <_EIP>:
Code;  c0144078 <path_walk+748/8b0>   <=====
   0:   8b 40 28                  mov    0x28(%eax),%eax   <=====
Code;  c014407b <path_walk+74b/8b0>
   3:   85 c0                     test   %eax,%eax
Code;  c014407d <path_walk+74d/8b0>
   5:   74 71                     je     78 <_EIP+0x78> c01440f0
<path_walk+7c0/8b0>
Code;  c014407f <path_walk+74f/8b0>
   7:   be 00 e0 ff ff            mov    $0xffffe000,%esi
Code;  c0144084 <path_walk+754/8b0>
   c:   21 e6                     and    %esp,%esi
Code;  c0144086 <path_walk+756/8b0>
   e:   8b 86 40 03 00 00         mov    0x340(%esi),%eax
