Date: Sat, 8 Apr 2000 13:36:22 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] converting a filesystem to a logical volume
Message-ID: <20000408133621.B12431@home.ds9a.nl>
References: <200004070615.IAA29664@u9etz.ez-darmstadt.telekom.de>
Mime-Version: 1.0
In-Reply-To: <200004070615.IAA29664@u9etz.ez-darmstadt.telekom.de>; from mauelsha@ez-darmstadt.telekom.de on Fri, Apr 07, 2000 at 08:15:34AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> > Lennert Buytenhek and I were discussing this a bit, and it shouldn't be
> > _too_ hard to do with the existing ext2resize code (although ext2resize
> > isn't currently designed to move the start of a filesystem, only the end).

Ah. Well, I had not planned on involving ext2 with this - My plan was to
first shrinkt the filesystem a few blocks with ext2resize, and then 'shift
it to the right' the right number of blocks for it to be in the place where
LVM expects it.

> I can change pvcreate to provide this information
> (without creating the volume for sure) and vgcreate/vgextend to wrap
> the new locations of the filesystem.

A procedure might be:

	calculate the block offset (x) where lvm expects the filesystem
	shrink the filesystem by x blocks, using whatever means desired
	move it x blocks upwards
	call vgcreate to create the volume group and wrap the new fs

With regard to moving the filesystem,  is that all there is to it? Does LVM
expect any special headers, or markers?

> > By making new copies of the indirect blocks, there is never a time when
> > the old filesystem is not valid - this is a very good thing so you don't
> > have problems if the program crashed, the machine crashed, you change your
> > mind, etc.  You could always use the old filesystem until the time you
> > overwrite the start of the old filesystem with LVM metadata.

Yeah, that is one thing we miss when doing it in the way I described above.
If your computer goes down while shifting your filesystem, you end up with a
mess.

> > If you are really interested in working on this, the ext2resize code is
> > available via FTP or anonymous CVS from ext2resize.sourceforge.net.  Please
> > feel free to ask me any questions, etc.

I didn't intend to become an ext2 expert originally. Your idea does have
merit however. I'm thinking it over.

Regards,

bert hubert.

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
