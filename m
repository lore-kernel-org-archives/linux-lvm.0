Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJ9WmE2027130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 04:32:48 -0500
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mx1.redhat.com (Postfix) with ESMTPS id D40E98EFC1
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 09:32:45 +0000 (UTC)
Received: by lfdo63 with SMTP id o63so44017163lfd.2
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 01:32:44 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 19 Nov 2015 11:32:44 +0200
Message-ID: <CANvPVN3Ak2Hb35T0moMfA3m9BP0sZVEwdMdWUkDihEbLpnPjBg@mail.gmail.com>
From: Ciprian Hacman <ciprian.hacman@sematext.com>
Content-Type: multipart/alternative; boundary=001a11419124ea6bbc0524e17027
Subject: [linux-lvm] Kernel BUG at dm-cache-policy-mq.c
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a11419124ea6bbc0524e17027
Content-Type: text/plain; charset=UTF-8

Hi,

One more issue from me. As I said in my previous email, we are configuring
lvm with SSD caching and EBS volumes on some of our boxes in AWS. The OS
for those nodes is Ubuntu 15.10 (4.2.0-16-generic).

We already had 2 nodes down and seems to be related to the lvm caching
part. On one of the nodes we found this in the logs:

Nov 17 17:03:26 localhost kernel: [1650439.548785] ------------[ cut here
]------------
Nov 17 17:03:26 localhost kernel: [1650439.552225] kernel BUG at
/build/linux-AxjFAn/linux-4.2.0/drivers/md/dm-cache-policy-mq.c:1079!
Nov 17 17:03:26 localhost kernel: [1650439.552561] invalid opcode: 0000
[#1] SMP
Nov 17 17:03:26 localhost kernel: [1650439.552561] Modules linked in: isofs
binfmt_misc xt_CHECKSUM iptable_mangle ipt_MASQUERADE
nf_nat_masquerade_ipv4 iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4
nf_nat_ipv4 nf_nat nf_conntrack xt_tcpudp bridge stp llc iptable_filter
ip_tables x_tables dm_cache_mq dm_cache dm_persistent_data dm_bio_prison
dm_bufio libcrc32c ppdev xen_fbfront syscopyarea sysfillrect sysimgblt
fb_sys_fops serio_raw parport_pc parport autofs4 raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq
raid1 multipath linear crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
raid0 aesni_intel aes_x86_64 lrw gf128mul glue_helper ablk_helper cryptd
psmouse floppy
Nov 17 17:03:26 localhost kernel: [1650439.552561] CPU: 1 PID: 68058 Comm:
java Not tainted 4.2.0-16-generic #19-Ubuntu
Nov 17 17:03:26 localhost kernel: [1650439.552561] Hardware name: Xen HVM
domU, BIOS 4.2.amazon 05/06/2015
Nov 17 17:03:26 localhost kernel: [1650439.552561] task: ffff880190241b80
ti: ffff8806f3cf4000 task.ti: ffff8806f3cf4000
Nov 17 17:03:26 localhost kernel: [1650439.552561] RIP:
0010:[<ffffffffc0182257>]  [<ffffffffc0182257>]
__mq_set_clear_dirty+0x47/0x80 [dm_cache_mq]
Nov 17 17:03:26 localhost kernel: [1650439.552561] RSP:
0018:ffff8806f3cf7730  EFLAGS: 00010246
Nov 17 17:03:26 localhost kernel: [1650439.552561] RAX: 0000000000000000
RBX: ffff88076a236080 RCX: ffffc90020f6aff8
Nov 17 17:03:26 localhost kernel: [1650439.552561] RDX: 0000000000f7b83e
RSI: ffffc9001fd39000 RDI: 0000000000000016
Nov 17 17:03:26 localhost kernel: [1650439.552561] RBP: ffff8806f3cf7748
R08: 0000000000000000 R09: ffff8801adb6c7c8
Nov 17 17:03:26 localhost kernel: [1650439.552561] R10: ffff88032fd31bb0
R11: ffff88076a22c858 R12: ffff88076a236000
Nov 17 17:03:26 localhost kernel: [1650439.552561] R13: 0000000000000001
R14: 000000000045c6ae R15: 0000000000000000
Nov 17 17:03:26 localhost kernel: [1650439.552561] FS:
 00007fccc4b27700(0000) GS:ffff88076f640000(0000) knlGS:0000000000000000
Nov 17 17:03:26 localhost kernel: [1650439.552561] CS:  0010 DS: 0000 ES:
0000 CR0: 0000000080050033
Nov 17 17:03:26 localhost kernel: [1650439.552561] CR2: 00007fce83a55000
CR3: 00000005b3d2b000 CR4: 00000000001406e0
Nov 17 17:03:26 localhost kernel: [1650439.552561] Stack:
Nov 17 17:03:26 localhost kernel: [1650439.552561]  ffff88076a236080
ffff88076a236000 0000000000f7b83e ffff8806f3cf7778
Nov 17 17:03:26 localhost kernel: [1650439.552561]  ffffffffc0182317
0000000000000000 000000000045c6ae ffff880476c014e0
Nov 17 17:03:26 localhost kernel: [1650439.552561]  ffff88076744f800
ffff8806f3cf7788 ffffffffc01a9862 ffff8806f3cf7818
Nov 17 17:03:26 localhost kernel: [1650439.552561] Call Trace:
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffffc0182317>]
mq_set_dirty+0x37/0x50 [dm_cache_mq]
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffffc01a9862>]
set_dirty+0x32/0x40 [dm_cache]
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffffc01ab3c9>]
remap_cell_to_cache_dirty+0x1d9/0x240 [dm_cache]
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffffc01ab900>]
cache_map+0x330/0x4d0 [dm_cache]
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffffc01a8eb0>] ?
cache_resume+0x30/0x30 [dm_cache]
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8166b2ee>]
__map_bio+0x3e/0x100
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8166d235>]
__split_and_process_bio+0x285/0x3f0
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8166d40d>]
dm_make_request+0x6d/0xc0
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff813952a6>]
generic_make_request+0xd6/0x110
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff810c3d61>] ?
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff81395356>]
submit_bio+0x76/0x170
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8138f51b>] ?
__bio_add_page.part.16+0x10b/0x270
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8128c311>]
ext4_io_submit+0x31/0x50
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8128c4c8>]
ext4_bio_write_page+0x168/0x410
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff81283351>]
mpage_submit_page+0x61/0x80
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff812835d6>]
mpage_map_and_submit_buffers+0x156/0x290
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff81288874>]
ext4_writepages+0x624/0xce0
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff811903be>]
do_writepages+0x1e/0x30
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8118335c>]
__filemap_fdatawrite_range+0xcc/0x100
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8118349a>]
filemap_write_and_wait_range+0x2a/0x70
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8127f831>]
ext4_sync_file+0xe1/0x2f0
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8122fc9b>]
vfs_fsync_range+0x4b/0xb0
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff8122fd5d>]
do_fsync+0x3d/0x70
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff81230023>]
SyS_fdatasync+0x13/0x20
Nov 17 17:03:26 localhost kernel: [1650439.552561]  [<ffffffff817ef9f2>]
entry_SYSCALL_64_fastpath+0x16/0x75
Nov 17 17:03:26 localhost kernel: [1650439.552561] Code: 89 f2 49 8b b4 24
80 0d 00 00 e8 c5 f5 ff ff 48 85 c0 74 17 49 3b 84 24 f8 00 00 00 48 89 c3
72 0a 49 3b 84 24 00 01 00 00 72 02 <0f> 0b 48 89 c6 4c 89 e7 41 83 e5 01
e8 08 ef ff ff 0f b6 43 28
Nov 17 17:03:26 localhost kernel: [1650439.552561] RIP
 [<ffffffffc0182257>] __mq_set_clear_dirty+0x47/0x80 [dm_cache_mq]
Nov 17 17:03:26 localhost kernel: [1650439.552561]  RSP <ffff8806f3cf7730>
Nov 17 17:03:26 localhost kernel: [1650439.740854] ---[ end trace
98483c1d54cc426e ]---


Is this something that has been seen before?
Would switching to RHEL/CentOS 7 make any difference?

Thanks,
Ciprian Hacman
--
Performance Monitoring * Log Analytics * Search Analytics
Solr & Elasticsearch Support * http://sematext.com/

--001a11419124ea6bbc0524e17027
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:13px">Hi,</div><div style=3D"font-=
size:13px"><br></div><div style=3D"font-size:13px">One more issue from me. =
As I said in my previous email, we are configuring lvm with SSD caching and=
 EBS volumes on some of our boxes in AWS. The OS for those nodes is Ubuntu =
15.10 (4.2.0-16-generic).</div><div style=3D"font-size:13px"><br></div><spa=
n style=3D"font-size:13px"><font face=3D"arial, helvetica, sans-serif">We a=
lready had 2 nodes down and seems to be related to the lvm caching part. On=
 one of the nodes we found this in the logs:</font></span><br><blockquote s=
tyle=3D"margin:0 0 0 40px;border:none;padding:0px"><div><div><font face=3D"=
monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.548785] --=
----------[ cut here ]------------</font></div></div><div><div><font face=
=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552225=
] kernel BUG at /build/linux-AxjFAn/linux-4.2.0/drivers/md/dm-cache-policy-=
mq.c:1079!</font></div></div><div><div><font face=3D"monospace, monospace">=
Nov 17 17:03:26 localhost kernel: [1650439.552561] invalid opcode: 0000 [#1=
] SMP=C2=A0</font></div></div><div><div><font face=3D"monospace, monospace"=
>Nov 17 17:03:26 localhost kernel: [1650439.552561] Modules linked in: isof=
s binfmt_misc xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_i=
pv4 iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conn=
track xt_tcpudp bridge stp llc iptable_filter ip_tables x_tables dm_cache_m=
q dm_cache dm_persistent_data dm_bio_prison dm_bufio libcrc32c ppdev xen_fb=
front syscopyarea sysfillrect sysimgblt fb_sys_fops serio_raw parport_pc pa=
rport autofs4 raid10 raid456 async_raid6_recov async_memcpy async_pq async_=
xor async_tx xor raid6_pq raid1 multipath linear crct10dif_pclmul crc32_pcl=
mul ghash_clmulni_intel raid0 aesni_intel aes_x86_64 lrw gf128mul glue_help=
er ablk_helper cryptd psmouse floppy</font></div></div><div><div><font face=
=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561=
] CPU: 1 PID: 68058 Comm: java Not tainted 4.2.0-16-generic #19-Ubuntu</fon=
t></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:26=
 localhost kernel: [1650439.552561] Hardware name: Xen HVM domU, BIOS 4.2.a=
mazon 05/06/2015</font></div></div><div><div><font face=3D"monospace, monos=
pace">Nov 17 17:03:26 localhost kernel: [1650439.552561] task: ffff88019024=
1b80 ti: ffff8806f3cf4000 task.ti: ffff8806f3cf4000</font></div></div><div>=
<div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: =
[1650439.552561] RIP: 0010:[&lt;ffffffffc0182257&gt;] =C2=A0[&lt;ffffffffc0=
182257&gt;] __mq_set_clear_dirty+0x47/0x80 [dm_cache_mq]</font></div></div>=
<div><div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost ker=
nel: [1650439.552561] RSP: 0018:ffff8806f3cf7730 =C2=A0EFLAGS: 00010246</fo=
nt></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:2=
6 localhost kernel: [1650439.552561] RAX: 0000000000000000 RBX: ffff88076a2=
36080 RCX: ffffc90020f6aff8</font></div></div><div><div><font face=3D"monos=
pace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561] RDX: 00=
00000000f7b83e RSI: ffffc9001fd39000 RDI: 0000000000000016</font></div></di=
v><div><div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost k=
ernel: [1650439.552561] RBP: ffff8806f3cf7748 R08: 0000000000000000 R09: ff=
ff8801adb6c7c8</font></div></div><div><div><font face=3D"monospace, monospa=
ce">Nov 17 17:03:26 localhost kernel: [1650439.552561] R10: ffff88032fd31bb=
0 R11: ffff88076a22c858 R12: ffff88076a236000</font></div></div><div><div><=
font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [16504=
39.552561] R13: 0000000000000001 R14: 000000000045c6ae R15: 000000000000000=
0</font></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17=
:03:26 localhost kernel: [1650439.552561] FS: =C2=A000007fccc4b27700(0000) =
GS:ffff88076f640000(0000) knlGS:0000000000000000</font></div></div><div><di=
v><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [16=
50439.552561] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 0000000080050033</font>=
</div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:26 l=
ocalhost kernel: [1650439.552561] CR2: 00007fce83a55000 CR3: 00000005b3d2b0=
00 CR4: 00000000001406e0</font></div></div><div><div><font face=3D"monospac=
e, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561] Stack:</fo=
nt></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:2=
6 localhost kernel: [1650439.552561] =C2=A0ffff88076a236080 ffff88076a23600=
0 0000000000f7b83e ffff8806f3cf7778</font></div></div><div><div><font face=
=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561=
] =C2=A0ffffffffc0182317 0000000000000000 000000000045c6ae ffff880476c014e0=
</font></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:=
03:26 localhost kernel: [1650439.552561] =C2=A0ffff88076744f800 ffff8806f3c=
f7788 ffffffffc01a9862 ffff8806f3cf7818</font></div></div><div><div><font f=
ace=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552=
561] Call Trace:</font></div></div><div><div><font face=3D"monospace, monos=
pace">Nov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;fffffff=
fc0182317&gt;] mq_set_dirty+0x37/0x50 [dm_cache_mq]</font></div></div><div>=
<div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: =
[1650439.552561] =C2=A0[&lt;ffffffffc01a9862&gt;] set_dirty+0x32/0x40 [dm_c=
ache]</font></div></div><div><div><font face=3D"monospace, monospace">Nov 1=
7 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffffc01ab3c9&g=
t;] remap_cell_to_cache_dirty+0x1d9/0x240 [dm_cache]</font></div></div><div=
><div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel:=
 [1650439.552561] =C2=A0[&lt;ffffffffc01ab900&gt;] cache_map+0x330/0x4d0 [d=
m_cache]</font></div></div><div><div><font face=3D"monospace, monospace">No=
v 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffffc01a8eb=
0&gt;] ? cache_resume+0x30/0x30 [dm_cache]</font></div></div><div><div><fon=
t face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.=
552561] =C2=A0[&lt;ffffffff8166b2ee&gt;] __map_bio+0x3e/0x100</font></div><=
/div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhos=
t kernel: [1650439.552561] =C2=A0[&lt;ffffffff8166d235&gt;] __split_and_pro=
cess_bio+0x285/0x3f0</font></div></div><div><div><font face=3D"monospace, m=
onospace">Nov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;fff=
fffff8166d40d&gt;] dm_make_request+0x6d/0xc0</font></div></div><div><div><f=
ont face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [165043=
9.552561] =C2=A0[&lt;ffffffff813952a6&gt;] generic_make_request+0xd6/0x110<=
/font></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:0=
3:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffff810c3d61&gt;] ? =
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20</font></div></div><div>=
<div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: =
[1650439.552561] =C2=A0[&lt;ffffffff81395356&gt;] submit_bio+0x76/0x170</fo=
nt></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:2=
6 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffff8138f51b&gt;] ? __b=
io_add_page.part.16+0x10b/0x270</font></div></div><div><div><font face=3D"m=
onospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561] =C2=
=A0[&lt;ffffffff8128c311&gt;] ext4_io_submit+0x31/0x50</font></div></div><d=
iv><div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kerne=
l: [1650439.552561] =C2=A0[&lt;ffffffff8128c4c8&gt;] ext4_bio_write_page+0x=
168/0x410</font></div></div><div><div><font face=3D"monospace, monospace">N=
ov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffff812833=
51&gt;] mpage_submit_page+0x61/0x80</font></div></div><div><div><font face=
=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561=
] =C2=A0[&lt;ffffffff812835d6&gt;] mpage_map_and_submit_buffers+0x156/0x290=
</font></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:=
03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffff81288874&gt;] e=
xt4_writepages+0x624/0xce0</font></div></div><div><div><font face=3D"monosp=
ace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&=
lt;ffffffff811903be&gt;] do_writepages+0x1e/0x30</font></div></div><div><di=
v><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [16=
50439.552561] =C2=A0[&lt;ffffffff8118335c&gt;] __filemap_fdatawrite_range+0=
xcc/0x100</font></div></div><div><div><font face=3D"monospace, monospace">N=
ov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffff811834=
9a&gt;] filemap_write_and_wait_range+0x2a/0x70</font></div></div><div><div>=
<font face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650=
439.552561] =C2=A0[&lt;ffffffff8127f831&gt;] ext4_sync_file+0xe1/0x2f0</fon=
t></div></div><div><div><font face=3D"monospace, monospace">Nov 17 17:03:26=
 localhost kernel: [1650439.552561] =C2=A0[&lt;ffffffff8122fc9b&gt;] vfs_fs=
ync_range+0x4b/0xb0</font></div></div><div><div><font face=3D"monospace, mo=
nospace">Nov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0[&lt;ffff=
ffff8122fd5d&gt;] do_fsync+0x3d/0x70</font></div></div><div><div><font face=
=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [1650439.552561=
] =C2=A0[&lt;ffffffff81230023&gt;] SyS_fdatasync+0x13/0x20</font></div></di=
v><div><div><font face=3D"monospace, monospace">Nov 17 17:03:26 localhost k=
ernel: [1650439.552561] =C2=A0[&lt;ffffffff817ef9f2&gt;] entry_SYSCALL_64_f=
astpath+0x16/0x75</font></div></div><div><div><font face=3D"monospace, mono=
space">Nov 17 17:03:26 localhost kernel: [1650439.552561] Code: 89 f2 49 8b=
 b4 24 80 0d 00 00 e8 c5 f5 ff ff 48 85 c0 74 17 49 3b 84 24 f8 00 00 00 48=
 89 c3 72 0a 49 3b 84 24 00 01 00 00 72 02 &lt;0f&gt; 0b 48 89 c6 4c 89 e7 =
41 83 e5 01 e8 08 ef ff ff 0f b6 43 28=C2=A0</font></div></div><div><div><f=
ont face=3D"monospace, monospace">Nov 17 17:03:26 localhost kernel: [165043=
9.552561] RIP =C2=A0[&lt;ffffffffc0182257&gt;] __mq_set_clear_dirty+0x47/0x=
80 [dm_cache_mq]</font></div></div><div><div><font face=3D"monospace, monos=
pace">Nov 17 17:03:26 localhost kernel: [1650439.552561] =C2=A0RSP &lt;ffff=
8806f3cf7730&gt;</font></div></div><div><div><font face=3D"monospace, monos=
pace">Nov 17 17:03:26 localhost kernel: [1650439.740854] ---[ end trace 984=
83c1d54cc426e ]---</font></div></div></blockquote><div><div style=3D"font-s=
ize:13px"><br></div></div><div style=3D"font-size:13px">Is this something t=
hat has been seen before?</div><div style=3D"font-size:13px">Would switchin=
g to RHEL/CentOS 7 make any difference?</div><div style=3D"font-size:13px">=
<br></div><div style=3D"font-size:13px">Thanks,</div><div style=3D"font-siz=
e:13px">Ciprian Hacman</div><div><div class=3D"gmail_signature"><div dir=3D=
"ltr"><div><div dir=3D"ltr">--</div><div dir=3D"ltr">Performance Monitoring=
 * Log Analytics * Search Analytics<br>Solr &amp; Elasticsearch Support *=
=C2=A0<a href=3D"http://sematext.com/" rel=3D"noreferrer" style=3D"color:rg=
b(17,85,204)" target=3D"_blank">http://sematext.com/</a><br></div></div></d=
iv></div></div>
</div>

--001a11419124ea6bbc0524e17027--
