From: Ed Tomlinson <tomlins@CAM.ORG>
Date: Mon, 8 Oct 2001 21:57:59 -0400
References: <20011003230330.508E91104F@oscar.casa.dyndns.org> <20011008170549.3B15E76467@oscar.casa.dyndns.org> <61620000.1002570709@tiny>
In-Reply-To: <61620000.1002570709@tiny>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011009015759.BF5E472AE3@oscar.casa.dyndns.org>
Subject: [linux-lvm] Re: [OOPS] full snapshot (with test vfs locking patch for reiserfs snapshots in 11-pre)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: linux-lvm@sistina.com

Hi Chris

> Ok, that first patch won't quite fix it, as we can still oops
> in lvm_snapshot_COW.  This one works better for me:

Looks like this one has problems too.  Here is the oops I get with it:

ksymoops 2.4.3 on i586 2.4.10-e1.  Options used
     -V (default)
     -k 20011008181015.ksyms (specified)
     -l 20011008181015.modules (specified)
     -o /lib/modules/2.4.11-pre5 (specified)
     -m /boot/System.map-2.4.11-pre5 (specified)

Unable to handle kernel NULL pointer dereference at virtual address 00000008
d680b179
*pde = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<d680b179>]    Tainted: P 
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010286
eax: 00000000   ebx: d36e4000   ecx: d36e4000   edx: d36e0600
esi: d36e0600   edi: d36e0600   ebp: c4aa3d3c   esp: c4aa2cb8
ds: 0018   es: 0018   ss: 0018
Process dbench (pid: 864, stackpage=c4aa3000)
Stack: c15713a0 d680a50a d36e4000 d36e0600 00003a04 00000000 00000627 0170a470 
       d36e0600 c4aa3d3c d680aafd d36e4000 d36e0600 d680d3cb d36e0600 0170a470 
       d36e4000 00000000 00000002 000003ff 00000be4 00010000 c4aa2d38 00000400 
Call Trace: [<d680a50a>] [<d680aafd>] [<d680d3cb>] [<c01503d1>] [<c015d9e1>] 
   [<c014fcec>] [<c0158cbf>] [<c0159543>] [<c015036e>] [<c01503d1>] [<c015e32f>] 
   [<c015d6bf>] [<c01578ae>] [<c0157c18>] [<c01503d1>] [<c015dc6b>] [<c014ff11>] 
   [<c0158cbf>] [<c0159543>] [<c015036e>] [<c018a8ed>] [<c018a943>] [<c01629a3>] 
   [<c012e1dc>] [<c015fef7>] [<c0160700>] [<c010ffba>] [<d68071e5>] [<d68075f3>] 
   [<d6807695>] [<c0185b4c>] [<c0185bb1>] [<c012d4ab>] [<c012d552>] [<c012e25b>] 
   [<c012ebaf>] [<c012f0f7>] [<c0155975>] [<c0152f34>] [<c0122e42>] [<c012c86a>] 
   [<c0106d53>] 
Code: c7 40 08 01 00 00 00 89 e0 50 6a 00 52 51 e8 78 fc ff ff 83 

>>EIP; d680b178 <[lvm-mod]_disable_snapshot+10/44>   <=====
Trace; d680a50a <[lvm-mod]lvm_drop_snapshot+22/94>
Trace; d680aafc <[lvm-mod]lvm_snapshot_COW+3b4/3f4>
Trace; d680d3ca <[lvm-mod]lvm_name+8c2/e76>
Trace; c01503d0 <do_balance_mark_leaf_dirty+54/64>
Trace; c015d9e0 <leaf_insert_into_buf+23c/248>
Trace; c014fcec <balance_leaf+2210/24e8>
Trace; c0158cbe <reiserfs_kfree+12/38>
Trace; c0159542 <unfix_nodes+146/154>
Trace; c015036e <do_balance+ea/f8>
Trace; c01503d0 <do_balance_mark_leaf_dirty+54/64>
Trace; c015e32e <leaf_delete_items_entirely+1b2/1c0>
Trace; c015d6be <leaf_delete_items+5a/140>
Trace; c01578ae <get_parents+1aa/1c0>
Trace; c0157c18 <ip_check_balance+354/aac>
Trace; c01503d0 <do_balance_mark_leaf_dirty+54/64>
Trace; c015dc6a <leaf_paste_in_buffer+27e/28c>
Trace; c014ff10 <balance_leaf+2434/24e8>
Trace; c0158cbe <reiserfs_kfree+12/38>
Trace; c0159542 <unfix_nodes+146/154>
Trace; c015036e <do_balance+ea/f8>
Trace; c018a8ec <start_request+130/1f4>
Trace; c018a942 <start_request+186/1f4>
Trace; c01629a2 <reiserfs_paste_into_item+86/e0>
Trace; c012e1dc <getblk+18/40>
Trace; c015fef6 <is_tree_node+36/54>
Trace; c0160700 <search_by_key+7ec/c44>
Trace; c010ffba <schedule+256/384>
Trace; d68071e4 <[lvm-mod]__remap_snapshot+5c/88>
Trace; d68075f2 <[lvm-mod]lvm_map+3e2/478>
Trace; d6807694 <[lvm-mod]lvm_make_request_fn+c/1c>
Trace; c0185b4c <generic_make_request+130/140>
Trace; c0185bb0 <submit_bh+54/70>
Trace; c012d4aa <write_locked_buffers+1e/28>
Trace; c012d552 <write_some_buffers+9e/110>
Trace; c012e25a <balance_dirty+12/30>
Trace; c012ebae <__block_commit_write+a2/c0>
Trace; c012f0f6 <generic_commit_write+32/5c>
Trace; c0155974 <reiserfs_commit_write+30/a8>
Trace; c0152f34 <reiserfs_get_block+0/ca0>
Trace; c0122e42 <generic_file_write+4a6/5ac>
Trace; c012c86a <sys_write+8e/c4>
Trace; c0106d52 <system_call+32/40>
Code;  d680b178 <[lvm-mod]_disable_snapshot+10/44>
00000000 <_EIP>:
Code;  d680b178 <[lvm-mod]_disable_snapshot+10/44>   <=====
   0:   c7 40 08 01 00 00 00      movl   $0x1,0x8(%eax)   <=====
Code;  d680b17e <[lvm-mod]_disable_snapshot+16/44>
   7:   89 e0                     mov    %esp,%eax
Code;  d680b180 <[lvm-mod]_disable_snapshot+18/44>
   9:   50                        push   %eax
Code;  d680b182 <[lvm-mod]_disable_snapshot+1a/44>
   a:   6a 00                     push   $0x0
Code;  d680b184 <[lvm-mod]_disable_snapshot+1c/44>
   c:   52                        push   %edx
Code;  d680b184 <[lvm-mod]_disable_snapshot+1c/44>
   d:   51                        push   %ecx
Code;  d680b186 <[lvm-mod]_disable_snapshot+1e/44>
   e:   e8 78 fc ff ff            call   fffffc8b <_EIP+0xfffffc8b> d680ae02 <[lvm-mod]lvm_snapshot_release+b6/b8>
Code;  d680b18a <[lvm-mod]_disable_snapshot+22/44>
  13:   83 00 00                  addl   $0x0,(%eax)

Needed to reiserfsck with --fix-fixable after this one...

Hope this helps.

Ed


> --- 0.21/drivers/md/lvm.c Sun, 07 Oct 2001 22:15:54 -0400
> +++ 0.21(w)/drivers/md/lvm.c Mon, 08 Oct 2001 15:54:42 -0400
> @@ -1142,7 +1142,8 @@
>
>  	/* we must redo lvm_snapshot_remap_block in order to avoid a
>  	   race condition in the gap where no lock was held */
> -	if (!lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
> +	if (lv->lv_block_exception &&
> +	    !lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
>  	    !lvm_snapshot_COW(rdev, rsector, pe_start, rsector, vg, lv))
>  		lvm_write_COW_table_block(vg, lv);
>
> @@ -1151,11 +1152,12 @@
>
>  static inline void _remap_snapshot(kdev_t rdev, ulong rsector,
>  				   ulong pe_start, lv_t *lv, vg_t *vg) {
> -	int r;
> +	int r = 0;
>
>  	/* check to see if this chunk is already in the snapshot */
>  	down_read(&lv->lv_lock);
> -	r = lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
> +	if (lv->lv_block_exception)
> +		r = lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv);
>  	up_read(&lv->lv_lock);
>
>  	if (!r)
> Index: 0.21/drivers/md/lvm-snap.c
> --- 0.21/drivers/md/lvm-snap.c Sat, 06 Oct 2001 00:07:22 -0400 root
> (linux/i/c/38_lvm-snap.c 1.1.2.1.2.1 644) +++ 0.21(w)/drivers/md/lvm-snap.c
> Mon, 08 Oct 2001 15:13:10 -0400 root (linux/i/c/38_lvm-snap.c 1.1.2.1.2.1
> 644) @@ -140,6 +140,8 @@
>  	unsigned long mask = lv->lv_snapshot_hash_mask;
>  	int chunk_size = lv->lv_chunk_size;
>
> +	if (!hash_table)
> +		BUG() ;
>  	hash_table = &hash_table[hashfn(org_dev, org_start, mask, chunk_size)];
>  	list_add(&exception->hash, hash_table);
>  }
