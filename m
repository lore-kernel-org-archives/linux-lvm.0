Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012192239.eBJMd3j26809@webber.adilger.net>
Subject: Re: [linux-lvm] hd read error / some PEs won't pvmove - how to resolve?
In-Reply-To: <20001217183129.B884@twitch.webtownis.bc.ca> "from rick@webtownis.bc.ca
 at Dec 17, 2000 06:31:29 pm"
Date: Tue, 19 Dec 2000 15:39:02 -0700 (MST)
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

Rick, you write:
> All except for 8 PEs, that is. pvmove fails with an error when I try to
> move those particular PEs where the read errors are occuring. 

Yes, AIX always had this same problem.  However, because you could mirror
inside the LVM on AIX, you could mirror the bad LEs, and then remove the
old PV because there were 2 copies of that LE.  Generally you were better
off throwing the whole filesystem out and restoring from a backup, if you
didn't have a mirrored LV in the first place.  AIX also warned you at the
time of temporary (rather than permanent) read errors, so sometimes you
had a chance to replace the disk before it totally crapped out.

> I don't need to worry about recovering that data. None of the affected
> files are important enough to worry about. But I do need to remove the 
> PV on the 20GB drive from the VG, which I can't do while these 8 PEs 
> are still assigned to my LV. 

If the bad PEs are in the middle of the filesystem, you are pretty much
hosed in terms of recovery for this filesystem, regardless of whether
you can force LVM to move the PEs for you (if you are lucky fsck may be
able to recover, but it really depends on where/how big the bad PEs are
and how you initially configured the filesystem).  Hopefully the bad
PEs are only in one LV.

I would simply back up what files you can (via tar) and make a new LV
and filesystem on the other disk.  You _should_ be able to delete the
LV. Once the LV using those PEs is gone is gone you should be able to
remove the PV.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
