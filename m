Return-Path: <dalecki@evision-ventures.com>
Message-ID: <3AE3ED20.FD685CE@evision-ventures.com>
Date: Mon, 23 Apr 2001 10:51:44 +0200
From: Martin Dalecki <dalecki@evision-ventures.com>
MIME-Version: 1.0
References: <01042110002200.00707@oscar> <20010421162003.F26732@suse.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [BUG] lvm beta7 and ac11 problems
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
To: Jens Axboe <axboe@suse.de>
Cc: Ed Tomlinson <tomlins@cam.org>, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>

Jens Axboe wrote:
> 
> On Sat, Apr 21 2001, Ed Tomlinson wrote:
> > Hi,
> >
> > building a kernel with 2.4.3-ac11 and lvm beta7 + vfs_locking_patch-2.4.2 yields:
> >
> > oscar# depmod -ae 2.4.3-ac11
> > depmod: *** Unresolved symbols in /lib/modules/2.4.3-ac11/kernel/drivers/md/lvm-mod.o
> > depmod:         get_hardblocksize
> >
> > ideas?
> 
> s/get_hardblocksize/get_hardsect_size

And don't forget to have a look whatever the get_hardblocksize == 0
check
or similar can't be killed alltogether as well....
