From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan errors with 1.0.3
Message-Id: <20020306115312.A22335@sistina.com>
References: <20020306062354.D9090@progsoc.uts.edu.au>
    <20020306105859.C21935@sistina.com>
    <20020306212858.J9090@progsoc.uts.edu.au>
    <20020306113737.H21935@sistina.com>
    <20020306214932.K9090@progsoc.uts.edu.au>
MIME-Version: 1.0
In-Reply-To: <20020306214932.K9090@progsoc.uts.edu.au>; from
    wildfire@progsoc.uts.edu.au on Wed, Mar 06, 2002 at 09:49:32PM +1100
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
Date: Wed Mar  6 04:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 06, 2002 at 09:49:32PM +1100, Anand Kumria wrote:
> On Wed, Mar 06, 2002 at 11:37:37AM +0100, Heinz J . Mauelshagen wrote:
> > 
> > Could you add the bzipped tarball "vgda.tar.bz2" created with
> > 
> > for d in md0 hdg hde
> > do
> >    dd if=/dev/$d of=$d.vgda bs=1k count=4k
> > done
> > tar Icf vgda.tar.bz2 *.vgda
> > 
> > to that?
> 
> I've created this tarball and put it up as well.

Working on it now...

> 
> <URL: http://www.progsoc.org/~wildfire/lvm/>
> 
> Thanks,
> Anand
> 
> -- 
>  `` We are shaped by our thoughts, we become what we think.
>  When the mind is pure, joy follows like a shadow that never
>  leaves. '' -- Buddha, The Dhammapada
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
