Return-Path: <tack@orion.dok.org>
Date: Sat, 11 Aug 2001 23:57:18 -0400
From: Jason Tackaberry <tack@linux.com>
Message-ID: <20010811235718.A20414@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Writing forward compatible applications using /proc
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

I have some ideas for a comprehensive GUI disk administration tool, and
I am first thinking about some of the issues I'll face regarding
interfacing with controllers, disks, partitions, md, and LVM.

I am curious if it's a silly idea to write an application that relies on
the data in /proc?  Do the kernel developers attempt to keep the data
and format provided in /proc as stable as possible?  Or is it fair game
for trivial changes that could break applications that parse it?  Should
I use ioctl instead?

I don't mind having to release a new update to be compatible with a new
format in /proc every once and a while, but if it's constantly a moving
target I may want to look at alternatives.

I also have the same question with LVM related tools.  Is it sane to try
to wrap a GUI around lvm tools or is there some API approach that would
be better?

Cheers,
Jason.
