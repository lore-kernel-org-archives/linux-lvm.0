Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8HG02Cl032255
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2014 12:00:02 -0400
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8HFxxDc009616
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2014 12:00:01 -0400
Received: by mail-vc0-f173.google.com with SMTP id le20so1487255vcb.32
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2014 08:59:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <99ACAC11-1051-4C96-A81F-E4B0845D3145@redhat.com>
References: <CACjhXxfZak7n=zBvfPX3FtpZeBM88eBm8RnweguOZjpwdoG0ew@mail.gmail.com>
	<590C03FA-0051-4DCF-B568-C0A47B16AA49@redhat.com>
	<CACjhXxdyw1Sx4iMKT7dMUFTRwd--zLpt8BK8iyedCj_bPiTCWg@mail.gmail.com>
	<99ACAC11-1051-4C96-A81F-E4B0845D3145@redhat.com>
Date: Wed, 17 Sep 2014 11:59:59 -0400
Message-ID: <CACjhXxcvqtBJ2h2efNRDu2FbhQ=v+S_X3NtBOzUb2rXo2L+9og@mail.gmail.com>
From: Elvin Cako <ecako@cogolabs.com>
Content-Type: multipart/alternative; boundary=001a11c3678cc54754050344f5c3
Subject: Re: [linux-lvm] [data] Re:  Setting up LVM cache causes crash
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
To: Brassow Jonathan <jbrassow@redhat.com>
Cc: data <data@cogolabs.com>, LVM general discussion and development <linux-lvm@redhat.com>

--001a11c3678cc54754050344f5c3
Content-Type: text/plain; charset=UTF-8

Hello Jonathan,

Here is the output of the kernel log:

[  933.985159] device-mapper: cache: Metadata device dm-3 is larger than
33292800 sectors: excess space will not be used.^M

[  934.001112] device-mapper: cache-policy-mq: version 1.2.0 loaded^M

[  937.261742] TECH PREVIEW: DM cache may not be fully supported.^M

[  937.261742] Please review provided documentation for limitations.^M

[  937.275035] bio: create slab <bio-2> at 2^M

[  939.495826] ------------[ cut here ]------------^M

[  939.501134] kernel BUG at
drivers/md/persistent-data/dm-btree-spine.c:169!^M

[  939.508552] invalid opcode: 0000 [#1] SMP ^M

[  939.513230] Modules linked in: dm_cache_mq dm_cache() dm_persistent_data
dm_bio_prison dm_bufio raid1 ext4 mbcache jbd2 sg ip6t_REJECT
nf_conntrack_ipv6 nf_defrag_ipv6 xt_conntrack nf_conntrack ip6table_filter
ip6_tables iTCO_wdt iTCO_vendor_support coretemp kvm_intel kvm
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel aesni_intel
lrw gf128mul glue_helper ablk_helper cryptd pcspkr sb_edac edac_core
i2c_i801 ixgbe igb lpc_ich mdio ptp mei_me mfd_core pps_core mei ioatdma
ntb dca ses enclosure ipmi_devintf wmi shpchp ipmi_si ipmi_msghandler mperf
nfsd auth_rpcgss nfs_acl lockd sunrpc xfs libcrc32c sd_mod crc_t10dif
crct10dif_common mgag200 syscopyarea sysfillrect sysimgblt i2c_algo_bit
drm_kms_helper ttm isci ahci drm libsas libahci libata mpt2sas(OF) i2c_core
raid_class scsi_transport_sas dm_mirror dm_region_hash dm_log dm_mod^M

[  939.594520] CPU: 31 PID: 7241 Comm: vgchange Tainted: GF
O-------------- T 3.10.0-123.6.3.el7.x86_64 #1^M

[  939.605410] Hardware name: Supermicro SYS-F617R2-RT+/X9DRFR, BIOS 3.0b
04/24/2014^M

[  939.613653] task: ffff883fd0460b60 ti: ffff883fcfe2a000 task.ti:
ffff883fcfe2a000^M

[  939.621891] RIP: 0010:[<ffffffffa052e73a>]  [<ffffffffa052e73a>]
ro_pop+0x2a/0x30 [dm_persistent_data]^M

[  939.631988] RSP: 0018:ffff883fcfe2bb20  EFLAGS: 00010246^M

[  939.638057] RAX: 0000000000000000 RBX: 0000000000000008 RCX:
0000000000000000^M

[  939.645961] RDX: 0000000000000000 RSI: 0000000000000246 RDI:
ffff883fcfe2bb80^M

[  939.653867] RBP: ffff883fcfe2bb70 R08: 0000000000000000 R09:
0000000000000000^M

[  939.661774] R10: 0000000000000000 R11: 0000000000000002 R12:
0000000000000008^M

[  939.669687] R13: ffffffffa05277a0 R14: ffff883fcfe2bbd0 R15:
ffff883e02f2a000^M

[  939.677596] FS:  00007ff8d7333880(0000) GS:ffff88407fde0000(0000)
knlGS:0000000000000000^M

[  939.686477] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033^M

[  939.693034] CR2: 00007f0139cfd50a CR3: 0000003fcfb75000 CR4:
00000000000407e0^M

[  939.700986] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000^M

[  939.708930] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
0000000000000400^M

[  939.716858] Stack:^M

[  939.719691]  ffffffffa052c5a2 00000000000001fd ffff883fcfe2bb80
ffff883fcfe2bba0^M

[  939.728009]  000000006c9004a8 0000000000000106 ffffffffa05277a0
ffff883fcfe2bbd0^M

[  939.736314]  ffff883fd2956800 ffff883fcb86d800 ffff883fcfe2bbc0
ffffffffa052d21e^M

[  939.744615] Call Trace:^M

[  939.747897]  [<ffffffffa052c5a2>] ? walk_node+0xc2/0x100
[dm_persistent_data]^M

[  939.755880]  [<ffffffffa05277a0>] ? block_dec+0x160/0x160
[dm_persistent_data]^M

[  939.763965]  [<ffffffffa052d21e>] dm_btree_walk+0x4e/0x80
[dm_persistent_data]^M

[  939.772045]  [<ffffffffa0540a30>] ? complete_migration+0x30/0x30
[dm_cache]^M

[  939.779854]  [<ffffffffa05275dc>] dm_array_walk+0x3c/0x60
[dm_persistent_data]^M

[  939.787926]  [<ffffffffa0543700>] ?
blocks_are_unmapped_or_clean+0xd0/0xd0 [dm_cache]^M

[  939.796622]  [<ffffffffa054451f>] dm_cache_load_mappings+0x7f/0xe0
[dm_cache]^M

[  939.804642]  [<ffffffffa0540a30>] ? complete_migration+0x30/0x30
[dm_cache]^M

[  939.812510]  [<ffffffff810f0001>] ? kdb_register_repeat+0xe1/0x270^M

[  939.819600]  [<ffffffffa0542ef9>] cache_preresume+0xf9/0x1a0 [dm_cache]^M

[  939.827137]  [<ffffffffa0005ff9>] dm_table_resume_targets+0x49/0xe0
[dm_mod]^M

[  939.835103]  [<ffffffffa000389c>] dm_resume+0x4c/0xd0 [dm_mod]^M

[  939.841870]  [<ffffffffa0008bcb>] dev_suspend+0x12b/0x250 [dm_mod]^M

[  939.848955]  [<ffffffffa0008aa0>] ? table_load+0x380/0x380 [dm_mod]^M

[  939.856118]  [<ffffffffa00094e5>] ctl_ioctl+0x255/0x500 [dm_mod]^M

[  939.863040]  [<ffffffff8123d7c4>] ? SYSC_semtimedop+0x264/0xd10^M

[  939.869844]  [<ffffffffa00097a3>] dm_ctl_ioctl+0x13/0x20 [dm_mod]^M

[  939.876845]  [<ffffffff811c2c15>] do_vfs_ioctl+0x2e5/0x4c0^M

[  939.883229]  [<ffffffff8123c2c9>] ? sem_security+0x9/0x10^M

[  939.889496]  [<ffffffff8123a8c9>] ? ipcget+0x149/0x1c0^M

[  939.895492]  [<ffffffff811c2e91>] SyS_ioctl+0xa1/0xc0^M

[  939.901395]  [<ffffffff815f2799>] system_call_fastpath+0x16/0x1b^M

[  939.908205] Code: 90 66 66 66 66 90 8b 47 08 85 c0 74 1e 83 e8 01 55 89
47 08 48 98 48 8b 74 c7 10 48 8b 07 48 89 e5 48 8b 38 e8 38 d4 ff ff 5d c3
<0f> 0b 0f 1f 40 00 66 66 66 66 90 8b 47 08 85 c0 74 15 83 e8 01 ^M

[  939.930089] RIP  [<ffffffffa052e73a>] ro_pop+0x2a/0x30
[dm_persistent_data]^M

[  939.937872]  RSP <ffff883fcfe2bb20>^M



Let me know if there is anything else I can do.

On Mon, Sep 8, 2014 at 12:03 PM, Brassow Jonathan <jbrassow@redhat.com>
wrote:

>
> On Sep 3, 2014, at 10:58 AM, Elvin Cako wrote:
>
> > Hello Jonathan,
> >
> > Thanks for the reply. In regards to the information you are seeking:
> >
> > 1) I've attached the output of the verbose vgchange command
> >
> > 2) By crash, I mean the machine hangs then automatically reboots itself.
> >
> > Hope that helps.
> >
>
>
> Thanks for providing the verbose output.  Everything seems to be going
> fine until it just cuts off at the end.  Is there anything in the log that
> might suggest what is going on from the kernel's perspective?
>
>  brassow
>
>


-- 
Elvin

--001a11c3678cc54754050344f5c3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Jonathan,<div><br></div><div>Here is the output of t=
he kernel log:</div><div><br></div><div><p style=3D"margin:0px;font-size:11=
px;font-family:Menlo">[=C2=A0 933.985159] device-mapper: cache: Metadata de=
vice dm-3 is larger than 33292800 sectors: excess space will not be used.^M=
</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 934.001112=
] device-mapper: cache-policy-mq: version 1.2.0 loaded^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 937.261742=
] TECH PREVIEW: DM cache may not be fully supported.^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 937.261742=
] Please review provided documentation for limitations.^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 937.275035=
] bio: create slab &lt;bio-2&gt; at 2^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.495826=
] ------------[ cut here ]------------^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.501134=
] kernel BUG at drivers/md/persistent-data/dm-btree-spine.c:169!^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.508552=
] invalid opcode: 0000 [#1] SMP ^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.513230=
] Modules linked in: dm_cache_mq dm_cache() dm_persistent_data dm_bio_priso=
n dm_bufio raid1 ext4 mbcache jbd2 sg ip6t_REJECT nf_conntrack_ipv6 nf_defr=
ag_ipv6 xt_conntrack nf_conntrack ip6table_filter ip6_tables iTCO_wdt iTCO_=
vendor_support coretemp kvm_intel kvm crct10dif_pclmul crc32_pclmul crc32c_=
intel ghash_clmulni_intel aesni_intel lrw gf128mul glue_helper ablk_helper =
cryptd pcspkr sb_edac edac_core i2c_i801 ixgbe igb lpc_ich mdio ptp mei_me =
mfd_core pps_core mei ioatdma ntb dca ses enclosure ipmi_devintf wmi shpchp=
 ipmi_si ipmi_msghandler mperf nfsd auth_rpcgss nfs_acl lockd sunrpc xfs li=
bcrc32c sd_mod crc_t10dif crct10dif_common mgag200 syscopyarea sysfillrect =
sysimgblt i2c_algo_bit drm_kms_helper ttm isci ahci drm libsas libahci liba=
ta mpt2sas(OF) i2c_core raid_class scsi_transport_sas dm_mirror dm_region_h=
ash dm_log dm_mod^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.594520=
] CPU: 31 PID: 7241 Comm: vgchange Tainted: GF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 O-------------- T 3.10.0-123.6.3.el7.x86_64 #1^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.605410=
] Hardware name: Supermicro SYS-F617R2-RT+/X9DRFR, BIOS 3.0b 04/24/2014^M</=
p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.613653=
] task: ffff883fd0460b60 ti: ffff883fcfe2a000 task.ti: ffff883fcfe2a000^M</=
p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.621891=
] RIP: 0010:[&lt;ffffffffa052e73a&gt;]=C2=A0 [&lt;ffffffffa052e73a&gt;] ro_=
pop+0x2a/0x30 [dm_persistent_data]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.631988=
] RSP: 0018:ffff883fcfe2bb20=C2=A0 EFLAGS: 00010246^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.638057=
] RAX: 0000000000000000 RBX: 0000000000000008 RCX: 0000000000000000^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.645961=
] RDX: 0000000000000000 RSI: 0000000000000246 RDI: ffff883fcfe2bb80^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.653867=
] RBP: ffff883fcfe2bb70 R08: 0000000000000000 R09: 0000000000000000^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.661774=
] R10: 0000000000000000 R11: 0000000000000002 R12: 0000000000000008^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.669687=
] R13: ffffffffa05277a0 R14: ffff883fcfe2bbd0 R15: ffff883e02f2a000^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.677596=
] FS:=C2=A0 00007ff8d7333880(0000) GS:ffff88407fde0000(0000) knlGS:00000000=
00000000^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.686477=
] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.693034=
] CR2: 00007f0139cfd50a CR3: 0000003fcfb75000 CR4: 00000000000407e0^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.700986=
] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.708930=
] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.716858=
] Stack:^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.719691=
]=C2=A0 ffffffffa052c5a2 00000000000001fd ffff883fcfe2bb80 ffff883fcfe2bba0=
^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.728009=
]=C2=A0 000000006c9004a8 0000000000000106 ffffffffa05277a0 ffff883fcfe2bbd0=
^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.736314=
]=C2=A0 ffff883fd2956800 ffff883fcb86d800 ffff883fcfe2bbc0 ffffffffa052d21e=
^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.744615=
] Call Trace:^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.747897=
]=C2=A0 [&lt;ffffffffa052c5a2&gt;] ? walk_node+0xc2/0x100 [dm_persistent_da=
ta]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.755880=
]=C2=A0 [&lt;ffffffffa05277a0&gt;] ? block_dec+0x160/0x160 [dm_persistent_d=
ata]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.763965=
]=C2=A0 [&lt;ffffffffa052d21e&gt;] dm_btree_walk+0x4e/0x80 [dm_persistent_d=
ata]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.772045=
]=C2=A0 [&lt;ffffffffa0540a30&gt;] ? complete_migration+0x30/0x30 [dm_cache=
]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.779854=
]=C2=A0 [&lt;ffffffffa05275dc&gt;] dm_array_walk+0x3c/0x60 [dm_persistent_d=
ata]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.787926=
]=C2=A0 [&lt;ffffffffa0543700&gt;] ? blocks_are_unmapped_or_clean+0xd0/0xd0=
 [dm_cache]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.796622=
]=C2=A0 [&lt;ffffffffa054451f&gt;] dm_cache_load_mappings+0x7f/0xe0 [dm_cac=
he]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.804642=
]=C2=A0 [&lt;ffffffffa0540a30&gt;] ? complete_migration+0x30/0x30 [dm_cache=
]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.812510=
]=C2=A0 [&lt;ffffffff810f0001&gt;] ? kdb_register_repeat+0xe1/0x270^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.819600=
]=C2=A0 [&lt;ffffffffa0542ef9&gt;] cache_preresume+0xf9/0x1a0 [dm_cache]^M<=
/p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.827137=
]=C2=A0 [&lt;ffffffffa0005ff9&gt;] dm_table_resume_targets+0x49/0xe0 [dm_mo=
d]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.835103=
]=C2=A0 [&lt;ffffffffa000389c&gt;] dm_resume+0x4c/0xd0 [dm_mod]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.841870=
]=C2=A0 [&lt;ffffffffa0008bcb&gt;] dev_suspend+0x12b/0x250 [dm_mod]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.848955=
]=C2=A0 [&lt;ffffffffa0008aa0&gt;] ? table_load+0x380/0x380 [dm_mod]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.856118=
]=C2=A0 [&lt;ffffffffa00094e5&gt;] ctl_ioctl+0x255/0x500 [dm_mod]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.863040=
]=C2=A0 [&lt;ffffffff8123d7c4&gt;] ? SYSC_semtimedop+0x264/0xd10^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.869844=
]=C2=A0 [&lt;ffffffffa00097a3&gt;] dm_ctl_ioctl+0x13/0x20 [dm_mod]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.876845=
]=C2=A0 [&lt;ffffffff811c2c15&gt;] do_vfs_ioctl+0x2e5/0x4c0^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.883229=
]=C2=A0 [&lt;ffffffff8123c2c9&gt;] ? sem_security+0x9/0x10^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.889496=
]=C2=A0 [&lt;ffffffff8123a8c9&gt;] ? ipcget+0x149/0x1c0^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.895492=
]=C2=A0 [&lt;ffffffff811c2e91&gt;] SyS_ioctl+0xa1/0xc0^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.901395=
]=C2=A0 [&lt;ffffffff815f2799&gt;] system_call_fastpath+0x16/0x1b^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.908205=
] Code: 90 66 66 66 66 90 8b 47 08 85 c0 74 1e 83 e8 01 55 89 47 08 48 98 4=
8 8b 74 c7 10 48 8b 07 48 89 e5 48 8b 38 e8 38 d4 ff ff 5d c3 &lt;0f&gt; 0b=
 0f 1f 40 00 66 66 66 66 90 8b 47 08 85 c0 74 15 83 e8 01 ^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.930089=
] RIP=C2=A0 [&lt;ffffffffa052e73a&gt;] ro_pop+0x2a/0x30 [dm_persistent_data=
]^M</p>
<p style=3D"margin:0px;font-size:11px;font-family:Menlo">[=C2=A0 939.937872=
]=C2=A0 RSP &lt;ffff883fcfe2bb20&gt;^M</p><p style=3D"margin:0px;font-size:=
11px;font-family:Menlo"><br></p><p style=3D"margin:0px;font-size:11px;font-=
family:Menlo"><br></p><p style=3D"margin:0px;font-size:11px;font-family:Men=
lo">Let me know if there is anything else I can do.</p></div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Sep 8, 2014 at 12=
:03 PM, Brassow Jonathan <span dir=3D"ltr">&lt;<a href=3D"mailto:jbrassow@r=
edhat.com" target=3D"_blank">jbrassow@redhat.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D""><br>
On Sep 3, 2014, at 10:58 AM, Elvin Cako wrote:<br>
<br>
&gt; Hello Jonathan,<br>
&gt;<br>
&gt; Thanks for the reply. In regards to the information you are seeking:<b=
r>
&gt;<br>
&gt; 1) I&#39;ve attached the output of the verbose vgchange command<br>
&gt;<br>
&gt; 2) By crash, I mean the machine hangs then automatically reboots itsel=
f.<br>
&gt;<br>
&gt; Hope that helps.<br>
&gt;<br>
<br>
<br>
</span>Thanks for providing the verbose output.=C2=A0 Everything seems to b=
e going fine until it just cuts off at the end.=C2=A0 Is there anything in =
the log that might suggest what is going on from the kernel&#39;s perspecti=
ve?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0brassow<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div dir=3D"ltr">Elvin</div>
</div>

--001a11c3678cc54754050344f5c3--
