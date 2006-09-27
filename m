Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8RDXePE024708
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 09:33:40 -0400
Received: from stinky.boolecat.com (stinky.boolecat.com [65.99.223.208])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8RDXXLw018471
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 09:33:34 -0400
Date: Wed, 27 Sep 2006 09:33:28 -0400
Subject: Re: [linux-lvm] Help, lvm2 snapshot and XFS ,
	using xfs_freeze to do this, but then lvcreate hang.
Message-ID: <20060927133328.GA30026@boolecat.com>
References: <625ccb870609262203m400d149ax47ef5396dd96236@mail.gmail.com>
	<451A0D03.9000204@davidb.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <451A0D03.9000204@davidb.org>
From: Steve Feehan <sfeehan@boolecat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 26, 2006 at 10:32:51PM -0700, David Brown wrote:
> bowen zheng wrote:
> 
> > Help, lvm2 snapshot and XFS , using xfs_freeze to do this, but then
> > lvcreate hang.
> 
> The lvcreate does the xfs_freeze for you, so if you run xfs_freeze, then
> the lcreate will hang.  Running it with '-u' should allow the lvcreate to
> hang.

Are you saying that the lvcreate command literally executes xfs_freeze
when used on a volume that happens to contain an XFS filesystem? Or
that creating a snapshot is equivalent to using xfs_freeze?

I too had read that it was suggested to call xfs_freeze before creating
a snapshot. This worked on a Debian system a year or two ago. And then
it stopped. I'm not sure if it was a kernel, lvm2 or xfs utilities
update that caused it to stop working. I did file a debian bug a while
back but nothing ever came of it:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=285979

> > I use lvm2 and xfs both.  If I do not use xfs_freeze before, I can use
> > lvcreate snapshot the lv. And it work fine for some static files or
> > lv, but not for running system such as / (root) which will generate a
> > log of I/O error.
> 
> What kind of errors are you getting.  I've done this on active filesystems
> for backup purposes, and not had any problems.

Running xfsdump on the snapshot I see many warnings like:

debug: starting dump at Wed Sep 27 06:00:02 EDT 2006 ...
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692873
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692876
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692873
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692876
/sbin/xfsdump: WARNING: could not stat dirent vg0_04875.vg ino 3692872: No such file or directory
/sbin/xfsdump: WARNING: could not stat dirent vg0_04876.vg ino 3692875: No such file or directory
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692873
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692876
/sbin/xfsdump: WARNING: could not stat dirent vg0_04875.vg ino 3692872: No such file or directory: using null generation count in directory entry
/sbin/xfsdump: WARNING: could not stat dirent vg0_04876.vg ino 3692875: No such file or directory: using null generation count in directory entry
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692873
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692876
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692873
/sbin/xfsdump: WARNING: failed to get bulkstat information for inode 3692876
debug: dump complete at Wed Sep 27 06:00:04 EDT 2006 ...

-- 
Steve Feehan
