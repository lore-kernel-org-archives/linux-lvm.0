Return-Path: <dg@suse.com>
Date: Thu, 7 Dec 2000 22:33:00 -0800
From: David Gould <dg@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <20001207223300.D25533@archimedes.oak.suse.com>
References: <20001207123743.B24307@ultraviolet.org> <24530000.976222571@coffee>
Mime-Version: 1.0
In-Reply-To: <24530000.976222571@coffee>; from mason@suse.com on Thu, Dec 07, 2000 at 03:56:11PM -0500
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
To: linux-lvm@sistina.com

On Thu, Dec 07, 2000 at 03:56:11PM -0500, Chris Mason wrote:
> 
> On Thursday, December 07, 2000 12:37:43 -0800 Tracy R Reed
> <treed@ultraviolet.org> wrote:
> 
> > So...can I or can I not use snapshots with reiserfs? The snapshot was
> > taken of a currently mounted and functioning (reiserfs module
> > loaded...compiled into the kernel, actually) so if I did the snapshot
> > correctly there should be a filesystem there. I'm going to wipe it out
> > (nothing on it but some test files) and try again with ext2 and see what
> > happens. 
> > 
> > This should work, shouldn't it?
> 
> It should work with ext2.

Really? I wonder. Maybe right after a sync before anything gets dirtied,
but otherwise, how could the disk image be consistantly, er, consistant?
And would not e2fsck have the same issues about writing?

Or did I just wake up pessimistic today?

-dg
 
-- 
David Gould                                                 dg@suse.com
SuSE, Inc.,  580 2cd St. #210,  Oakland, CA 94607          510.628.3380
"As I've gained more experience with Perl it strikes me that it
 resembles Lisp in many ways, albeit Lisp as channeled by an awk
 script on acid."  -- Tim Moore <moore@herschel.bricoworks.com>,
                      on comp.lang.lisp
