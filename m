Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Apr 2001 13:50:37 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What have snapshots got to do with LVM ?
Message-ID: <20010424135037.B31988@sistina.com>
References: <20010422130924.A10390@66bassett.freeserve.co.uk> <20010423102145.C27367@sistina.com> <20010423093818.B739@66bassett.freeserve.co.uk> <20010423120521.A27695@sistina.com> <20010423112638.B1060@66bassett.freeserve.co.uk> <20010423152748.A28301@sistina.com> <20010423150556.C1492@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010423150556.C1492@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Mon, Apr 23, 2001 at 03:05:56PM +0100
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

On Mon, Apr 23, 2001 at 03:05:56PM +0100, Joe Thornber wrote:
> On Mon, Apr 23, 2001 at 03:27:48PM +0000, Heinz J. Mauelshagen wrote:
> > You said it already above: the general concept still needs to deal with chunks 
> > which could eventually map to LVM PEs in case we run LV snapshots carying
> > metadata (COW table sections) and data.
> > The abstraction therefore will be one in notion basically
> > (chunk rather than PE).
> 
> I'm certain this is the way to go for 1.2, having thought about it for
> a day.  Snapshot's would still be part of the LVM suit, but just
> implemented in a seperate driver.
> 
> The only problem is the per device hook.  Has anyone else implemented
> something similar ?

Didn't see something in public so far :(

> or shall I just have a bash and upset the gurus.

Yes!
The typical "we need to suffer in order to make things better" thing.

> 
> - Joe Thornber
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
