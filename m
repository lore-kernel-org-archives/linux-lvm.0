From: Theodore Tso <tytso@mit.edu>
Message-ID: <20011022153819.A2744@thunk.org>
References: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk> <002501c15a66$34f8d010$836788cf@industry>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002501c15a66$34f8d010$836788cf@industry>; from jlixfeld@fastvibe.com on Sun, Oct 21, 2001 at 03:25:56PM -0400
Subject: [linux-lvm] Re: What really works?
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
Date: Mon Oct 22 14:37:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason A. Lixfeld" <jlixfeld@fastvibe.com>
Cc: ext3-users@redhat.com, linux-lvm@sistina.com

On Sun, Oct 21, 2001 at 03:25:56PM -0400, Jason A. Lixfeld wrote:
> Previous attempts at stock kernels and
> various LVM/EXT3/FastTrack patches resulted in all kinds of errors
> ranging from ATARAID errors to LVM errors to physical hard drive errors.

If you see physical disk errors or LVM errors, it's likely that the
filesystem may have been corrupted.  Sometimes the filesystem
corruption may not be noticeable until much later, and the longer you
wait, the worse your data may get scrambled.  So if you were seeing
all sorts of disk or LVM errors, don't just assume that the problems
all went away when you moved to a "stable" kernel.  

So after seeing this kind of disk problems, *always* run fsck -f to
make sure the filesystem is in a sane state before you continue.  Any
journaling filesystem, like ext3, will protect you against needing to
run fsck after an unclean shutdown, but they all won't save you if you
have low-level disk/LVM errors.  In those cases, you still need to
have a filesystem checker to try to pick up the pieces caused by
hardware problems, kernel bugs, etc.

>  One of the lost+founds is stuck on my LVM and I can't delete it.
> Every time I try, it gives me permission denied errors. Chattr -I
> doesn't work either (that's another problem, how the hell do I get
> rid of all that stuff in there now).

It's "chattr -i" (case matters).  

Also, what version of e2fsprogs are you using?  Recent versions should
have offered to get rid of corrupted files for you.  

> Why is all this happening?  What do I need to do to get this all
> working?  This isn't complicated, is it?  10 drives, 3 LVMs and one
> ATARAID?!

Umm.... you're using bleeding edge 2.4 kernels, LVM's, and ext3?  Err,
yeah, this is still complicated.  Given all of the changes going into
the kernel, even though a lot of work had gone into making earlier
versions of LVM and ext3 play nicely together, your milage may
definitely vary (and I haven't even included the ATARAID aspects)..  I
wouldn't put any production data on it just yet, until things have
done a little settling down.

						- Ted
