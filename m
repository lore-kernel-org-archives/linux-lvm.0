Message-ID: <36CAEAA9.4CB98E05@pso.com>
Date: Wed, 17 Feb 1999 08:13:29 -0800
From: Hwa Jin Bae <hjb@pso.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM, MD and LLD
References: <199902171313.OAA13340@e35.msede.com> <36CADA1A.249433E0@softwired-inc.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hello,

I have been reading LVM and MD code.  It looks like both of these
can be merged eventually. The code changes in ll_rw_block for
LVM and MD are similar, and it would be nice to have coherent
single RAID subsystem in the kernel.  Also, I'm not sure how many
of you are aware of LLD work from MIT.  LLD is "Logical Disk" which
tries to solve problems that are usually solved by LFS or other
extent based FS with journaling.  The neat idea behind LLD is
that rather than motifying the FS or writing a new FS to support
large extent based I/O coupled with journaling, you can do this
at block I/O level, under FS layer.  The example software implementation
is based on MINIX and a bit outdated.  However, it seems reasonable
to start looking into merging this into LVM framework.  
Of course, given the "free time" if I can manage, I would be very
willing to help in the effort, since I am interested in such a thing.
Finally, great work all you LVM folks!
-- 
Hwa Jin Bae
PSO Systems Inc
hjb@pso.com   
http://www.pso.com
