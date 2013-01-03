Received: from [10.36.6.196] (vpn1-6-196.ams2.redhat.com [10.36.6.196])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r03AIbxa003583
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 05:18:38 -0500
Message-ID: <50E55AFD.1040807@redhat.com>
Date: Thu, 03 Jan 2013 11:18:37 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
In-Reply-To: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot causing segault
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 31.12.2012 19:50, Tyler Gates napsal(a):
> Hello everyone,
>       I've been having an intermittent problem on random servers segfaulting
> while trying to create a snapshot under version  lvm2-2.02.17-7.38.3 on
> kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4). The messages I get are:
> ###########################################
> Dec 27 07:45:39 chelco-app-01 kernel: Unable to handle kernel NULL pointer
> dereference at virtual address 0000001c
> Dec 27 07:45:39 chelco-app-01 kernel:  printing eip:
> Dec 27 07:45:39 chelco-app-01 kernel: f90ab3a7
> Dec 27 07:45:39 chelco-app-01 kernel: *pde = 3780a001
> Dec 27 07:45:39 chelco-app-01 kernel: Oops: 0000 [#1]
> Dec 27 07:45:39 chelco-app-01 kernel: SMP
> Dec 27 07:45:39 chelco-app-01 kernel: last sysfs file:
> /devices/pci0000:00/0000:00:02.0/0000:04:00.1/irq
> Dec 27 07:45:39 chelco-app-01 kernel: Modules linked in: raw dock button
> battery ac loop dm_snapshot usbhid dm_mod uhci_hcd bnx2x hw_random ehci_hcd
> qla2xxx hpilo usbcore firmware_class scsi_transport_fc parport_pc lp parport
> ext3 jbd edd
> fan thermal processor cciss sd_mod scsi_mod
> Dec 27 07:45:39 chelco-app-01 kernel: CPU:    4
> Dec 27 07:45:39 chelco-app-01 kernel: EIP:    0060:[<f90ab3a7>]    Tainted: G
>      X VLI
> Dec 27 07:45:39 chelco-app-01 kernel: EFLAGS: 00210202
> (2.6.16.60-0.93.1-bigsmp #1)
> Dec 27 07:45:39 chelco-app-01 kernel: EIP is at __map_bio+0x50/0x11f [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel: eax: f90960c4   ebx: 00000000   ecx:
> f7ff2a60   edx: f7794440
> Dec 27 07:45:39 chelco-app-01 kernel: esi: f7ff2a58   edi: f90960c4   ebp:
> f46306c0   esp: f4c15d28
> Dec 27 07:45:39 chelco-app-01 kernel: ds: 007b   es: 007b   ss: 0068
> Dec 27 07:45:39 chelco-app-01 kernel: Process lvcreate (pid: 6678,
> threadinfo=f4c14000 task=f7838680)
> Dec 27 07:45:39 chelco-app-01 kernel: Stack: <0>f7794340 f7794440 f7794440
> 03201ff0 00000000 03201ff0 00000000 00000008
> Dec 27 07:45:39 chelco-app-01 kernel:        00000000 00000000 f90960c4
> f7ff2a68 f46306c0 f90abd1b 00000000 00000001
> Dec 27 07:45:39 chelco-app-01 kernel:        00000008 f428e2e0 fcdfe010
> ffffffff c0113d62 00000000 0000001f f7ff2a58
> Dec 27 07:45:39 chelco-app-01 kernel: Call Trace:
> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90abd1b>] __split_bio+0x182/0x440
> [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0113d62>] do_flush_tlb_all+0x0/0x5d
> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90abff0>]
> __flush_deferred_io+0x17/0x20 [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90ac14c>] dm_resume+0x8e/0xf9 [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90aedd8>] dev_suspend+0x138/0x157
> [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90af607>] ctl_ioctl+0x220/0x26e [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel:  [<f90aeca0>] dev_suspend+0x0/0x157 [dm_mod]
> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179ce8>] do_ioctl+0x48/0x5e
> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179f60>] vfs_ioctl+0x262/0x275
> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0179fc7>] sys_ioctl+0x54/0x6d
> Dec 27 07:45:39 chelco-app-01 kernel:  [<c0103dcb>] sysenter_past_esp+0x54/0x79
> Dec 27 07:45:39 chelco-app-01 kernel: Code: b4 0a f9 89 70 40 8b 06 83 c0 0c
> f0 ff 00 8b 54 24 08 8d 4e 08 8b 02 8b 52 04 89 44 24 0c 89 f8 89 54 24 10 8b
> 5f 04 8b 54 24 08 <ff> 53 1c 83 f8 00 89 c2 0f 8e 93 00 00 00 8b 54 24 08 8b 42 0c
> #############################################################
>
> The result is the target volume gets suspended and the only way to fix it is
> to reboot and remove the faulty snapshot when it comes back up.
>
> Now the script I wrote that creates these snapshots will use all available
> extents from the Volume Group pool which in this case was actually larger than
> the size of the volume I was trying to snapshot. Thinking this was the
> problem, I tried creating the snapshot several times using a snapshot size
> less than or equal to the target volume and it worked every time. So, I tried
> a value larger than the target to generate a crash and it did BUT not every
> time. In fact now I can't get it to segfault at all.
>
> So my question is: is creating the snapshot volume with a size larger than the
> target volume inducing segfaults randomly or could there be another problem
> lurking? If these weren't production machines I would normally just go with a
> size smaller than the target but I really need to be sure what exactly is
> causing the segfaults.
>
> Any help would be appreciated.


Any special reason to use lvm2 from the year 2006 in the year 2013 ?
There is no big point in fixing some particular bugs any many years obsoleted 
source code.

Can you try to use/rebuild more recent version?

Zdenek
