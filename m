Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104231008.f3NA8Gkx001134@webber.adilger.int>
Subject: Re: [linux-lvm] badblocks handling with LVM
In-Reply-To: <20010422071922.B14891@syrius.org> "from laurent@linuxfr.org at
 Apr 22, 2001 07:19:22 am"
Date: Mon, 23 Apr 2001 04:08:16 -0600 (MDT)
MIME-Version: 1.0
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

Laurent writes:
> I have blocks marked bad on a ext2 filesystem.  The device has bad blocks.
> I'm wondering how bad blocks are handled with lvm.  I would like to create
> a phycal volume on this device and use reiserfs on it.
> Could you give me some informations ?

As long as the bad blocks are not in the first ~250kB of the partition/disk
then LVM doesn't care about it.  However, reiserfs doesn't yet support bad
blocks in the filesystem (this is currently under development AFAIK), so
this will not help you.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
