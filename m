Return-Path: <root@srv.sistina.com>
Date: Thu, 21 Jun 2001 11:05:40 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM problems
Message-ID: <20010621110540.C28374@sistina.com>
References: <20010620155023.B25048@sistina.com> <Pine.LNX.4.33.0106210143280.996-100000@fogarty.jakma.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0106210143280.996-100000@fogarty.jakma.org>; from paul@clubi.ie on Thu, Jun 21, 2001 at 01:58:32AM +0100
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

On Thu, Jun 21, 2001 at 01:58:32AM +0100, Paul Jakma wrote:
> On Wed, 20 Jun 2001, Heinz J. Mauelshagen wrote:
> 
> > Ed,
> 
> > Linus *never* answered when we send hom patches even though I've
> > send them multiple times.
> 
> and linus has said many many times on l-k: he gets loads and loads of
> mail, he reads it with his finger on the D key, if you hear nothing
> from him, keep sending.

Yes, we kept sending (sigh).
Thanks to Alan, we'll hopefully make it soon into vanilla.

> 
> also, you can almost take it as given that he won't look at anything
> but emails that contain an inline diff (unified format) that tackles
> one specific problem/update. URL or mime attachment -> deleted.

We never have send attachements.

> 
> > We are working together with Alan Cox since weeks to get his -ac
> > tree updated.
> >
> > Once he has it in he will push it to Linus.  Hopefully small
> > changes in the future will make it in easier (sigh).
> 
> hopefully so and look forward to it.

We too.

> 
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> 
> again, just like Ed, i have to say that i'm not bitching.. i think
> LVM is just about the best thing since sliced bread - truly my
> favourite linux kernel feature.

Thanks :-)

> so all i want to point out is that
> LVM'd be just that -> <- much better if you guys kept LVM closely
> in-sync with Linus. and best of all, for everyone ultimately, if
> you'd ditch your private CVS tree altogether and just sync through
> Linus very regularly..

That's exactly what we want to conform to.
It just takes a hole lot of time (several weeks now) to feed it into -ac.

And believe me, Alan is *very* helpful here but he can't work on just LVM
integration for sure.

Once we've got -ac updated, we'll try setting up a cron job to feed in the
small patches we are going to send to Alan/Linus ;-))

> 
> (we don't care if sometimes you introduce bugs by sending patches
> very frequently to Linus, cause we'll know that you just as regularly
> send fixes.  but don't accumulate bug-fixes over many months in a cvs
> tree and sit on them.)

Accepted.

> 
> but i do love LVM.

We too ;-)

> 
> regards,
> -- 
> Paul Jakma	paul@clubi.ie	paul@jakma.org
> PGP5 key: http://www.clubi.ie/jakma/publickey.txt
> -------------------------------------------
> Fortune:
> That government is best which governs least.
> 		-- Henry David Thoreau, "Civil Disobedience"
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
