Return-Path: <mauelshagen@sistina.com>
Date: Wed, 25 Jul 2001 21:33:00 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] GUI front-end for LVM
Message-ID: <20010725213300.A27765@sistina.com>
References: <85063BBE668FD411944400D0B744267A643507@AUSMAIL> <20010725144221.D30937@linux.com>
Mime-Version: 1.0
In-Reply-To: <20010725144221.D30937@linux.com>; from tack@linux.com on Wed, Jul 25, 2001 at 02:42:21PM -0400
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

On Wed, Jul 25, 2001 at 02:42:21PM -0400, Jason Tackaberry wrote:
> * Gonyou, Austin (austin@coremetrics.com) [010725 14:39]:
> > I agree....but this would have to be something like what I was talking
> > about earlier with what I thought that LVM should be able to do
> > eventually.  Dynamic reallocation/re-striping at any raid level. 
> 
> The impression I got from the LVM FAQ was that LVM will not support
> RAID1 basically because md does.

And not just RAID1.

Yes, the idea is to combine existing modular feature sets like LVM/MD.
With the enhancent stacking support in 2.4 the user has all the flexibility
to stack LVM on top of MD or vice versa.

> Maybe Heinz can shed some light on
> that situation and about the dynamic reallocation/restriping issue?

LVM just supports RAID0 to offer performance.

Constraint in the actual allocator is, that you can't extend a stripe beyond
a PV :-(
We want to remove that constraint in post 1.0 LVM.

If that's done, users can add additional PVs (which can be based on
SW/HW RAID1/5/whatever) and extend RAID0 LVs onto those.

Until then, one can stripe over multiple LVs using MD. Those LVs can be
resized equally in order to resize the striped MD. Care needs to be taken,
that the LVs are allocated/extended on distinct PVs.

> 
> Jason.
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
