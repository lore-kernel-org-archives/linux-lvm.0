Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Migrating to an LVM system (boot/root) disk
Date: Mon, 4 Jun 2001 09:12:04 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEANIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B1A81A9.9D378419@tls.msk.ru>
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

uh?
I really don't understand this part -- the lvm tools on my system
work for more than one kernel, why not the tools on the init ramdrive?

How hard can it be?

Whats IOP anyhow?
(I'm no newbie -- I've been messing with Linux since '93
and I never came across "IOP" before. Someone want to
de-ignorance me? Please?)


> -----Original Message-----
> From: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]On Behalf Of Michael Tokarev
> Sent: Monday, June 04, 2001 6:28 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
>
>
> Steve Wray wrote:
> []
> > > Perhaps just like LVM has a nice little script for creating the
> > > initrd, they can ship with a nice little script for creating root/boot
> > > diskettes.
> >
> > Yes and I hope the mkinitrd (whatever its called...) is fixed so that
> > it copies sed to the ramdrive...
>
> Hey, sed should NOT be here.  Initrd exeists for exactly ONE version of
> kernel, so you know what IOP that kernel uses and what usertools should
> be placed to initrd BEFORE doing initrd, and sed can/should be used only
> at initrd creation stage.  Idea: why not put to initrd ALL modules for
> ALL kernels your system have, and update it each time you add a new
> kernel to your system? ;)
>
> Regards,
>  Michael.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
