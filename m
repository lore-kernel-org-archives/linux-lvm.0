Message-ID: <3861DE10.8448FCC1@twc.de>
Date: Thu, 23 Dec 1999 09:32:16 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting w/o initrd
References: <3860D151.21FD732B@twc.de> <19991222201127.C13180@colombina.comedia.it>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Luca Berra wrote:
> 
> there are some good ideas here, i will only point the problems.
> On Wed, Dec 22, 1999 at 02:25:37PM +0100, Ulf Bartelt wrote:
> <snip>
> 
> > And when bringing the system down, LVM can be stopped cleanly because the
> > root filesystem is only addressed via the partition alias.
> 
> add mirrored LV to the equation and you'll obtain a mess.

The idea works for now. When I get in touch with mirrored LVs, I sure
have to rethink a lot. 

> what's the problem with initrd, just look at it as a very big
> __initfunc(), just easier to debug.

I dont see the clean __exitfunc().

Maybe I don't "see the forest because of too many trees" (we'd say in
german...)...

Bye!
	Ulf.
