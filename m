Return-Path: <todd@staff.nm.org>
Date: 2 May 2001 05:23:31 -0600
Date: Wed, 2 May 2001 05:23:31 -0600 (MDT)
From: Todd Underwood <todd@osogrande.com>
Subject: Re: [linux-lvm] odd problem
In-Reply-To: <200105012312.RAA27583@lynx.turbolabs.com>
Message-ID: <Pine.LNX.4.10.10105020519060.4139-100000@staff>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

andreas, folx,

thanks for the replies and suggestions.  comments below...

On Tue, 1 May 2001, Andreas Dilger wrote:

> Todd Underwood writes:
> > All was working well but recently i needed to reboot (i was unable to
> > increase the size of my / with the online ext2 tools and it was full
> > --not sure what the error was there, or whether that is relevant).
> 
> Probably not relevant, but it is of interest to me what sort of problems
> you had.  I assume you have patched the kernel with the online ext2
> kernel patches and also enabled CONFIG_EXT2_RESIZE?  You should not have
> any problems resizing root.

i am using the kernel patch and have CONFIG_EXT2_RESIZE.  i have had
problems with resizing when i resize several filesystems repeatedly by
small amounts (that is always my preference, rather than giving one big
boost that may waste space).  at the time i had difficulties the root was
full (except for space reserved for root), but i don't know if that is
relevant.  unfortunately, i've got no specifics to report, but i'll try to
reproduce it today.  

> > lvm -- lvm_chr_ioctl:  unknown command 4004fe0a
> 
> Expected behaviour with new tools (compatibility reasons).  However, it
> _does_ indicate that you do not have beta7 LVM kernel code.
> 

interesting.  i will recompile, recompile, re-lilo and try again.  this
really *was* working with that kernel before. sigh.  this is helpful to
know, though.

> Do you run "vgchange -a y" (and optionally vgscan) in startup scripts?
> There is a "LVM root howto" somewhere on the Sistina site.
> 

yes.  i put vgchange -a y and vgscan in /etc/rc.sysinit (it's a RH box)
and that seems to be working well for now without the LVM root, but given
the problems i've had with /etc, i will recheck the faq and try again.

again, thanks for the help.


todd
