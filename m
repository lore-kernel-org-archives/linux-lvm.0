Return-Path: <hch@ns.caldera.de>
Date: Sat, 2 Dec 2000 11:45:15 +0100
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from /dev/raw/...
Message-ID: <20001202114515.A10722@caldera.de>
References: <200012012322.eB1NMK414023@webber.adilger.net> <3A2843C6.D277A3F7@tls.msk.ru>
Mime-Version: 1.0
In-Reply-To: <3A2843C6.D277A3F7@tls.msk.ru>; from mjt@tls.msk.ru on Sat, Dec 02, 2000 at 03:35:18AM +0300
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
To: linux-lvm@redhat.com
Cc: linux-lvm@sistina.com

On Sat, Dec 02, 2000 at 03:35:18AM +0300, Michael Ju. Tokarev wrote:
> What's *still* unknown to me is a difference between character and
> block specials.  In principle, block device should only allow
> block access (i.e. multiple of 512 or 1024 or whatether size),
> while character devs should allow read of 1 byte.  For example,
> solaris doesn't allow "any-size" i/o on block devices -- things
> will be bad here (when I read one byte, I got it, but next byte
> read will actually be 513'th one, not 2nd etc).  Linux sometimes
> gives us errors (invalid argument) in such a cases, and sometimes
> not (lvm devices doesn't generate this errors).  The whole rawio
> thing as it seemed *to me* to be, is to provide some layer between
> block and char i/o, so it should be possible to use any read/write
> size with it.  At the other hand, rawio (as stated at sgi oss site
> at least), while uses character devices, requires even more
> restrictions to be meet -- also about aligning memory buffers
> used for read/write requests etc.  I'm confused here... :(

Ok.  The blockdevices itself don't have a direct interface to the
userspace.  They are only called by ll_rw_block.  The blockdevice
specials are implemented in fs/block_dev.c, and allow cached access
to the block devices (currently through the buffer cache, but it may
move to the pagecache soon).  The rawio stuff on the other hand allows
raw, uncached access to the block devices.  It has another advantage:
by using kiobufs the data does not have to be copied from user- to
kernelspace or vice versa.

> > Is the /dev/raw directory
> > a "virtual filesystem" like proc or /dev/shm?  The other possibility
> 
> No, it's just a plain subdirectory with a bunch (254) files named
> raw1..raw254.  It looks like RedHat uses this layout (since there
> is no standard layout for rawdevs like for sda hdb etc) to be
> prepared for 2.4 kernel (I use 2.2.17).

Nope.  You can use whatever /dev layout you want with every kernel you
want unless you use devfs.  The newer raw versions just use the /dev/raw
directory instead of having the files directly in /dev.

> Linux have no character
> devices for disks etc for now, so the rawio patch is for that
> purpose (e.g. solaris always had /dev/dsk/xxx devices - that are
> character specials, and /dev/rdsk/xxx, block specials (or the
> opposite, I don't remember)

Yepp. The opposite... (rdsk = raw disk).

> that have the same major/minor but
> different type; linux lacks this).  For now, linux's way is a
> ugly -- one should "bound" block device to one of /dev/raw/xxx
> device using supplied `raw' utility, and after that can open
> that /dev/raw/xxx and use it.  One thing that stops me trying
> lvm in "my real life" is that I didn't know if it can work together
> with rawio patch.  For now, lvm patch requires rawio patch, so
> I concluded that them works together well and tried that..

LVM doesn't really need rawio but the kiobuf infrastructure included
in the rawio patch.  Without snapshot LVs it should be usable without
that patch.  And yes, LVM works with rawio.  Rawio works with every
blockdvice, because it needs no special support on the block device
layer.

> > 
> > As to the real problem, I have no idea.  There were a couple of changes
> > that Heinz made to LVM w.r.t. block sizes, but I think that was limited
> > to removing constants, and not changing the actual block handling.
> 
> This again reminds my "unknowlege" of block/char specials -- should
> *block* lvm devices have some *block* limits or not ?! ;) But ok.

Block lvm devices shouldn't have a limit on the number of read/written
chars.  Actually block special devices is a very confusing name.  These
are just device files that allow cached access to the block devices.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
