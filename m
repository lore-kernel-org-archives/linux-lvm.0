Message-ID: <3780FF87.2C90F77D@moeraki.com>
Date: Mon, 05 Jul 1999 11:55:03 -0700
From: John Finlay <finlay@moeraki.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: ext2resize
References: <010e01bec6c3$06ebed80$0102010a@adminstation.sgymsdam.nl>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Lennert Buytenhek <buytenh@dsv.nl>
Cc: linux-lvm@msede.com

Lennert Buytenhek wrote:

> >Lennert Buytenhek writes:
> >> I replied: "Depending on who you talk to of course. :-) The max. number
> >> of groups for ext2 is 1024 I believe. One extra gd block per block gives
> >> you room for 32*8=256mb expansion (assuming 1kb blocks). This
> >> will cost you at most 1 meg of reserved gd blocks. Seems like a fair
> >> price. The max. number of gd blocks is 32. So doing this when making
> >> an fs will cost you at most 32*1024 blocks, which is 32mb with 1k
> >> blocks. On modern drives, you'll probably not even notice a 32mb
> >> loss. Unless you have a lot of partitions, of course...."
> >Are you sure that the max number of GDT blocks is 32?  For a 1kB block
>
> Yes, for a 1kb block size. One of my ext2 linux kernel headers #defines
> the max number of groups to be 1024. Times 32 bytes per group
> descriptor is 32kb, which is 32 blocks on 1kb. Unless the header is
> wrong, of course.
>

I don't think this is correct. I have an ext2 filesystem that is 52GB. It
appears to have 200+ blocks in the GDT and as I recall 6000+ block groups. I
made a 86GB filesystem the other day with 1k blocks and it had 10000+ block
groups. With 4k blocks there were 650+ block groups.

>
> >size, this would give a limit of 32 GDT blocks * 32 GD/GDT block * 8k
> >blocks/GD = 8GB max FS size.  With 4kB blocks we grow 4x for larger data
> >blocks, 4x for more GD/GDT block, and 4x for more blocks/GD, so 512 GB
> >max, not the expected 4TB limit.  If we wanted to reach 4TB with 1kB
> >blocks (possible since block numbers are 32-bit unsigned), then we would
> >need 512*32 GDT blocks, or 200% !!!  of all FS space, while with 4kB
> >blocks we need 256 GDT blocks, or 1/32 of FS space.
>
> Yes, well, I didn't invent this. Most of the people will use larger block
> sizes then, anyway.
>

It does seem peculiar that the largest block size is limited to 4k. 8k would
seem to be a reasonable size to me.

It seems that ext2 is not really suited for large filesystems: seems like
there is too much redundancy in the block groups that causes slow downs in
operations like mount, etc.; e2fsck takes hours on a 52GB filesystem.

Are there any projects underway to develop a new filesystem that is more
suitable for large filesystems?

John
