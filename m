Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 25 Apr 2001 09:01:39 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Message-ID: <20010425090139.C1711@tykepenguin.com>
References: <01042412353404.07748@pc-silva> <20010424104505.F9882@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010424104505.F9882@sistina.com>; from lewis@sistina.com on Tue, Apr 24, 2001 at 10:45:06AM -0500
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

On Tue, Apr 24, 2001 at 10:45:06AM -0500, AJ Lewis wrote:
> On Tue, Apr 24, 2001 at 12:19:45PM -0300, Ernesto Silva wrote:
> > Hi,
> > 
> > 	In order to make things right I downloaded the 2.4.3 kernel and
> > compiled it (i386).
> > 
> > 	With the new kernel running (lvm-mod load ok) I'm trying to compile lvm
> > tools, but there are lots of warinigs, all the same thing, the first of them is:
> > -----------------------------------------------------------
> > gcc -c -pipe -g -O2 -Wall -DDEBUG -I ../../tools/lib -I ../../tools - debug.o
> > debug.c
> > In file included from ../../tools/lib/liblvm.h:97
> > 		from basename.c:34
> > ../../tools/lib/lvm_log.h:47:59: warning: nothing can be pasted after this token
>  <...snip...> 
> > Does anyone had a problem like this before???
> 
> Hmm...I don't get that at all!  Which version of GCC are you using?  Did you
> download the 0.9.1_beta7 tarball or grab something from the cvs?

I get similar warnings with gcc 3.0 from CVS. The indicated line has changed but
the actual error is the same I think:

lvm_config.c:113:7: warning: pasting ""error: "" and ""error in config file: not in section at line %d"" does not give a valid preprocessing token
lvm_config.c:117:7: warning: pasting ""error: "" and ""couldn't put %s:%s = %s into config"" does not give a valid preprocessing token
lvm_config.c:162:9: warning: pasting ""warning: "" and ""unknown variable %s:%s in config file"" does not give a valid preprocessing token
lvm_config.c:172:5: warning: pasting ""warning: "" and ""more than one value for %s:%s, using most recent"" does not give a valid preprocessing token
lvm_config.c:186:5: warning: pasting ""warning: "" and ""more than one value for %s:%s, using most recent"" does not give a valid preprocessing token
lvm_config.c:342:3: warning: pasting ""warning: "" and ""'%s' not a recognised boolean value, assuming false"" does not give a valid preprocessing token


patrick
