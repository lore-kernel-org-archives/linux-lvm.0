Return-Path: <andrea@suse.de>
Date: Wed, 15 Aug 2001 23:13:30 +0200
From: Andrea Arcangeli <andrea@suse.de>
Message-ID: <20010815231330.B27003@athlon.random>
References: <20010815185005.A32239@sistina.com> <200108151755.f7FHtmTH013535@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200108151755.f7FHtmTH013535@webber.adilger.int>; from adilger@turbolinux.com on Wed, Aug 15, 2001 at 11:55:48AM -0600
Subject: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
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
Cc: mauelshagen@sistina.com, Kurt Garloff <garloff@suse.de>, linux-lvm@sistina.com, lvm-devel@sistina.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, sistina@sistina.com, mge@sistina.com

On Wed, Aug 15, 2001 at 11:55:48AM -0600, Andreas Dilger wrote:
> Saying you "need" the old versions of the installed tools to read the
> on disk data is bogus, IMNSHO.  You could easily have a flag which says
> "calculate the PE offsets using the old algorithm or the new algorithm".

Definitely. This is what I was asking for. That would be optimal.

> Also, since this bug exists only for a limited number of users (only a
> subset of users who created volumes with beta 5 and beta 6), it causes
> grief for anyone who is NOT affected by the bug.

Agreed. I understand that here I am biased but I don't care much about
that possible misalignment too because we never shipped a beta[56].

> Well, that is the future, and should not impact users of 2.4.x kernels.
> Just like we found an acceptable workaround to the (incompatible) IOP 11
> change (which was later reverted), it is possible to find an acceptable
> workaround for the new incompatible change.  Sadly, it is no longer my

Agreed.

Andrea
