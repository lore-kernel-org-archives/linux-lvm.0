Return-Path: <dg@suse.com>
Date: Fri, 8 Dec 2000 10:30:07 -0800
From: David Gould <dg@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <20001208103007.D27307@archimedes.oak.suse.com>
References: <20001207223300.D25533@archimedes.oak.suse.com> <323270000.976284597@coffee>
Mime-Version: 1.0
In-Reply-To: <323270000.976284597@coffee>; from mason@suse.com on Fri, Dec 08, 2000 at 09:09:57AM -0500
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

On Fri, Dec 08, 2000 at 09:09:57AM -0500, Chris Mason wrote:
> 
> 
> On Thursday, December 07, 2000 22:33:00 -0800 David Gould <dg@suse.com>
> wrote:
> 
> > On Thu, Dec 07, 2000 at 03:56:11PM -0500, Chris Mason wrote:
> 
> [ snapshots ]
> 
> >> It should work with ext2.
> > 
> > Really? I wonder. Maybe right after a sync before anything gets dirtied,
> > but otherwise, how could the disk image be consistantly, er, consistant?
> > And would not e2fsck have the same issues about writing?
> > 
> > Or did I just wake up pessimistic today?
> > 
> 
> The reason it will not work on reiserfs without the extra API is that on
> reiserfs, sync == commit to log, not commit to disk.  So, there is no way
> over the command line (or in the kernel) to ask the FS to sync to disk,
> even when there is no traffic at all on the FS.
> 
> With ext2, if nothing is going on, you can type sync and have all the
> buffers on disk.  It is at least possible ;-)  It would be better if ext2
> could provide the write suspension hooks as well, but I'm guessing that
> will be done in ext3 first (where the journal already does most of the
> work).

Ok, so we are agreeing, it does not work on ext2 either unless you sync
and do not write between the sync and the snapshot. Doable, but not exactly
"safe".

-dg
 
-- 
David Gould                                                 dg@suse.com
SuSE, Inc.,  580 2cd St. #210,  Oakland, CA 94607          510.628.3380
"As I've gained more experience with Perl it strikes me that it
 resembles Lisp in many ways, albeit Lisp as channeled by an awk
 script on acid."  -- Tim Moore <moore@herschel.bricoworks.com>,
                      on comp.lang.lisp
