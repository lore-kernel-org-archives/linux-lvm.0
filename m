From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010121641.MAA03003@lynx.turbolabs.com>
Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
Date: Thu, 12 Oct 2000 12:41:21 -0400 (EDT)
In-Reply-To: <20001011084555.A6983@omnifarious.mn.org> from "Eric M. Hopper" at Oct 11, 2000 08:45:55 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Cc: linux-lvm@msede.com

Eric M. Hopper writes:
> On Wed, Oct 11, 2000 at 01:25:50PM +0100, Andy Cowling wrote:
> > I'm just starting out using LVM under SuSE 7.0. I created a logical
> > volume which was initially 30Gb but I then resized it to 90Gb (using
> > lvresize) spanning 3 physical volumes each of 30Gb.
> >
> > Now, lvdisplay/vgdisplay shows the LV/VG size as 90Gb, but df still
> > lists the file system as 30Gb.
> >
> > How can I get df to recognise the addtional space ?
> 
> 	I'm assume the filesystem is an ext2 filesystem.  If it is, then
> you need to find an ext2 resizing utility.  resize2fs is one such
> utility.  I'm not sure where to find them on the web, but they
> definitely exist.

You can get ext2 resizing tools from ext2resize.sourceforge.net.  There
is also the resize2fs tool included with e2fsprogs 1.19.

> 	In general, the filesystem can only be resized when it's
> offline.  The filesystem resizing utility updates all the filesystem
> data structures to reflect the new size, and creates new data structures
> in the new space.

With the ext2online kernel patch and user-space tool, you can do online
(mounted) ext2 resizes.

Cheers, Andreas
