Return-Path: <mason@suse.com>
Date: Tue, 15 May 2001 21:17:06 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
Message-ID: <28230000.989975826@tiny>
In-Reply-To: <200105160032.f4G0WPIP022333@webber.adilger.int>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


On Tuesday, May 15, 2001 06:32:24 PM -0600 Andreas Dilger
<adilger@turbolinux.com> wrote:

>> reiserfs should catch blocks that don't have the proper bits set when it
>> starts i/o, and then it makes sure the block hasn't been relogged while
>> the i/o was in progress.  It sends warnings not an oops though, check
>> your log files.  If we were losing journal bits, and the log code didn't
>> catch it, the result should be silent corruption.  
>> 
>> Since he is seeing deadlock, it seems more likely reiserfs is trying to
>> lock a buffer for i/o, and that is hanging for some reason....
> 
> But what does PV_FLUSH do?  Calls fsync_dev() to flush dirty buffers to
> disk, and sync_supers() and waits for buffer I/O completion.  This is
> unlikely to be the cause of a problem, because that happens on each
> sync call.
> 
> It then calls __invalidate_buffers(dev, 0), which destroys everything
> but dirty buffers (on ALL buffer lru lists).  

Unless I'm reading it wrong (2.4.4), __invalidate_buffers destroys all
buffers that are clean and have b_count == 0.  Reiserfs keeps b_count > 0
for all metadata buffers that have been logged, while ext3 allows the count
to be zero (but keeps them in the dirty list).

__invalidate_buffers also waits on any locked buffers.  Any chance one of
the other LVM ioctls grabs some lvm lock before calling PV_FLUSH?

You're right though, pv_flush certainly doesn't look like it could cause
any deadlocks.

-chris
