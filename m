Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7G7HPV09726
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 03:17:25 -0400
Received: from mail.astral.ro (mail.astral.ro [193.230.240.11])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7G7HH44031164
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 03:17:17 -0400
Received: from 127.0.0.1 (localhost.localdomain [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id EFD453055F
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 10:17:11 +0300 (EEST)
Received: from [192.168.25.222] (dummy.cluj.astral.ro [193.230.240.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.astral.ro (Postfix) with ESMTP id D2ED23054D
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 10:17:11 +0300 (EEST)
Message-ID: <430192F7.5010801@astral.ro>
Date: Tue, 16 Aug 2005 10:17:11 +0300
From: Imre Gergely <imre.gergely@astral.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple snapshots
References: <4300816B.8060208@astral.ro> <430189C1.8030000@astral.ro>
In-Reply-To: <430189C1.8030000@astral.ro>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


i've got a log entry for one of the oops-es:

Unable to handle kernel paging request at virtual address 00100108
 printing eip:
c025e142
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: pcnet32
CPU:    0
EIP:    0060:[<c025e142>]    Not tainted VLI
EFLAGS: 00010213   (2.6.12.5)
EIP is at __origin_write+0x62/0x230
eax: 001000e0   ebx: c59a9c60   ecx: c7c915c0   edx: ffff0001
esi: 001000e0   edi: c568a7cc   ebp: 00000000   esp: c7189cd0
ds: 007b   es: 007b   ss: 0068
Process kjournald (pid: 991, threadinfo=c7188000 task=c7c915c0)
Stack: c70b6580 c7189d04 00000001 c7189cf4 00000000 c025dbc0 c7c5fe3c
c48b4cec
       00000000 c6285460 00001340 00000010 c61b6b40 c5f0c220 00002be0
00000010
       c1bca9e0 c037ae7c 00000001 c32e9aec c7189da4 c025e357 c568a7cc
c1bca560
Call Trace:
 [<c025dbc0>] copy_callback+0x0/0x50
 [<c025e357>] do_origin+0x47/0x70
 [<c0251449>] __map_bio+0x49/0x120
 [<c02518c1>] __clone_and_map+0x2a1/0x2b0
 [<c0127470>] autoremove_wake_function+0x0/0x60
 [<c0251978>] __split_bio+0xa8/0x130
 [<c0251a6e>] dm_request+0x6e/0xa0
 [<c0205c67>] generic_make_request+0x147/0x1e0
 [<c0127470>] autoremove_wake_function+0x0/0x60
 [<c0127470>] autoremove_wake_function+0x0/0x60
 [<c0127470>] autoremove_wake_function+0x0/0x60
 [<c0205d62>] submit_bio+0x62/0x100
 [<c0153c44>] bio_alloc_bioset+0xe4/0x1c0
 [<c0153d40>] bio_alloc+0x20/0x30
 [<c0153572>] submit_bh+0xd2/0x120
 [<c01c2371>] journal_commit_transaction+0xd51/0x1220
 [<c01048be>] do_IRQ+0x1e/0x30
 [<c02b51c7>] schedule+0x347/0x5e0
 [<c01c4ab6>] kjournald+0xd6/0x250
 [<c0127470>] autoremove_wake_function+0x0/0x60
 [<c0127470>] autoremove_wake_function+0x0/0x60
 [<c01029ae>] ret_from_fork+0x6/0x14
 [<c01c49c0>] commit_timeout+0x0/0x10
 [<c01c49e0>] kjournald+0x0/0x250
 [<c0100c31>] kernel_thread_helper+0x5/0x14
Code: 85 d2 0f 85 46 01 00 00 8b 53 18 8d 42 e8 89 c3 8b 40 18 0f 18 00
90 39 fa 75 e2 8b 44 24 1c 85 c0 0f 84 fc 00 00 00 8b 74 24 1c <8b> 46
28 ba 01 00 ff ff 0f c1 10 85 d2 0f 85 2e 05 00 00 85 ed

at this point the system still works but i cannot do reading/writing on
that mounted partition. looks like ext3's journal has some problems with
the snapshots?

i did a restart, i removed, then recreated the two snapshots, did some
reading/writing, then another oops popped up:

Aug 16 10:32:21 fc2 kernel: Unable to handle kernel NULL pointer
dereference at
virtual address 00000000
Aug 16 10:32:21 fc2 kernel:  printing eip:
Aug 16 10:32:21 fc2 kernel: c025e196
Aug 16 10:32:21 fc2 kernel: *pde = 00000000
Aug 16 10:32:21 fc2 kernel: Oops: 0002 [#1]
Aug 16 10:32:21 fc2 kernel: PREEMPT
Aug 16 10:32:21 fc2 kernel: Modules linked in: pcnet32
Aug 16 10:32:21 fc2 kernel: CPU:    0
Aug 16 10:32:21 fc2 kernel: EIP:    0060:[<c025e196>]    Not tainted VLI
Aug 16 10:32:21 fc2 kernel: EFLAGS: 00010246   (2.6.12.5)
Aug 16 10:32:21 fc2 kernel: EIP is at __origin_write+0xb6/0x230
Aug 16 10:32:21 fc2 kernel: eax: 00000000   ebx: c583c0e0   ecx:
c7fc2560   edx:
 0000ffff
Aug 16 10:32:21 fc2 kernel: esi: c57a9b0c   edi: c507498c   ebp:
00000000   esp:
 c7fe5b14
Aug 16 10:32:21 fc2 kernel: ds: 007b   es: 007b   ss: 0068
Aug 16 10:32:21 fc2 kernel: Process pdflush (pid: 8, threadinfo=c7fe4000
task=c7
fc2560)
Aug 16 10:32:21 fc2 kernel: Stack: c4c796a0 c7fe5b48 00000001 c7fe5b38
00000000
c025dbc0 c57a9b0c c7c5f1dc
Aug 16 10:32:21 fc2 kernel:        00000000 c5332dc0 000009e0 00000010
c50ed330
c7ee0520 000044e0 00000010
Aug 16 10:32:21 fc2 kernel:        c73e8620 c037ae7c 00000001 c51a4dbc
c7fe5be8
c025e357 c507498c c73e85c0
Aug 16 10:32:21 fc2 kernel: Call Trace:
Aug 16 10:32:22 fc2 kernel:  [<c025dbc0>] copy_callback+0x0/0x50
Aug 16 10:32:22 fc2 kernel:  [<c025e357>] do_origin+0x47/0x70
Aug 16 10:32:22 fc2 kernel:  [<c0251449>] __map_bio+0x49/0x120
Aug 16 10:32:22 fc2 kernel:  [<c02518c1>] __clone_and_map+0x2a1/0x2b0
Aug 16 10:32:22 fc2 kernel:  [<c0127470>] autoremove_wake_function+0x0/0x60
Aug 16 10:32:22 fc2 kernel:  [<c0251978>] __split_bio+0xa8/0x130
Aug 16 10:32:22 fc2 kernel:  [<c0251a6e>] dm_request+0x6e/0xa0
Aug 16 10:32:22 fc2 kernel:  [<c0205c67>] generic_make_request+0x147/0x1e0
Aug 16 10:32:22 fc2 kernel:  [<c0127470>] autoremove_wake_function+0x0/0x60
Aug 16 10:32:22 fc2 last message repeated 2 times
Aug 16 10:32:22 fc2 kernel:  [<c0205d62>] submit_bio+0x62/0x100
Aug 16 10:32:22 fc2 kernel:  [<c0153c44>] bio_alloc_bioset+0xe4/0x1c0
Aug 16 10:32:22 fc2 kernel:  [<c0153d40>] bio_alloc+0x20/0x30
Aug 16 10:32:22 fc2 kernel:  [<c0153572>] submit_bh+0xd2/0x120
Aug 16 10:32:22 fc2 kernel:  [<c0151c90>]
__block_write_full_page+0x150/0x320
Aug 16 10:32:22 fc2 kernel:  [<c01533dd>] block_write_full_page+0xcd/0x100
Aug 16 10:32:22 fc2 kernel:  [<c01b2620>] ext3_get_block+0x0/0xa0
Aug 16 10:32:22 fc2 kernel:  [<c01b3292>] ext3_ordered_writepage+0xd2/0x1c0
Aug 16 10:32:22 fc2 kernel:  [<c01b2620>] ext3_get_block+0x0/0xa0
Aug 16 10:32:22 fc2 kernel:  [<c01b3180>] bget_one+0x0/0x10
Aug 16 10:32:22 fc2 kernel:  [<c0173842>] mpage_writepages+0x262/0x3e0
Aug 16 10:32:22 fc2 kernel:  [<c01b31c0>] ext3_ordered_writepage+0x0/0x1c0
Aug 16 10:32:22 fc2 kernel:  [<c013739d>] do_writepages+0x3d/0x50
Aug 16 10:32:22 fc2 kernel:  [<c0171d61>] __sync_single_inode+0x71/0x210
Aug 16 10:32:22 fc2 kernel:  [<c0171f67>]
__writeback_single_inode+0x67/0x150
Aug 16 10:32:22 fc2 kernel:  [<c0251b70>] dm_any_congested+0x30/0x60
Aug 16 10:32:22 fc2 kernel:  [<c0253e8d>] dm_table_any_congested+0x5d/0x60
Aug 16 10:32:22 fc2 kernel:  [<c0251b70>] dm_any_congested+0x30/0x60
Aug 16 10:32:22 fc2 kernel:  [<c01721e7>] sync_sb_inodes+0x197/0x2a0
Aug 16 10:32:22 fc2 kernel:  [<c01723c4>] writeback_inodes+0xd4/0xf0
Aug 16 10:32:22 fc2 kernel:  [<c0137053>] background_writeout+0x73/0xc0
Aug 16 10:32:22 fc2 kernel:  [<c0137afb>] __pdflush+0xbb/0x1a0
Aug 16 10:32:22 fc2 kernel:  [<c0137be0>] pdflush+0x0/0x30
Aug 16 10:32:22 fc2 kernel:  [<c0137c08>] pdflush+0x28/0x30
Aug 16 10:32:22 fc2 kernel:  [<c0136fe0>] background_writeout+0x0/0xc0
Aug 16 10:32:22 fc2 kernel:  [<c0137be0>] pdflush+0x0/0x30
Aug 16 10:32:22 fc2 kernel:  [<c0126fa5>] kthread+0xa5/0xb0
Aug 16 10:32:22 fc2 kernel:  [<c0126f00>] kthread+0x0/0xb0
Aug 16 10:32:22 fc2 kernel:  [<c0100c31>] kernel_thread_helper+0x5/0x14
Aug 16 10:32:22 fc2 kernel: Code: c0 0f 84 e7 00 00 00 89 48 04 8b 4c 24
5c 89 4
a 04 8b 46 2c 85 c0 0f 85 bf 00 00 00 c7 46 2c 01 00 00 00 8b 46 28 ba
ff ff 00
00 <0f> c1 10 0f 85 f0 04 00 00 8b 5e 28 8b 43 10 8b 48 10 8b 41 04

after this the same thing... i cannot read nor write to the partition,
and eventually have to reboot.

(now there's a little detail i didn't mention... this "computer" i'm
testing on is in a vmware installed fedora core 2. but i don't think
that could be a problem. or could it?)

Imre Gergely wrote:
> mmm, i forgot:
> 
> [root@fc2 root]# uname -r
> 2.6.12.5
> 
> lvm> version
>   LVM version:     2.01.13-cvs (2005-06-14)
>   Library version: 1.01.01 (2005-03-29)
>   Driver version:  4.4.0
> 
> 
> Imre Gergely wrote:
> 
>>hi
>>
>>i tried to create 2 snapshots of a LV, and i got in trouble ;) with one
>>snapshot there are apparently no problems, with two the kernel gives me
>>random oops-es and hangs. first, i tried with the root LV, then i tried
>>with a simple partition, the result were the same. i created the two
>>snapshots, after that i did a vgdisplay, there was everything alright, i
>>mounted the origin LV, i copied some files, i watched the percentage
>>increasing on the snapshots, then i did a 'ls -la' on the mounted
>>directory and then the kernel said bye-bye... i don't see any kernel
>>panic, just the usual register and memory dump, and the hang.
>>
>>any ideas? don't tell me i cannot have more than one snapshot on one
>>given LV.
>>
>>thx.
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
