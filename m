From: Heinz J . Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] vg_read_with_pv_and_lv error
Message-ID: <20020826123350.D18054@sistina.com>
References: <20020822174612.GA8692@grimlock> <XFMail.20020822195818.cfreeze@alumni.clemson.edu> <20020823103252.A8639@sistina.com> <20020823170025.GB24937@grimlock>
Mime-Version: 1.0
In-Reply-To: <20020823170025.GB24937@grimlock>; from adamm@array.org on Fri, Aug 23, 2002 at 11:00:25AM -0600
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
Date: Mon Aug 26 05:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Aug 23, 2002 at 11:00:25AM -0600, Adam McDaniel wrote:
> On Fri, Aug 23, 2002 at 10:32:52AM +0200, Heinz J . Mauelshagen wrote:
> > Have you tried uuid_fixer from ftp://ftp.sistina.com/pub/LVM/contrib/ in
> > case it was a missing PV-UUID in the PV-UUID list yet ?
> 
> Yes, and I think it has the right idea. The only problem is that it
> has too many consistency checks, which I know for a fact that my
> scenario will fail upon.
> 
> Since I've already practically lost my data, there is probably no
> extra risk in disabling those checks and forcing it to do the
> modificiation. Working off a dd'd image of the hd via a loopback
> device minimizes any further data loss anyways.

Yep. Please give it a try.

> 
> > People make backups! ;-)
> 
> Yeah.. uhm. That *WAS* the backup :)
> 
> Atleast I won't be making this mistake again.. 
> 
> -- 
> Adam McDaniel
> Array Networks
> Calgary, AB, Canada

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
