Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103130144.f2D1iZi01304@webber.adilger.int>
Subject: Re: [linux-lvm] e2fsck error
In-Reply-To: <F25nPz8nCb6fazW7NlK000071e2@hotmail.com> from hail narcissus at
 "Mar 12, 2001 03:33:48 pm"
Date: Mon, 12 Mar 2001 18:44:34 -0700 (MST)
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

You write:
> Running resize2fs was successful.  Got another 140GB added to my LV now.

I can't see that resize2fs would run if there are filesystem errors.  It
is far more paranoid about resizing than ext2resize (it forces you to run
e2fsck, even on a clean filesystem, while ext2resize only needs it if the
filesystem is dirty).

> I'm running e2fsck -fvp now to see if there are any more errors, but it 
> doesn't get the errors right off the bat like it use to so it might have 
> fixed itself during the resize.

Probably takes a long time, but well worth it...  Maybe the errors were
cleaned up the last time you ran e2fsck?  It would have been useful to
check the filesystem status with "dumpe2fs -h <dev>" before you did the
resize/e2fsck, to see if it was clean or not.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
