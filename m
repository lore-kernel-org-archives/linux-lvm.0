Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AMTnNq027788
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 18:29:49 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.189])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6AMTfWN025525
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 18:29:42 -0400
Received: by nf-out-0910.google.com with SMTP id c2so829167nfe
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 15:29:41 -0700 (PDT)
Message-ID: <87f94c370607101529t41ff9ff3x34bf7cb595fbd05b@mail.gmail.com>
Date: Mon, 10 Jul 2006 18:29:41 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
In-Reply-To: <87f94c370607100933l3e709b8bv4142c4acb7fd33a6@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87f94c370607100933l3e709b8bv4142c4acb7fd33a6@mail.gmail.com>
Subject: [linux-lvm] Re: Opps while attempting snapshot
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Please ignore.

My issue was resolved by upgrading to the current SuSE test kernel at
ftp://ftp.suse.com/pub/people/aj/10.1-kernel-update-test

2.6.16.21-0.6

Sorry for the noise.
Greg

On 7/10/06, Greg Freemyer <greg.freemyer@gmail.com> wrote:
> I just got the below oops while working with a newly upgraded SUSE 10.1 install.
>
> It uses a 2.6.16.13-4 Suse kernel and lvm2-2.02.02-9 userland.
>
> I was attempting to work with a LVM snapshot at the time.
>
> I have not yet attempted replicate this with a 2.6.17 kernel.
>
> I assume the below is related to LVM snapshots?
>
> thanks,
> Greg
> ====
> Jul  7 16:18:56 Forensic1000 udevd-event[32296]: run_program:
> '/sbin/dmsetup' abnormal exit
> Jul  7 16:18:56 Forensic1000 kernel: Unable to handle kernel NULL
> pointer dereference at virtual address 00000024
> Jul  7 16:18:56 Forensic1000 kernel:  printing eip:
> Jul  7 16:18:56 Forensic1000 kernel: c0290ca0
> Jul  7 16:18:56 Forensic1000 kernel: *pde = 00000000
> Jul  7 16:18:56 Forensic1000 kernel: Oops: 0002 [#1]
> Jul  7 16:18:56 Forensic1000 kernel: SMP
> Jul  7 16:18:56 Forensic1000 kernel: last sysfs file: /block/sda/size
> Jul  7 16:18:56 Forensic1000 kernel: Modules linked in: nls_utf8 udf
> joydev st ide_cd sr_mod cdrom usb_storage iptable_filter ip_tables
> x_tables dm_snapshot ipv6 button battery ac xfs_quota xfs exportfs
> loop dm_mod hw_random intel_agp agpgart shpchp pci_hotplug uhci_hcd
> ehci_hcd i8xx_tco usbcore i2c_i801 i2c_core e100 mii parport_pc lp
> parport ext3 jbd piix fan thermal processor sg 3w_xxxx sd_mod scsi_mod
> ide_disk ide_core
> Jul  7 16:18:56 Forensic1000 kernel: CPU:    0
> Jul  7 16:18:56 Forensic1000 kernel: EIP:    0060:[<c0290ca0>]    Not
> tainted VLI
> Jul  7 16:18:56 Forensic1000 kernel: EFLAGS: 00210246   (2.6.16.13-4-smp #1)
> Jul  7 16:18:56 Forensic1000 kernel: EIP is at _read_lock+0x0/0xc
> Jul  7 16:18:56 Forensic1000 kernel: eax: 00000024   ebx: 00000000
> ecx: 00000000   edx: 00000000
> Jul  7 16:18:56 Forensic1000 kernel: esi: 00000000   edi: fffffffa
> ebp: 00000000   esp: e4be5dcc
> Jul  7 16:18:56 Forensic1000 kernel: ds: 007b   es: 007b   ss: 0068
> Jul  7 16:18:56 Forensic1000 kernel: Process dmsetup (pid: 32298,
> threadinfo=e4be4000 task=dfc900b0)
> Jul  7 16:18:56 Forensic1000 kernel: Stack: <0>f98317bf 00000000
> f991d000 f98317e1 00000000 f991d000 fffffffa 00000000
> Jul  7 16:18:56 Forensic1000 kernel:        f9831909 f991d000 f9833f6a
> 00000163 00000004 f991d000 f991d000 fffffffa
> Jul  7 16:18:56 Forensic1000 kernel:        e4be4000 f98341d6 f991d000
> fffffff4 00000007 f9834e79 f98341c7 00000004
> Jul  7 16:18:56 Forensic1000 kernel: Call Trace:
> Jul  7 16:18:56 Forensic1000 kernel:  [<f98317bf>]
> dm_get_table+0xc/0x23 [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<f98317e1>] dm_put+0xb/0x11b [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<f9831909>]
> dm_get_mdptr+0x18/0x1c [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<f9833f6a>]
> find_device+0x34/0xa4 [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<f98341d6>] dev_status+0xf/0x2b [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<f9834e79>]
> ctl_ioctl+0x1ee/0x232 [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<f98341c7>] dev_status+0x0/0x2b [dm_mod]
> Jul  7 16:18:57 Forensic1000 kernel:  [<c016ae00>] do_ioctl+0x48/0x5e
> Jul  7 16:18:57 Forensic1000 kernel:  [<c016b062>] vfs_ioctl+0x24c/0x25e
> Jul  7 16:18:57 Forensic1000 kernel:  [<c016b0bc>] sys_ioctl+0x48/0x60
> Jul  7 16:18:57 Forensic1000 kernel:  [<c0103c89>] syscall_call+0x7/0xb
> Jul  7 16:18:57 Forensic1000 kernel: Code: 31 c0 84 d2 0f 9f c0 c3 b2
> 01 86 10 c3 b1 01 86 08 52 9d c3 b2 01 86 10 fb c3 f0 83 28 01 79 05
> e8 4e e1 ff ff b8 01 00 00 00 c3 <f0> 83 28 01 79 05 e8 3d e1 ff ff c3
> 9c 5a fa f0 83 28 01 79 05
>
>
> --
> Greg Freemyer
> The Norcross Group
> Forensics for the 21st Century
>


-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
