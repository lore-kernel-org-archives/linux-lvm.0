Subject: Re: [linux-lvm] Sorry, dm:1.02, lvm2:2.02 did not work for me
From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
In-Reply-To: <20051112224941.GP26394@agk.surrey.redhat.com>
References: <20051111163525.18AE1734B1@hormel.redhat.com>
	<1131758026.4975.77.camel@jgs4.ino.pvt>
	<20051112020710.GN26394@agk.surrey.redhat.com>
	<20051112220320.GO26394@agk.surrey.redhat.com>
	<20051112224941.GP26394@agk.surrey.redhat.com>
Date: Mon, 14 Nov 2005 14:32:55 -0800
Message-Id: <1132007575.6132.17.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Alasdair G Kergon <agk@redhat.com>
Cc: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Sat, 2005-11-12 at 22:49 +0000, Alasdair G Kergon wrote: 
> On Sat, Nov 12, 2005 at 10:03:21PM +0000, Alasdair G Kergon wrote:
> > I've reproduced this if the LV is activated with an old release but
> > the snapshot is created with the new code.  Should be easy to fix.
>  
> Try the current CVS versions.
> [A device-mapper fix to stop it issuing an incorrect 'dm create';
> an LVM2 fix to avoid the 'device left open' messages.]
> 
> Alasdair

Ok, I've grabbed the cvs images, done the configure/make/make install on
dm and then lvm, and I now see:

lvm version
  LVM version:     2.02.01-cvs (2005-11-10)
  Library version: 1.02.01-cvs (2005-11-10)
  Driver version:  4.4.0

I rebooted and reran my test procedure which 
1) loops on {lvcreate, sleep 10, lvremove, sleep 2}
and simultaneously
2) loops on {cp abcd wxyz;cp wxyz abcd) 
operating on a 1GB file on the origin filesystem


The kcopyd.c BUG at line 145 is triggered by the first lvremove
following start of the i/o (copy loop).


The dmesg dump is:
-----------------
Linux version 2.6.13-1.1532_FC4 (bhcompile@tweety.build.redhat.com) (gcc
version 4.0.1 20050727 (Red Hat 4.0.1-5)) #1 Thu Oct 20 01:30:08 EDT
2005
..<snip>..
------------[ cut here ]------------
kernel BUG at drivers/md/kcopyd.c:145!
invalid operand: 0000 [#1]
Modules linked in: xfs exportfs dm_snapshot ipv6 parport_pc lp parport
autofs4 rfcomm l2cap bluetooth sunrpc ohci_hcd i2c_piix4 i2c_core tulip
e100 mii floppy ext3 jbd raid1 dm_mod aic7xxx scsi_transport_spi sd_mod
scsi_mod
CPU:    0
EIP:    0060:[<f8870635>]    Not tainted VLI
EFLAGS: 00010287   (2.6.13-1.1532_FC4) 
EIP is at client_free_pages+0x2a/0x34 [dm_mod]
eax: 00000100   ebx: c1b73a60   ecx: f7fff060   edx: 00000000
esi: f8aaa080   edi: 00000000   ebp: 00000000   esp: f560ef0c
ds: 007b   es: 007b   ss: 0068
Process lvremove (pid: 4004, threadinfo=f560e000 task=f772d550)
Stack: c1b73a60 f8871e00 c1b97140 f89f9935 f8aaa080 f5667180 f886bb86
f5667180 
       f4a60140 f8a9f000 00000004 f886e09f f886d97e f88786a0 f886e0f1
f560e000 
       f560e000 00000000 f886f4df 00000002 c0164c71 f8a9f000 f886f411
f63e7600 
Call Trace:
 [<f8871e00>] kcopyd_client_destroy+0x12/0x26 [dm_mod]
 [<f89f9935>] snapshot_dtr+0x4f/0x58 [dm_snapshot]
 [<f886bb86>] table_destroy+0x3e/0x8e [dm_mod]
 [<f886e09f>] dev_remove+0x0/0xc6 [dm_mod]
 [<f886d97e>] __hash_remove+0x5a/0x99 [dm_mod]
 [<f886e0f1>] dev_remove+0x52/0xc6 [dm_mod]
 [<f886f4df>] ctl_ioctl+0xce/0x10a [dm_mod]
 [<c0164c71>] audit_syscall_entry+0x130/0x15e
 [<f886f411>] ctl_ioctl+0x0/0x10a [dm_mod]
 [<c01bf121>] do_ioctl+0x51/0x55
 [<c01bf217>] vfs_ioctl+0x50/0x1aa
 [<c01bf3ce>] sys_ioctl+0x5d/0x6b
 [<c0104465>] syscall_call+0x7/0xb
Code: c3 53 89 c3 8b 40 24 39 43 28 75 1f 8b 43 20 e8 86 ff ff ff c7 43
20 00 00 00 00 c7 43 24 00 00 00 00 c7 43 28 00 00 00 00 5b c3 <0f> 0b
91 00 ff 21 87 f8 eb d7 83 ec 0c c7 44 24 08 00 00 00 00 
 <1>Unable to handle kernel paging request at virtual address f8aacd84
 printing eip:
f89fb038
*pde = 019c0067
Oops: 0000 [#2]
Modules linked in: xfs exportfs dm_snapshot ipv6 parport_pc lp parport
autofs4 rfcomm l2cap bluetooth sunrpc ohci_hcd i2c_piix4 i2c_core tulip
e100 mii floppy ext3 jbd raid1 dm_mod aic7xxx scsi_transport_spi sd_mod
scsi_mod
CPU:    0
EIP:    0060:[<f89fb038>]    Not tainted VLI
EFLAGS: 00010246   (2.6.13-1.1532_FC4) 
EIP is at persistent_commit+0xdb/0x100 [dm_snapshot]
eax: 00000000   ebx: 000001b0   ecx: f8aacd80   edx: 00000001
esi: 00000d80   edi: f5083120   ebp: 00000000   esp: f6a92edc
ds: 007b   es: 007b   ss: 0068
Process kcopyd (pid: 2944, threadinfo=f6a92000 task=f6294aa0)
Stack: 0088d972 00000000 00001808 00000000 cf39f964 c1b97140 cf39f964
f89f9c9b 
       f89f9cd1 cf39f964 cf3a1274 00000000 f8870760 00000000 cf3a1274
00000202 
       f8878878 f887071f f8870ece 00000092 00000000 00000282 f6294aa0
fadf8496 
Call Trace:
 [<f89f9c9b>] copy_callback+0x0/0x3c [dm_snapshot]
 [<f89f9cd1>] copy_callback+0x36/0x3c [dm_snapshot]
 [<f8870760>] run_complete_job+0x41/0x4b [dm_mod]
 [<f887071f>] run_complete_job+0x0/0x4b [dm_mod]
 [<f8870ece>] process_jobs+0x19/0x6a5 [dm_mod]
 [<f887155a>] do_work+0x0/0x2d [dm_mod]
 [<f8871569>] do_work+0xf/0x2d [dm_mod]
 [<c0147bf7>] worker_thread+0x2aa/0x621
 [<c012186b>] __wake_up_common+0x39/0x59
 [<c0121826>] default_wake_function+0x0/0xc
 [<c014794d>] worker_thread+0x0/0x621
 [<c01508ab>] kthread+0x87/0x8b
 [<c0150824>] kthread+0x0/0x8b
 [<c01012ed>] kernel_thread_helper+0x5/0xb
Code: 08 00 00 00 00 83 c4 10 5b 5e 5f 5d c3 c7 47 08 00 00 00 00 8b 47
28 85 c0 74 bc 31 db 31 f6 89 f1 03 4f 2c 31 d2 85 ed 0f 94 c2 <8b> 41
04 ff 11 83 c3 01 83 c6 08 39 5f 28 77 e4 c7 47 28 00 00 
-----------------------------------------------------------------------

At this point any call to dmsetup seems to hang (and be in
uninterruptible sleep state)

I have a big level-6 lvm2.log file if that's helpful. I could extract a
somewhat smaller tail-end -- probably half-size or smaller would cover
the results since last boot.

I think the origin volume was made on 2.6 lvm2 but I'm not 100% sure. 

==> I will go rerun my test scenario on a new origin volume, to see if
there's any differences.

Any suggestions on what else to do?

Regards, 
..jim
