From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020110131257.E771@lynx.adilger.int>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <200201050212.TAA16774@cthulhu.turbolabs.com>
    <20020105142527.I12868@lynx.no>
    <200201101521.IAA17651@cthulhu.turbolabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200201101521.IAA17651@cthulhu.turbolabs.com>; from
    ahead@bigpond.net.au on Fri, Jan 11, 2002 at 01:21:26AM +1000
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
Date: Thu Jan 10 14:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com, ext2-devel@lists.sourceforge.net

On Jan 11, 2002  01:21 +1000, Adrian Head wrote:
> The last problem is that in only some of my tests when I "ls" the overflowed 
> snapshot "ls" complains about missing directories and files, "echo *" shows 
> what use to be there and ext3 generates errors in the logs:
> EXT3-fs error (device lvm(58,5)): ext3_readdir" directory #2 contains a hole 
> at offset 0

Well, given that the snapshot is now broken and LVM is refusing I/O on it,
what do you expect the filesystem to do?  This is what LVM _intends_ to
happen, because the snapshot can no longer hold all of the data to keep
it consistent.

The ext3 error is reporting that it tried to read the directory (root = #2)
and it got nothing back.  The reason you see some files and not others is
because those blocks happen to still be in the cache, and it does not go
to LVM to try and re-read them.  Eventually, as the memory is needed for
other things, you will no longer be able to read anything.

I suppose it would be possible to have LVM do an "unmount" of any fs
using a bad snapshot device from within the kernel, but whether people
actually want that to happen is another question entirely.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
