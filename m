Return-Path: <root@srv.sistina.com>
Date: Wed, 2 May 2001 12:45:04 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
Message-ID: <20010502124504.G30791@sistina.com>
References: <20010427104702.A16169@sistina.com> <200104301816.MAA19335@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200104301816.MAA19335@lynx.turbolabs.com>; from adilger@turbolinux.com on Mon, Apr 30, 2001 at 12:16:56PM -0600
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

On Mon, Apr 30, 2001 at 12:16:56PM -0600, Andreas Dilger wrote:
> Heinz writes:
> > I am about to implement a vgscan option in order to support the recreation
> > of the "invalid PV UUID list problem" in case a VG can't be found by vgscan
> > any more.
> > 
> > What's your opinion (Andreas?) about it?
> > 
> > Do we have too many people which can't do the lvcreate/lvremove trick
> > so that this work makes sense?
> 
> It is surely a fix for some of the problems.

Which other problems do you see and are you able to define?

> Of course, the need for the
> fix will be reduced as time goes on,

That's why I asked in the first place.

Maybe the /etc/lvmconf/ to /etc/lvmtab.d/ copy and echo to /etc/lvmtab
trick plus "vgchange -ay" and dummy change on VGs does it anyway?

> so maybe a comment/#ifdef on the code
> so that it will be removed at a later date.
> 
> Cheers, Andreas
> -- 
> Andreas Dilger                               Turbolinux filesystem development
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
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
