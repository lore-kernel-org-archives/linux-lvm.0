Return-Path: <bluca@comedia.it>
Date: Fri, 13 Jul 2001 20:01:13 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010713200112.A11175@colombina.comedia.it>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010713131200.C32198@sistina.com>; from Mauelshagen@sistina.com on Fri, Jul 13, 2001 at 01:12:00PM +0200
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

On Fri, Jul 13, 2001 at 01:12:00PM +0200, Heinz J. Mauelshagen wrote:
> > Another question is the boot stuff, what is better? compile LVM as a module
> > and use inird or compile the kernel with built-in LVM support?
> 
> It doesn't make a difference if you go for the module or the build in driver,
> you need to have an initrd today anyway to activate your VGs at boot time.
> 
> We are working on boot time recognition of VGs in the driver which will vanish
> the initrd. That will be in a post 1.0 version of the Linux LVM.

is this still worthwile since i read Linus in thinking of a new way
to handle initrd (appending a tar file to a kernel image and populating
a ramfs with it) and moving many _init code that now bloats kernel
to userspace.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
