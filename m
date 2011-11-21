Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pALAgZ3P000783
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 05:42:35 -0500
Received: from fgwmail6.fujitsu.co.jp (fgwmail6.fujitsu.co.jp [192.51.44.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pALAgXYx009667
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 05:42:34 -0500
Received: from m2.gw.fujitsu.co.jp (unknown [10.0.50.72])
	by fgwmail6.fujitsu.co.jp (Postfix) with ESMTP id D8A953EE0AE
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Received: from smail (m2 [127.0.0.1])
	by outgoing.m2.gw.fujitsu.co.jp (Postfix) with ESMTP id C171645DE4E
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by m2.gw.fujitsu.co.jp (Postfix) with ESMTP id A8EFA45DD74
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 9B5581DB802C
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Received: from m001.s.css.fujitsu.com (m001.s.css.fujitsu.com [10.23.4.39])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 695A31DB803A
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Received: from m001.css.fujitsu.com (m001 [127.0.0.1])
	by m001.s.css.fujitsu.com (Postfix) with ESMTP id 54CEA50EBC7
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Received: from [127.0.0.1] (nepturn.fct.css.fujitsu.com [10.91.171.44])
	by m001.s.css.fujitsu.com (Postfix) with ESMTP id 218C150EBC3
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2011 19:42:32 +0900 (JST)
Date: Mon, 21 Nov 2011 19:42:29 +0900
From: Yusuke Ashiduka <ashiduka@jp.fujitsu.com>
Message-Id: <20111121194228.6E07.5D451749@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dmsetup snapshot-origin problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

hello all.

When I create multi-stage snapshot-origin by using dmsetup, kernel panic occurred.
How many stages does dmsetup support?
I did it on CentOS 5.6 and Fedora 16. it happened on both.
here is the log file.

- sample scripts
---
#!/bin/sh
#
set -x 

DMSETUP=/sbin/dmsetup
$DMSETUP create cow0 --table "0 1000 zero"
for i in $(seq 100)
do
$DMSETUP create cow$i --table "0 1000 snapshot-origin /dev/mapper/cow$((i-1))"
if [ $? -ne 0 ];then
	echo "faild $DMSETUP"
	exit 1
fi
done
exit 0
---


- panic log
CentOS 5.6 x86-64(2.6.18-238.el5) + device-mapper-1.02.55-2.el5 (LVM2.2.02.74 base)
---
Code: 0f 0b 68 1a 9c 2b 80 c2 51 02 4c 8b 62 28 65 8b 04 25 2c 00 
RIP  [<ffffffff8000b567>] kfree+0x83/0x1d8
 RSP <ffff810025fb19d8>
 <0>Kernel panic - not syncing: Fatal exception
 <1>Unable to handle kernel NULL pointer dereference at 0000000000000004 RIP: 
 [<0000000000000004>]
PGD 25678067 PUD 3c6df067 PMD 0 
Oops: 0010 [2] SMP 
last sysfs file: /devices/pci0000:00/0000:00:00.0/irq
CPU 1 
Modules linked in: ip6_tables ebtable_nat ebtables ipt_MASQUERADE iptable_nat ip_nat xt_state ip_conntrack nfnetlink ipt_REJECT xt_tcpudp iptable_filter ip_tables x_tables bridge autofs4 lockd sunrpc vmblock(U) vsock(U) vmci(U) vmmemctl(U) vmhgfs(U) loop dm_multipath scsi_dh video backlight sbs power_meter hwmon i2c_ec dell_wmi wmi button battery asus_acpi acpi_memhotplug ac lp ksm(U) kvm(U) sg e1000 floppy i2c_piix4 i2c_core pcspkr shpchp serio_raw tpm_tis parport_pc tpm parport tpm_bios pvscsi(U) vmxnet3(U) vmxnet(U) dm_raid45 dm_message dm_region_hash dm_mem_cache dm_snapshot dm_zero dm_mirror dm_log dm_mod ata_piix libata mptspi mptscsih mptbase scsi_transport_spi sd_mod scsi_mod ext3 jbd uhci_hcd ohci_hcd ehci_hcd
Pid: 4303, comm: dmsetup Tainted: G      2.6.18-238.el5 #1
RIP: 0010:[<0000000000000004>]  [<0000000000000004>]
RSP: 0018:ffff810037c0bf90  EFLAGS: 00010006
RAX: ffff810025fb1fd8 RBX: 00000000000000ff RCX: 0000000000000000
RDX: 00000000000010cf RSI: 00000000000000ff RDI: 00000000000000ff
RBP: ffff810025fb1680 R08: 0000000000000004 R09: 000000000000003c
R10: ffff810025fb1658 R11: 0000000000000080 R12: 0000000000000004
R13: 00000000ffffff03 R14: ffffffff802ae2bd R15: ffff810025fb1bc8
FS:  00002aed9f4c91a0(0000) GS:ffff81003fe627c0(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 0000000000000004 CR3: 000000000198f000 CR4: 00000000000006e0
Process dmsetup (pid: 4303, threadinfo ffff810025fb0000, task ffff81003b754820)
Stack:  ffffffff8002308a ffffffff802ae0bf 0000000000000000 0000000000000096
 ffffffff8005dc22 ffff810025fb1680 <EOI>  0000000000000000 0000000000000080
 ffff810025fb1658 000000000000003c 0000000000000004 00000000000000ff
Call Trace:
 <IRQ>  [<ffffffff8002308a>] smp_call_function_interrupt+0x57/0x75
 [<ffffffff8005dc22>] call_function_interrupt+0x66/0x6c
 <EOI>  [<ffffffff80077435>] smp_send_stop+0x9e/0xa4
 [<ffffffff80077403>] smp_send_stop+0x6c/0xa4
 [<ffffffff80092eda>] panic+0x94/0x1d7
 [<ffffffff80065117>] __die+0xf6/0xff
 [<ffffffff80064fba>] oops_end+0x51/0x53
 [<ffffffff8006c742>] die+0x3a/0x44
 [<ffffffff8006ccfa>] do_invalid_op+0xad/0xb7
 [<ffffffff8000b567>] kfree+0x83/0x1d8
 [<ffffffff80063ae5>] mutex_lock+0xd/0x1d
 [<ffffffff8814dbf8>] :dm_mod:dm_table_unplug_all+0x3f/0x83
 [<ffffffff8005dde9>] error_exit+0x0/0x84
 [<ffffffff8000b567>] kfree+0x83/0x1d8
 [<ffffffff800c3518>] utrace_get_signal+0xfd/0x54b
 [<ffffffff800a0e99>] search_exception_tables+0x1d/0x2d
 [<ffffffff8006738b>] do_page_fault+0x64b/0x874
 [<ffffffff8002afa1>] get_signal_to_deliver+0x174/0x494
 [<ffffffff8005acc8>] do_notify_resume+0x9c/0x7af
 [<ffffffff8008dbbc>] task_rq_lock+0x3d/0x6f
 [<ffffffff80046fc0>] try_to_wake_up+0x472/0x484
 [<ffffffff8005dde9>] error_exit+0x0/0x84
 [<ffffffff8009acdd>] signal_wake_up+0x1e/0x2d
 [<ffffffff8009b831>] specific_send_sig_info+0xd1/0xdf
 [<ffffffff80062170>] bad_put_user+0x0/0x8
 [<ffffffff8005d19f>] sysret_signal+0x1c/0x27
 [<ffffffff8005d427>] ptregscall_common+0x67/0xac
 [<ffffffff800c63a8>] ptrace_report_signal+0x29/0x2f
 [<ffffffff800c2711>] utrace_quiescent+0xdc/0x256
 [<ffffffff800c3903>] utrace_get_signal+0x4e8/0x54b
 [<ffffffff8002afa1>] get_signal_to_deliver+0x174/0x494
 [<ffffffff8005acc8>] do_notify_resume+0x9c/0x7af
 [<ffffffff8008dbbc>] task_rq_lock+0x3d/0x6f
 [<ffffffff80046fc0>] try_to_wake_up+0x472/0x484
 [<ffffffff800c331b>] utrace_set_flags+0x173/0x273
 [<ffffffff8009acdd>] signal_wake_up+0x1e/0x2d
 [<ffffffff8009b831>] specific_send_sig_info+0xd1/0xdf
 [<ffffffff800c44bc>] utrace_report_syscall+0x1d4/0x1f6
 [<ffffffff8009bade>] force_sig_info+0xae/0xb9
 [<ffffffff8005d32e>] int_signal+0x12/0x17


Code:  Bad RIP value.
RIP  [<0000000000000004>]
 RSP <ffff810037c0bf90>
CR2: 0000000000000004
 <0>Kernel panic - not syncing: Fatal exception
 WARNING: at kernel/panic.c:137 panic()

Call Trace:
 <IRQ>  [<ffffffff8009300c>] panic+0x1c6/0x1d7
 [<ffffffff80065117>] __die+0xf6/0xff
 [<ffffffff80064fba>] oops_end+0x51/0x53
 [<ffffffff800674a6>] do_page_fault+0x766/0x874
 [<ffffffff8005dde9>] error_exit+0x0/0x84
 [<ffffffff8002308a>] smp_call_function_interrupt+0x57/0x75
 [<ffffffff8005dc22>] call_function_interrupt+0x66/0x6c
 <EOI>  [<ffffffff80077435>] smp_send_stop+0x9e/0xa4
 [<ffffffff80077403>] smp_send_stop+0x6c/0xa4
 [<ffffffff80092eda>] panic+0x94/0x1d7
 [<ffffffff80065117>] __die+0xf6/0xff
 [<ffffffff80064fba>] oops_end+0x51/0x53
 [<ffffffff8006c742>] die+0x3a/0x44
 [<ffffffff8006ccfa>] do_invalid_op+0xad/0xb7
 [<ffffffff8000b567>] kfree+0x83/0x1d8
 [<ffffffff80063ae5>] mutex_lock+0xd/0x1d
 [<ffffffff8814dbf8>] :dm_mod:dm_table_unplug_all+0x3f/0x83
 [<ffffffff8005dde9>] error_exit+0x0/0x84
 [<ffffffff8000b567>] kfree+0x83/0x1d8
 [<ffffffff800c3518>] utrace_get_signal+0xfd/0x54b
 [<ffffffff800a0e99>] search_exception_tables+0x1d/0x2d
 [<ffffffff8006738b>] do_page_fault+0x64b/0x874
 [<ffffffff8002afa1>] get_signal_to_deliver+0x174/0x494
 [<ffffffff8005acc8>] do_notify_resume+0x9c/0x7af
 [<ffffffff8008dbbc>] task_rq_lock+0x3d/0x6f
 [<ffffffff80046fc0>] try_to_wake_up+0x472/0x484
 [<ffffffff8005dde9>] error_exit+0x0/0x84
 [<ffffffff8009acdd>] signal_wake_up+0x1e/0x2d
 [<ffffffff8009b831>] specific_send_sig_info+0xd1/0xdf
 [<ffffffff80062170>] bad_put_user+0x0/0x8
 [<ffffffff8005d19f>] sysret_signal+0x1c/0x27
 [<ffffffff8005d427>] ptregscall_common+0x67/0xac
 [<ffffffff800c63a8>] ptrace_report_signal+0x29/0x2f
 [<ffffffff800c2711>] utrace_quiescent+0xdc/0x256
 [<ffffffff800c3903>] utrace_get_signal+0x4e8/0x54b
 [<ffffffff8002afa1>] get_signal_to_deliver+0x174/0x494
 [<ffffffff8005acc8>] do_notify_resume+0x9c/0x7af
 [<ffffffff8008dbbc>] task_rq_lock+0x3d/0x6f
 [<ffffffff80046fc0>] try_to_wake_up+0x472/0x484
 [<ffffffff800c331b>] utrace_set_flags+0x173/0x273
 [<ffffffff8009acdd>] signal_wake_up+0x1e/0x2d
 [<ffffffff8009b831>] specific_send_sig_info+0xd1/0xdf
 [<ffffffff800c44bc>] utrace_report_syscall+0x1d4/0x1f6
 [<ffffffff8009bade>] force_sig_info+0xae/0xb9
 [<ffffffff8005d32e>] int_signal+0x12/0x17
---

Thanks,
Y.ashiduka
