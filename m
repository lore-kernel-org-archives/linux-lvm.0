From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [ANNOUNCE] LVM reimplementation ready for
    beta testing
Message-Id: <20020131132548.F9764@sistina.com>
References: <20020130202254.A7364@fib011235813.fsnet.co.uk>
    <E16W6PW-0000K0-00@starship.berlin>
MIME-Version: 1.0
In-Reply-To: <E16W6PW-0000K0-00@starship.berlin>; from
    phillips@bonn-fries.net on Thu, Jan 31, 2002 at 02:53:10AM +0100
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
Date: Thu Jan 31 06:30:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 02:53:10AM +0100, Daniel Phillips wrote:
> On January 30, 2002 09:22 pm, Joe Thornber wrote:
> > The new kernel driver (known as "device-mapper") supports volume
> > management in general and is no longer Linux LVM specific.
> > As such it is a separate package from LVM2 which you will need
> > to download and install before building LVM2.
> > 
> >  ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-beta1.tgz
> 
> Hi, thanks a lot for this fine gift.  One small point: I downloaded these
> files right away of course, then I renamed device-mapper-beta1.tgz as
> LVM2-mapper-beta1.tgz, so I'd be able to find these things in my (very
> full) download directory.  What do you think about doing it that way at
> source?

Well, as said in the annoucement the device-mapper is no longer Linux LVM
specific and therefore we choosed to give it a name without any 'LVM' substring
in its name. device-mapper is just a package LVM2 needs to run beside others
like linux-kernel ;-)

> 
> > The userland tools are available from here:
> > 
> >  ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-beta1.tgz
> 
> -- 
> Daniel
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
