Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106051832.f55IWUNn005259@webber.adilger.int>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
In-Reply-To: <20010605104843.A9845@stocks.pillory.com> "from Jack McKinney at
 Jun 5, 2001 10:48:43 am"
Date: Tue, 5 Jun 2001 12:32:30 -0600 (MDT)
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

Jack McKinney writes:
>     Under Linux LVM, there are issues.  I did a demo to a local unix group
> in which I created a volume and copied a bunch of files to it.  Then, I
> started a pvmove command on that volume (while mounted) and copied files
> into it while it was moving.  md5sums before and after verified that the
> files were all intact.
>     However, I did the same presentation on the same system a week later
> to a local linux group, and one of the files got corrupted.  Moral: you
> need to umount the FS in order to move the LV.

FYI, this problem _should_ be fixed in CVS already, but the fix is more
recent than beta7, so it is likely that you hit a known bug.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
