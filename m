Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104231044.f3NAiUwL001186@webber.adilger.int>
Subject: Re: [linux-lvm] Split patch sets for beta[345]
In-Reply-To: <20010422125226.A10274@66bassett.freeserve.co.uk>
 "from Joe Thornber at Apr 22, 2001 12:52:26 pm"
Date: Mon, 23 Apr 2001 04:44:30 -0600 (MDT)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-openlvm@nl.linux.org

Joe, you write:
> The 2.4.3 patches were generated automatically by repeatedly patching
> the LVM tarball, building a 2.4.3 patch, applying said patch and then
> diffing.  The results look correct but I haven't tested them - yell
> if you see something wrong.

I haven't looked at all of the patches yet, but I think part of them at
least are missing the point.  I don't think Linus/Alan want a blow-by-blow
series of patches to follow LVM development (I could be wrong, but that's
my opinion).  Maybe this is a work-in-progress?

If I were you, I would continue with your current scheme, just to get a
discrete list of all the changes made to the kernel code.  Then I would
sit back and combine all patches that affect the same piece of code, so
you get a bunch of patchs that go directly from beta2 (Linus kernel) to
beta7/CVS which say "this patch changes X, because it was broken, now
it is fixed, see".

Granted, the file renaming and code reorg also needs to be done, if we
want the kernel code to match CVS...  However, I don't think that many
(if any) changes were made in lvm-fs.c after it was split out, for example.
Also, whether the patches go into lvm-snap.h before it is renamed, or
lvm-internal.h after the rename doesn't really matter.  I don't think
there were any other major file structure changes.


Specifically, all of the "change beta2 in header to beta3" should be
consolidated into a single patch (beta2->beta7), and anything that you
have labeled as BOGUS should also be consolidated whatever patch
"unbogisifies" it (assuming there is one ;-).  No point having a patch
which ADDS a bug to the source code.

For example, the IOP version change patch should just be thrown away
outright (zero sum change).  The "allow VG_CREATE on /dev/lvm" patch
should be combined with the patch (not on your page yet) that adds
the "VG_CREATE_OLD" ioctl.  This assumes that the current CVS user
tool vgcreate has my patch which tries the VG_CREATE_OLD ioctl if
VG_CREATE fails (several people complained about that.  Otherwise the
whole thing is still broken.

Likewise, the fix to lvm_user_bmap() to use b_rdev and b_blocknr is
actually reverting a fix which was added into the stock kernel recently
because lvm_map() was broken.  I submitted a patch to lvm-devel to fix
this just before beta7 was released, but it wasn't added to CVS, AFAICS.

Combine all of the trivial whitespace, debug, etc. patches into a single
one (ensuring it really is all trivial stuff).

Of course, don't even think of submitting a patch which has the "set
low bits on buffer pointer" for pv_move, or the whole flame-fest will
start anew.  Jump straight to the correct solution, which is to pass
reads through, and realize that all the remaining I/Os are writes (for
2.4 at least) so no need to store "rw".


Let me know if you want me to start working on and/or sending in patches
which fix a specific piece of code.  I won't touch the snapshot stuff,
but I can do all of the parts which affect lvm_map(), pv_move() and others.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
