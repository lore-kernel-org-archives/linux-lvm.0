Date: Fri, 15 Sep 2000 13:08:51 +0200 (CEST)
From: Bernhard Kaindl <bk@suse.de>
Subject: Re: [linux-lvm] Re: [PATCH] align lv_on_disk.base to 512K blocks
In-Reply-To: <20000915093525.A6608@ns.lst.de>
Message-ID: <Pine.LNX.4.21.0009151226330.6409-100000@Wotan.suse.de>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: Mauelshagen@sistina.com, mge@sistina.com

On Fri, 15 Sep 2000, Christoph Hellwig wrote:
> On Fri, Sep 15, 2000 at 09:01:14AM +0000, Heinz J. Mauelshagen wrote:
> > 
> > Done.
> > 
> > How far are you with your driver enhancements?
> 
> As far as the in-kernel scanning is concerned I'm working on
> getting the detection of vgs with multiple pvs right and
> implement some kind of error handling.

Cool, when development is done for a new version of LVM, please
someone should also consider the hardware block size issue of
the used PVs(I don't want to bring anyone from his way, just
give an item for people that are looking for something).

One Architecture I just got LVM running on is S/390. Most of the
block devices on this archtecture have an hardware block size
of 4096 bytes and the LVM patches I've seen yet do not deal with
that, they assume block sizes of BLOCK_SIZE.

To get LVM running there, I have initialized the lvm_blocksizes
array with 4096 instead of BLOCK_SIZE. This forces the block accesses
from userland to use 4k buffers and you can actually initialze
an LV this way.

Then you also have to initialize the hardsect_size array with
the same size, because the filesystems call bread directly and
use this array to determine the size of the buffers used.

See fs/ext2/super.c and look for "hard". So you have to export
the blocksizes of the PVs mapped in an LV to the upper layers thru
the blksize_size and hardsect_size arrays as described above or
you cannot mount an ext2 in that LV.

Of course, what I did was just a kludge to get me up and running,
I think it should be better to ensure that only PVs that support
the same block size can be used in an VG and be mapped to LVs.

I don't know the LVM structures and internal procedures good
enough to do that myself, but maybe someone else can do or
point me the the places where this would need to be checked
and where I can determine the block size an LV will need to
export.

best regards,
   
                 Bernd

PS: Again, nobody should delay work on in-kernel scanning of vgs
for that, for me it's just working, and I'm just want to bring
this information up too. Maybe it can intetrate into the next
version and we have an LVM that works everywhere whithout any
patch, that's the intention of this mail.
