Return-Path: <root@srv.sistina.com>
Date: Mon, 29 Jan 2001 16:35:48 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Help: lvm 0.9.1_beta3 oops (desperate plea)
Message-ID: <20010129163548.K8567@srv.sistina.com>
References: <3A748FE9.BFFD7B9C@nortelnetworks.com> <200101290653.f0T6r2h26300@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200101290653.f0T6r2h26300@webber.adilger.net>; from adilger@turbolinux.com on Sun, Jan 28, 2001 at 11:53:02PM -0700
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

Andreas has a good point here.

Minor correction: the names of the functions are pv_read_all_pv()
and pv_read_all_pv_of_vg().

On Sun, Jan 28, 2001 at 11:53:02PM -0700, Andreas Dilger wrote:
> Joe Harvell writes:
> > I really, really, really need the data that is on this VG.
> > 
> > So if anyone at Sistina really wants to get to the bottom of this, you
> > just got yourself a dedicated beta-tester.  I am an experienced software
> > developper with a small amount of Linux device-driver experience.  I can
> > provide hexdumps of the relevant portions of the actual partitions.
> > I am willing to run any series of tests on this machine to help find
> > the root cause of this problem.  Whatever it takes.
> 
> Not that I'm from Sistina, but one thing you could start out checking is
> in lvm_read_all_pv_of_vg(), and print out the PV list at each step of the
> way.  It may be possible that some of the PVs are being removed from the
> list, even though they are not supposed to.  The first list, returned
> from lvm_read_all_pv(), should be all of the PVs on your system.
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
