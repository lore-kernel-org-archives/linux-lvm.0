Return-Path: <lda@winux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14999.11867.620413.838666@nv.winux.com>
Date: Fri, 23 Feb 2001 22:45:31 -0500
From: lvm@winux.com
Subject: Re: [linux-lvm] oops on 2.4.2 with lvm-0.9beta5 and Reiserfs 3.6.25
In-Reply-To: <726380000.982965372@tiny>
References: <14998.55834.382892.124432@eagle.mh.lucent.com>
	<726380000.982965372@tiny>
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
>> This oops shows that somebody logged the super block without preparing
>> it. Could you please run this data through ksymoops so I can track down
>> the caller?
>> 
>> # dmesg | ksymoops -v /usr/src/linux/vmlinux -m /boot/System.map 
> 
> Hmmm, probably not the right system.map.
> I think I see the bug though, please try this patch:
> 
> --- linux/fs/reiserfs/super.c.1	Fri Feb 23 16:30:55 2001
> +++ linux/fs/reiserfs/super.c	Fri Feb 23 16:31:39 2001
> @@ -68,6 +68,7 @@
>    lock_kernel() ;
>    if (!(s->s_flags & MS_RDONLY)) {
>      journal_begin(&th, s, 1) ;
> +    reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1) ;
>      journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
>      reiserfs_block_writes(&th) ;
>      journal_end(&th, s, 1) ;

This message doesn't show up any more:

journal-1777: buffer 16 bad state !PREPARED !LOCKED !DIRTY !JDIRTY_WAIT

but that definitely didn't fix it.   I get exactly the same oops behavior.

I'm working on a different machine now but it's acting the same way.
Here's the script I use to stimulate the problem.  I use /dev/sda4
as the target here.

[ WARNING! There should be NO live LVM volumes on this machine.
  This starts from scratch by blowing away LVM info and zapping the partition.
]


dd if=/dev/zero of=/dev/sda4 count=2k bs=4k
rm -rf /etc/lvm* /dev/lvm* /dev/vg*
vgscan
pvcreate /dev/sda4
vgcreate vg0 /dev/sda4
lvcreate -L 10g -n lv0 vg0
lvextend -L +2g /dev/vg0/lv0
mkreiserfs -q /dev/vg0/lv0
mount /dev/vg0/lv0 /mnt
echo hello world > /mnt/foo
lvcreate -L 1g -s -n s0 /dev/vg0/lv0

-----------------------------------------------------------------------

Because you questioned the validity of the System.map, I switched back
to the kernel version without the above patch, recompiled to generate
a bona fide System.map and ran the test again.  Here's the result.
Hope it helps.

# dmesg | ksymoops -v /usr/src/linux/vmlinux -m /boot/System.map 
ksymoops 2.3.7 on i686 2.4.2.  Options used
     -v /usr/src/linux/vmlinux (specified)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.2/ (default)
     -m /boot/System.map (specified)

Warning (compare_maps): mismatch on symbol partition_name  , ksyms_base says c01e7c70, vmlinux says c01474b0.  Ignoring ksyms_base entry
Unable to handle kernel NULL pointer dereference at virtual address 00000000
c0110efb
*pde = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<c0110efb>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010086
eax: cf84af78   ebx: 00000000   ecx: 00000286   edx: ce7b3d68
esi: ce7b3d60   edi: ce7b2000   ebp: cddcd590   esp: ce7b3d48
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 129, stackpage=ce7b3000)
Stack: cf84af6c ce7b3d60 c0107a29 cddcd400 cf84ae00 cfb1e000 00000001 ce7b2000 
       cf84af78 00000000 c0107b88 cf84af6c cfe6bce0 00000000 c022b685 4004fe20 
       0809bd60 ce7b3f9c cfb1e000 cddcd400 00000001 cfb1e4c4 00000004 cfb1e4c4 
Call Trace: [<c0107a29>] [<c0107b88>] [<c022b685>] [<c01ed244>] [<c0139157>] [<c0108e7f>] 
Code: 89 13 51 9d 5b 5e c3 89 f6 9c 58 fa 8b 4a 0c 8b 52 08 89 4a 

>>EIP; c0110efb <add_wait_queue_exclusive+1f/28>   <=====
Trace; c0107a29 <__down+41/9c>
Trace; c0107b88 <__down_failed+8/c>
Trace; c022b685 <stext_lock+f19/1176>
Trace; c01ed244 <lvm_chr_ioctl+504/670>
Trace; c0139157 <sys_ioctl+16b/184>
Trace; c0108e7f <system_call+33/38>
Code;  c0110efb <add_wait_queue_exclusive+1f/28>
0000000000000000 <_EIP>:
Code;  c0110efb <add_wait_queue_exclusive+1f/28>   <=====
   0:   89 13                     mov    %edx,(%ebx)   <=====
Code;  c0110efd <add_wait_queue_exclusive+21/28>
   2:   51                        push   %ecx
Code;  c0110efe <add_wait_queue_exclusive+22/28>
   3:   9d                        popf   
Code;  c0110eff <add_wait_queue_exclusive+23/28>
   4:   5b                        pop    %ebx
Code;  c0110f00 <add_wait_queue_exclusive+24/28>
   5:   5e                        pop    %esi
Code;  c0110f01 <add_wait_queue_exclusive+25/28>
   6:   c3                        ret    
Code;  c0110f02 <add_wait_queue_exclusive+26/28>
   7:   89 f6                     mov    %esi,%esi
Code;  c0110f04 <remove_wait_queue+0/14>
   9:   9c                        pushf  
Code;  c0110f05 <remove_wait_queue+1/14>
   a:   58                        pop    %eax
Code;  c0110f06 <remove_wait_queue+2/14>
   b:   fa                        cli    
Code;  c0110f07 <remove_wait_queue+3/14>
   c:   8b 4a 0c                  mov    0xc(%edx),%ecx
Code;  c0110f0a <remove_wait_queue+6/14>
   f:   8b 52 08                  mov    0x8(%edx),%edx
Code;  c0110f0d <remove_wait_queue+9/14>
  12:   89 4a 00                  mov    %ecx,0x0(%edx)


1 warning issued.  Results may not be reliable.
