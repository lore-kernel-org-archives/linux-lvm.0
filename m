Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2IGVLj25736
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 11:31:21 -0500
Received: from hisser.org (hermes.hisser.org [62.49.72.126])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2IGVG4b005091
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 11:31:18 -0500
Message-ID: <4059CECE.1080203@hisser.org>
Date: Thu, 18 Mar 2004 16:31:10 +0000
From: James Pattinson <jamesp@hisser.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] OOPS: Kernel Oops using LVM2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi All

I am just playing around with LVM2 before I upgrade my live system to 
2.6.x. I am using a VMWare virtual machine running gentoo with the 
latest gentoo kernel tree, and device_mapper 1.00.08 and LVM2 2.00.08. I 
pvcreate a whole disk (4GB) then create a VG and lvcreate an lv filling 
the whole disk.

When I try to format the new LV the kernel oopses once, then again a 
short time afterwards.

Below are the two Oopses ksymoops'd. Could someone please have a look at 
this for me - anything else you need to know?

Thanks
James

Oops: 0002
CPU:    0
EIP:    0010:[<c02b41e6>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00000202
eax: 00000001   ebx: c0177164   ecx: 0000fe00   edx: c27f8000
esi: 00000001   edi: c22ddd80   ebp: 00000001   esp: c4da5e2c
ds: 0018   es: 0018   ss: 0018
Process mke2fs (pid: 1347, stackpage=c4da5000)
Stack: c02b3711 00000001 c22ddd80 003ff000 c02b3a92 0000fe00 00000000 
00000002
        00000310 cfe04280 c22ddd80 003ff000 00000002 00000001 c02566ba 
c0166f00
        00000001 c22ddd80 c87ac580 c87ac600 00000192 c22ddd80 00000002 
00000001
Call Trace:    [<c02b3711>] [<c02b3a92>] [<c02566ba>] [<c0256771>] 
[<c01cc33b>]
   [<c01cc4bf>] [<c01cc4f8>] [<c01cc644>] [<c01d1e9c>] [<c01cca9a>] 
[<c0199cdf>]
Code: ff 40 0c c3 83 ec 08 89 5c 24 04 8b 5c 24 0c ff 4b 0c 0f 94


 >>EIP; c02b41e6 <dm_get+4/8>   <=====

 >>ebx; c0177164 <_dev_lock+0/1c>
 >>edx; c27f8000 <_end+24951e8/104e2248>
 >>edi; c22ddd80 <_end+1f7af68/104e2248>
 >>esp; c4da5e2c <_end+4a43014/104e2248>

Trace; c02b3711 <get_kdev+41/5f>
Trace; c02b3a92 <dm_request+1b/1c1>
Trace; c02566ba <generic_make_request+e0/130>
Trace; c0256771 <submit_bh+67/b6>
Trace; c01cc33b <write_locked_buffers+29/34>
Trace; c01cc4bf <write_some_buffers+179/195>
Trace; c01cc4f8 <write_unlocked_buffers+1d/27>
Trace; c01cc644 <sync_buffers+15/71>
Trace; c01d1e9c <__block_fsync+33/61>
Trace; c01cca9a <sys_fsync+94/c6>
Trace; c0199cdf <ret+0/5>

Code;  c02b41e6 <dm_get+4/8>
00000000 <_EIP>:
Code;  c02b41e6 <dm_get+4/8>   <=====
    0:   ff 40 0c                  incl   0xc(%eax)   <=====
Code;  c02b41e9 <dm_get+7/8>
    3:   c3                        ret
Code;  c02b41ea <dm_put+0/46>
    4:   83 ec 08                  sub    $0x8,%esp
Code;  c02b41ed <dm_put+3/46>
    7:   89 5c 24 04               mov    %ebx,0x4(%esp,1)
Code;  c02b41f1 <dm_put+7/46>
    b:   8b 5c 24 0c               mov    0xc(%esp,1),%ebx
Code;  c02b41f5 <dm_put+b/46>
    f:   ff 4b 0c                  decl   0xc(%ebx)
Code;  c02b41f8 <dm_put+e/46>
   12:   0f 94 00                  sete   (%eax)

Second Ooops:

Oops: 0002
CPU:    0
EIP:    0010:[<c02b41e6>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00000202
eax: 00000001   ebx: c0177164   ecx: 0000fe00   edx: c27f8000
esi: 00000001   edi: c22d5100   ebp: 00000001   esp: cfed5e8c
ds: 0018   es: 0018   ss: 0018
Process kupdated (pid: 6, stackpage=cfed5000)
Stack: c02b3711 00000001 c22d5100 003ff000 c02b3a92 0000fe00 00000001 
cfed5f1c
        cfed5eac cfed5eac c22d5100 003ff000 00000002 00000001 c02566ba 
c0166f00
        00000001 c22d5100 00000000 00000001 00000198 c22d5100 00000002 
00000001
Call Trace:    [<c02b3711>] [<c02b3a92>] [<c02566ba>] [<c0256771>] 
[<c01cc33b>]
   [<c01cc4bf>] [<c01cfc15>] [<c01cff8f>] [<c01983f7>] [<c01cfe89>]
Code: ff 40 0c c3 83 ec 08 89 5c 24 04 8b 5c 24 0c ff 4b 0c 0f 94


 >>EIP; c02b41e6 <dm_get+4/8>   <=====

 >>ebx; c0177164 <_dev_lock+0/1c>
 >>edx; c27f8000 <_end+24951e8/104e2248>
 >>edi; c22d5100 <_end+1f722e8/104e2248>
 >>esp; cfed5e8c <_end+fb73074/104e2248>

Trace; c02b3711 <get_kdev+41/5f>
Trace; c02b3a92 <dm_request+1b/1c1>
Trace; c02566ba <generic_make_request+e0/130>
Trace; c0256771 <submit_bh+67/b6>
Trace; c01cc33b <write_locked_buffers+29/34>
Trace; c01cc4bf <write_some_buffers+179/195>
Trace; c01cfc15 <sync_old_buffers+72/c2>
Trace; c01cff8f <kupdate+106/148>
Trace; c01983f7 <arch_kernel_thread+2b/3d>
Trace; c01cfe89 <kupdate+0/148>

Code;  c02b41e6 <dm_get+4/8>
00000000 <_EIP>:
Code;  c02b41e6 <dm_get+4/8>   <=====
    0:   ff 40 0c                  incl   0xc(%eax)   <=====
Code;  c02b41e9 <dm_get+7/8>
    3:   c3                        ret
Code;  c02b41ea <dm_put+0/46>
    4:   83 ec 08                  sub    $0x8,%esp
Code;  c02b41ed <dm_put+3/46>
    7:   89 5c 24 04               mov    %ebx,0x4(%esp,1)
Code;  c02b41f1 <dm_put+7/46>
    b:   8b 5c 24 0c               mov    0xc(%esp,1),%ebx
Code;  c02b41f5 <dm_put+b/46>
    f:   ff 4b 0c                  decl   0xc(%ebx)
Code;  c02b41f8 <dm_put+e/46>
   12:   0f 94 00                  sete   (%eax)
