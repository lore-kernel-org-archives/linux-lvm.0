From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Remove VOlume group that doesn't exist
Message-ID: <20030909014346.H2618@sistina.com>
References: <3F5522A7.5030900@phys.unsw.edu.au> <20030903110622.B2618@sistina.com> <3F5C2095.6050300@phys.unsw.edu.au>
Mime-Version: 1.0
In-Reply-To: <3F5C2095.6050300@phys.unsw.edu.au>; from melinda@phys.unsw.edu.au on Mon, Sep 08, 2003 at 04:24:21PM +1000
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
Date: Mon Sep  8 18:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: mge@sistina.com

On Mon, Sep 08, 2003 at 04:24:21PM +1000, Melinda Taylor wrote:
> Hi Heinz,

Hi Melinda.

> 
> PVSCAN reveals:
> 
> [root@astro melinda]# /sbin/pvscan
>   VG data differs between PVs /dev/sdd2 and /dev/sde2
>   1 PV(s) found for VG vg01: expected 0
>   Out of memory.  Requested 4006555252 bytes.
>   Couldn't allocate logical volume maps.
>   PV /dev/sdd1    is in exported VG vg02 [9.85 GB / 0    free]
>   PV /dev/sde1    is in exported VG vg02 [19.54 GB / 0    free]
>   Total: 2 [0   ] / in use: 2 [0   ] / in no VG: 0 [0   ]
> 
> /dev/sdd2 and /dev/sde2 have both been reformatted as ext3 fs and their 
> partition type was changed to linux fs using fdisk.

And those aren't listed above wich is good.

> 
> The memory error I haven't seen before (we have 3GB) but I installed a 
> new kernel the other week maybe that is the cause /var/log/messages said:

This is no memory error at all. Just some application sending an unsupported
command through the ide-scsi driver (cd writer sw ?). Can be ignored safely.

> 
> Sep  8 16:17:15 astro kernel: ide-scsi: hda: unsupported command in 
> request queue (0)
> Sep  8 16:17:15 astro kernel: end_request: I/O error, dev 03:1e (hda), 
> sector 0
> Sep  8 16:17:15 astro kernel: ide-scsi: hda: unsupported command in 
> request queue (0)
> Sep  8 16:17:15 astro kernel: end_request: I/O error, dev 03:1f (hda), 
> sector 0
> Sep  8 16:17:16 astro kernel: ide-scsi: hda: unsupported command in 
> request queue (0)
> Sep  8 16:17:16 astro kernel: end_request: I/O error, dev 03:20 (hda), 
> sector 0
> 
> I don't want to do
> 
> dd if=/dev/zero of=/dev/sdd2 bs=512 

You shoudn't because it would overwrite filesystem metadata.

> 
> as /dev/sdd2 now has data on it.
> 
> If I look at both drives in fdisk only the parition /dev/sdd1 and /dev/sde1 which make up VG02 are set to "Linux LVM".

LVM still finds PV metadata for vg01 which is strange.

Could you send the 1st 4MB of you partitions sdd2 and sde2 to me in email
for further analysis ?

If so please run:

# dd if=/dev/sdd2 of=sdd2.vgda bs=1k count=4k
# dd if=/dev/sde2 of=sde2.vgda bs=1k count=4k
# tar cf Melinda.vgda.tar sd[de]2.vgda
# bzip2 Melinda.vgda.tar

and send the resulting Melinda.vgda.tar.bz2 file to me.

Regards,
Heinz    -- The LVM Guy --



> 
> Is there someway to rename VG02 as VG01 maybe? I am at a loss.
> 
> Many Thanks,
> 
> melinda
> 
> 
> 
> 
> 
> Heinz J . Mauelshagen wrote:
> 
> >Melinda,
> >
> >Does pvscan show /dev/sdd2 as a Physical Volume ?
> >
> >If so, there's still LVM metadata on /dev/sdd2 in the first sector.
> >In case the partition is unused (no filesystem etc.), a
> >
> >	dd if=/dev/zero of=/dev/sdd2 bs=512
> >
> >should remove the PV.
> >
> >On Wed, Sep 03, 2003 at 09:07:19AM +1000, Melinda Taylor wrote:
> >  
> >
> >>Hello,
> >>
> >>After my couple of disks died I have been left with one working volume 
> >>group vg02 and
> >>one non-existant volume group vg01 which I would like to remove.
> >>Since /dev/sdd2 and /dev/sde2 no longer exist I am unable to remove the 
> >>volume group with the usual method:
> >>
> >>/sbin/vgremove vg01
> >>VG data differs between PVs /dev/sdd2 and /dev/sde2
> >>Volume group "vg01" doesn't exist
> >>
> >>
> >>Actually /dev/sdd2 does still exist as a normal formatted linux partition
> >>so I don't want to damage that while trying to remove my volume group.
> >>
> >>How do I tell lvm that vg01 no longer exists? It is not in lvmtab so I 
> >>am unsure where it store this info.
> >>
> >>
> >>Many Thanks,
> >>
> >>melinda
> >>
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>    
> >>
> >
> >  
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
