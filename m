Message-ID: <39873D1C.6A9E49B9@tuxtops.com>
Date: Tue, 01 Aug 2000 14:11:56 -0700
From: Mark Allen <mallen@tuxtops.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Generic resize tool
References: <200008011842.e71IgcS27484@webber.adilger.net> <20000801145354.A9220@omnifarious.mn.org>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

"Eric M. Hopper" wrote:
> 
> On Tue, Aug 01, 2000 at 12:42:38PM -0600, Andreas Dilger wrote:
> > Hello,
> > I'm wondering if people are interested in having a more generic resize
> > tool than the current e2fsadm.  I've updated e2fsadm to have support
> > for the GNU ext2resize tools (ext2resize and ext2online) in addition
> > to resize2fs, but I was wondering about adding support for reiserfs
> > resizing as well.  At this point e2fsadm isn't a very good name for it
> > anymore.
> >
> > I was thinking if renaming it to "chfs" the same as AIX LVM tool which
> > handles both LV and FS resizing, among other things, and does not
> > sound fs-specific.
> 
>         I would expect that chfs would allow you to change a partition
> from ext2 to reiserfs, and maybe change the size in the bargain.
> 
>         I like resizefs better.  It could also be fsresize.  It depends
> on whether you like the mkfs, or fsck traditions better.  Of course, you
> could just call it 'resize' like mount calls itself 'mount'.  But,
> there's already a X program called 'resize' for resetting your TERMCAP
> variable and stty settings after xterm resizes.

There is also the GNU "parted" utility which already has a nice API and
stuff for resizing FAT partitions. It needs help "moving" ext2
partitions (specifically, moving the first sectors of an ext2 filesystem
suck) and it would be nice to collect all other functionality like
dealing with reiserfs and LVMs into one place, one library.  The
project's homepage is http://www.gnu.org/software/parted .

Andrew Clausen is the project leader. I'm sure he wouldn't turn away an
offer of help. :-)

Mark

--
mallen@tuxtops.com
http://www.tuxtops.com
Tuxtops: the Linux on Laptops company
