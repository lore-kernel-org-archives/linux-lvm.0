Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F0BC@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
MIME-Version: 1.0
Subject: [linux-lvm] oops umounting full LVM snapshots
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
Date: Fri Feb 22 15:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I have recreated my oops umounting full LVM snapshots of an XFS filesystem.
I updated to use a more recent system:

xfs CVS tree from Feb 20th
LVM 1.0.3 (just released)
linux-2.4.11-VFS-lock.patch
compiled with kgcc.

Scenario: make two snapshots of xfs filesystem.  Mount them both ro, nouuid,
norecovery.  Add files to filesystem until the snapshots are full
(invalidated -- any further access should just return an I/O error).  Umount
the first snapshot, then the second snapshot.  I get log entries complaining
about the I/O error in each umount, and the second one also oopses.

I performed the same sequence of events twice with two snapshots of an ext2
filesystem.  No oops, no errors, no complaints in the log.

Here are the log messages preceding the oops:
<6> Feb 22 14:20:47 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
on /dev/volgr0/lvol1: out of space 
<6> Feb 22 14:20:47 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
on /dev/volgr0/lvol2: out of space 
<6> Feb 22 14:21:00 CROND[1106]: (root) CMD (/bin/snapsched) 
<1> Feb 22 14:21:35 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol1 
<1> Feb 22 14:21:35 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol1 
<4> Feb 22 14:21:35 kernel: I/O error in filesystem ("lvm(58,1)") meta-data
dev 0x3a01 block 0x1400020 
<4> Feb 22 14:21:35 kernel:        ("xlog_iodone") error 5 buf count 1024 
<4> Feb 22 14:21:35 kernel: xfs_force_shutdown(lvm(58,1),0x2) called from
line 939 of file xfs_log.c.  Return address = 0xc01b495e 
<4> Feb 22 14:21:35 kernel: Log I/O Error Detected.  Shutting down
filesystem: lvm(58,1) 
<4> Feb 22 14:21:35 kernel: Please umount the filesystem, and rectify the
problem(s) 
<1> Feb 22 14:21:40 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol2 
<1> Feb 22 14:21:40 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol2 
<4> Feb 22 14:21:40 kernel: I/O error in filesystem ("lvm(58,2)") meta-data
dev 0x3a02 block 0x1400020 
<4> Feb 22 14:21:40 kernel:        ("xlog_iodone") error 5 buf count 1024 
<4> Feb 22 14:21:40 kernel: xfs_force_shutdown(lvm(58,2),0x2) called from
line 939 of file xfs_log.c.  Return address = 0xc01b495e 
<4> Feb 22 14:21:40 kernel: Log I/O Error Detected.  Shutting down
filesystem: lvm(58,2) 
<4> Feb 22 14:21:40 kernel: Please umount the filesystem, and rectify the
problem(s) 

The oops follows in the log at 14:21:40.  I ran it through ksymoops on my
build machine using a copy of /proc/ksyms:

ksymoops 2.4.0 on i686 2.4.9-2buildsmp.  Options used
     -V (default)
     -k ksyms (specified)
     -L (specified)
     -O (specified)
     -M (specified)

Error (expand_objects): cannot
stat(/lib/modules/2.4.17-1snap/kernel/net/appletalk/appletalk.o) for
appletalk
Error (expand_objects): cannot
stat(/lib/modules/2.4.17-1snap/kernel/drivers/net/eepro100.o) for eepro100
Unable to handle kernel NULL pointer dereference at virtual address 00000020

c012ea13 
*pde = 00000000 
Oops: 0000 
CPU:    0 
EIP:    0010:[<c012ea13>]    Not tainted 
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010206 
eax: 00000000   ebx: 00000000   ecx: 00003a02   edx: 00003a02 
esi: 00000006   edi: 00000000   ebp: 00000000   esp: c1615e8c 
ds: 0018   es: 0018   ss: 0018 
Process umount (pid: 1118, stackpage=c1615000) 
Stack: c3e3e460 c3c99800 c3b8b360 00000000 3a020168 00000000 c012eaf8
c3e3e460  
       00000001 c3756220 c01d2270 00003a02 00000001 c3c99800 c01bc7d7
c3756220  
       00000000 c3c99800 c01c3e61 c3c99800 00000001 c03485c0 00000000
c3c99800  
Call Trace: [<c012eaf8>] [<c01d2270>] [<c01bc7d7>] [<c01c3e61>] [<c01d2c9a>]

   [<c01da79c>] [<c0131eb8>] [<c014090e>] [<c013579f>] [<c0140f61>]
[<c01204f5>]  
   [<c0140f7c>] [<c0106d7b>]  
Code: 8b 53 20 89 54 24 14 0f b7 54 24 12 66 39 53 0c 75 7b 83 7b  

>>EIP; c012ea13 <invalidate_bdev+3f/104>   <=====
Trace; c012eaf8 <__invalidate_buffers+20/7c>
Trace; c01d2270 <pagebuf_target_clear+10/2c>
Trace; c01bc7d7 <load_nls_default+5217f/65270>
Trace; c01c3e61 <load_nls_default+59809/65270>
Trace; c01d2c9a <pagebuf_unlock+a0e/9304>
Trace; c01da79c <pagebuf_unlock+8510/9304>
Trace; c0131eb8 <get_super+9f8/c98>
Trace; c014090e <__mntput+1e/3fc>
Trace; c013579f <path_release+27/144>
Trace; c0140f61 <may_umount+275/fa4>
Trace; c01204f5 <do_munmap+279/298>
Trace; c0140f7c <may_umount+290/fa4>
Trace; c0106d7b <__up_wakeup+1057/2274>
Code;  c012ea13 <invalidate_bdev+3f/104>
00000000 <_EIP>:
Code;  c012ea13 <invalidate_bdev+3f/104>   <=====
   0:   8b 53 20                  mov    0x20(%ebx),%edx   <=====
Code;  c012ea16 <invalidate_bdev+42/104>
   3:   89 54 24 14               mov    %edx,0x14(%esp,1)
Code;  c012ea1a <invalidate_bdev+46/104>
   7:   0f b7 54 24 12            movzwl 0x12(%esp,1),%edx
Code;  c012ea1f <invalidate_bdev+4b/104>
   c:   66 39 53 0c               cmp    %dx,0xc(%ebx)
Code;  c012ea23 <invalidate_bdev+4f/104>
  10:   75 7b                     jne    8d <_EIP+0x8d> c012eaa0
<invalidate_bdev+cc/104>
Code;  c012ea25 <invalidate_bdev+51/104>
  12:   83 7b 00 00               cmpl   $0x0,0x0(%ebx)


2 errors issued.  Results may not be reliable.

I have also generated an oops with the same build by filling a single
snapshot of an xfs file system, umounting it, and doing an lvscan.  Again,
the same procedure is not a problem with ext2.

Here's the log and oops from that sequence.

<6> Feb 21 14:35:14 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
on /dev/volgr0/lvol4: out of space 
<1> Feb 21 14:50:25 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol4 
<1> Feb 21 14:50:25 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol4 
<4> Feb 21 14:50:25 kernel: I/O error in filesystem ("lvm(58,4)") meta-data
dev 0x3a04 block 0x1400020 
<4> Feb 21 14:50:25 kernel:        ("xlog_iodone") error 5 buf count 1024 
<4> Feb 21 14:50:25 kernel: xfs_force_shutdown(lvm(58,4),0x2) called from
line 939 of file xfs_log.c.  Return address = 0xc01b495e 
<4> Feb 21 14:50:25 kernel: Log I/O Error Detected.  Shutting down
filesystem: lvm(58,4) 
<4> Feb 21 14:50:25 kernel: Please umount the filesystem, and rectify the
problem(s) 

The oops occured shortly thereafter when I ran lvscan.  I ran it through
ksymoops on my build machine using a copy of /proc/ksyms:

ksymoops 2.4.0 on i686 2.4.9-2buildsmp.  Options used
     -V (default)
     -k ksyms (specified)
     -L (specified)
     -O (specified)
     -M (specified)

Error (expand_objects): cannot
stat(/lib/modules/2.4.17-1snap/kernel/net/appletalk/appletalk.o) for
appletalk
Error (expand_objects): cannot
stat(/lib/modules/2.4.17-1snap/kernel/drivers/net/eepro100.o) for eepro100
Unable to handle kernel NULL pointer dereference at virtual address 00000020

c012ea13 
*pde = 00000000 
Oops: 0000 
CPU:    0 
EIP:    0010:[<c012ea13>]    Not tainted 
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202 
eax: 00000000   ebx: 00000000   ecx: 00000000   edx: 00001600 
esi: 00000191   edi: 00000000   ebp: 00000000   esp: c26e9f28 
ds: 0018   es: 0018   ss: 0018 
Process lvscan (pid: 1409, stackpage=c26e9000) 
Stack: c3e3e420 c24f62a0 c3e3e43c 00000000 16006350 00000000 c0132225
c3e3e420  
       00000001 c3e3e420 c0132d75 c3e3e420 c21ce2c0 c1c4dc20 c3ea52a0
c3ccf7e0  
       c0132dde c3e3e420 00000000 c012e014 c1c4dc20 c21ce2c0 c21ce2c0
00000000  
Call Trace: [<c0132225>] [<c0132d75>] [<c0132dde>] [<c012e014>] [<c012d0ec>]

   [<c012d137>] [<c0106d7b>]  
Code: 8b 53 20 89 54 24 14 0f b7 54 24 12 66 39 53 0c 75 7b 83 7b  

>>EIP; c012ea13 <invalidate_bdev+3f/104>   <=====
Trace; c0132225 <kern_mount+cd/e8>
Trace; c0132d75 <blkdev_put+51/f4>
Trace; c0132dde <blkdev_put+ba/f4>
Trace; c012e014 <fput+4c/d0>
Trace; c012d0ec <filp_close+58/60>
Trace; c012d137 <sys_close+43/84>
Trace; c0106d7b <__up_wakeup+1057/2274>
Code;  c012ea13 <invalidate_bdev+3f/104>
00000000 <_EIP>:
Code;  c012ea13 <invalidate_bdev+3f/104>   <=====
   0:   8b 53 20                  mov    0x20(%ebx),%edx   <=====
Code;  c012ea16 <invalidate_bdev+42/104>
   3:   89 54 24 14               mov    %edx,0x14(%esp,1)
Code;  c012ea1a <invalidate_bdev+46/104>
   7:   0f b7 54 24 12            movzwl 0x12(%esp,1),%edx
Code;  c012ea1f <invalidate_bdev+4b/104>
   c:   66 39 53 0c               cmp    %dx,0xc(%ebx)
Code;  c012ea23 <invalidate_bdev+4f/104>
  10:   75 7b                     jne    8d <_EIP+0x8d> c012eaa0
<invalidate_bdev+cc/104>
Code;  c012ea25 <invalidate_bdev+51/104>
  12:   83 7b 00 00               cmpl   $0x0,0x0(%ebx)


2 errors issued.  Results may not be reliable.

I would appreciate any insights.  Is anyone else using xfs with lvm and
seeing this behavior (or not seeing this behavior)?

Dale Stephenson
steph@snapserver.com
