Date: Thu, 11 May 2017 11:12:57 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20170511101257.GB28090@localhost.localdomain>
References: <23c510c6-8a15-7f7c-bcf5-1f72b5dca994@mglug.de>
	<6bf9d190-c009-344f-e4cc-a5a242090274@redhat.com>
	<4888d916-29b3-df5b-41ca-9a191dc39e22@mglug.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4888d916-29b3-df5b-41ca-9a191dc39e22@mglug.de>
Subject: Re: [linux-lvm] configure fail with option --enable-notivy-dbus
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marian Csontos <mcsontos@redhat.com>

On Thu, May 11, 2017 at 12:05:34PM +0200, Oliver Rath wrote:
> Hi Marian,
> 
> 
> On 11.05.2017 09:43, Marian Csontos wrote:
> > On 05/11/2017 09:01 AM, Oliver Rath wrote:
> [..]
> > ################################################################################
> > 
> > AC_CHECK_LIB(m, log10,
> >         [M_LIBS="-lm"], hard_bailout)
> > 
> > 
> > 
> > This is because of missing log10 function from m library (wherever that
> > comes from) and has nothing to do with dbus. So enabling or disabling it
> > should have absolutely no effect.
> 
> Ok, that helps. I figured out, that libm is part of libc6, libc6-dev is
> installed and has a include file called tgmath.h
> 
> $ grep -iR "define log10" /usr/include/
> /usr/include/tgmath.h:# define log10(Val) __TGMATH_UNARY_REAL_IMAG (Val,
> log10, __clog10)
> /usr/include/tgmath.h:# define log10(Val) __TGMATH_UNARY_REAL_ONLY (Val,
> log10)
> [..]

That's a macro for complex log operations. You want the floating point
version from bits/math-finite.h (included by math.h).
 
> So it seems all needed files are installed. But the message still remains.

Try compiling the log10 test autoconf uses yourself. It should be something
simple like:

    char log10();
    
    int main(int argc, char **argv)
    {
    	return log10();
    }

Then compile it with -lm and note any errors (you may get a warning about
redefining a built-in but this is just to test that the symbol can be
found).

Regards,
Bryn.
 
