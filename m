Return-Path: <lda@research.bell-labs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14998.55834.382892.124432@eagle.mh.lucent.com>
Date: Fri, 23 Feb 2001 16:46:02 -0500 (EST)
From: lvm@winux.com
Subject: Re: [linux-lvm] oops on 2.4.2 with lvm-0.9beta5 and Reiserfs 3.6.25
In-Reply-To: <703660000.982962984@tiny>
References: <14998.53544.642864.34288@eagle.mh.lucent.com>
	<703660000.982962984@tiny>
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

Chris Mason writes:
> This oops shows that somebody logged the super block without preparing it.
> Could you please run this data through ksymoops so I can track down the
> caller?

# dmesg | ksymoops -v /usr/src/linux/vmlinux -m /boot/System.map 
ksymoops 2.3.7 on i686 2.4.2.  Options used
     -v /usr/src/linux/vmlinux (specified)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.2/ (default)
     -m /boot/System.map (specified)

No modules in ksyms, skipping objects
Warning (read_lsmod): no symbols in lsmod, is /proc/modules a valid lsmod file?
Warning (compare_maps): mismatch on symbol partition_name  , ksyms_base says c01ee150, vmlinux says c0149cc0.  Ignoring ksyms_base entry
Unable to handle kernel NULL pointer dereference at virtual address 00000000
c011370b
*pde = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<c011370b>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010086
eax: c697b578   ebx: 00000000   ecx: 00000286   edx: c15bdd68
esi: c15bdd60   edi: c15bc000   ebp: c697bb90   esp: c15bdd48
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 134, stackpage=c15bd000)
Stack: c697b56c c15bdd60 c01079d9 c697ba00 c697b400 c6879000 00000001 c15bc000 
       c697b578 00000000 c0107b38 c697b56c c13b51a0 00000000 c023bf73 4004fe20 
       080989e0 c15bdf9c c6879000 c697ba00 00000001 c68794c4 00000004 c68794c4 
Call Trace: [<c01079d9>] [<c0107b38>] [<c023bf73>] [<c01f3724>] [<c013b967>] [<c0108e2f>] [<c010002b>] 
Code: 89 13 51 9d 5b 5e c3 89 f6 9c 58 fa 8b 4a 0c 8b 52 08 89 4a 

>>EIP; c011370b <add_wait_queue_exclusive+1f/28>   <=====
Trace; c01079d9 <__down+41/9c>
Trace; c0107b38 <__down_failed+8/c>
Trace; c023bf73 <stext_lock+f9b/1374>
Trace; c01f3724 <lvm_chr_ioctl+504/670>
Trace; c013b967 <sys_ioctl+16b/184>
Trace; c0108e2f <system_call+33/38>
Trace; c010002b <startup_32+2b/139>
Code;  c011370b <add_wait_queue_exclusive+1f/28>
0000000000000000 <_EIP>:
Code;  c011370b <add_wait_queue_exclusive+1f/28>   <=====
   0:   89 13                     mov    %edx,(%ebx)   <=====
Code;  c011370d <add_wait_queue_exclusive+21/28>
   2:   51                        push   %ecx
Code;  c011370e <add_wait_queue_exclusive+22/28>
   3:   9d                        popf   
Code;  c011370f <add_wait_queue_exclusive+23/28>
   4:   5b                        pop    %ebx
Code;  c0113710 <add_wait_queue_exclusive+24/28>
   5:   5e                        pop    %esi
Code;  c0113711 <add_wait_queue_exclusive+25/28>
   6:   c3                        ret    
Code;  c0113712 <add_wait_queue_exclusive+26/28>
   7:   89 f6                     mov    %esi,%esi
Code;  c0113714 <remove_wait_queue+0/14>
   9:   9c                        pushf  
Code;  c0113715 <remove_wait_queue+1/14>
   a:   58                        pop    %eax
Code;  c0113716 <remove_wait_queue+2/14>
   b:   fa                        cli    
Code;  c0113717 <remove_wait_queue+3/14>
   c:   8b 4a 0c                  mov    0xc(%edx),%ecx
Code;  c011371a <remove_wait_queue+6/14>
   f:   8b 52 08                  mov    0x8(%edx),%edx
Code;  c011371d <remove_wait_queue+9/14>
  12:   89 4a 00                  mov    %ecx,0x0(%edx)


2 warnings issued.  Results may not be reliable.
