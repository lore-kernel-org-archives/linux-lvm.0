Return-Path: <andrea@suse.de>
Date: Thu, 30 Nov 2000 21:41:21 +0100
From: Andrea Arcangeli <andrea@suse.de>
Message-ID: <20001130214121.D18804@athlon.random>
References: <14886.7367.247491.267120@notabene.cse.unsw.edu.au> <200011302005.eAUK5re01932@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011302005.eAUK5re01932@webber.adilger.net>; from adilger@turbolinux.com on Thu, Nov 30, 2000 at 01:05:53PM -0700
Subject: [linux-lvm] Re: [PATCH] Re: [bug] infinite loop in generic_make_request()
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
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Neil Brown <neilb@cse.unsw.edu.au>, Linus Torvalds <torvalds@transmeta.com>, V Ganesh <ganesh@veritas.com>, linux-kernel@vger.kernel.org, linux-LVM@sistina.com, mingo@redhat.com

On Thu, Nov 30, 2000 at 01:05:53PM -0700, Andreas Dilger wrote:
> the RAID and LVM make_request functions should be changed to do that
> instead (i.e. 0 on success, -ve on error, and maybe "1" if they do their
> own recursion to break the loop)?

We preferred to let the lowlevel drivers to handle error themselfs to
simplify the interface. The lowlevel driver needs to call buffer_IO_error
before returning in case of error.

Andrea
