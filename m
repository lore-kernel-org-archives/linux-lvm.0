Return-Path: <root@srv.sistina.com>
Date: Tue, 17 Jul 2001 13:31:58 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Upgrade path
Message-ID: <20010717133158.F17345@sistina.com>
References: <3B4EE8F2.5050506@ednet.ns.ca> <20010716132959.C11625@sistina.com> <20010716140313.H8175@cistron.nl> <20010716162517.A12520@sistina.com> <20010716164253.P8175@cistron.nl> <20010716155838.A882@btconnect.com>
Mime-Version: 1.0
In-Reply-To: <20010716155838.A882@btconnect.com>; from thornber@btconnect.com on Mon, Jul 16, 2001 at 03:58:38PM +0100
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

On Mon, Jul 16, 2001 at 03:58:38PM +0100, Joe Thornber wrote:
> On Mon, Jul 16, 2001 at 04:42:53PM +0200, Wichert Akkerman wrote:
> > Previously Heinz J. Mauelshagen wrote:
> > > I announced the holdup caused by the misalignment bugs we found.
> > > We'll need to release another Beta ASAP to get test feedback on that.
> > 
> > I saw that, but there seems to have been a consensus on a fix
> > for that for over a week now already.
> 
> Fixing it isn't the problem, ensuring people with existing VG's can
> use the new driver/tools *is* the problem.

Yep.

> The pe positions weren't
> being stored in the metadata before beta8 :( So we have to upgrade
> peoples VG's.  I understand that Heinz has written the upgrade tool,
> but I'm not sure how much testing he wants before we release.

Every Sistina LVM team member needs to test, that up-/downgrades work propperly
before we release. The regular tests need to be run as well.

> 
> - Joe
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
