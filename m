From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Remove VOlume group that doesn't exist
Message-ID: <20030903110622.B2618@sistina.com>
References: <3F5522A7.5030900@phys.unsw.edu.au>
Mime-Version: 1.0
In-Reply-To: <3F5522A7.5030900@phys.unsw.edu.au>; from melinda@phys.unsw.edu.au on Wed, Sep 03, 2003 at 09:07:19AM +1000
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
Date: Wed Sep  3 04:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Melinda,

Does pvscan show /dev/sdd2 as a Physical Volume ?

If so, there's still LVM metadata on /dev/sdd2 in the first sector.
In case the partition is unused (no filesystem etc.), a

	dd if=/dev/zero of=/dev/sdd2 bs=512

should remove the PV.

On Wed, Sep 03, 2003 at 09:07:19AM +1000, Melinda Taylor wrote:
> Hello,
> 
> After my couple of disks died I have been left with one working volume 
> group vg02 and
> one non-existant volume group vg01 which I would like to remove.
> Since /dev/sdd2 and /dev/sde2 no longer exist I am unable to remove the 
> volume group with the usual method:
> 
> /sbin/vgremove vg01
> VG data differs between PVs /dev/sdd2 and /dev/sde2
> Volume group "vg01" doesn't exist
> 
> 
> Actually /dev/sdd2 does still exist as a normal formatted linux partition
> so I don't want to damage that while trying to remove my volume group.
> 
> How do I tell lvm that vg01 no longer exists? It is not in lvmtab so I 
> am unsure where it store this info.
> 
> 
> Many Thanks,
> 
> melinda
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
