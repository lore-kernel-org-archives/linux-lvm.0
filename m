Date: Tue, 18 Jan 2000 17:04:25 -0600
From: "Heinz J. Mauelshagen" <mge@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] 2.2.14
Message-ID: <20000118170425.A16333@congo.borg.umn.edu>
Reply-To: mge@ez-darmstadt.telekom.de
References: <Pine.HPP.3.95.1000118173807.29832E-100000@CNBC.CMU.EDU>
Mime-Version: 1.0
In-Reply-To: <Pine.HPP.3.95.1000118173807.29832E-100000@CNBC.CMU.EDU>; from rmitz@cnbc.cmu.edu on Tue, Jan 18, 2000 at 05:39:48PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roman Mitz <rmitz@cnbc.cmu.edu>
Cc: linux-lvm@msede.com

On Tue, Jan 18, 2000 at 05:39:48PM -0500, Roman Mitz wrote:
> Sorry if this is a FAQ, but I couldn't find anything in the list archive
> or the docs.  Anyone have any luck compiling the 2.2.13 .8 patch /w
> 2.2.14?  Mine fails compile with the following:
> 
> drivers/block/block.a(ll_rw_blk.o): In function `blk_dev_init':
> ll_rw_blk.o(.text.init+0xb0): undefined reference to `lvm_init'
> 

Please delete the "static" before lvm_init() in drivers/block/lvm.c
and have a look for known bugs on <ftp://linux.msede.com/lvm/v0.8/BUGS>.

The line looks like "__initfunc(static int lvm_init(void))".

Heinz
