Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101130143.f0D1hNF19829@webber.adilger.net>
In-Reply-To: <20010113114507.D15915@linuxcare.com> "from Anton Blanchard at Jan
 13, 2001 11:45:07 am"
Date: Fri, 12 Jan 2001 18:43:23 -0700 (MST)
MIME-Version: 1.0
Subject: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at www.sistina.com
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
To: Anton Blanchard <anton@linuxcare.com.au>
Cc: Mauelshagen@sistina.com, linux-kernel@vger.kernel.org, linux-lvm@sistina.comlvm@sistina.com

Anton, you write:
> Have a look at 2.4, arch/sparc64/kernel/ioctl32.c

Yuk.

> Would it be possible to clean up the ioctl interface so we dont need
> such large hacks for LVM support? I can do the work but I want to be
> sure you guys will agree to it.

What is the reason for all this?  Alignment/wordsize/other?  If you look
at the IOP10 code, much of the in-core data structs were changed to int
or long, so this sparc code may not be necessary.  It may in fact be
damaging, because I don't know if any of the LVM developers even know it
is there, and surely it will be out of sync...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
