Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3AB7B6EF.AFA0AD4C@in.tum.de>
Date: Tue, 20 Mar 2001 21:00:47 +0100
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan won't recognize my VG
References: <200103201925.f2KJPVm02621@webber.adilger.int>
Content-Transfer-Encoding: 7bit
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

Andreas Dilger wrote:

>
>
> Patch below.  Only needed if you have < beta6 kernel code.  It probably
> should be put into the standard tools, however, because a lot of people
> are still using beta2 kernel code.

err... is this a patch for generating the kernel patch? I _do_ have the beta6
sources, compiled the tools and generated the patch, but the kernel doesn't
compile. It says sth. about unresolved symbols. Indeed, if I compile lvm as a
module (lvm-mod.o), I can build the kernel and the modules, but there seems to be
"unresolved symbols". Hmmm... and I have had to deactivate lines 333-335 in
tools/lib/liblvm.h because there is a name conflict with this function and the
standard one...
I also have had to add the include dir of the kernel source tree to the
CFLAGS because of a couple of ENOENTs... I have to say that I don't and can't have
the source tree in the standard location (/usr/src) because I'm not root.... I am
sure that I'm doing something stupidly wrong. Am I right?


Thanks for your patience,
--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod@in.tum.de)
