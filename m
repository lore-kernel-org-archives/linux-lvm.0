Return-Path: <sct@redhat.com>
Date: Thu, 30 Nov 2000 10:41:58 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] lvm 0.9 kernel build problems
Message-ID: <20001130104158.A3633@redhat.com>
References: <OLEAJMNOEMOMMNEIMMINMENJCBAA.pswartz@digitalrom.com> <20001129211909.C26635@srv.t-online.de> <005c01c05a4d$ee072080$a56cfea9@miguel> <20001130024449.J1381@wookimus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001130024449.J1381@wookimus.net>; from chewie@wookimus.net on Thu, Nov 30, 2000 at 02:44:49AM -0600
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chewie <chewie@redhat.com>, linux-lvm@sistina.com
Cc: Stephen Tweedie <sct@redhat.com>

Hi,

On Thu, Nov 30, 2000 at 02:44:49AM -0600, Chewie wrote:
> On Wed, Nov 29, 2000 at 10:47:09PM +0100, Falcon wrote:
> > You must to change gcc by kgcc in the Makefile
> 
> <rant>
> Is it just me, or does this sound like a Red Hat-like solution?  Gee.
> Let's package an old version of gcc just so we can compile the kernel
> correctly.  We can't simply use a stable gcc as our standard compiler.

Good grief.  Is it just me, or has this thread been beaten to death
already on linux-kernel?

Connectiva, Red Hat, Debian and (I think) Mandrake are all shipping an
older compiler for the kernel now, simply because too many things in
the kernel are fragile and break if the compiler reorders instructions
in an unexpected way.

The fault here is actually the kernel's: if the kernel doesn't specify
its ordering constraints explicitly enough, then change the kernel and
you can break silent assumptions that the kernel was making, causing
obscure and hard-to-diagnose errors on SMP machines or when code is
interrupted.

This is nothing new --- since forever, there have been specific
compilers known to work with specific kernel versions, and using a
different compiler (older OR newer) has been likely to break things.  

--Stephen
