Return-Path: <root@srv.sistina.com>
Date: Thu, 26 Apr 2001 17:11:55 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] badblocks handling with LVM
Message-ID: <20010426171155.A11885@sistina.com>
References: <200104231008.f3NA8Gkx001134@webber.adilger.int> <01042519594802.31687@lyta> <20010426100603.A9820@sistina.com> <20010426152651.B26041@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010426152651.B26041@vestdata.no>; from lvm@ragnark.vestdata.no on Thu, Apr 26, 2001 at 03:26:52PM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thu, Apr 26, 2001 at 03:26:52PM +0200, Ragnar Kj�rstad wrote:
> On Thu, Apr 26, 2001 at 10:06:03AM +0000, Heinz J. Mauelshagen wrote:
> > > The problem is that when you move LV's around and make snapshots the bad 
> > > blocks on the underlieing media will move.  Therefore I think that management 
> > > of bad blocks possibly should be done in the LVM.
> > > 
> > > Or should we just assume that LVM runs over RAID arrays of ATA/SCSI disks 
> > > that have sector-sparing so that bad blocks are not an issue?
> > 
> > That's what I recommend because disks typically "hide" bad sectors to a certain
> > degree using bad block relocation et al.
> > If the given disk capacity for this is not enough because too many bad blocks
> > occured already then you are in serious trouble and need to repleace
> > your disk (subsystem) anyway IMO.
> 
> And if anyone insist on using LVM to mark the blocks anyway, it can be
> done with out special code. Just create a volume named "broken", and put
> the PVs in question in this.

It is not that I really *insist*.

I just say that it doesn't make a whole lot of sense today, because most of
the disk (subsystems) don't expose bad blacks any longer.

Once those start too, they are ready to go to the trashcan IMO anyway.

> 
> 
> -- 
> Ragnar Kj�rstad
> Big Storage
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
