Message-ID: <3D80D4CB.C244DFA6@storix.com>
From: Anthony Johnson <anthony@storix.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Quorums / VGDAs
References: <3D7E4050.B3BEEE@storix.com> <20020911123312.D26854@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Fri Sep 13 15:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz, 
I'm having some trouble understanding these answers. Perhaps I am
misunderstanding the purpose of a "quorum" on Linux. On AIX, quorums
ensure that at least one copy of the latest VGDA is alsays avaialble by
ensuring there are always a quorum (over half) of the VGDA copies
available. The VGDA is stored on each PV (and sometimes 2 copies are
stored on each PV). If you lose quorum, you lose the VG (to ensure we
don't varyon with an old copy).

You imply that a "quorum" requires ALL of the PVs be avialable in Linux.
The dictionary definition of a "quorum", however, is more than half. If
a VG in Linux can be varied on with only one good copy of a VGDA (in
perhaps a 3-PV VG), then how do you ensure that you are always looking
at and updating the most recent copy? If, for instance, I have a 4-disk
VG, and I lose 2 disks, then shutdown and varon the VG with the
alternate 2 disks (the previously missing ones), I will be seeing only
the older VGDA. Is the VGDA also stored in the /etc/lvmtab.d? If so, can
you varyon if this VGDA was removed?

I guess the big question is: How does LVM for Linux ensure that we are
always using the most recent VGDA data (in case we're looking at active
PVs that were previously missing). I have to do a lecture to an AIX
group on the differences between LVM on AIX and Linux, and quorums were
always a big issue for AIX.

Thanks,
Anthony

> > 1) What defines a quorum - over 50% of the PVs in the VG, or over 50%
> >    of the VGDAs?
> 
> VG quorum is given in case all of its PVs are available.
> 
> > 2) How many VGDAs are stored on each physical volume. From AIX
> >    experience, this varied depending on the number of PVs in the VG.
> 
> In the LVM1 metadata there's allways 1 VGDA on each PV which has internal
> redundancy.
> With the new LVM2 formats you can have as many VGDA copies as you like.
> 
> > 3) If quorum is lost on an active VG, is the entire VG automatically
> >    varied off?
> 
> No, it will stay accessable with the exception of the dead PV(s).
> 
> > 4) Can a VG without quorum be forcefully varied on?
> 
> With LVM1.1 (see CVS; WARNING: his is interim development code!) and with final
> LVM2 later this year, you can activate a VG which has lost quorum.
