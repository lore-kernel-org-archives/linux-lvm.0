Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105231543.f4NFhkql028088@webber.adilger.int>
Subject: Re: [linux-lvm] XFS and LVM
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJOEMIIOAA.steve.wray@the.net.nz>
 "from Steve Wray at May 23, 2001 11:17:14 am"
Date: Wed, 23 May 2001 09:43:46 -0600 (MDT)
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

Steve Wray writes:
> nooo, I'm not really using reiserfs in a serious way.
> I only tried it out because XFS isn't shrinkable,
> so I wondered how reiserfs would perform on a shrink.
> 
> I'm going to try ext3 sometime soon...

Just FYI, I have patches/tools to do online and offline resizing of ext2,
and have an alpha online ext3 resizer.  The ext2 code is pretty solid.
You can grow an ext2 filesystem online, but you need to unmount it to
shrink the filesystem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
