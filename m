From: Ed Tomlinson <tomlins@CAM.ORG>
Date: Mon, 8 Oct 2001 11:53:46 -0400
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011008012906.D790A11069@oscar.casa.dyndns.org> <77260000.1002507094@tiny>
In-Reply-To: <77260000.1002507094@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011008155346.A741C76E3B@oscar.casa.dyndns.org>
Subject: [linux-lvm] [OOPS] full snapshot (with test vfs locking patch for reiserfs snapshots in 11-pre)
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
To: Chris Mason <mason@suse.com>
Cc: linux-lvm@sistina.com

Hi Chris,

To summerize, with 2.4.11-pre5 and lvm-1.01-rc4 + your test vfslocking patch 
for 2.4.11-pre I, unlike you, was able to make snapshots and reiserfsck them without 
problems.  Then I tried a debench 50 run and got an oops.

ksymoops 2.4.3 on i586 2.4.10-e1.  Options used
     -V (default)
     -k 20011008092859.ksyms (specified)
     -l 20011008092859.modules (specified)
     -o /lib/modules/2.4.11-pre5 (specified)
     -m /boot/System.map-2.4.11-pre5 (specified)

lvm -- giving up to snapshot /dev/lv/root on /dev/lv/snap: out of space
Unable to handle kernel NULL pointer dereference at virtual address 00000d68
d680a45c
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<d680a45c>]    Tainted: P 
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010246
eax: 00001fff   ebx: 00000d68   ecx: d36dac00   edx: 00000000
esi: 00105670   edi: 00002101   ebp: 00000000   esp: d220bdf8
ds: 0018   es: 0018   ss: 0018
Process syslogd (pid: 219, stackpage=d220b000)
Stack: d36dac00 d36dad70 d36da770 00e00000 00e00000 000001ad 00000058 00000000 
       d68075c0 d220be56 d220be58 00104470 d36dac00 00003a01 c1f6dd40 00005258 
       00e00000 c029ef28 c029eec0 d36da600 d36d1000 00104470 00000020 2101b7e0 
Call Trace: [<d68075c0>] [<d6807695>] [<c0185b4c>] [<c0185bb1>] [<c0185d07>] 
   [<c0164e69>] [<c01683ee>] [<c0167647>] [<c0155eac>] [<c012d8ce>] [<c0106d53>] 
Code: 8b 0b eb 03 45 8b 09 39 d9 74 27 39 71 08 75 f4 66 39 79 0c 

>>EIP; d680a45c <[lvm-mod]lvm_snapshot_remap_block+70/d4>   <=====
Trace; d68075c0 <[lvm-mod]lvm_map+3b0/478>
Trace; d6807694 <[lvm-mod]lvm_make_request_fn+c/1c>
Trace; c0185b4c <generic_make_request+130/140>
Trace; c0185bb0 <submit_bh+54/70>
Trace; c0185d06 <ll_rw_block+13a/1a0>
Trace; c0164e68 <flush_commit_list+208/388>
Trace; c01683ee <do_journal_end+746/9ec>
Trace; c0167646 <journal_end_sync+12/18>
Trace; c0155eac <reiserfs_sync_file+80/9c>
Trace; c012d8ce <sys_fsync+5e/8c>
Trace; c0106d52 <system_call+32/40>
Code;  d680a45c <[lvm-mod]lvm_snapshot_remap_block+70/d4>
00000000 <_EIP>:
Code;  d680a45c <[lvm-mod]lvm_snapshot_remap_block+70/d4>   <=====
   0:   8b 0b                     mov    (%ebx),%ecx   <=====
Code;  d680a45e <[lvm-mod]lvm_snapshot_remap_block+72/d4>
   2:   eb 03                     jmp    7 <_EIP+0x7> d680a462 <[lvm-mod]lvm_snapshot_remap_block+76/d4>
Code;  d680a460 <[lvm-mod]lvm_snapshot_remap_block+74/d4>
   4:   45                        inc    %ebp
Code;  d680a460 <[lvm-mod]lvm_snapshot_remap_block+74/d4>
   5:   8b 09                     mov    (%ecx),%ecx
Code;  d680a462 <[lvm-mod]lvm_snapshot_remap_block+76/d4>
   7:   39 d9                     cmp    %ebx,%ecx
Code;  d680a464 <[lvm-mod]lvm_snapshot_remap_block+78/d4>
   9:   74 27                     je     32 <_EIP+0x32> d680a48e <[lvm-mod]lvm_snapshot_remap_block+a2/d4>
Code;  d680a466 <[lvm-mod]lvm_snapshot_remap_block+7a/d4>
   b:   39 71 08                  cmp    %esi,0x8(%ecx)
Code;  d680a46a <[lvm-mod]lvm_snapshot_remap_block+7e/d4>
   e:   75 f4                     jne    4 <_EIP+0x4> d680a460 <[lvm-mod]lvm_snapshot_remap_block+74/d4>
Code;  d680a46c <[lvm-mod]lvm_snapshot_remap_block+80/d4>
  10:   66 39 79 0c               cmp    %di,0xc(%ecx)

Suspect there is a problem with snapshots filling in 2.4.11-pre with lvm 1.01-rc4 

Ed Tomlinson
