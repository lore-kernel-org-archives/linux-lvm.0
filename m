Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A2843C6.D277A3F7@tls.msk.ru>
Date: Sat, 02 Dec 2000 03:35:18 +0300
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from 
 /dev/raw/...
References: <200012012322.eB1NMK414023@webber.adilger.net>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Andreas Dilger wrote:
> 
> Michael Tokarev writes:
> > The bad thing is that Oracle tries to write 512 bytes
> > _when creating tablespace_ (I've set up it to use 4k
> > blocks, so it will read/write 4096*n blocks after ts
> > creation).  I attached some strace output from oracle
> > process when creating tablespace, below.
> 
> One "hack" you could try when creating the tablespaces initially is
> to symlink /dev/raw/raw100 to the block device you are using
> (in this case /dev/vg0/ora0), and then when you are done with
> the tabelspace creation remove the symlink and set up the raw
> device as before.

What's *still* unknown to me is a difference between character and
block specials.  In principle, block device should only allow
block access (i.e. multiple of 512 or 1024 or whatether size),
while character devs should allow read of 1 byte.  For example,
solaris doesn't allow "any-size" i/o on block devices -- things
will be bad here (when I read one byte, I got it, but next byte
read will actually be 513'th one, not 2nd etc).  Linux sometimes
gives us errors (invalid argument) in such a cases, and sometimes
not (lvm devices doesn't generate this errors).  The whole rawio
thing as it seemed *to me* to be, is to provide some layer between
block and char i/o, so it should be possible to use any read/write
size with it.  At the other hand, rawio (as stated at sgi oss site
at least), while uses character devices, requires even more
restrictions to be meet -- also about aligning memory buffers
used for read/write requests etc.  I'm confused here... :(

> I'm not 100% sure this will work, however.

This will not work.  I don't know if it's an oracle bug or not
(seemed to be), but if I give to it *block* special file (like
lvm's lv), it will try to remove that file (device) first and
than complain that "file already exists" (funny ;).  But this
triggers something in my mind -- I can create tablespace in
regular file and than copy that file to lv.  For this I don't
shure if it will work or not (will check later - interesting),
but for shure this isn't a solution, since we'll not be able
to extend that datafile from oracle (like extending filesystem
on top of lv), since this again will require writing/reading
like at initial creation time, -- so almost all lvm work will
go away.

> Is the /dev/raw directory
> a "virtual filesystem" like proc or /dev/shm?  The other possibility

No, it's just a plain subdirectory with a bunch (254) files named
raw1..raw254.  It looks like RedHat uses this layout (since there
is no standard layout for rawdevs like for sda hdb etc) to be
prepared for 2.4 kernel (I use 2.2.17).  Linux have no character
devices for disks etc for now, so the rawio patch is for that
purpose (e.g. solaris always had /dev/dsk/xxx devices - that are
character specials, and /dev/rdsk/xxx, block specials (or the
opposite, I don't remember) that have the same major/minor but
different type; linux lacks this).  For now, linux's way is a
ugly -- one should "bound" block device to one of /dev/raw/xxx
device using supplied `raw' utility, and after that can open
that /dev/raw/xxx and use it.  One thing that stops me trying
lvm in "my real life" is that I didn't know if it can work together
with rawio patch.  For now, lvm patch requires rawio patch, so
I concluded that them works together well and tried that...

> is that Oracle will treat it differently because it is a block device
> and not a character device, but I'm not sure of that either.

Shure it will, and will refuse to do something... ;)

Seriously, for me it's not a critical to *not* to use lvm for this
sort of things (yet), there are another working solutions already
exists.  With lvm, things should be far easily.  The main goal
of my original post is to enshure (or make it that) that linux works
in this environment (there should be high demand for raw partitions
on top of lvm in enterprise level, and oracle is the main consumer
for that raw devices).

> 
> As to the real problem, I have no idea.  There were a couple of changes
> that Heinz made to LVM w.r.t. block sizes, but I think that was limited
> to removing constants, and not changing the actual block handling.

This again reminds my "unknowlege" of block/char specials -- should
*block* lvm devices have some *block* limits or not ?! ;) But ok.

I need to check if "stock" lvm patches for stock kernel will work
here (using "retired" lvm-0.9-2.2.17-new_raid.patch and a patch
for that patch isn't a clean experiment ;) ), and will post results
here (but this will be at least at monday, as I won't not reboot
machines at work from home -- all my experiments are at work, I
have no hardware to test things at home machine).  If things will
go, I'll see what's different in two situations...

BTW, here, we are using both lvm and softraid together.  The
test machine have hardware raid controller (5x18Gb, level 5,
total ~72Gb, 68Gb used for one pv that I want to manage for
oracle datafiles), and another four 18G disks on different
controller, used as some number of softraid1-pairs (again,
with raw devices on top and oracle usage).  So it is important
that all subsystem works -- lvm, md and rawio.  Md together with
rawio works pretty well, but not lvm+rawio.  I don't want to
try lvm+md... :)

BTW, one (little?) question.  There was a thread on the list
recently subjected "lvm 0.9 - make_req_fn", for that I don't
have beginning (it was a time when mailinglist switched from
msede.com to sistina.com).  Is there any place where this
can be found ? (sistina's archives are quiet about this).
I ask because I got the problem when tried to apply (really
adopt) patches to redhat-patched kernel exactly with this
(make_req_fn), and wanted to ask list too about this (and
found end of that thread...).

Thanks!

Regards,
 Michael.

P.S.  I like lvm tools -- the first look was *very* nice
tool collection, with very friendly interface/concepts...
