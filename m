Return-Path: <treed@ultraviolet.org>
Date: Thu, 7 Dec 2000 12:37:43 -0800
From: Tracy R Reed <treed@ultraviolet.org>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <20001207123743.B24307@ultraviolet.org>
References: <20001207115538.B24318@archimedes.oak.suse.com> <700130000.976219508@coffee>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <700130000.976219508@coffee>; from mason@suse.com on Thu, Dec 07, 2000 at 03:05:08PM -0500
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

On Thu, Dec 07, 2000 at 03:05:08PM -0500, Chris Mason wrote:
> > Unless they have changed it (possible), reiserfs does not support ro
> > hardware for mounting unless the filesystem was unmounted cleanly. The
> > reason is that to make the FS consistant the journal has to be replayed
> > which necessarily _writes_ to the device. This cannot work on an ro
> > device.

Hmm....

> We didn't change that ;-)  But, the message would look different.  In this
> case, it did not find a reiserfs filesystem at all, or perhaps the reiserfs
> module wasn't loaded...

So...can I or can I not use snapshots with reiserfs? The snapshot was
taken of a currently mounted and functioning (reiserfs module
loaded...compiled into the kernel, actually) so if I did the snapshot
correctly there should be a filesystem there. I'm going to wipe it out
(nothing on it but some test files) and try again with ext2 and see what
happens. 

This should work, shouldn't it?

-- 
Tracy Reed      http://www.ultraviolet.org
