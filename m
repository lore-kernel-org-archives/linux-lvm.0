From: Andrew Patterson <andrew@fc.hp.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1057789596.1368.28.camel@lvadplx>
Mime-Version: 1.0
Subject: [linux-lvm] Oops when running snapshots
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
Date: Wed Jul  9 17:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ran a load test last night where we created snapshots two snapshots
every 2 hours under heavy file system load.  We got the following oops:


Unable to handle kernel NULL pointer dereference at virtual address
00000000
802895f5
*pde = 55bd7001
Oops: 0002
CPU:    2
EIP:    0010:[<802895f5>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010206
eax: 00000000   ebx: f8ab2118   ecx: f8a79048   edx: f8a79030
esi: 00810180   edi: b4db0000   ebp: 00000820   esp: a2765c4c
ds: 0018   es: 0018   ss: 0018
Process vsftpd (pid: 7309, stackpage=a2765000)
Stack: b4db0000 b4db0170 f69b3170 00ea8000 00000080 00000006 00000070
00000000
       80286031 a2765caa a2765cac 00810180 b4db0000 00003a02 e338c840
00800070
      00ea8000 00000000 00000000 f69b3000 f68a0000 00810180 00000800
08208cbc
Call Trace: [<80286031>]  [<80286117>]  [<80219ccc>]  [<80219d41>] 
[<801d209f>]
  [<801d26eb>]  [<801d2ac7>]  [<801d2b2a>]  [<801387fd>]  [<801d2952>] 
[<80139b
1d327e>]  [<80137807>]  [<80106f27>]
Code: 89 10 c7 01 00 00 00 00 c7 41 04 00 00 00 00 8b 03 89 48 04


>>EIP; 802895f5 <lvm_snapshot_remap_block+a9/f8>   <=====

>>ebx; f8ab2118 <[nfstracker].bss.end+490c5/ffe98fa9>
>>ecx; f8a79048 <[nfstracker].bss.end+fff5/ffe98fa9>
>>edx; f8a79030 <[nfstracker].bss.end+ffdd/ffe98fa9>
>>edi; b4db0000 <_end+3499065c/7847565c>
>>esp; a2765c4c <_end+223462a8/7847565c>

Trace; 80286031 <lvm_map+3b9/490>
Trace; 80286117 <lvm_make_request_fn+f/1c>
Trace; 80219ccc <generic_make_request+11c/12c>
Trace; 80219d41 <submit_bh+65/80>
Trace; 801d209f <submit_page+57/74>
Trace; 801d26eb <page_state_convert+40b/4a0>
Trace; 801d2ac7 <linvfs_writepage+3b/e0>
Trace; 801d2b2a <linvfs_writepage+9e/e0>
Trace; 801387fd <write_some_buffers+9d/14c>
Trace; 801d2952 <linvfs_get_block+1e/24>

Code;  802895f5 <lvm_snapshot_remap_block+a9/f8>
00000000 <_EIP>:
Code;  802895f5 <lvm_snapshot_remap_block+a9/f8>   <=====
   0:   89 10                     mov    %edx,(%eax)   <=====
Code;  802895f7 <lvm_snapshot_remap_block+ab/f8>
   2:   c7 01 00 00 00 00         movl   $0x0,(%ecx)
Code;  802895fd <lvm_snapshot_remap_block+b1/f8>
Trace; 80219d41 <submit_bh+65/80>
Trace; 801d209f <submit_page+57/74>
Trace; 801d26eb <page_state_convert+40b/4a0>
Trace; 801d2ac7 <linvfs_writepage+3b/e0>
Trace; 801d2b2a <linvfs_writepage+9e/e0>
Trace; 801387fd <write_some_buffers+9d/14c>
Trace; 801d2952 <linvfs_get_block+1e/24>

Code;  802895f5 <lvm_snapshot_remap_block+a9/f8>
00000000 <_EIP>:
Code;  802895f5 <lvm_snapshot_remap_block+a9/f8>   <=====
   0:   89 10                     mov    %edx,(%eax)   <=====
Code;  802895f7 <lvm_snapshot_remap_block+ab/f8>
   2:   c7 01 00 00 00 00         movl   $0x0,(%ecx)
Code;  802895fd <lvm_snapshot_remap_block+b1/f8>
   8:   c7 41 04 00 00 00 00      movl   $0x0,0x4(%ecx)
Code;  80289604 <lvm_snapshot_remap_block+b8/f8>
   f:   8b 03                     mov    (%ebx),%eax
Code;  80289606 <lvm_snapshot_remap_block+ba/f8>
  11:   89 48 04                  mov    %ecx,0x4(%eax)


10 warnings issued.  Results may not be reliable.

This was run on a 2.4.21 system using LVM 1.0.7.  The system has 2GB of
memory and is configured with HIGHME64G.  We are running the latest
2.4.21 XFS and are using xfs_freeze to quiesce the file system.  We are
not using the VFS_LOCK patch.

Anyone have any ideas what may be causing this?

Thanks,

Andrew

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard Company                   Email:  andrew@fc.hp.com
