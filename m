Message-Id: <200308182109.h7IL9Lo27219@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
In-Reply-To: <20030818185934.D29420@uk.sistina.com>
MIME-Version: 1.0
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
Date: Mon Aug 18 16:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, agk@uk.sistina.com

Ok, I increased the size of argv to 2048 in the dm-table.c file that's
part of the linux-2.6.0-test3 tree, and then I got the following kernel
oops when I ran lvcreate:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:                                                              
02142cf9      
*pde = 00000000
Oops: 0000 [#1]
SMP            
CPU:    2048
EIP:    0060:[<02142cf9>]    Not tainted VLI
EFLAGS: 00010046                            
EIP is at __kmalloc+0x4d/0x7a
eax: 00000800   ebx: d5e06000   ecx: d9eef520   edx: 00000000
esi: 00000246   edi: 000000d0   ebp: 00000000   esp: d5e07ea0
ds: 007b   es: 007b   ss: 0068                               
Process  (pid: 0, threadinfo=d5e06000 task=5b782032)
Stack: 65746365 d5e07f08 d5e07f08 da93c080 00000008 022b0290 000001b0 000000d0 
       0000000a 3a363164 043c2000 00000007 da93714c 00000034 da937160 da93c080 
       d5c2d280 da93c0ac d5e07f08 022af594 da93c080 0000006a d5e07f08 da93715c 
Call Trace:                                                                    
 [<022b0290>] stripe_ctr+0x1da/0x1e2
 [<022af594>] dm_table_add_target+0x156/0x1ac
                                             
Code: e3 39 c1 76 12 83 c2 0c 8b 02 85 c0 75 f3 31 c0 83 c4 08 5b 5e 5f c3 f7 c7 01 00 00 00 74 34 8b 4a 08 9c 5e fa 8b 43 10 8b 14 81 <8b> 02 85 c0 74 14 83 e8 01 c7 42 0c 01 00 00 00 89 02 8b 44 82 
Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:                                                              
0212a6a9      
*pde = 00000000
