Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105231653.f4NGrScO028621@webber.adilger.int>
Subject: Re: How about ext3? (was RE: [linux-lvm] XFS and LVM)
In-Reply-To: <20010523103432.D27177@redhat.com> "from Stephen C. Tweedie at May
 23, 2001 10:34:32 am"
Date: Wed, 23 May 2001 10:53:28 -0600 (MDT)
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
Cc: Stephen Tweedie <sct@redhat.com>, Steve Wray <steve.wray@the.net.nz>

Stephen writes:
> On Wed, May 23, 2001 at 08:35:36PM +1200, Steve Wray wrote:
> > Any experience with ext3?
> > Is it shrinkable?
> 
> It is format-compatible with ext2, so offline e2resize should work
> happily on ext3 for both shrinking and growing.  Online, only growing
> has been implemented (but not all of the kernel support is
> integrated).
> 
> I haven't tried doing a resize on ext3 so we might have to teach the
> e2resize tools not to worry if they see the HAS_JOURNAL flag set in
> the superblock, but there is nothing in the format itself to prevent
> it from working.

The ext2resize code has no problem with the non-reserved journal files
for offline resizing.  However, I just noticed last night that it doesn't
handle the reserved journal inode properly.  It halts the resize because
it can't find the owner of the blocks that the reserved journal is using.

Also, while I have finished an online ext3 resizing patch which works
with the journaling properly, I haven't polished it up and finished the
user-space support for it.  It is available on request to people who
really want to play with it...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
