Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F0AF@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
    boundary="----_=_NextPart_000_01C1B8B3.8F88AB80"
Subject: [linux-lvm] RE: Oops unmounting snapshot of xfs filesystem
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
Date: Mon Feb 18 13:34:02 2002
List-Id: <linux-lvm.redhat.com>
To: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C1B8B3.8F88AB80
Content-Type: text/plain;
	charset="iso-8859-1"

Klaus Strebel's suggestion to use 2.91.66 (kgcc) for the kernel did solve
the oops from snapshot umounting, in ordinary circumstances.  Thanks!

However, I still have similar behavior, from umounting an invalid
(filled-up) snapshot.  I took three snapshots of a single xfs logical
volume, mounted the snapshots, and ran I-O on the source until the snapshots
were invalidated.  I then umounted two of the snapshots.  I saw
xfs_force_shutdown messages in syslog for each umount, and the second umount
oopsed.

Here's the syslog entries:

<6> Feb 14 15:24:11 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
on /dev/volgr0/lvol1: out of space 
<6> Feb 14 15:24:11 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
on /dev/volgr0/lvol2: out of space 
<6> Feb 14 15:24:11 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
on /dev/volgr0/lvol3: out of space 
<1> Feb 14 15:24:43 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol1 
<1> Feb 14 15:24:43 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol1 
<4> Feb 14 15:24:43 kernel: I/O error in filesystem ("lvm(58,1)") meta-data
dev 0x3a01 block 0xa00020 
<4> Feb 14 15:24:43 kernel:        ("xlog_iodone") error 5 buf count 1024 
<4> Feb 14 15:24:43 kernel: xfs_force_shutdown(lvm(58,1),0x2) called from
line 939 of file xfs_log.c.  Return address = 0xc01b934e 
<4> Feb 14 15:24:43 kernel: Log I/O Error Detected.  Shutting down
filesystem: lvm(58,1) 
<4> Feb 14 15:24:43 kernel: Please umount the filesystem, and rectify the
problem(s) 
<1> Feb 14 15:24:48 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol2 
<1> Feb 14 15:24:48 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/volgr0/lvol2 
<4> Feb 14 15:24:48 kernel: I/O error in filesystem ("lvm(58,2)") meta-data
dev 0x3a02 block 0xa00020 
<4> Feb 14 15:24:48 kernel:        ("xlog_iodone") error 5 buf count 1024 
<4> Feb 14 15:24:48 kernel: xfs_force_shutdown(lvm(58,2),0x2) called from
line 939 of file xfs_log.c.  Return address = 0xc01b934e 
<4> Feb 14 15:24:48 kernel: Log I/O Error Detected.  Shutting down
filesystem: lvm(58,2) 
<4> Feb 14 15:24:48 kernel: Please umount the filesystem, and rectify the
problem(s) 
<1> Feb 14 15:24:48 kernel: Unable to handle kernel NULL pointer dereference
at virtual address 00000020 
[oops snipped, but output of ksymoops attached to message]

System details:
Celeron with 512 MB of RAM and WD 45GB harddrives.
128 MB swap, one vg consisting of a one-drive RAID 0.
Kernel 2.4.16 with 12/14/01 xfs CVS.
LVM CVS of 1/21/02 (functionally identical to 1.0.2, I believe).
LVM's linux-2.4.11-VFS-lock.patch.
xfs_fs_freeze() patch posted by Eric Sandeen.
Anselm Kruis' writable snapshot patch.

Snapshots were mounted ro,nouuid,norecovery.  The only action taken to the
snapshots was mounting.

I hope to try it soon with 2.4.17, as Adrian Head suggested.

Has anyone else run this case with xfs snapshots?

Why does umount result in I/O activity to a read-only, norecovery file
system?

Thanks,
Dale Stephenson
steph@snapserver.com

> -----Original Message-----
> From: Klaus Strebel [mailto:klaus.strebel@eigner.com]
> Sent: Monday, February 11, 2002 2:46 AM
> To: Stephenson, Dale
> Cc: 'linux-xfs@oss.sgi.com'; 'linux-lvm@sistina.com'
> Subject: Re: Oops unmounting snapshot of xfs filesystem
> 
> 
> Stephenson, Dale wrote:
> > I have been running into an oops when umounting the 
> snapshot of an xfs
> > filesystem, or following the umount.  For instance, a 
> umount followed by an
> > lvremove will oops in the lvremove, while a 
> mount/umount/mount/umount
> > sequence will oops on the second or third umount.
> > 
> > What does seem consistent is the error message logged on 
> each umount.  Here
> > are the messages from a mount/umount sequence:
> > 
> > <4> Feb  7 11:20:00 kernel: Mounting filesystem "lvm(58,1)" 
> in no-recovery
> > mode.  Filesystem will be inconsistent. 
> > <2> Feb  7 11:20:02 kernel: lvm - lvm_map: ll_rw_blk write 
> for readonly LV
> > /dev/volgr0/lvol1 
> > <2> Feb  7 11:20:02 kernel: lvm - lvm_map: ll_rw_blk write 
> for readonly LV
> > /dev/volgr0/lvol1 
> > <4> Feb  7 11:20:02 kernel: I/O error in filesystem 
> ("lvm(58,1)") meta-data
> > dev 0x3a01 block 0xa00020 
> > <4> Feb  7 11:20:02 kernel:        ("xlog_iodone") error 5 
> buf count 1024 
> > <4> Feb  7 11:20:02 kernel: 
> xfs_force_shutdown(lvm(58,1),0x2) called from
> > line 939 of file xfs_log.c.  Return address = 0xc01b3cbc 
> > <4> Feb  7 11:20:02 kernel: Log I/O Error Detected.  Shutting down
> > filesystem: lvm(58,1) 
> > <4> Feb  7 11:20:02 kernel: Please umount the filesystem, 
> and rectify the
> > problem(s) 
> > 
> > I've attached the oops (run through ksymoops) from this 
> particular umount.
> > The snapshot is mounted ro,nouuid,norecovery.  The source 
> of the snapshot
> > contains an unmounted xfs filesystem, which was unmounted 
> at the time of
> > snapshot creation.  There has been no intentional I/O 
> activity to the
> > snapshot, either.
> > 
> > It looks to me like xfs is trying to flush something to 
> disk on the umount,
> > even though the filesystem is read only and no recovery.  I 
> would not have
> > expected this.  Is it correct behavior?
> > 
> > I made the snapshot writeable, but kept the mount options 
> the same.  I was
> > able to mount/umount many times without oops, I/O errors, or
> > xfs_force_shutdown.
> > 
> > I did notice similar behavior when a full snapshot returns 
> an I/O error --
> > xfs_force_shutdown, with an oops following soon thereafter.
> > 
> > System details:
> > Celeron with 512 MB of RAM and WD 45GB harddrives.
> > 128 MB swap, one vg consisting of a one-drive RAID 0.
> > Kernel 2.4.16 with 12/14/01 xfs CVS.
> > LVM CVS of 1/21/02 (functionally identical to 1.0.2, I believe).
> > LVM's linux-2.4.11-VFS-lock.patch.
> > xfs_fs_freeze() patch posted by Eric Sandeen.
> > Anselm Kruis' writable snapshot patch.
> 
> Had the same, disappeared when compiled the kernel with gcc-2.91.66 ! 
> Seems to be a compiler issue.
> 
> Ciao
> Klaus
> 
> -- 
> Klaus Strebel
> UNIX-Engineer
> klaus.strebel@eigner.com
> EIGNER - Precision Lifecycle Management -
> <http://www.eigner.com>
> 


------_=_NextPart_000_01C1B8B3.8F88AB80
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
c012ea83 =0A=
Oops: 0000 =0A=
CPU:    0 =0A=
EIP:    0010:[<c012ea83>]    Not tainted =0A=
Using defaults from ksymoops -t elf32-i386 -a i386=0A=
EFLAGS: 00010206 =0A=
eax: 00000000   ebx: 00000000   ecx: 00003a02   edx: 00003a02 =0A=
esi: 00000006   edi: 00000000   ebp: 00000000   esp: c0719d60 =0A=
ds: 0018   es: 0018   ss: 0018 =0A=
Process umount (pid: 6416, stackpage=3Dc0719000) =0A=
Stack: c3e403a0 00000000 c0718000 c2bfe000 3a020168 00000000 c012eb68 =
c3e403a0  =0A=
       00000001 c3ace220 c016f038 00003a02 00000001 00000000 c01d18c2 =
c3ace220  =0A=
       00000000 c3ada680 c2f50000 00000400 c01b934e c2bfe000 00000002 =
c02b27c7  =0A=
Call Trace: [<c012eb68>] [<c016f038>] [<c01d18c2>] [<c01b934e>] =
[<c016bcd8>]  =0A=
   [<c016c62c>] [<c01b9388>] [<c01b9aa2>] [<c01baf6a>] [<c01bb0b0>] =
[<c01b8c94>]  =0A=
   [<c01c1032>] [<c01c84d1>] [<c01d2c7a>] [<c01da7cc>] [<c0131ef8>] =
[<c014098e>]  =0A=
   [<c013582f>] [<c0141201>] [<c0120665>] [<c014121c>] [<c0106d7b>]  =
=0A=
Code: 8b 53 20 89 54 24 14 0f b7 54 24 12 66 39 53 0c 75 7b 83 7b  =0A=
=0A=
>>EIP; c012ea83 <invalidate_bdev+3f/104>   <=3D=3D=3D=3D=3D=0A=
Trace; c012eb68 <__invalidate_buffers+20/7c>=0A=
Trace; c016f038 <pagebuf_target_clear+10/2c>=0A=
Trace; c01d18c2 <pagebuf_unlock+6286e/6c37c>=0A=
Trace; c01b934e <pagebuf_unlock+4a2fa/6c37c>=0A=
Trace; c016bcd8 <pagebuf_iodone+38/7c>=0A=
Trace; c016c62c <pagebuf_iorequest+108/144>=0A=
Trace; c01b9388 <pagebuf_unlock+4a334/6c37c>=0A=
Trace; c01b9aa2 <pagebuf_unlock+4aa4e/6c37c>=0A=
Trace; c01baf6a <pagebuf_unlock+4bf16/6c37c>=0A=
Trace; c01bb0b0 <pagebuf_unlock+4c05c/6c37c>=0A=
Trace; c01b8c94 <pagebuf_unlock+49c40/6c37c>=0A=
Trace; c01c1032 <pagebuf_unlock+51fde/6c37c>=0A=
Trace; c01c84d1 <pagebuf_unlock+5947d/6c37c>=0A=
Trace; c01d2c7a <pagebuf_unlock+63c26/6c37c>=0A=
Trace; c01da7cc <pagebuf_unlock+6b778/6c37c>=0A=
Trace; c0131ef8 <get_super+9f8/c98>=0A=
Trace; c014098e <__mntput+1e/624>=0A=
Trace; c013582f <path_release+27/144>=0A=
Trace; c0141201 <may_umount+26d/826c>=0A=
Trace; c0120665 <do_munmap+279/298>=0A=
Trace; c014121c <may_umount+288/826c>=0A=
Trace; c0106d7b <__up_wakeup+1057/2274>=0A=
Code;  c012ea83 <invalidate_bdev+3f/104>=0A=
00000000 <_EIP>:=0A=
Code;  c012ea83 <invalidate_bdev+3f/104>   <=3D=3D=3D=3D=3D=0A=
   0:   8b 53 20                  mov    0x20(%ebx),%edx   =
<=3D=3D=3D=3D=3D=0A=
Code;  c012ea86 <invalidate_bdev+42/104>=0A=
   3:   89 54 24 14               mov    %edx,0x14(%esp,1)=0A=
Code;  c012ea8a <invalidate_bdev+46/104>=0A=
   7:   0f b7 54 24 12            movzwl 0x12(%esp,1),%edx=0A=
Code;  c012ea8f <invalidate_bdev+4b/104>=0A=
   c:   66 39 53 0c               cmp    %dx,0xc(%ebx)=0A=
Code;  c012ea93 <invalidate_bdev+4f/104>=0A=
  10:   75 7b                     jne    8d <_EIP+0x8d> c012eb10 =
<invalidate_bdev+cc/104>=0A=
Code;  c012ea95 <invalidate_bdev+51/104>=0A=
  12:   83 7b 00 00               cmpl   $0x0,0x0(%ebx)=0A=
=0A=
=0A=
6 errors issued.  Results may not be reliable.=0A=

------_=_NextPart_000_01C1B8B3.8F88AB80--
