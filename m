Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F08F@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
    boundary="----_=_NextPart_000_01C1B0DA.3DC711A0"
Subject: [linux-lvm] Oops unmounting snapshot of xfs filesystem
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
Date: Fri Feb  8 13:51:02 2002
List-Id: <linux-lvm.redhat.com>
To: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C1B0DA.3DC711A0
Content-Type: text/plain;
	charset="iso-8859-1"

I have been running into an oops when umounting the snapshot of an xfs
filesystem, or following the umount.  For instance, a umount followed by an
lvremove will oops in the lvremove, while a mount/umount/mount/umount
sequence will oops on the second or third umount.

What does seem consistent is the error message logged on each umount.  Here
are the messages from a mount/umount sequence:

<4> Feb  7 11:20:00 kernel: Mounting filesystem "lvm(58,1)" in no-recovery
mode.  Filesystem will be inconsistent. 
<2> Feb  7 11:20:02 kernel: lvm - lvm_map: ll_rw_blk write for readonly LV
/dev/volgr0/lvol1 
<2> Feb  7 11:20:02 kernel: lvm - lvm_map: ll_rw_blk write for readonly LV
/dev/volgr0/lvol1 
<4> Feb  7 11:20:02 kernel: I/O error in filesystem ("lvm(58,1)") meta-data
dev 0x3a01 block 0xa00020 
<4> Feb  7 11:20:02 kernel:        ("xlog_iodone") error 5 buf count 1024 
<4> Feb  7 11:20:02 kernel: xfs_force_shutdown(lvm(58,1),0x2) called from
line 939 of file xfs_log.c.  Return address = 0xc01b3cbc 
<4> Feb  7 11:20:02 kernel: Log I/O Error Detected.  Shutting down
filesystem: lvm(58,1) 
<4> Feb  7 11:20:02 kernel: Please umount the filesystem, and rectify the
problem(s) 

I've attached the oops (run through ksymoops) from this particular umount.
The snapshot is mounted ro,nouuid,norecovery.  The source of the snapshot
contains an unmounted xfs filesystem, which was unmounted at the time of
snapshot creation.  There has been no intentional I/O activity to the
snapshot, either.

It looks to me like xfs is trying to flush something to disk on the umount,
even though the filesystem is read only and no recovery.  I would not have
expected this.  Is it correct behavior?

I made the snapshot writeable, but kept the mount options the same.  I was
able to mount/umount many times without oops, I/O errors, or
xfs_force_shutdown.

I did notice similar behavior when a full snapshot returns an I/O error --
xfs_force_shutdown, with an oops following soon thereafter.

System details:
Celeron with 512 MB of RAM and WD 45GB harddrives.
128 MB swap, one vg consisting of a one-drive RAID 0.
Kernel 2.4.16 with 12/14/01 xfs CVS.
LVM CVS of 1/21/02 (functionally identical to 1.0.2, I believe).
LVM's linux-2.4.11-VFS-lock.patch.
xfs_fs_freeze() patch posted by Eric Sandeen.
Anselm Kruis' writable snapshot patch.

Dale J. Stephenson
steph@snapserver.com


------_=_NextPart_000_01C1B0DA.3DC711A0
Content-Type: application/octet-stream;
	name="oops.out"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="oops.out"

ksymoops 2.4.0 on i686 2.4.9-2buildsmp.  Options used=0A=
     -V (default)=0A=
     -k ksyms (specified)=0A=
     -L (specified)=0A=
     -O (specified)=0A=
     -M (specified)=0A=
=0A=
Error (expand_objects): cannot =
stat(/lib/modules/2.4.16-2snap/kernel/net/appletalk/appletalk.o) for =
appletalk=0A=
Error (expand_objects): cannot =
stat(/lib/modules/2.4.16-2snap/kernel/drivers/i2c/adm1024.o) for =
adm1024=0A=
Error (expand_objects): cannot =
stat(/lib/modules/2.4.16-2snap/kernel/drivers/i2c/i2c-proc.o) for =
i2c-proc=0A=
Error (expand_objects): cannot =
stat(/lib/modules/2.4.16-2snap/kernel/drivers/i2c/i2c-dev.o) for =
i2c-dev=0A=
Error (expand_objects): cannot =
stat(/lib/modules/2.4.16-2snap/kernel/drivers/i2c/i2c-core.o) for =
i2c-core=0A=
Error (expand_objects): cannot =
stat(/lib/modules/2.4.16-2snap/kernel/drivers/net/eepro100.o) for =
eepro100=0A=
Unable to handle kernel NULL pointer dereference at virtual address =
00000020 =0A=
c012ffe3 =0A=
*pde =3D 00000000 =0A=
Oops: 0000 =0A=
CPU:    0 =0A=
EIP:    0010:[<c012ffe3>]    Not tainted =0A=
Using defaults from ksymoops -t elf32-i386 -a i386=0A=
EFLAGS: 00010206 =0A=
eax: 00003a01   ebx: 00000000   ecx: 00000160   edx: 00000000 =0A=
esi: 00000011   edi: 00000000   ebp: 00000000   esp: c2217d48 =0A=
ds: 0018   es: 0018   ss: 0018 =0A=
Process umount (pid: 2010, stackpage=3Dc2217000) =0A=
Stack: 00003a01 00000000 00000000 c0133dc4 00003a01 c033b120 00000160 =
c3e40360  =0A=
       00000001 c2216000 c132e000 c01300df c3e40360 00000001 c3722200 =
00000000  =0A=
       c016fb50 00003a01 00000001 00000000 c01cab1d c3722200 c132e000 =
c1240000  =0A=
Call Trace: [<c0133dc4>] [<c01300df>] [<c016fb50>] [<c01cab1d>] =
[<c01b3cbc>]  =0A=
   [<c016c628>] [<c016cfa5>] [<c01b3cf4>] [<c01b4407>] [<c01c93d2>] =
[<c01bfb31>]  =0A=
   [<c01b3b8b>] [<c01b5834>] [<c01b598c>] [<c01b35e9>] [<c01bb211>] =
[<c01c25ea>]  =0A=
   [<c01cc2e4>] [<c01d33cf>] [<c01335ac>] [<c0136f78>] [<c0142a71>] =
[<c012e573>]  =0A=
   [<c0121752>] [<c0142a8c>] [<c0106efb>]  =0A=
Code: 8b 7b 20 66 39 43 0c 0f 85 86 00 00 00 8b 53 30 85 d2 0f 84  =0A=
=0A=
>>EIP; c012ffe3 <invalidate_bdev+53/130>   <=3D=3D=3D=3D=3D=0A=
Trace; c0133dc4 <bdget+34/120>=0A=
Trace; c01300df <__invalidate_buffers+1f/a0>=0A=
Trace; c016fb50 <pagebuf_target_clear+10/30>=0A=
Trace; c01cab1d <pagebuf_unlock+5afad/64440>=0A=
Trace; c01b3cbc <pagebuf_unlock+4414c/64440>=0A=
Trace; c016c628 <pagebuf_iodone+38/80>=0A=
Trace; c016cfa5 <pagebuf_iorequest+115/150>=0A=
Trace; c01b3cf4 <pagebuf_unlock+44184/64440>=0A=
Trace; c01b4407 <pagebuf_unlock+44897/64440>=0A=
Trace; c01c93d2 <pagebuf_unlock+59862/64440>=0A=
Trace; c01bfb31 <pagebuf_unlock+4ffc1/64440>=0A=
Trace; c01b3b8b <pagebuf_unlock+4401b/64440>=0A=
Trace; c01b5834 <pagebuf_unlock+45cc4/64440>=0A=
Trace; c01b598c <pagebuf_unlock+45e1c/64440>=0A=
Trace; c01b35e9 <pagebuf_unlock+43a79/64440>=0A=
Trace; c01bb211 <pagebuf_unlock+4b6a1/64440>=0A=
Trace; c01c25ea <pagebuf_unlock+52a7a/64440>=0A=
Trace; c01cc2e4 <pagebuf_unlock+5c774/64440>=0A=
Trace; c01d33cf <pagebuf_unlock+6385f/64440>=0A=
Trace; c01335ac <get_super+9fc/ca0>=0A=
Trace; c0136f78 <path_release+28/140>=0A=
Trace; c0142a71 <may_umount+261/7d10>=0A=
Trace; c012e573 <filp_close+53/60>=0A=
Trace; c0121752 <do_munmap+292/2b0>=0A=
Trace; c0142a8c <may_umount+27c/7d10>=0A=
Trace; c0106efb <__up_wakeup+112f/2474>=0A=
Code;  c012ffe3 <invalidate_bdev+53/130>=0A=
00000000 <_EIP>:=0A=
Code;  c012ffe3 <invalidate_bdev+53/130>   <=3D=3D=3D=3D=3D=0A=
   0:   8b 7b 20                  mov    0x20(%ebx),%edi   =
<=3D=3D=3D=3D=3D=0A=
Code;  c012ffe6 <invalidate_bdev+56/130>=0A=
   3:   66 39 43 0c               cmp    %ax,0xc(%ebx)=0A=
Code;  c012ffea <invalidate_bdev+5a/130>=0A=
   7:   0f 85 86 00 00 00         jne    93 <_EIP+0x93> c0130076 =
<invalidate_bdev+e6/130>=0A=
Code;  c012fff0 <invalidate_bdev+60/130>=0A=
   d:   8b 53 30                  mov    0x30(%ebx),%edx=0A=
Code;  c012fff3 <invalidate_bdev+63/130>=0A=
  10:   85 d2                     test   %edx,%edx=0A=
Code;  c012fff5 <invalidate_bdev+65/130>=0A=
  12:   0f 84 00 00 00 00         je     18 <_EIP+0x18> c012fffb =
<invalidate_bdev+6b/130>=0A=
=0A=
=0A=
6 errors issued.  Results may not be reliable.=0A=

------_=_NextPart_000_01C1B0DA.3DC711A0--
