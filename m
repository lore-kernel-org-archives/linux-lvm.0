Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103121811.f2CIBXw04818@webber.adilger.int>
Subject: Re: [linux-lvm] resizing a mounted ext2 file system?
In-Reply-To: <m2pufnc7ya.fsf@isnogud.escape.de> from Urs Thuermann at "Mar 12,
 2001 04:39:41 pm"
Date: Mon, 12 Mar 2001 11:11:33 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs writes:
> IIRC, I have read somewhere of the possibility to resize a mounted
> ext2 file system.  I think I will have to patch the kernel and the
> resize2fs utility (or install a new utility) to be able to do it.
> 
> Can someone give me a URL or other pointer, where to find it?  How
> stable is this?  And will this go into the mainstream kernel/e2fsprogs
> in near future?

Please see http://sourceforge.net/projects/ext2resize/

It is fairly stable (OK, I'm a bit biased), but I haven't had any bug
reports in many months (1 year+?).  It only works on x86 right now.

Will it go into kernel?  Eventually.  I'm working on a new ext3 version
right now, and I haven't tried submitting the ext2 version to Linus in a
long time.

The new ext3 code will need a few minor changes to the on-disk layout
of the resize inode (the old layout will still work for ext2).  At this
point I will add an ext2 COMPAT flag, add full e2fsck support (verification
of resize inode instead of just removing an error message like now), and
send patches to Ted for inclusion into e2fsprogs (he will probably accept).

Once all is installed, you can use e2fsadm to handle LV+ext2 resize (it
will call ext2online or ext2resize as appropriate).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
