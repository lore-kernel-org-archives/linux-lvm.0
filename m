Date: Tue, 18 Jan 2000 17:39:48 -0500 (EST)
From: Roman Mitz <rmitz@cnbc.cmu.edu>
Subject: [linux-lvm] 2.2.14
Message-ID: <Pine.HPP.3.95.1000118173807.29832E-100000@CNBC.CMU.EDU>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Sorry if this is a FAQ, but I couldn't find anything in the list archive
or the docs.  Anyone have any luck compiling the 2.2.13 .8 patch /w
2.2.14?  Mine fails compile with the following:

drivers/block/block.a(ll_rw_blk.o): In function `blk_dev_init':
ll_rw_blk.o(.text.init+0xb0): undefined reference to `lvm_init'

Any help appriciated.  Thanks.

Roman.
------
Director of Computational Resources
The Center for the Neural Basis of Cognition
