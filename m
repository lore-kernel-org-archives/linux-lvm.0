Return-Path: <root@srv.sistina.com>
Date: Wed, 28 Feb 2001 12:34:07 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Possible to raise Max LV?
Message-ID: <20010228123407.G4361@srv.sistina.com>
References: <20010227213517.G29642@vestdata.no> <200102272055.f1RKt5S27720@webber.adilger.net> <20010227150417.A22325@omnifarious.mn.org>
Mime-Version: 1.0
In-Reply-To: <20010227150417.A22325@omnifarious.mn.org>; from hopper@omnifarious.mn.org on Tue, Feb 27, 2001 at 03:04:17PM -0600
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

On Tue, Feb 27, 2001 at 03:04:17PM -0600, Eric M. Hopper wrote:
> On Tue, Feb 27, 2001 at 01:55:05PM -0700, Andreas Dilger wrote:
> > Ragnar Kj_rstad writes:
> > > What about increesing the [PE size] default, to say 32 MB?
> > > 32 MB should be enough for everyone (because of the 2TB limit), and 16
> > > MB waste on every PV isn't that bad.
> > 
> > So says the guy from a company called "Big Storage" ;-).  However,
> > I've seen several people who make multiple partitions on a single
> > disk, and then turn these into PVs (don't ask me why), so they would
> > be wasting 16MB per partition.  Most people will not need 2TB LVs for
> > some time to come.  However, if your systems usually have large LVs,
> > then it is OK for you to increase the default for your systems.
> 
> 	I actually intend to for mine sometime later because it reduces
> the fragmentation problem.  I know it shouldn't be that big a deal with
> 4M PEs, but with 32M PEs it'll be even less of a deal.  :-)
> 
> 	I actually thinking of generally scaling my PEs to around 0.1%
> of my total available space on the theory that allocation of finer
> grained chunks than that is kinda silly.
> 
> 	If I weren't working on some stuff of my own, I'd dive in and
> see if I could write a defrag utility for LVM.  The part I'm not sure
> how I'd handle would be striped LVs.
> 
> Have fun (if at all possible),
> -- 

As Andreas already pointed out: 4M basically is a good value to keep
the overhead small.

As I stated in another email: the ~64k extents per LV limit will likely
disappear in the future (no date though ;-).
For now you *need* to plan for the maximum LV size you want to create/extend to
during planning of the VG(s). 2T is the Linux limit per block device anyway
at least until Linux 2.5 changes that.

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
