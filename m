Message-Id: <200401162045.i0GKjEo26460@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] linux-2.6.0 + reiser4 oops
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
Date: Fri Jan 16 15:46:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-lvm@sistina.com

I was testing our DBT-2 workload on linux-2.6.0 with LVM2 and reiser4
and got the following oops when I attempted to create a database with
PostgreSQL.  Let me know if I can provide any additional information:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:                                                       
c014c607      
*pde = 00104001
*pte = 00000000
Oops: 0000 [#1]
CPU:    7      
EIP:    0060:[<c014c607>]    Not tainted
EFLAGS: 00010086                        
EIP is at page_address+0x17/0xd0
eax: 00000000   ebx: 00000000   ecx: ea5c58e0   edx: ea21bf20
esi: f69df200   edi: 00000000   ebp: 00000001   esp: f59abb84
ds: 007b   es: 007b   ss: 0068                               
Process ktxnmgrd:run (pid: 16798, threadinfo=f59aa000 task=f5983960)
Stack: 00000001 e8d77260 f69df200 00000000 00000001 c027fed6 00000000 ea5c58e0 
       00000020 00000000 00002980 00000000 00000000 00000008 00000020 e8d77260 
       f69df200 00000020 ea5c5be0 00000020 c02803ff f69df200 ea5c58e0 f7fc7260 
Call Trace:                                                                    
 [<c027fed6>] __make_request+0x226/0x5e0
 [<c02803ff>] generic_make_request+0x16f/0x1f0
 [<c02f303d>] __map_bio+0x3d/0x120            
 [<c02f32f6>] __clone_and_map+0xc6/0x310
 [<c011fae0>] autoremove_wake_function+0x0/0x50
 [<c02f35c8>] __split_bio+0x88/0x100           
 [<c022000c>] try_by_label+0x2c/0x40
 [<c02f3703>] dm_request+0xc3/0xe0  
 [<c02803ff>] generic_make_request+0x16f/0x1f0
 [<c0165807>] bio_alloc+0xd7/0x1c0            
 [<c02804d4>] submit_bio+0x54/0xa0
 [<c01ece88>] jnode_extent_write+0x3c8/0x430
 [<c01ed157>] alloc_wandered_blocks+0x77/0xc0
 [<c01ed5e2>] reiser4_write_logs+0x1b2/0x300 
 [<c01e464d>] commit_current_atom+0x17d/0x260
 [<c01e50bd>] try_commit_txnh+0xed/0x1b0     
 [<c01e51b8>] commit_txnh+0x38/0xd0     
 [<c011f651>] .text.lock.sched+0x10f/0x12e
 [<c01e385f>] txn_end+0x3f/0x50           
 [<c01e4b57>] commit_some_atoms+0x187/0x220
 [<c01f38f6>] scan_mgr+0x36/0x57           
 [<c01f3528>] ktxnmgrd+0x1a8/0x290
 [<c01f3380>] ktxnmgrd+0x0/0x290  
 [<c01072e9>] kernel_thread_helper+0x5/0xc
                                          
Code: 8b 03 a9 00 01 00 00 75 30 8b 0d 8c 33 4a c0 29 cb c1 fb 03 
 <6>note: ktxnmgrd:run[16798] exited with preempt_count 1         
Debug: sleeping function called from invalid context at include/linux/rwsem.h:43
in_atomic():1, irqs_disabled():0                                               
Call Trace:                     
 [<c011f3eb>] __might_sleep+0xab/0xd0
 [<c0122928>] printk+0x178/0x1d0     
 [<c0122ef0>] profile_exit_task+0x20/0x60
 [<c0124a88>] do_exit+0x78/0x4b0         
 [<c010a8bc>] die+0xfc/0x100    
 [<c011a4a9>] do_page_fault+0x1f9/0x58f
 [<c0143180>] __alloc_pages+0xc0/0x370 
 [<c0141c61>] mempool_alloc+0x91/0x190
 [<c011fae0>] autoremove_wake_function+0x0/0x50
 [<c0141c61>] mempool_alloc+0x91/0x190         
 [<c011fae0>] autoremove_wake_function+0x0/0x50
 [<c011fae0>] autoremove_wake_function+0x0/0x50
 [<c011a2b0>] do_page_fault+0x0/0x58f          
 [<c010a205>] error_code+0x2d/0x38   
 [<c014c607>] page_address+0x17/0xd0
 [<c027fed6>] __make_request+0x226/0x5e0
 [<c02803ff>] generic_make_request+0x16f/0x1f0
 [<c02f303d>] __map_bio+0x3d/0x120            
 [<c02f32f6>] __clone_and_map+0xc6/0x310
 [<c011fae0>] autoremove_wake_function+0x0/0x50
 [<c02f35c8>] __split_bio+0x88/0x100           
 [<c022000c>] try_by_label+0x2c/0x40
 [<c02f3703>] dm_request+0xc3/0xe0  
 [<c02803ff>] generic_make_request+0x16f/0x1f0
 [<c0165807>] bio_alloc+0xd7/0x1c0            
 [<c02804d4>] submit_bio+0x54/0xa0
 [<c01ece88>] jnode_extent_write+0x3c8/0x430
 [<c01ed157>] alloc_wandered_blocks+0x77/0xc0
 [<c01ed5e2>] reiser4_write_logs+0x1b2/0x300 
 [<c01e464d>] commit_current_atom+0x17d/0x260
 [<c01e50bd>] try_commit_txnh+0xed/0x1b0     
 [<c01e51b8>] commit_txnh+0x38/0xd0     
 [<c011f651>] .text.lock.sched+0x10f/0x12e
 [<c01e385f>] txn_end+0x3f/0x50           
 [<c01e4b57>] commit_some_atoms+0x187/0x220
 [<c01f38f6>] scan_mgr+0x36/0x57           
 [<c01f3528>] ktxnmgrd+0x1a8/0x290
 [<c01f3380>] ktxnmgrd+0x0/0x290  
 [<c01072e9>] kernel_thread_helper+0x5/0xc


-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
