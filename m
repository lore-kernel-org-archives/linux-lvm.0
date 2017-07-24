Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 485F869535
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2017 16:19:33 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F409356F4
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2017 16:19:31 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v6OEc1lw030319
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2017 10:38:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2bwex5kkd4-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2017 10:38:45 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <linux-lvm@redhat.com> from <paulmck@linux.vnet.ibm.com>;
	Mon, 24 Jul 2017 10:38:44 -0400
Date: Mon, 24 Jul 2017 07:38:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
References: <4b89b134-2e86-6a84-9eba-16cff411684d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b89b134-2e86-6a84-9eba-16cff411684d@redhat.com>
Message-Id: <20170724143844.GS3730@linux.vnet.ibm.com>
Subject: Re: [linux-lvm] BUG: unable to handle kernel NULL pointer
 dereference in notifier_call_chain
Reply-To: paulmck@linux.vnet.ibm.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: nikolay@cumulusnetworks.com, David Miller <davem@davemloft.net>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 24, 2017 at 03:45:36PM +0200, Zdenek Kabelac wrote:
> Hi
> 
> I've booted  4.13-rc1 a56e88ec05df50110f2bf578b6e17128f37111ed
> and seen this BUG report on boot  of my T61 (C2D, 4G Ram, Fedora Rawhide):
> (not sure if the 2nd. sleep is side-effect - it could be possibly unrelated issue)

I suggest tracking down and fixing the sleep bug -- it looks to be a
bug in its own right, and might possibly be related.

							Thanx, Paul

> audit: type=1131 audit(1500843225.056:150): pid=1 uid=0
> auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed
> comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=?
> terminal=? res=success'
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000208
> IP: ip6_route_dev_notify+0x50/0x190 [ipv6]
> PGD 0
> P4D 0
> 
> Oops: 0002 [#1] PREEMPT SMP
> Modules linked in: ccm usb_storage xt_CHECKSUM iptable_mangle
> ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat
> nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack
> ipt_REJECT nf_reject_ipv4 xt_tcpudp tun bridge stp ipv6 llc ebtables
> ip6_tables iptable_filter btusb btbcm btintel bluetooth ecdh_generic
> iTCO_wdt iTCO_vendor_support wmi_bmof arc4 snd_hda_codec_analog
> snd_hda_codec_generic coretemp kvm_intel kvm input_leds irqbypass
> psmouse r852 sm_common nand snd_hda_intel nand_ecc i2c_i801 iwl3945
> iwlegacy r592 mtd snd_hda_codec memstick mac80211 snd_hda_core
> snd_hwdep snd_seq pcmcia lpc_ich cfg80211 snd_seq_device mfd_core
> snd_pcm wmi thinkpad_acpi nvram snd_timer e1000e snd ptp evdev
> pps_core soundcore binfmt_misc nfsd auth_rpcgss oid_registry nfs_acl
> lockd grace
> sunrpc loop ip_tables x_tables uhci_hcd mmc_block serio_raw ehci_pci
> ehci_hcd usbcore sr_mod cdrom sdhci_pci sdhci mmc_core i915
> yenta_socket iosf_mbi i2c_algo_bit drm_kms_helper syscopyarea
> sysfillrect sysimgblt fb_sys_fops drm i2c_core usb_common video
> backlight autofs4
> CPU: 1 PID: 75 Comm: kworker/u4:3 Not tainted 4.13.0-rc1-00418-gd792077e1f55 #67
> Hardware name: LENOVO 6464CTO/6464CTO, BIOS 7LETC9WW (2.29 ) 03/18/2011
> Workqueue: netns cleanup_net
> task: ffff880135505100 task.stack: ffffc90000164000
> RIP: 0010:ip6_route_dev_notify+0x50/0x190 [ipv6]
> RSP: 0018:ffffc90000167c28 EFLAGS: 00010297
> RAX: ffff880132e56800 RBX: ffff88012ec16000 RCX: 0000000000000003
> RDX: ffffc90000167cc0 RSI: 0000000000000006 RDI: 0000000000000000
> RBP: ffffc90000167c38 R08: 0000000000000000 R09: ffffffffa09dd600
> R10: ffffc90000167c48 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000006 R14: ffffc90000167cc0 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff88013aa00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000208 CR3: 0000000001c11000 CR4: 00000000000006e0
> Call Trace:
> notifier_call_chain+0x4a/0x70
> raw_notifier_call_chain+0x16/0x20
> call_netdevice_notifiers_info+0x35/0x60
> rollback_registered_many+0x2d3/0x410
> unregister_netdevice_many.part.107+0x14/0x70
> default_device_exit_batch+0x13f/0x160
> ? do_wait_intr_irq+0xc0/0xc0
> ops_exit_list.isra.8+0x52/0x60
> cleanup_net+0x1e2/0x2c0
> process_one_work+0x21d/0x680
> worker_thread+0x4d/0x3b0
> kthread+0x133/0x150
> ? process_one_work+0x680/0x680
> ? kthread_create_on_node+0x40/0x40
> ? kthread_create_on_node+0x40/0x40
> ret_from_fork+0x27/0x40
> Code: 48 83 fe 06 74 0e 48 8d 65 f0 b8 01 00 00 00 5b 41 5c 5d c3 80
> bb c0 04 00 00 03 74 e9 48 8b 80 a8 08 00 00 48 8b b8 58 01 00 00
> <f0> ff 8f 08 02 00 00 75 d2 e8 d2 6c d0 e0 eb cb 48 8b 90 a8 08
> RIP: ip6_route_dev_notify+0x50/0x190 [ipv6] RSP: ffffc90000167c28
> CR2: 0000000000000208
> ---[ end trace 499867b014596c1c ]---
> 
> 
> 
> BUG: sleeping function called from invalid context at
> ./include/linux/percpu-rwsem.h:33
> in_atomic(): 0, irqs_disabled(): 1, pid: 75, name: kworker/u4:3
> INFO: lockdep is turned off.
> irq event stamp: 50298
> hardirqs last  enabled at (50297): [<ffffffff816d5067>]
> _raw_spin_unlock_irqrestore+0x57/0x70
> hardirqs last disabled at (50298): [<ffffffff816d6bbf>] error_entry+0x6f/0xc0
> softirqs last  enabled at (50290): [<ffffffff815f895d>] neigh_ifdown+0x7d/0xe0
> softirqs last disabled at (50288): [<ffffffff815f8912>] neigh_ifdown+0x32/0xe0
> CPU: 1 PID: 75 Comm: kworker/u4:3 Tainted: G      D
> 4.13.0-rc1-00418-gd792077e1f55 #67
> Hardware name: LENOVO 6464CTO/6464CTO, BIOS 7LETC9WW (2.29 ) 03/18/2011
> Workqueue: netns cleanup_net
> Call Trace:
> dump_stack+0x70/0x9d
> ___might_sleep+0x173/0x250
> __might_sleep+0x4a/0x80
> exit_signals+0x24/0x2a0
> do_exit+0x9d/0xc80
> ? kthread+0x133/0x150
> ? process_one_work+0x680/0x680
> rewind_stack_do_exit+0x17/0x20
> sysrq: SysRq : Emergency Sync
> Emergency Sync complete
> 
> 
> If you need more details - feel free to ask
> 
> Zdenek
> 
