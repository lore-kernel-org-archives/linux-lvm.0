From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Quorums / VGDAs
Message-ID: <20020916133748.C17122@sistina.com>
References: <3D7E4050.B3BEEE@storix.com> <20020911123312.D26854@sistina.com> <3D80D4CB.C244DFA6@storix.com>
Mime-Version: 1.0
In-Reply-To: <3D80D4CB.C244DFA6@storix.com>; from anthony@storix.com on Thu, Sep 12, 2002 at 10:54:19AM -0700
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
Date: Mon Sep 16 06:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Sep 12, 2002 at 10:54:19AM -0700, Anthony Johnson wrote:
> Heinz, 
> I'm having some trouble understanding these answers. Perhaps I am
> misunderstanding the purpose of a "quorum" on Linux.

Well,

I used the term "quorum" as we use it with LVM1. There's piles of different
"quorum" definitions for various things out there, I am afraid ;-)

> On AIX, quorums
> ensure that at least one copy of the latest VGDA is alsays avaialble by
> ensuring there are always a quorum (over half) of the VGDA copies
> available. The VGDA is stored on each PV (and sometimes 2 copies are
> stored on each PV). If you lose quorum, you lose the VG (to ensure we
> don't varyon with an old copy).
> 
> You imply that a "quorum" requires ALL of the PVs be avialable in Linux.
> The dictionary definition of a "quorum", however, is more than half.

Well, this is the problem with definitions ;-)

In the LVM1 format case the VGDA is assembled using the metadata of *all*
PVs and thats why quorum for *LVM1* means that 100% of the PVs are needed.

With LVM2 you will have the choice to put VGDA metadata on as many PVs as you
like (for eg.: just on 3 out of 50). This is to avoid metadata update delays
as much as possible.

In this example you don't need access to all PVs in order to achive quorum.
But if you manage to kill those 3 at once, you need a valid VGDA backup.

OTOH this goes beyond the AIX approach giving you VG quorum even with much
less than 50% of the PVs available!


> If a VG in Linux can be varied on with only one good copy of a VGDA (in
> perhaps a 3-PV VG), then how do you ensure that you are always looking
> at and updating the most recent copy? If, for instance, I have a 4-disk
> VG, and I lose 2 disks, then shutdown and varon the VG with the
> alternate 2 disks (the previously missing ones), I will be seeing only
> the older VGDA. Is the VGDA also stored in the /etc/lvmtab.d?

Yes, with LVM1 there is a working copy of the VGDA of each VG.

> If so, can
> you varyon if this VGDA was removed?

That working copy is recreated every time you run vgscan.

In general an activated VG *without* quorum is read-only in case of the LVM1
ondisk format so your example describes a don't care scenario.
With the LVM2 metadata format (which we call format2) there are sequence
numbers kept with each copy which define the recent one.

Hope this makes things a little cleare :)

Regards,
Heinz    -- The LVM Guy --

> 
> I guess the big question is: How does LVM for Linux ensure that we are
> always using the most recent VGDA data (in case we're looking at active
> PVs that were previously missing). I have to do a lecture to an AIX
> group on the differences between LVM on AIX and Linux, and quorums were
> always a big issue for AIX.
> 
> Thanks,
> Anthony
> 
> > > 1) What defines a quorum - over 50% of the PVs in the VG, or over 50%
> > >    of the VGDAs?
> > 
> > VG quorum is given in case all of its PVs are available.
> > 
> > > 2) How many VGDAs are stored on each physical volume. From AIX
> > >    experience, this varied depending on the number of PVs in the VG.
> > 
> > In the LVM1 metadata there's allways 1 VGDA on each PV which has internal
> > redundancy.
> > With the new LVM2 formats you can have as many VGDA copies as you like.
> > 
> > > 3) If quorum is lost on an active VG, is the entire VG automatically
> > >    varied off?
> > 
> > No, it will stay accessable with the exception of the dead PV(s).
> > 
> > > 4) Can a VG without quorum be forcefully varied on?
> > 
> > With LVM1.1 (see CVS; WARNING: his is interim development code!) and with final
> > LVM2 later this year, you can activate a VG which has lost quorum.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
