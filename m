Return-Path: <hch@ns.caldera.de>
Date: Sat, 13 Jan 2001 17:06:16 +0100
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
Message-ID: <20010113170616.B22699@caldera.de>
References: <20010113114507.D15915@linuxcare.com> <200101130143.f0D1hNF19829@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200101130143.f0D1hNF19829@webber.adilger.net>; from adilger@turbolinux.com on Fri, Jan 12, 2001 at 06:43:23PM -0700
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
Cc: Anton Blanchard <anton@linuxcare.com.au>, Mauelshagen@sistina.com, linux-kernel@vger.kernel.org

On Fri, Jan 12, 2001 at 06:43:23PM -0700, Andreas Dilger wrote:
> Anton, you write:
> > Have a look at 2.4, arch/sparc64/kernel/ioctl32.c
> 
> Yuk.
> 
> > Would it be possible to clean up the ioctl interface so we dont need
> > such large hacks for LVM support? I can do the work but I want to be
> > sure you guys will agree to it.
> 
> What is the reason for all this?  Alignment/wordsize/other?  If you look
> at the IOP10 code, much of the in-core data structs were changed to int
> or long, so this sparc code may not be necessary.

The longs are the biggest problem AFAICS.
long is 64bit on sparc64 and 32bit on sparc32...

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
