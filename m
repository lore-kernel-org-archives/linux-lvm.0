Return-Path: <root@srv.sistina.com>
Date: Fri, 27 Apr 2001 10:47:02 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
Message-ID: <20010427104702.A16169@sistina.com>
References: <3AE6D919.1B3F4A3@in.tum.de> <200104251626.f3PGQf2M031290@webber.adilger.int>
Mime-Version: 1.0
In-Reply-To: <200104251626.f3PGQf2M031290@webber.adilger.int>; from adilger@turbolinux.com on Wed, Apr 25, 2001 at 10:26:41AM -0600
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

On Wed, Apr 25, 2001 at 10:26:41AM -0600, Andreas Dilger wrote:
> David Vidal writes:
> > I'll send them tomorrow. You say that there are problems with VGs created
> > with <beta4. My kernel is has beta2-lvm, and because of compiling errors
> > in the newer beta6+-versions, I couldn't update the driver (tools are
> > actually working). Is there a way to [sozusagen] update the on-disc
> > structures in order to avoid conflicts with the new tools?
> 
> It doesn't matter what version the kernel code is, as long as the tools
> are newer than beta2 you are OK.  If the on-disk UUIDs are bad, then
> all you need to do is some sort of simple change (add a 1 PE LV and
> remove it), and the on-disk VGDA should be re-written with the correct
> UUIDs.
> 
> You can check the on-disk UUIDs with "pvdata -U" for each PV.  They
> should all match.

I am about to implement a vgscan option in order to support the recreation
of the "invalid PV UUID list problem" in case a VG can't be found by vgscan
any more.

What's your opinion (Andreas?) about it?

Do we have too many people which can't do the lvcreate/lvremove trick
so that this work makes sense?

> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
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
