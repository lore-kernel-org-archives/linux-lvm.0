Return-Path: <mason@suse.com>
Date: Tue, 15 May 2001 19:14:01 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
Message-ID: <1272890000.989968441@tiny>
In-Reply-To: <200105152249.f4FMnP3D022006@webber.adilger.int>
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


On Tuesday, May 15, 2001 04:49:25 PM -0600 Andreas Dilger
<adilger@turbolinux.com> wrote:

> Tom Otake writes:
>> Yes, I've been able to recreate the second hang scenario, though I have
>> to admit it wasn't exactly the same.  I started the copy of the data,
>> created a new LV, which worked.  I ran mkreiserfs on the new LV, it
>> worked.  I removed the new LV, also worked, then ran pvscan.  That's
>> when the system hung.  All the while, the copy from CD to disk was going
>> on.
> 
> It may be that this is related to the ext3 problem that is ongoing.
> Basically, if pvscan or vgscan (PV_FLUSH ioctl calling invalidate_buffers)
> is run it causes buffers to go into an invalid state for the journal
> code, and this breaks the journaling.  On ext3, there are assertions in
> the code which detect the invalid state and case an oops (stack trace),
> but this may not be the case with reiserfs.

reiserfs should catch blocks that don't have the proper bits set when it
starts i/o, and then it makes sure the block hasn't been relogged while the
i/o was in progress.  It sends warnings not an oops though, check your log
files.  If we were losing journal bits, and the log code didn't catch it,
the result should be silent corruption.  

Since he is seeing deadlock, it seems more likely reiserfs is trying to
lock a buffer for i/o, and that is hanging for some reason....

-chris
