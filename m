Return-Path: <gerry@dorfam.ca>
Date: Wed, 15 Aug 2001 17:47:18 -0400 (EDT)
From: <gerry@dorfam.ca>
Subject: Re: [linux-lvm] Help with redhat install
In-Reply-To: <3B7AC356.A2FD65A3@xapnet.com>
Message-ID: <Pine.LNX.4.33.0108151744300.28178-100000@leopard.dorfam.ca>
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

Although 2.4.2-2 has lvm support built in I don't believe it is enabled in
the default kernel.  I think you have to recompile the kernel and enable
it.

I forget what version is in the kernel.  With lvm 1.0 just released you
may wish to patch the kernel source to the latest level so it will work
with lvm 1.0 and then recompile.

Gerry

On Wed, 15 Aug 2001, Chris Bourne wrote:

> Hello!!
>          I am trying to get lvm working on redhat 7.1 with kernel
> 2.4.2-2. I down loaded the source rpm's 1)
> lvm-iop-0.9.1_beta6-1.src.rpm   2)
> lvm-iop-patchgen-0.9.1_beta6-1.src.rpm  and the base rpm 3)
> lvm-base-1.1-1.i386.rpm. I did a rpm --rebuild and ran the rpm command
> and all seemed to install well with no problems. The problem I did
> discover is that there is no lvm dir. in /proc and the lvm-mod is
> nowhere to be found. I was under the impression that kernel 2.4 has lvm
> already built in. I did a insmod lvm-mod and modprobe lvm-mod and nada.
> I cannot figure out what I am doing wrong or if I should not be using
> this version of lvm and use lvm 1.0 instaed (will it work on redhat?).
> Thanks, Chris.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>

Gerry
-- 
"The lyfe so short, the craft so long to learne"  Geoffrey Chaucer
