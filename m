From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM 1.0.4 pvmove is broken
Message-ID: <20020525125043.B19221@sistina.com>
References: <F888C30C3021D411B9DA00B0D0209BE8038F94FF@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F94FF@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Fri, May 24, 2002 at 09:03:44AM -0700
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
Date: Sat May 25 05:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 24, 2002 at 09:03:44AM -0700, Poul Petersen wrote:
> > Poul,
> > 
> > please try the  patch below which should fix the locking problem I
> > introduced in 1.0.4.
> > 
> > This is against a clean 2.4.18 kernel patched with LVM 1.0.4.
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> 
> 	That fixes it! Thanks!

Alright. Is in CVS (LVM_BRANCH_1-0) and will show up in 1.0.5 soon.

> 
> 
> -poul
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
