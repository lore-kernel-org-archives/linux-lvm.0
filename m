Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011302016.eAUKGD501949@webber.adilger.net>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
In-Reply-To: <200011301948.eAUJm6k01893@webber.adilger.net> "from Andreas Dilger
 at Nov 30, 2000 12:48:06 pm"
Date: Thu, 30 Nov 2000 13:16:13 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Linux LVM mailing list <linux-lvm@sistina.com>, jweber@valinux.com

I wrote:
> The simple fix for this problem is to remove "ret" from lvm_map, and always
> returning "0" at the end.

Strangely, in 2.4 lvm_make_request() we totally ignore the return code from
lvm_map() and always return 1.  This should also be fixed after lvm_map()
no longer returns the snapshot error codes.  There is currently a thread
on l-k (cc'd to linux-lvm) which is discussing this very issue.  A good
time to clean this whole thing up.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
