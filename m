Return-Path: <thornber@btconnect.com>
Date: Sun, 12 Aug 2001 20:07:02 +0100
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010812200701.A657@btconnect.com>
References: <20010811235718.A20414@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010811235718.A20414@linux.com>; from tack@linux.com on Sat, Aug 11, 2001 at 11:57:18PM -0400
From: Joe Thornber <thornber@btconnect.com>
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

On Sat, Aug 11, 2001 at 11:57:18PM -0400, Jason Tackaberry wrote:
> I have some ideas for a comprehensive GUI disk administration tool, and
> I am first thinking about some of the issues I'll face regarding
> interfacing with controllers, disks, partitions, md, and LVM.
> 
> I am curious if it's a silly idea to write an application that relies on
> the data in /proc?  Do the kernel developers attempt to keep the data
> and format provided in /proc as stable as possible?  Or is it fair game
> for trivial changes that could break applications that parse it?  Should
> I use ioctl instead?

We won't change the format of the /proc data for the 1.0 series of LVM
(including 0.9.1 betas).  I do *not* suggest you use the ioctls directly, at
some point the ioctl interface will change.

> I don't mind having to release a new update to be compatible with a new
> format in /proc every once and a while, but if it's constantly a moving
> target I may want to look at alternatives.

You should also be able to get all the information you need from the tools.

> 
> I also have the same question with LVM related tools.  Is it sane to try
> to wrap a GUI around lvm tools or is there some API approach that would
> be better?

I would much rather see people wrapping the tools than using liblvm, in fact
liblvm will probably disappear in the future.

It would be really good to see a comprehensive LVM gui tool.  You
should certainly dig up Jorg de Jong's Java based gui to get ideas
(http://www.xs4all.nl/~mmj/lvm/), from the screen shots it looks nice.
Are you planning to implement in C and gtk ? or use some higher level
language ?

- Joe
