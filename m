From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Questions about PE size and clustering
Message-ID: <20020605154559.D21313@sistina.com>
References: <F888C30C3021D411B9DA00B0D0209BE8038F9518@cvo-exchange.cvo.roguewave.com>
Mime-Version: 1.0
In-Reply-To: <F888C30C3021D411B9DA00B0D0209BE8038F9518@cvo-exchange.cvo.roguewave.com>; from petersp@roguewave.com on Tue, Jun 04, 2002 at 09:44:49AM -0700
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
Date: Wed Jun  5 08:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 04, 2002 at 09:44:49AM -0700, Poul Petersen wrote:
> > From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> > Sent: Tuesday, June 04, 2002 6:12 AM
> > To: linux-lvm@sistina.com
> > Subject: Re: [linux-lvm] Questions about PE size and clustering
> > 
> <snip> 
> > 
> > Correct.
> > 
> > In summer, you can go with Cluster LVM + GFS in order to avoid these
> > constraints. That'll give you shared volume groups active on all nodes
> > and GFS filesystems mounted on all as well.
> > 
> 
> 	Ah, it's already in the works :) I've managed to poke around and dig
> up some sketchy information about Cluster LVM and now I have the following
> questions:
> 
> 	1) Any ideas on whether Cluster LVM be open/free, or will it follow
> GFS?

LVM2 is still under GPL/LGPL and will stay like this.
Cluster LVM OTOH sits on top of LVM2 and Sistina will need to charge for it.

> 	2) It looks like Cluster LVM is being based on the 1.x LVM model?
> Will this
> 		actually be considered a separate product, or simply a
> release of 1.x with the
> 		necessary global locking?

LVM2 is the GPL/LGPL base for Cluster LVM sitting on top of it.

> 
> Thanks,
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
