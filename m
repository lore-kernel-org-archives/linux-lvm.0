Message-ID: <37C674DB.2EB5B424@tls.msk.ru>
Date: Fri, 27 Aug 1999 15:22:03 +0400
From: "Michael Ju. Tokarev" <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
References: <Pine.LNX.3.96.990826175120.22041A-100000@zeke.sympatico.ca>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Shane Shrybman wrote:
> PROS
[a lot of pros's skipped]
> 
> CONS
[]
What about adding new complecity to kernel code? Is this a cons?
Kernel already (maybe gone?) have some instabilities with fs,
saying some "Ooops" that are very hard to debug. Sorry if all
this Ooops are iliminated already, but info about them can be
found in many mailinglist archives (1997, 1998 yy at least).

And another two questions (maybe "politic"):

 - yes, Linux lacks now a great ability that exisit in other Unices.
   yes, Linux should have this ability.
   But why this should be linux-lvm? I do not know if other projects exists,
   and think that no, but is linux-lvm have exactly that things that really
   should have Linux? I like linux-lvm, but I like also Veritas, and like
   BSD's implementation... And all of them have different approaches!
   Sorry for this. One old good Russian proverb says that each orn compliments
   it's own morass.

 - look to solaris, for example -- it have lvm in a separate package (DiskSuite),
   that don't included kernel :!). This is an addon to os, and it doesn't do
   anything with kernel itself. Yes, I know about differences in kernel's architectures,
   and know little about Linux kernel internals, but linux have kernel modules!
   Is it possible to make lvm a separate package, like on Solaris? And not only
   lvm, but other things like drivers (!), fs's etc? Kernel should have base set
   of modules, and some sort of config files where others are listed, and as result
   there should be no need to recompile kernel at all! Yes, this is not an lvm
   question, but lvm-related. There are many kernel patches for different packages
   not included into stock kernel (like lvm ;), and each need this recompilation.
   Yes, some of them really _need_ recompilation, such as acl project, but some
   at least logically doesn't. So maybe ask Linus to work around pluggable modules
   instead of including lvm into kernel? This also seriously simplifies other parts
   of kernel. But I doesn't know if it is possible at all with current architecture.
   Microkernel? Hurd? ;)

> 
> Please feel free to edit and add your own points!
> 
> Shane

Regards,
  Michael.
