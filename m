Date: Fri, 12 Oct 2001 23:43:18 -0600
From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pv recovery after trashing partition table.
Message-ID: <20011012234318.F27981@turbolinux.com>
References: <20011012.204509.-448365.0.james.cromie@juno.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011012.204509.-448365.0.james.cromie@juno.com>
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
To: Jim N Cromie <james.cromie@juno.com>
Cc: linux-lvm@sistina.com

On Oct 12, 2001  20:45 -0600, Jim N Cromie wrote:
> so following your suggestions,,
> 
> gpart.linux is telling me unexpected results:
> 
> hda1 data matches, allowing for the -1 offset of cylinder numbers, wrt fdisk.
> hda2 is reported as 94Mb DOS, not  Linux swap.
> hda3-4 are un-recognized. (reported as zeros)

Yeah, I tried gpart once as well, and it was less-than-stellar at finding
LVM stuff (possibly because of the fact that the ext2 superblock wasn't
aligned properly for a normal partition table).

> dumpe2fs /dev/hda3 shows
> Block-ct = 8032, Block-size = 1024
> 
> fdisk shows same partition having 16065 512 byte blocks, ie different by
> 1 block.

Well, since the block size is 1kB, the last 512-byte chunk is ignored by
ext2, so 16065 is probably correct.  Also, it is hard to specify "1 block"
with a partition table (usually it must be aligned on a cylinder start
or something like that).

> fsck -V /dev/hda3 works, but doesnt really seem to check much.  No errors
> reported, and if the earlier partition table was correct, then this is
> silently wrong, but...

Well, unless you use "-f" it is only looking at the superblock "status"
flag and not much else.  It does still verify that the device size is
big enough for the filesystem, however.

> Separately, is there an LVM PV super-block pattern that I could look for?

Yes, it will be "HM\001\000" (in hex 48 4d 01 00), unless you did the
"LVM upgrade dance" with version 1.0, in which case it may be "HM\002\000".
This would be at byte 0 of your missing partition.

> I believe I caould take a representative od -x output fragment, replace
> varying fields with periods, and use it as a perl regular-expression to
> test against my own od-x output.  If this works, then the block offset
> should be evident from the matching addresses.

If you download the e2fsprogs source (http://sf.net/projects/e2fsprogs)
there is a program "findsuper" which will look for ext2 superblock
signatures.  They will be some arbitrary distance from the start of the
partition because of LVM stuff, but at least you will have an idea if
the filesystem is still there.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
