Return-Path: <root@srv.sistina.com>
Date: Tue, 20 Mar 2001 12:25:07 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Recovering PV's VG metadata
Message-ID: <20010320122507.H29326@sistina.com>
References: <3AB49365.2020606@inetnow.net> <20010319131456.C26986@sistina.com> <3AB71D83.2000000@inetnow.net>
Mime-Version: 1.0
In-Reply-To: <3AB71D83.2000000@inetnow.net>; from hne@inetnow.net on Tue, Mar 20, 2001 at 06:06:11PM +0900
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

On Tue, Mar 20, 2001 at 06:06:11PM +0900, HopNet wrote:
> Thanks to Heinz & Andreas for your suggestions.  They are "almost" working. :-)  I can activate the VG, but I'm getting "wrong major or minor number" from the mount of the lvol, so I'm thinking I have an offset that is not correct.
> 

As Andreas questioned in his answer: where does that message come from and
what is it exactly?


> Heinz, you're assumptions (listed below) are correct.  The PVs are identical models.
> 
> One thing I have a question about, and this may lead to resolving my offset problem, is where does the following pvdata info come from?
> hda showed: (after LILO, which, I can see from the hex dump, was indeed the problem)
> PV Size               12.14 GB / NOT usable 3.21 MB [LVM: 16.09 MB]
> hdc showed:
> PV Size               12.14 GB / NOT usable 3.24 MB [LVM: 242 KB]
> 
> After I copied the header over, they are the same (as hdc).  Should they be the same?  Or do I need to fudge some more numbers in the hda header.
> 

If the models are *exactly* equal there are none.

If there's firmware differences that could actually lead to slightly different
sizes beeing exposed to the OS.
This difference could eventually lead to an additional PE on one disk causing
an *additional* entry in the mapping table in the VGDA on disk which starts at
offset pv->pe_on_disk.base set in library functions
vg_setup_for_{create,extend}() calculated by macro LVM_PE_ON_DISK_BASE(pv)
defined in lvm.h.
Nevertheless the beginning offsets to the mapping tables should be
the same, because this macro was introduced in LVM 0.6 and hasn't changed
since then.

Explained that we still need the exact "wrong major or minor number" messages
in order to proceed ;-)


> Heinz, from your paragraph below: What should I be looking for to identify the first sector of "?"  Is there a block diagram available with the metadata layout?

See the pv_on_disk, vg_on_disk, pv_name_list_on_disk, lv_on_disk and pe_on_disk
structures beeing set in vg_setup_for_{create,extend}() and the macros defined
in lvm.h they use.

Structure layout from the beginning of the PV is:

 - PV
 - VG
 - NAMELIST (of all devices names used; changed to UUIDLIST in 0.9)
 - LVs
 - PEs

Regards,
Heinz    -- The LVM Guy --

> 
> Andreas, this appears to be a v1 header, so no uuid.  This confused the heck out of me for a while, until I finally deciphered part of lvm.h.  Also, pvdata doesn't support -PU on this release.
> 
> If I can't get the offset fixed, I'll probably try creating the "lvrecover" that Andreas suggested.
> 
> One the bright side, I do have a backup I recovered!  On the dark side, my backups have been flaky, and the only good one was two months old :-(  Time to invest in a new tape drive.  Well 12G of data is better than no data at all.
> 
> Heinz J. Mauelshagen wrote:
> 
> > I understand:
> > 
> >  - you are not booting from hda or hdc
> > 
> >  - hdc still holds a valid LVM VGDA
> > 
> >  - likely the first sector of hda got blown away (by lilo)
> > 
> >  - you don't have any /etc/lvmconf/ VGDA backup files on disk/tape
> >    (if not so use vgcfgrestore(8) in order to restore metadata to /dev/hda!)
> > 
> > 
> > I'm assuming based on the data below:
> > 
> >  - your 2 physical volumes are equal in size
> > 
> >  - you had just 1 logical volume spread over both physical volumes using
> >    all of the VG's capacity
> > 
> >  - all of your VGDA with the exception of the physical volume structure,
> >    which was sitting at the very beginning of hda is still there and
> >    likely valid
> > 
> > 
> > *If* the above assumptions are correct, your option is to copy the first
> > sector of /dev/hdc over to /dev/hda with
> > "dd if=/dev/hdc bs=512 count=1 of=/dev/hda" *and* change it with a hex editor.
> > 
> > In order to find the correct offsets into the first sector on /dev/hda to
> > change, look at lvm.h (of LVM 0.8final!) and the definition of pv_disk_t in
> > that header file.
> > 
> > At least you need to change the physical number (pv_number); set it to 1.
> > 
> > In case the above assumptions are not correct for eg. the sizes of the PVs
> > differ, you need to change pv_size, pe_total and pe_allocated as well.
> > 
> > Please get back to me if this is the case.
> > 
> > 
> > BTW: we are working on the enhancement of our LVM checker in order
> >      to support such repairs. Not very helpfull for you nor, I know :(
> > 
> > Don't forget to check your /etc/lilo.conf to make sure, that lilo doesn't
> > tamper with the first sector on /dev/hda again!
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
