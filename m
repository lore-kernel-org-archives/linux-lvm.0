Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102271700.f1RH0iE27053@webber.adilger.net>
Subject: Re: [linux-lvm] NFS
In-Reply-To: <Pine.LNX.4.20.0102270825260.27799-100000@rdb.linux-help.org> from
 "ardy@rdb.linux-help.org" at "Feb 27, 2001 08:26:35 am"
Date: Tue, 27 Feb 2001 10:00:44 -0700 (MST)
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

Andy writes:
> Are there any issues regarding exporting lvm mounted filesystems
> over NFS?

No, I've been doing it a long time.  LVM is a block device like a disk,
while NFS is a filesystem interface.  As long as the filesystem can
support NFS you are OK.  This limits you pretty much to ext2 or ext3 only,
unless you have reiserfs with up-to-date patches.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
