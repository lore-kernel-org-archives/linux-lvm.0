From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 6 Sep 2001 22:05:53 -0600
Subject: Re: [linux-lvm] Feature : Merge two LV
Message-ID: <20010906220553.Z32553@turbolinux.com>
References: <Pine.LNX.4.30.0109062137150.11080-100000@x14.informatik.uni-bremen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0109062137150.11080-100000@x14.informatik.uni-bremen.de>
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
To: linux-lvm@sistina.com

On Sep 06, 2001  21:51 +0200, Henk Birkholz wrote:
> It would have been easier (without moving the date manually) if some kind
> of lvmerge would exist, which would merge the lv and thier fs
> automatically. Maybe there is ia wayto do it, i simply don't know.
> In that case i would be glad to know that way from you. (and be added to
> you FAQ).

What you ask for is very complex.  It is not so much an issue of LVM (which
could do such a thing relatively easily), but a filesystem issue (which is
_very_ hard to do.  Even with a tree-based filesystem like reiserfs or XFS,
there are all sorts of duplicate identifiers stored in the filesystem, like
block numbers, inode numbers, etc, which would make it complex to resolve.

You are far better off just to do (assuming you collapse /usr/local into /usr):

umount /usr/local
e2fsadm -L -(free space) /dev/vg/lvusrlocal	# if needed, assuming ext2/ext3
e2fsadm -L +(needed space) /dev/vg/lvusr	# if needed, assuming ext2/ext3
mount /dev/vg/lvusrlocal /mnt/tmp
tar cf - -C /mnt/tmp . | tar xf - -C /usr/local
umount /mnt/tmp
lvremove /dev/vg/lvusrlocal

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
