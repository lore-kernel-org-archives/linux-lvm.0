Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7RExAV05244
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 10:59:10 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7REx595000917
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 10:59:09 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j7REwwin006616
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 16:58:58 +0200
Subject: Re: [linux-lvm] Saving files from full failing volume
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <fa61edfd05082706007d36d221@mail.gmail.com>
References: <fa61edfd0508200022235af787@mail.gmail.com>
	<1124806695.17889.22.camel@bats.omnifarious.org>
	<fa61edfd05082706007d36d221@mail.gmail.com>
Date: Sat, 27 Aug 2005 16:58:57 +0200
Message-Id: <1125154737.2225.54.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2005-08-27 at 23:00 +1000, Chris Jensen wrote:
> > The only way to really identify where files live in LVM is to identify
> > which filesystem they're on.  Then they might end up being on any random
> > block of that filesystem.  You can identify which physical extents a
> > particular filesystem is using easily, but not which physical extents a
> > particular file is using.
> > 
> > Perhaps someone else can correct me if I'm wrong about this, but as I
> > understand things this is how it works.
> 
> Thanks for the response Eric. Let me check that I understand this correctly:
>  If I were to use LVM to create a file system that spans 2 hard disks,
> of capacity 80G each (for simplicities sake), giving a total capacity
> of 160G, if that filesystem grows to (say) 100G and then one of the
> disks begins to fail, there is no way for me to backup the files that
> would be endangered, short of backing up the entire 100G, to another
> disk entirely.

That's how I understand it as well. The thing is also that you can't
really say that "a file is endangered", because it may even only be
parts of the file that are endangered. The blocks that make up the
storage area of a single file may well be spread over several disks.

With Linux LVM, there is no way for the filesystem driver to determine
on what disk a certain block resides, so the filesystem cannot safely
partition files on only one disk. Even if Linux LVM provided an
operation to inquire about such things, all filesystem drivers would
have to implement that independently of each other.

> Is there a better way I should go about organising my disks and LVM so
> that surviving a hard disk failure is not so difficult?

With a larger budget, you could buy double disk space and mirror the
volume (similar to RAID10). Depending on your budget, though, I guess
that may well not be possible.

I'm no expert on it, but from what I've heard, the new ZFS filesystem in
Solaris 10 would "fix" many of these issues. Whereas Linux LVM operates
on the block device layer (and thus also allows any filesystem to reside
on a LV), the ZFS filesystem contains a volume manager in the filesystem
layer, so that individual files can be striped, mirrored, and kept on
distinct disks, individually.

Hope it helps,
Fredrik Tolf
