From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What command do I use to make a PV active?
Message-ID: <20030707193054.B28295@sistina.com>
References: <20030703165707.LXFV15998.imf16aec.bellsouth.net@tiger2> <20030704134905.A28295@sistina.com> <1057592224.10033.30.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
In-Reply-To: <1057592224.10033.30.camel@david.internal.NorcrossGroup.com>; from freemyer-ml@NorcrossGroup.com on Mon, Jul 07, 2003 at 11:37:04AM -0400
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
Date: Mon Jul  7 12:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jul 07, 2003 at 11:37:04AM -0400, Greg Freemyer wrote:
> On Fri, 2003-07-04 at 07:49, Heinz J . Mauelshagen wrote:
> > On Thu, Jul 03, 2003 at 01:05:43PM -0400, Greg Freemyer wrote:
> > >  
> > > Somehow I inactived a PV
> > 
> > Hmm, there's no direct (in)activation of PVs.
> > A bit strange, that both are in diffrent states (they should be either inactive
> > in case the VG is or both active in case the VG got activated).
> 
> This is a lab/test machine.  I have a couple of others that have a
> similar LVM layout, and all of them have hot-swap drives.  I likely
> moved a drive around at the wrong time.

Ah, the  let me assume, that this is the reason why the inactive status
is stored on the PV.

> 
> > 
> > > 
> > > # pvscan
> > > pvscan -- reading all physical volumes (this may take a while...)
> > > pvscan -- inactive PV "/dev/sda3" of VG "TruStore-Data" [53.63 GB / 48.63 GB free]
> > > pvscan -- ACTIVE   PV "/dev/sdb1" of VG "TruStore-Data" [74.54 GB / 13.54 GB free]
> > > pvscan -- total: 2 [128.19 GB] / in use: 2 [128.19 GB] / in no VG: 0 [0]
> > > 
> > > What command do I use to make it active?
> > 
> > If the VG "TruStore-Data" is inactive, "vgchange -ay TruStore-Data" should turn
> > /dev/sda3 active as well.
> 
> It is already active, and I just tried a reboot.  sda3 is still
> inactive.

You might want to create a dummy LV and remove it.
That changes PV state stored on disks.

> 
> > 
> > Is "TruStore-Data" accessable fine (LVs ok) ?
> 
> I have 3 LVs on sdb1, they are working fine.
> 
> I have a copy of my Linux Distro CDs and spare space for sdb1 snapshots
> on sda3.  They are not working.
> 
> Obviously I can recreated the CD copies, but I prefer not to do this.
> 
> Is there something else I can try?
> 
> FYI: None of this data is very important, so I won't complain too loud
> if you ask me to do something and it ends up blowing everything away.
> 
> Thanks
> Greg
> -- 
> Greg Freemyer
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
