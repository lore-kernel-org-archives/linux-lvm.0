Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Apr 2001 13:48:16 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM version of 2.4.2 kernel?
Message-ID: <20010424134816.A31988@sistina.com>
References: <Pine.LNX.4.33.0104231933220.17635-100000@duckman.distro.conectiva> <Pine.LNX.4.33.0104231810270.13970-100000@chasqui.LaRed.net.pe>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0104231810270.13970-100000@chasqui.LaRed.net.pe>; from carenas@chasqui.lared.net.pe on Mon, Apr 23, 2001 at 06:22:56PM -0500
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

On Mon, Apr 23, 2001 at 06:22:56PM -0500, Carlo Marcelo Arenas Belon wrote:
> > On Mon, 23 Apr 2001, Joe Thornber wrote:
> > > On Mon, Apr 23, 2001 at 04:13:32PM +0200, David Vidal Rodriguez wrote:
> > > > Hi!
> > > > I want to know what version of LVM (beta_x etc.) is included within
> > > > Kernel 2.4.2 and if I can use the fresh compiled beta7 tools with it.
> > >
> > > Beta2 is in the 2.4.2 kernel.  You are advised to upgrade both the
> > > kernel and the userland tools to beta7.
> >
> > Ummm ?
> 
> :(, not again please, i am a noname lvm user and i really found this kind
> of misunderstanding really frustating.
> 
> but there is a time when "clearing the air" is needed and i am pretty sure
> that you all (developers) love much to code than to argue.
> 
> please, take my words as they come, from a linux user and developer
> wannabe that loves the way opensource is getting into the world.

Thanks for your comment here.
We hope to be on the right track to "clear the air" now.

> 
> > Weren't you people saying that the Linus tree would be the
> > main LVM repository from now on?
> 
> sure we all hope it is, but if you take a look to the currently released
> linus kernel (2.4.3 and for sure the olders), it is obvious than a broken
> lvm was in place there.

Please recall again that it was not us pushing that to Linus back then!

Even though it was good will by the guy who did it back then, and we seem to
get blamed for everything these days (maybe even for TANSTAAFL ;-) it wasn't
us.
We wanted to fix several things before integrating it.

Anyway: as Joe Thornber stated in the other email; work is in progress
        to change that anoying situation and to update the vanilla kernel.

> 
> and for sure taking the beta7 userland tools with that module is going to
> piss anyone.

Yep and sorry: that's why we recommend to get LVM 0.9.1 Beta 7 from
www.sistina.com, patch the kernel and build the tools/library.

> 
> > Would it be possible to get at least the important bugfixes
> > merged in Linus' kernel ?
> 
> i'll bet they (sistina) are working on that as they explained before, BTW
> i just found it on 2.4.4-pre6

Yes, we are.
Alan Cox and others already kindfully offered their help to check the patches
and likely will ease the path to Linus and the vanilla kernel integration
as well.

> 
> + *    05/04/2001 - lvm_map bugs: don't use b_blocknr/b_dev in lvm_map, it
> + *                destroys stacking devices. call b_end_io on failed maps.
> + *                (Jens Axboe)
> 
> and i am pretty sure that there are more to come (Alan, Heinz, your turn
> with the ball)

This one and others will be covered.
Let us continue the open source game, folks ;-)

> 
> best regards,
> 
> Carlo
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
