Return-Path: <sct@redhat.com>
Date: Thu, 30 Nov 2000 09:46:30 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
Message-ID: <20001130094630.E3027@redhat.com>
References: <200011290701.eAT71p902650@webber.adilger.net> <200011291018.eATAI6K21538@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011291018.eATAI6K21538@webber.adilger.net>; from adilger@turbolinux.com on Wed, Nov 29, 2000 at 03:18:06AM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@sistina.com, jweber@valinux.com, "Stephen C. Tweedie" <sct@redhat.com>, "Heinz J. Mauelshagen" <mauelshagen@sistina.com>

Hi,

On Wed, Nov 29, 2000 at 03:18:06AM -0700, Andreas Dilger wrote:

> > Maybe LVM isn't cleaning up the buffer properly when it runs out of space
> > in the snapshot...
> 
> Judging by the assertion (the buffer is still locked), and the fact that
> this flag BH_Lock is what's set when a buffer is being written, and
> cleared by wait_on_buffer(), LVM may need to be waiting on it's snapshot
> I/Os to complete if it will later destroy the snapshot...

Right.  There are only two ways the assertion can fail: the buffer is
locked for read, or for write.  By this stage, ext3 has frozen all of
the filesystem operations which were working on this buffer, but may
have started collecting new updates while the old ones are committing,
so there is the possibility of ext3 doing concurrent access while we
are doing this journal operation.

So, is somebody else doing a read?  It could be ext3, conceivably, if
we had had an IO error previously on the buffer and the BH_uptodate
flag had been cleared: a subsequent access to the buffer by another
process would try to reread the buffer off disk, locking it
temporarily.  Could you load the ext3 kdb debugging extensions and run
a "bh <buffer_head address>" on the buffer-head once the oops drops
you into kdb monitor mode?  That way, we can find out whether the
dirty bit has been set on the buffer_head. 

Cheers,
 Stephen
