From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Implementation questions
Message-ID: <20011218093315.A10276@kluge.net>
References: <200112181346.fBIDkX513319@lewis.abi.tconline.net> <Pine.LNX.4.33.0112180802190.1822-100000@lx1.daboard.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0112180802190.1822-100000@lx1.daboard.com>; from mitch@mdmiller.com on Tue, Dec 18, 2001 at 08:03:58AM -0600
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
Date: Tue Dec 18 08:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 18, 2001 at 08:03:58AM -0600, mitch@mdmiller.com wrote:
> Doesn't Ghost support Linux / LILO configurations?  That would allow you
> to configure up one PC, and duplicate it to 129 others, and it's VERY
> quick.  You do, however, still have to make any individualized changes to
> each one after the duplication.

I've tried using Ghost2k (newer versions may be better) to just backup/copy
my Linux partitions (straight ext2 at the time), and it sucked horribly.  The
biggest problem was a bunch of missing symlinks for libraries which made the
system unbootable.  I don't remember now whether all symlinks were removed,
or if it was just in a certain area, or ...

I went back with Partition Magic and it copied the ext2 fses just fine.

However, I don't expect any of these programs to support anything but
straight partitions and ext2.

-- 
Randomly Generated Tagline:
All the easy problems have been solved.
