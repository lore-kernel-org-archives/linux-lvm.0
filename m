Return-Path: <stric@ing.umu.se>
Date: Wed, 29 Nov 2000 12:15:55 +0100
From: Tomas Ogren <stric@ing.umu.se>
Message-ID: <20001129121555.A20113@thelma.ing.umu.se>
References: <20001127171113.B9485@thelma.ing.umu.se> <20001128012356.H20735@srv.t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20001128012356.H20735@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Tue, Nov 28, 2000 at 01:23:56AM +0000
Subject: [linux-lvm] Re: Some brokenness in LVM 0.9 (on 2.2.18pre23) [long mail w/ oopses and patch]
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: "Heinz J. Mauelshagen" <Heinz.Mauelshagen@t-online.de>
Cc: mge@sistina.com, linux-lvm@sistina.com

On 28 November, 2000 - Heinz J. Mauelshagen sent me these 8.4K bytes:

> > Over to LVM...
> > 
> > I have found some various bugs in LVM 0.9 applied to a 2.2.18pre23
> > kernel (2.2.17 + pre23 + ide patches + rawio + lvm 0.9).
> > We know that 2.2.18pre might not be supported, but the code we've looked
> > at is visually broken (the code snip below) even in CVS.
[..]
> > With that fixed, I can add a pv into an existing vg.. but other things
> > breaks too which I have been unable to find (but I have Oops +
> > ksymoops).
> > 
> > After adding a 41G and 8G disk into one vg I tried creating an lv at 40G
> > (lvcreate -L40G -n leklv homevg) which resulted in the following oops:
> > 
> <SNIP>
> 
> This looks like a BUG in lvm_do_create_proc_entry_of_pv tampering with
> the pv_name within the pv.
> 
> Could you try the following patch and tell me if it fixes the problem.

It only fixes the problem I fixed myself..

Disk /dev/sdb: 255 heads, 63 sectors, 1106 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1      1106   8883913+  8e  Unknown

Disk /dev/hde: 16 heads, 63 sectors, 23819 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hde1             1     89355  45034888+  8e  Unknown
tekla-ng:~# pvcreate /dev/sdb1
pvcreate -- physical volume "/dev/sdb1" successfully created

tekla-ng:~# pvcreate /dev/hde1
pvcreate -- physical volume "/dev/hde1" successfully created

tekla-ng:~# vgcreate -s 32M homevg /dev/sdb1
vgcreate -- INFO: maximum logical volume size is 1 Terabyte
vgcreate -- doing automatic backup of volume group "homevg"
vgcreate -- volume group "homevg" successfully created and activated

tekla-ng:~# vgextend homevg /dev/hde1
vgextend -- INFO: maximum logical volume size is 1 Terabyte
vgextend -- doing automatic backup of volume group "homevg"
vgextend -- volume group "homevg" successfully extended

tekla-ng:~# lvcreate -L 40G -n leklv homevg
Segmentation fault
tekla-ng:~# vgdisplay 
--- Volume group ---
VG Name               homevg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           1 TB
Max PV                256
Cur PV                3
Act PV                3
VG Size               51.41 GB
PE Size               32 MB
Total PE              1645
Alloc PE / Size       1 / 32 MB
Free  PE / Size       1644 / 51.38 GB
VG UUID               WCjf6F-gg8H-cNTM-695r-eTwF-cqEi-3E7Vad


Oops as follows:

Unable to handle kernel NULL pointer dereference at virtual address 000001ac
current->tss.cr3 = 08f22000, %cr3 = 08f22000
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c01b1331>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax: ca830811   ebx: c9242200   ecx: 00000002   edx: 00000000
esi: 00000000   edi: 00000000   ebp: 00000000   esp: c8f21da4
ds: 0018   es: 0018   ss: 0018
Process lvcreate (pid: 232, process nr: 33, stackpage=c8f21000)
Stack: 00000000 bfffefd8 00000000 c9242200 c922a000 00000000 00000001 c01ae7e0 
       00000000 c0261bb8 c8f21dfc c90116c0 ffffffe7 4004fe20 bfffefd8 c8f21dfc 
       c8f20000 c8f20000 c922a000 00000400 00000000 00000801 7665642f 6d6f682f 
Call Trace: [<c01ae7e0>] [<c012c898>] [<c01ae24c>] [<c0107a9c>] [<c010002b>] 
Code: 66 39 82 ac 01 00 00 75 06 ff 82 cc 01 00 00 41 8b 5c 24 18 

>>EIP; c01b1331 <lvm_do_lv_create+319/794>   <=====
Trace; c01ae7e0 <lvm_chr_ioctl+594/72c>
Trace; c012c898 <sys_ioctl+1b0/1c8>
Trace; c01ae24c <lvm_chr_ioctl+0/72c>
Trace; c0107a9c <system_call+34/38>
Trace; c010002b <startup_32+2b/11d>
Code;  c01b1331 <lvm_do_lv_create+319/794>
00000000 <_EIP>:
Code;  c01b1331 <lvm_do_lv_create+319/794>   <=====
   0:   66 39 82 ac 01 00 00      cmp    %ax,0x1ac(%edx)   <=====
Code;  c01b1338 <lvm_do_lv_create+320/794>
   7:   75 06                     jne    f <_EIP+0xf> c01b1340 <lvm_do_lv_create+328/794>
Code;  c01b133a <lvm_do_lv_create+322/794>
   9:   ff 82 cc 01 00 00         incl   0x1cc(%edx)
Code;  c01b1340 <lvm_do_lv_create+328/794>
   f:   41                        inc    %ecx
Code;  c01b1341 <lvm_do_lv_create+329/794>
  10:   8b 5c 24 18               mov    0x18(%esp,1),%ebx


And it oopses just like in my last mail when I try to run vgchange -a n
at >>EIP; c01b1951 <lvm_do_lv_remove+1a5/24c>   <=====

The pointer 0x1ac seems to be popping up all the time.. I doubt it comes
from a good source..

/Tomas
-- 
Tomas �gren, stric@ing.umu.se, http://www.ing.umu.se/~stric/
|- Student at Computing Science, University of Ume�
`- Sysadmin@{cs,ing,acc}.umu.se
