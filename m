Message-ID: <38DCCF7E.69E50306@colorfullife.com>
Date: Sat, 25 Mar 2000 15:38:54 +0100
From: Manfred Spraul <manfreds@colorfullife.com>
MIME-Version: 1.0
Subject: [linux-lvm] SMP bug: vmalloc() called without lock_kernel()
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-LVM@msede.com, linux-LVM@ez-darmstadt.telekom.de

vmalloc() is protected by the big kernel lock, but AFAICS

lvm_proc_get_info() calls vmallloc() without lock_kernel():

lvm_proc_get_info() is called by
linux/fs/proc/generic.c:proc_file_read(), and file_read runs without the
big kernel lock in 2.3.

Could you add "lock_kernel()" around vmalloc()/vfree() in
lvm_proc_get_info()? The ioctl functions are called with the kernel
locked, thus you don't need lock_kernel() in your ioctl/open functions.

Btw, your sleep_on() usage in lvm_map() seems to be wrong:

* sleep_on() is evil, processes could get stuck if the second cpu in in
lvm_do_pe_unlock() [even on i386].

	add_wait_queue(); 
wait_again:
	set_current_state(TASK_UNINTERRUPTIBLE);
	if(we_must_wait_and_someone_will_wake_us_up) {
		schedule();
		goto wait_again;
	}
	remove_wait_queue();	
	goto retry;

* lvm_do_pe_lock_unlock() assume that the cpu won't reorder write
instructions,

	pe_lock_req.lock = UNLOCK_PE;
+	wmb();
	pe_lock_req.data.lv_dev = \

--
	Manfred
