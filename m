Return-Path: <ted@10cust182.starstream.net>
Date: Sun, 19 Aug 2001 19:49:42 -0700
From: Ted Deppner <ted@psyber.com>
Subject: Re: [linux-lvm] Adding a mirror after-the-fact
Message-ID: <20010819194942.A13616@dondra.ofc.psyber.com>
References: <20010814171159.B28266@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010814171159.B28266@linux.com>
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

On Tue, Aug 14, 2001 at 05:11:59PM -0400, Jason Tackaberry wrote:
> I know this isn't strictly an LVM question, but ...
> 
> Suppose I have a volume group with 1 physical volume, say a 9GB disk.
> Now, after some time, I decide I want to mirror this VG with another 9GB
> disk.  What options do I have?  AFAICS, the only way to do this would be
> to start from scratch?  This is a pretty simple and presumably common
> thing to want to do, so I hope I'm wrong.  :)

I've done this using RAID only on ext2fs partitions, no LVM...  it's not
too tough.  I recommend *using* persistent superblocks (they come in handy
sometimes), though it's a little fun to add them to a live file system.

Fact 1:  with or without persistent superblocks, adding raid to a device
doesn't change the initial offset (ie the underlying filesystem begins at
the 0th block regardless of raid or non raid).

Fact 2:  persistent superblock adds a superblock at the end of the device,
of variying size (not sure why).

You can "ext2resize /dev/blah numblocks" where numblocks is the size of
the device minus 5 to 50mb (enough for the superblock, yes it's overkill).  
Once you mkraid on the device, just "ext2resize /dev/blah" to get back
whatever space you over-reserved.  

If you *KNOW* the filesystem isn't using blocks near the end of the
device, you can skip the initial resize, do the mkraid, and "e2fsck
/dev/blah" (read off the actual block size, then abort the e2fsck) and
"ext2resize /dev/blah newnumblocks" 


If you're not using ext2, then do some tests with your filesystems resize
utility to make sure it's bulletproof and go at it.  reiserfs_resize was
buggy in this regard a few months ago when I was testing it...  I've
not tested recently, so maybe it's been fixed.  (it grows just fine, but
introduces errors when shrinking).

And finally, since this is a LVM list, I've no idea what changing device
layers under LVM will do... I know the raid won't do anything but clip
some blocks off the end of the device, but I don't know LVM's handling or
block resize options.

-- 
Ted Deppner
http://www.psyber.com/~ted/
