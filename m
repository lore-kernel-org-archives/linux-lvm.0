Return-Path: <thornber@btconnect.com>
Date: Wed, 25 Apr 2001 15:44:13 +0100
Subject: Re: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Message-ID: <20010425154413.A1805@66bassett.freeserve.co.uk>
References: <01042412353404.07748@pc-silva> <20010424104505.F9882@sistina.com> <01042413111705.07748@pc-silva> <20010425153007.G1711@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010425153007.G1711@tykepenguin.com>; from caulfield@sistina.com on Wed, Apr 25, 2001 at 03:30:07PM +0100
From: Joe Thornber <thornber@btconnect.com>
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

On Wed, Apr 25, 2001 at 03:30:07PM +0100, Patrick Caulfield wrote:
> On Tue, Apr 24, 2001 at 01:09:19PM -0300, Ernesto Silva wrote:
> > 
> > I'm using gcc 2.96 from RedHat 7.0 and I downloaded the tarball.
> > I also applied the patch from the tarball to the kernel.
> > 
> 
> This patch works for me using gcc 3.0:
> 
> 
> Index: lvm_log.h
> ===================================================================
> RCS file: /home/cvs/LVM/tools/lib/lvm_log.h,v
> retrieving revision 1.2
> retrieving revision 1.3
> diff -u -r1.2 -r1.3
> --- lvm_log.h   2001/04/24 14:29:21     1.2
> +++ lvm_log.h   2001/04/25 08:20:57     1.3
> @@ -44,9 +44,9 @@
>  void print_log(int level, const char *format, ...);
>  
>  #define plog(l, f, n, x, a...) print_log(l, "%s:%d " x "\n", f, n, ## a)
> -#define lvm_info(x...) plog(LOG_INFO, __FILE__, __LINE__, "info: " ## x)
> -#define lvm_warn(x...) plog(LOG_WARN, __FILE__, __LINE__, "warning: " ## x)
> -#define lvm_err(x...) plog(LOG_ERROR, __FILE__, __LINE__, "error: " ## x)
> +#define lvm_info(x...) plog(LOG_INFO, __FILE__, __LINE__, "info: " x)
> +#define lvm_warn(x...) plog(LOG_WARN, __FILE__, __LINE__, "warning: " x)
> +#define lvm_err(x...) plog(LOG_ERROR, __FILE__, __LINE__, "error: " x)
>  
>  #define lvm_fatal(x...) do {\
>    plog(LOG_FATAL, __FILE__, __LINE__, "(FATAL) " ## x); \
> 

If this is the right fix (time for me to download gcc 3.0) why haven't you
changed lvm_fatal and plog ?  Does this still do the right thing under older
versions of gcc ?

- Joe
