Date: Tue, 11 May 2004 13:10:56 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Snit fight beetween LVM, MD and NFSD.
Message-ID: <20040511111056.GB31390@redhat.com>
References: <200405060143.i461hjLw014192@wind.enjellic.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200405060143.i461hjLw014192@wind.enjellic.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@enjellic.com, LVM general discussion and development <linux-lvm@redhat.com>
Cc: hjm@redhat.com


Greg,

this looks very much like the resource contention problem
NFSD and pvmove had (as you assumed below) causing a severe slowdown
of pvmove.

With LVM2/device-mapper the problem is likely to be much less visible,
because of the use of temprorary mirrors for data relocation and background
copies used for mirror resynchronization.

IOW: I expect LVM2/device-mapper to be smoother ITR but of course
     not free of resource contention problems.

Regards,
Heinz    -- The LVM Guy --



On Wed, May 05, 2004 at 08:43:45PM -0500, Dr. Greg Wettstein wrote:
> Good evening, hope the day is going well for everyone.
> 
> We just spent the last 24 hours dealing with a rather strange
> situation on one of our big file servers.  I wanted to summarize what
> happened to find out if there is an issue or whether this is a "don't
> do that type of thing situation".
> 
> The server in question is a dual 1.2Ghz PIII with 1 gigabyte of RAM
> running 2.4.26 and providing NFS services to around 100 Linux clients
> (IA32/IA64).  Storage is implemented with a 8x160 Gbyte MD based RAID5
> array using a 7508 3-ware controller.  LVM is used to carve the MD
> device into 5 logical volumes supporting ext3 filesystems which serve
> as the NFS export sources.  LVM is up to date with whatever patches
> were relevant from the 1.0.8 distribution.
> 
> Clients are mounted with the following options:
> 
> 	tcp,nfsvers=3,hard,intr,rsize=8192,wsize=8192
> 
> Last week one of the drives in the RAID5 stripe failed.  In order to
> avoid a double fault situation we migrated all the physical extents
> from the RAID5 based PV to a FC based PV on the SAN.  SAN access is
> provided through a Qlogic 2300 with firmware 3.02.16 using the 6.06.10
> driver from Qlogic.
> 
> Migration to the FC based physical volume was uneventful.  The faulty
> drive was replaced this week and the extents were migrated back from
> the FC based physical volume on an LV by LV basis.  All of this went
> fine until the final 150 Gbyte LV was migrated.
> 
> Early into the migration the load on the box went high (10-12).  Both
> the pvmove process and the NFSD processes were persistently stuck for
> long periods of time in D state.  The pvmove process would stick in
> get_active_stripe while the NFSD processes were stuck in
> log_wait_commit.
> 
> I/O patterns were very similar for NFS and the pvmove process.  NFS
> clients would hang for 20-30 seconds followed by a burst of I/O.  On
> the FC controllers we would see a burst of I/O from the pvmove process
> followed by a 20-30 seconds of no activity.  Interactive performance
> on the fileserver was good.
> 
> We unmounted almost all of the NFS clients and reduced the situation
> to a case where we had 5-7 clients doing modest I/O, mostly listing
> directories and other common interactive functions.  Load remained
> high with the NFSD processes oscillating in and out of D state with
> the pvmove process.
> 
> We then unmounted all the clients that were accessing the filesystem
> supported by the LV which was having its physical extents migrated.
> Load patterns remained the same.  We then unmounted the physical
> filesystem and the load still remained high.
> 
> As a final test we stopped NFS services.  This caused the pvmove
> process to run almost continuously with only occasional D state waits.
> We confirmed this by observing almost continuous traffic on the FC
> controller.  When the pvmove completed NFS services were restarted,
> all clients were remounted and the server is running with 80-90 client
> connections with modest load.
> 
> So it would seem that the NFSD processes and the pvmove process were
> involved in some type of resource contention problem.  I would write
> this off to "LVM doesn't work well for NFS exported filesystems"
> except for the fact that we had successfully transferred 250+
> gigabytes of filesystems off the box and back onto the box without
> event before this incident.
> 
> I would be interested in any thoughts that anyone may have.  We can
> setup a testbed to try and re-create the problem if there are
> additional diagnostics that would be helpful in figuring out what was
> going on.
> 
> Best wishes for a productive end of the week.
> 
> As always,
> Dr. G.W. Wettstein, Ph.D.   Enjellic Systems Development, LLC.
> 4206 N. 19th Ave.           Specializing in information infra-structure
> Fargo, ND  58102            development.
> PH: 701-281-1686
> FAX: 701-281-3949           EMAIL: greg@enjellic.com
> ------------------------------------------------------------------------------
> "There are two ways of constructing a software design. One is to make
> it so simple that there are obviously no deficiencies; the other is to
> make it so complicated that there are no obvious deficiencies. The
> first method is far more difficult."
>                                 -- C. A. R. Hoare
>                                    The Emperor's Old Clothes
>                                    CACM February 1981
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
