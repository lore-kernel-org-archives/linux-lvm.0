Return-Path: <silva@athenea.ort.edu.uy>
From: Ernesto Silva <silva@athenea.ort.edu.uy>
Subject: Re: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Date: Tue, 24 Apr 2001 13:09:19 -0300
References: <01042412353404.07748@pc-silva> <20010424104505.F9882@sistina.com>
In-Reply-To: <20010424104505.F9882@sistina.com>
MIME-Version: 1.0
Message-Id: <01042413111705.07748@pc-silva>
Content-Transfer-Encoding: 8bit
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

I'm using gcc 2.96 from RedHat 7.0 and I downloaded the tarball.
I also applied the patch from the tarball to the kernel.

On Tue, 24 Apr 2001, you wrote:
> 
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
> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-379-3951
> 1313 5th St SE, Suite 111              Fax:    612-379-3952
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> THE LESSER-KNOWN PROGRAMMING LANGUAGES #16:
> C- This language was named for the grade received by its creator when he
> submitted it as a class project in a graduate programming class.  C- is
> best described as a "low-level" programming language.  In fact, the
> language generally requires more C- statements than machine-code statements
> to execute a given task.  In this respect, it is very similar to COBOL.
> -----End Obligatory Humorous Quote------------------------------------------
> 

----------------------------------------
Content-Type: application/pgp-signature; name="unnamed"
Content-Transfer-Encoding: 7bit
Content-Description: 
----------------------------------------
