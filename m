Return-Path: <root@srv.sistina.com>
Date: Fri, 15 Jun 2001 12:29:37 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] expanding physical disks
Message-ID: <20010615122937.B3318@sistina.com>
References: <200106130710.f5D7AhaX005430@webber.adilger.int> <m3ofrsguqf.fsf@multivac.cwru.edu>
Mime-Version: 1.0
In-Reply-To: <m3ofrsguqf.fsf@multivac.cwru.edu>; from prj@po.cwru.edu on Wed, Jun 13, 2001 at 01:22:26PM -0400
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

On Wed, Jun 13, 2001 at 01:22:26PM -0400, Paul Jarc wrote:
> Andreas Dilger <adilger@turbolinux.com> writes:
> > Brian Murrell writes:
> >> How does LVM deal with physical disks that can get bigger or smaller,
> >> such as a hardware RAID device?
> > 
> > Doesn't work at this time.  LVM will only see what was originally there
> > at the time pvcreate was run (or possibly vgcreate/vgextend).
> 
> But it won't do any harm either, right?
> 
> > If the new PEs don't all fit into the padding space (it may happen if
> > your starting PV size is just a couple hundred kB over n * PE size),
> > then you will need to pvmove PE0 from its current location to somewhere
> > else in the VG, and then renumber all of the PEs on that PV as (PE# - 1).
> > That couble be ugly because I believe the PE number is stored in the
> > snapshot tables and such.
> 
> Since this is a case of making the PV bigger, all the PEs could simply
> be shifted by one; there is, after all, more room at the end now.
> That would still be ugly, though.

Yes, it would :-(

Typical HW storage subsystems anable you to create additional IDs (for eg.
SCSI LUNs) to addrees the gained storage once you insert additional drives.

Do you have constraints to create those and just use the as new PVs or
is the maximum of 8 LUNs in the SCSI case insufficient for you?

That's the way we did it quite happily for multiple years in my previous job 
on HP, SUN and other platforms :-)

> 
> 
> paul
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
