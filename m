Subject: Re: [linux-lvm] LVM 2 patch
Message-Id: <20020411124335.GC14214@fib011235813.fsnet.co.uk>
References: <E04CF3F88ACBD5119EFE00508BBB212102418D31@exch-01.noida.hcltech.com>
    <20020411102751.GA12534@fib011235813.fsnet.co.uk>
    <3CB57209.7080304@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CB57209.7080304@st-peter.stw.uni-erlangen.de>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Apr 11 07:43:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Apr 11, 2002 at 01:22:49PM +0200, svetljo wrote:
> >
> >
> >On Thu, Apr 11, 2002 at 03:24:09PM +0530, Chitaranjan Behera, Noida wrote:
> >
> >>Hi, 
> >>
> >>I downloaded the LVM2 beta version from Sistina site. But it's unable to
> >>create path for kernel-2.4.7-10. Patches are available for 2.4.16/17. But 
> >>I
> >>want to build it over kernel-2.4.7-10. Can anybody help me ??
> >>
> >
> >We're only supporting recent kernels.  However you should be able to
> >to get the 2.4.17 patch working with it with minimal problems
> >(probably just some conflicts in the Makefiles).
> >
> >- Joe
> >
> just a tiny little question
> 
> what about the 2.5 tree

I did make a 2.5 patch some time after the last beta release (this may
be in CVS), but it wouldn't surprise me if 2.5 has moved on so much since
then that it no longer works.

- Joe
