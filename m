Return-Path: <root@srv.sistina.com>
Date: Fri, 11 May 2001 17:28:43 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What happens when a disk dies?
Message-ID: <20010511172843.A18887@sistina.com>
References: <85256A49.0053DE83.00@janus.eci.esys.com>
Mime-Version: 1.0
In-Reply-To: <85256A49.0053DE83.00@janus.eci.esys.com>; from Kyle_S_Hoyt@raytheon.com on Fri, May 11, 2001 at 11:16:02AM -0400
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

On Fri, May 11, 2001 at 11:16:02AM -0400, Kyle_S_Hoyt@raytheon.com wrote:
> 
> 
> I am very interested in starting to use LVM.  We have large amounts of data
> that is fairly dynamic.  Since it is dynamic, we don't need to incur the
> cost expensive SCSI RAID solutions for data integrity.  We currently use
> four 80 Gig Maxtor Hard Drives to store our data at test events. Of course
> this means with a /drive1 /drive2 /drive3 and a /drive4 directory.  So the
> user has to search the drives to find the file of interest.  We kind of
> hide this by creating links but the links need to be periodically updated
> as files are added or deleted.  LVM solves this problem.  But before I move
> to LVM, I curious on what happens if a drive dies.
> 
>  If drive2 goes down and I replace it with another drive, do I just lose
> the data on drive2 or do I lose all of the data in the Logical Volume?

You need to restore the LVM metadata onto the replacement drive in order
to activate the volume group again.
Because LVM maps the logical address space of the logical volume in units
of logical extends (LEs; typically 4M in size) to the equal sized physical
extents (PEs) on the underlying disk devices, all allocated PEs on the
replaced drive will have bad contents.
This will expose a partially messy filesystem which will give you plenty of
errors soon and won't make fsck happy at all :-(

> 
> If I don't lose the data on the other drives, can LVM also be reconfigured
> to remove the dead drive and then continue working with just the other
> three drives (only losing the data on the dead drive)?

Not today.

The feature you are requesting is known as VG quorum.

IOW: if less than a reasonable amount of physical volumes within a volume
group fail, you can activate the VG *but* you need to live with the above
mentioned fs (or database or whatever) problem. Just depends on what is stored
in the partially available LV and what complaints of LVM user software
entities (like filesystems, database systems etc.) are caused by that.

VG quorum will be supported in a later LVM version.

> 
> I read the FAQs and one of them shows how to recover from a dead drive.  It
> is says you lose the data in the Logical Volume but I'm hoping just the
> data on the physical disk that died and not the entire volume.

Yep, as explained above.

For enhanced availability you should make use of MD software RAID >= 1 or
hardware RAID subsystems.

Regards,
Heinz    -- The LVM Guy --

> 
> Thanks for your help,
> 
> Kyle Hoyt
> (727) 302-7465
> Kyle_S_Hoyt@raytheon.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
