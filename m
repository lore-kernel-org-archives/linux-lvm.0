Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAK89EAt002624
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 03:09:14 -0500
Received: from emailgate2.cpvie.co.at (smtp.cargo-partner.com [195.234.151.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAK89AhJ030652
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 03:09:10 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id D514E40D39
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 09:09:04 +0100 (CET)
Received: from [10.10.55.2] (eisenkoe.cp.com [10.10.55.2])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 1D42540C8E
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 09:09:03 +0100 (CET)
Message-ID: <4742963A.5050509@cargo-partner.com>
Date: Tue, 20 Nov 2007 09:09:30 +0100
From: =?ISO-8859-15?Q?Michael_Eisenk=F6lbl?=
	<michael.eisenkoelbl@cargo-partner.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cmirror LV size - kernel panic
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I have a "big" problem with cmirror-1.0.1-1 (RHEL4.5 or RHEL5, 
cmirror-kernel-smp-2.6.9-32.0.0.6).
When I am trying to active a LV with 6 TB (in cmirror ONLY, without it 
works fine) i got this kernel panic:

Nov 19 13:45:44 mail2 kernel: Unable to handle kernel NULL pointer 
dereference at virtual address 00000000
Nov 19 13:45:44 mail2 kernel:  printing eip:
Nov 19 13:45:44 mail2 kernel: f88cae00
Nov 19 13:45:44 mail2 kernel: *pde = 00004001
Nov 19 13:45:44 mail2 kernel: Oops: 0002 [#1]
Nov 19 13:45:44 mail2 kernel: SMP
Nov 19 13:45:44 mail2 kernel: Modules linked in: nfsd exportfs lockd 
nfs_acl autofs4 i2c_dev i2c_core dm_cmirror(U) dlm(U) cman(U) sunrpc 
dm_round_robin crc32
c libcrc32c iscsi_sfnet scsi_transport_iscsi md5 ipv6 8021q mptctl 
dm_multipath button battery ac ohci_hcd tg3 e1000 bonding(U) floppy sg 
dm_snapshot dm_zero
dm_mirror ext3 jbd dm_mod qla2xxx scsi_transport_fc mptscsih mptsas 
mptspi mptfc mptscsi mptbase sd_mod scsi_mod
Nov 19 13:45:44 mail2 kernel: CPU:    3
Nov 19 13:45:44 mail2 kernel: EIP:    0060:[<f88cae00>]    Not tainted VLI
Nov 19 13:45:44 mail2 kernel: EFLAGS: 00010246   (2.6.9-55.0.12.ELsmp)
Nov 19 13:45:44 mail2 kernel: EIP is at do_region+0x52/0x10a [dm_mod]
Nov 19 13:45:44 mail2 kernel: eax: 00000002   ebx: 00000800   ecx: 
f78c08f8   edx: 00000000
Nov 19 13:45:44 mail2 kernel: esi: 00000000   edi: 00000000   ebp: 
00000000   esp: f565be64
Nov 19 13:45:44 mail2 [7238]: Monitoring mirror device VG_mail-LV_mail 
for events
Nov 19 13:45:44 mail2 kernel: ds: 007b   es: 007b   ss: 0068
Nov 19 13:45:44 mail2 kernel: Process cluster_log_ser (pid: 9262, 
threadinfo=f565b000 task=f4ebb1b0)
Nov 19 13:45:44 mail2 kernel: Stack: f78c08f8 00000000 00000010 f565befc 
00000010 f565befc f565bf08 00000010
Nov 19 13:45:44 mail2 kernel:        00000000 00000000 f88caf3b f565bf08 
f565bed0 f78c08f8 00000001 f88cad46
Nov 19 13:45:44 mail2 kernel:        f88cad70 00000000 f8cd6000 00000000 
00000001 f78c08f8 00000001 f88cafd7
Nov 19 13:45:44 mail2 kernel: Call Trace:
Nov 19 13:45:44 mail2 kernel:  [<f88caf3b>] dispatch_io+0x83/0xa4 [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f88cad46>] vm_get_page+0x0/0x2a [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f88cad70>] vm_next_page+0x0/0x17 [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f88cafd7>] sync_io+0x7b/0xdf [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f88cb169>] dm_io_sync_vm+0x2a/0x32 [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f88cad46>] vm_get_page+0x0/0x2a [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f88cad70>] vm_next_page+0x0/0x17 [dm_mod]
Nov 19 13:45:44 mail2 kernel:  [<f8b7ca75>] read_bits+0x2f/0x37 [dm_cmirror]
Nov 19 13:45:44 mail2 kernel:  [<f8b7ceea>] disk_resume+0xc2/0x3f6 
[dm_cmirror]
Nov 19 13:45:44 mail2 kernel:  [<f8b7e1c8>] 
process_log_request+0x1bd/0x460 [dm_cmirror]
Nov 19 13:45:44 mail2 kernel:  [<f8b7e616>] 
cluster_log_serverd+0x1ab/0x21f [dm_cmirror]
Nov 19 13:45:45 mail2 kernel:  [<f8b7e46b>] 
cluster_log_serverd+0x0/0x21f [dm_cmirror]
Nov 19 13:45:45 mail2 kernel:  [<c01041f5>] kernel_thread_helper+0x5/0xb
Nov 19 13:45:45 mail2 kernel: Code: f8 89 d8 89 f5 0f ac f0 03 8d 50 02 
b8 10 00 00 00 e8 17 11 00 00 8b 0c 24 89 c7 8b 41 0c 8b 51 10 29 d8 19 
f2 03 41 04 13
 51 08 <89> 07 89 57 04 8b 01 c7 47 34 8d ac 8c f8 8b 57 30 89 47 0c 8b
Nov 19 13:45:45 mail2 kernel:  <0>Fatal exception: panic in 5 seconds

maybe you have a solution for me? how big can be a LV in cmirror?
discs are connectec with iscsi-initiator-utils-4.0.3.0-5 and 
device-mapper-multipath-0.4.5-21.0.1.RHEL4

kind regards
Michael
