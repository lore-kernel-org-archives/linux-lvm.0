Return-Path: <mason@suse.com>
Date: Wed, 16 May 2001 09:20:51 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
Message-ID: <59310000.990019251@tiny>
In-Reply-To: <20010516093929.B482@66bassett.freeserve.co.uk>
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
Cc: jweber@valinux.com


On Wednesday, May 16, 2001 09:39:29 AM +0100 Joe Thornber
<thornber@btconnect.com> wrote:

> On Tue, May 15, 2001 at 09:17:06PM -0400, Chris Mason wrote:
>> You're right though, pv_flush certainly doesn't look like it could cause
>> any deadlocks.
> 
> I must admit I'm struggling to understand why PV_FLUSH even exists.
> It does *exactly* the same thing as a BLKFLSBUF ioctl to the pv device
> itself.  As such I agree that it's unlikely to be the culprit.

I think there are actually two problems.  Calling invalidate_buffers on
part of an active ext3 FS should hose it (unless ext3 doesn't allow b_count
== 0 on buffers that are clean but still need flushing). 

Adding the BKL on 2.2.x shouldn't do anything, since sys_ioctl grabs it.
Unless the LVM code drops the BKL somewhere, it should be safe.  So, at the
very least ext3 people need Jay's first patch.

The 2.4.x deadlock with reiserfs should be something different.  Reiserfs
should have b_count > 0 on any buffer it cares about.  If PV_FLUSH is never
called with any other locks held, we're probably best off going in with kdb.

-chris
