Return-Path: <john@oswf.de>
From: Werner John <john@oswf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <15205.4296.839673.519783@rigel.oswf.de>
Date: Mon, 30 Jul 2001 09:46:16 +0200 (MEST)
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
In-Reply-To: <20010727090245.A4262@linux.com>
References: <20010726131928.D1779@linux.com>
	<20010726134732.A27706@sistina.com>
	<20010726160701.H1779@linux.com>
	<20010726151725.A28574@sistina.com>
	<15201.4293.260605.275782@rigel.oswf.de>
	<20010727090245.A4262@linux.com>
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
To: linux-lvm@sistina.com

Jason Tackaberry writes:
> [...]
> 
> I guess you mean software RAID using md? 

yes.

> > for more than 140 days on one of our machines. No problems so far, although
> > it is still 0.9.1-beta5 and a "rather old" kernel ;-). Maybe it is time to
> > upgrade this one, too.
> 
> I guess this is the concern: md clearly works when all is going well,
> but when somethings goes awry (like, for example, in my case where a
> kernel bug in reiserfs caused umount to segfault while it had a lock on
> /etc/mtab), is it robust enough?

don't mix md with the file system. The FS doesn't care about anything that
goes on below its level. You could have an ext2 on a ramdisk, or you could
have an ext2 on a SW RAID-0 on top of a ramdisk and a floppy drive.

> Are there others on this list who can share their md/lvm experiences use
> with me?

I have "tested" the SW RAID and LVM by simply pulling the plug while
writing a 500MB file to my disks. Well, I know, this should not be called a
real test, I consider it a brute force attack ;-) Just one time, the FS was
damaged so badly that I could not repair it.

Regards,

Werner
