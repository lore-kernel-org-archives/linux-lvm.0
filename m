Return-Path: <shuric@crimson.namesys.com>
From: Alexander Zarochentcev <zam@namesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15123.55304.751997.122954@crimson.namesys.com>
Date: Tue, 29 May 2001 21:10:32 +0400
In-Reply-To: <20010528183105.C924@mind.bartosch.net>
References: <20010528183105.C924@mind.bartosch.net>
Subject: [linux-lvm] Re: [reiserfs-list] lvm-list pointed to reiserfs: fs/lvm-problems?
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
To: peter@bartosch.net
Cc: reiserfs-list@namesys.com, linux-lvm@sistina.com

 PB> Heinz Mauelshagen pointed me to send my error-report to this list:
 PB> ----- Forwarded message from Peter Bartosch <peter@bartosch.net> -----

 PB> Date: Sun, 27 May 2001 23:41:17 +0200
 PB> From: Peter Bartosch <peter@bartosch.net>
 PB> To: linux-lvm@sistina.com
 PB> Subject: lvm-problems?

 PB> hello,

 PB> i recently made my three LV new (caused by an accident as i tried to
 PB> extend an existing (0.8i) LV)

 PB> so i created a new kernel (2.4.2) with lvm 0.9.1_beta7

Linux-2.4.4 has serious reiserfs bugs fixed.

 PB> the first problems came when i tried to create more than one VG - the
 PB> second VG couldn't be activated (always inactive after reboot and unable
 PB> to activate)

 PB> so i'm using only one VG

 PB> the first two LV's of this VG could i create without problems, but the
 PB> third makes problems:

 PB> i created the reiserfs on it, but when i tried to mount it, the mount
 PB> failed
 PB> an reiserfsck --rebuild-sb and after that reiserfsck --rebuild-tree
 PB> clears it and i could mount my LV -- UNTIL the next reboot

What kernel messages were ?

Sorry, but it looks for me like a lvm problem.  Can you test you LV by
coping some random data (~ 64 MB) to a file in reliable location and
to LV, and compare them (or md5 hashes) after reboot ?

 PB> i had to reboot because something oopsed:

 PB> ----

Reiserfs error handling not an ideal one.  Kernel oops below is a
normal :( reaction on damaged data coming from disk.

Same reason (damaged data), I think, prevented reiserfs volume from
mounting. 


 PB> is_leaf: item location seems wrong (second one): *NEW* [9 10 0x0 SD],
 PB> item_len 44, item_location 2308, free_space(entry_count) 65535
 PB> vs-5150: search_by_key: invalid format found in block 8271. Fsck?
 PB> kernel BUG at namei.c:343!
 PB> invalid operand: 0000
 PB> CPU:    0
 PB> EIP:    0010:[<c018ff08>]
 PB> EFLAGS: 00010286
 PB> eax: 0000001b   ebx: c6655e58   ecx: 00000001   edx: 00000001
 PB> esi: c02d4fb4   edi: c6655edc   ebp: c6655e70   esp: c6655e40
 PB> ds: 0018   es: 0018   ss: 0018
 PB> Process cp (pid: 1799, stackpage=c6655000)
 PB> Stack: c02d4c7e c02d4d7e 00000157 00000000 c02d4fb4 c6655e9c 00000002 0000000e 
 PB> 	4a0507ff 000001f4 00000000 00000003 c3e55a20 c0190030 c7742c20 c7dd3b20 
 PB>         0000001b c6655e9c c6655edc fffffff4 c6654000 c7742c20
 PB> 	c3e55a20 00000001 
 PB> Call Trace: [<c0190030>] [<c01468e9>] [<c013de9a>]
 PB>         [<c013e6e9>] [<c013db5a>] [<c013ee4c>] [<c013b8c6>] 
 PB>         [<c0133047>] [<c0108f5b>] 
 PB> Code: 0f 0b 83 c4 0c 8d 76 00 8b 4d 10 51 8b 45 0c 50 57 8d 55 e8 

 PB> -----

 PB> this oops let the process which works on the third LV freeze - so i
 PB> couldn't kill it

 PB> the first and the second LV seem to work well

 PB> when i reboot the third LV won't be mountet automagically and the
 PB> filesystem seems to be corrupt


 PB> any help will be appreciated

 PB> ----- End forwarded message -----

 PB> as this happened just again, i got some more informations:


 PB> vs-13048: reiserfs_iget: bad_inode. Stat data of (9 10) not found
 PB> is_leaf: item location seems wrong (second one): *NEW* [9 10 0x0 SD],
 PB> item_len 4
 PB> 4, item_location 2308, free_space(entry_count) 65535
 PB> vs-5150: search_by_key: invalid format found in block 8271. Fsck?
 PB> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat
 PB> data of
 PB>  [9 13 0x0 SD]
 PB>  vs-13048: reiserfs_iget: bad_inode. Stat data of (9 13) not found
 PB>  is_leaf: item location seems wrong (second one): *NEW* [9 10 0x0 SD],
 PB>  item_len 4
 PB>  4, item_location 2308, free_space(entry_count) 65535
 PB>  vs-5150: search_by_key: invalid format found in block 8271. Fsck?
 PB>  kernel BUG at namei.c:343!
 
-- 
Thanks,
Alex.
