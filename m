Message-ID: <3BD8A30D.EB2E4E37@adelaide.edu.au>
From: Sean Burford <sean.burford@adelaide.edu.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Segment Failure ,while doing lvcreate
References: <20011025114525.88548.qmail@web16301.mail.tpe.yahoo.com> <3BD80807.4725174F@carolina.rr.com> <20011025074500.A4615@omnifarious.org>
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
Date: Thu Oct 25 18:36:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Eric M. Hopper" wrote:
> On Thu, Oct 25, 2001 at 08:39:35AM -0400, Jason Edgecombe wrote:
> >   recompile lvm tools with the -O0 flag (no optimization).
> > this is because of redhat's 7.x borken gcc compiler
...
>         Does gcc 3.0.1 have this same problem?  Are you sure the bug
> isn't in the code?  (i.e. having a non-volatile variable randomly
> modified under your nose, or some such that would tend to not work so
> well under optimization.)

I've traced it in gdb, and I saw a function (called via an inline) being
given valid arguments but receiving junk arguments.  It looks like the
stack pointer got messed up (I didn't check, I was viewing source not
asm at the time).  Calling the function directly, rather than through
the inline (which only added an argument to the argument list) worked
fine.

Having your arguments corrupted during a function call sure looks like a
compiler bug to me.

-- 
Sean Burford    x34135
ITS Systems Specialist
Adelaide University
