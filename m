From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 17 Oct 2001 16:30:56 -0600
Message-ID: <20011017163056.A508@turbolinux.com>
References: <20011018000006.A22777@jensbenecke.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011018000006.A22777@jensbenecke.de>
Subject: [linux-lvm] Re: [reiserfs-list] Horrid performance with 2.4.{9,10,12} + LVM + ReiserFS
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
To: ReiserFS Mailingliste <reiserfs-list@namesys.com>, LVM List <linux-lvm@sistina.com>

On Oct 18, 2001  00:00 +0200, Jens Benecke wrote:
> The LVM volume is about 97% full (7.5GB free). In ext2 the rule was not to
> use the last 5% of a disk because it would be too slow. But I think this
> should not be a problem for ReiserFS, at least not with such big disks (?).
> If it is, this would waste over 10GB disk space which I don't think is
> acceptable.

Do you mean that you have 3% of the LOGICAL VOLUME or DISK free, or do you
have 3% of the FILESYSTEM free (e.g. is the free space reported by "pvscan"
or "df")?  If it is the FILESYSTEM with only 3% free, then there is not much
that you can do about the performance problem - fragmentation cannot be
helped, regardless of the filesystem.

Actually, there is someone testing exactly this issue with reiserfs, and they
report 5-10x slowdown with a highly fragmented filesystem, so your 2.5x
slowdown is in the right range.

> Strangely, on a 'real' partition this is much faster (this was formatted
> recently and with 3.6 format, though):

Yes, well a new filesystem (especially if not full) will not have
fragmentation problems.

> Currently I'm thinking of backing up the whole volume and reformatting, but
> I wanted to ask what might cause this first because this would be a major
> PITA for many users here.

Well, it may help for a short time, but at 97% full you will have problems
almost right away again.  I'd suggest adding more space to the LV and growing
the filesystem (without doing the backup/restore) and you will naturally get
some "defragmentation" happening as the new space is used and old space is
freed.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
