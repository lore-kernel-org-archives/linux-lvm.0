From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
Message-ID: <20020919120453.C32578@sistina.com>
References: <00cd01c25f0c$2990ffd0$1c01a8c0@internal.tripnet.int> <00f001c25f1b$3a24ef50$1c01a8c0@internal.tripnet.int> <20020918155938.A28041@sistina.com> <011401c25f21$b15f7da0$1c01a8c0@internal.tripnet.int>
Mime-Version: 1.0
In-Reply-To: <011401c25f21$b15f7da0$1c01a8c0@internal.tripnet.int>; from red@tripany.com on Wed, Sep 18, 2002 at 04:42:54PM +0200
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
Date: Thu Sep 19 05:05:23 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 18, 2002 at 04:42:54PM +0200, Robin Edgar - Tripany wrote:
> Doing the lvdisplay -v shows that pv /dev/hde1 had bits of all of the lv's
> on it (including the docu lv, which I *can* mount).

Then it is most likely, that all filesystems will have errors.

Regards,
Heinz    -- The LVM Guy --


> 
> ----- Original Message -----
> From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> To: <linux-lvm@sistina.com>
> Sent: Wednesday, September 18, 2002 3:59 PM
> Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
> 
> 
> > On Wed, Sep 18, 2002 at 03:56:36PM +0200, Robin Edgar - Tripany wrote:
> > > I've discovered that there is a problem with /all/ the superblocks
> except for those of the /docu lv (see below). It does lead me to another
> question though - only one of the HDs crashed: is it possible that LVM wrote
> all the superblocks on 1 HD?! If so this seems like a pretty serious bug in
<SNIP>
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
