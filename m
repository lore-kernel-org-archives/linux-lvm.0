Subject: Re: [linux-lvm] What command do I use to make a PV active?
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <20030704134905.A28295@sistina.com>
References: <20030703165707.LXFV15998.imf16aec.bellsouth.net@tiger2>
	 <20030704134905.A28295@sistina.com>
Message-Id: <1057592224.10033.30.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
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
Date: Mon Jul  7 10:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, 2003-07-04 at 07:49, Heinz J . Mauelshagen wrote:
> On Thu, Jul 03, 2003 at 01:05:43PM -0400, Greg Freemyer wrote:
> >  
> > Somehow I inactived a PV
> 
> Hmm, there's no direct (in)activation of PVs.
> A bit strange, that both are in diffrent states (they should be either inactive
> in case the VG is or both active in case the VG got activated).

This is a lab/test machine.  I have a couple of others that have a
similar LVM layout, and all of them have hot-swap drives.  I likely
moved a drive around at the wrong time.

> 
> > 
> > # pvscan
> > pvscan -- reading all physical volumes (this may take a while...)
> > pvscan -- inactive PV "/dev/sda3" of VG "TruStore-Data" [53.63 GB / 48.63 GB free]
> > pvscan -- ACTIVE   PV "/dev/sdb1" of VG "TruStore-Data" [74.54 GB / 13.54 GB free]
> > pvscan -- total: 2 [128.19 GB] / in use: 2 [128.19 GB] / in no VG: 0 [0]
> > 
> > What command do I use to make it active?
> 
> If the VG "TruStore-Data" is inactive, "vgchange -ay TruStore-Data" should turn
> /dev/sda3 active as well.

It is already active, and I just tried a reboot.  sda3 is still
inactive.

> 
> Is "TruStore-Data" accessable fine (LVs ok) ?

I have 3 LVs on sdb1, they are working fine.

I have a copy of my Linux Distro CDs and spare space for sdb1 snapshots
on sda3.  They are not working.

Obviously I can recreated the CD copies, but I prefer not to do this.

Is there something else I can try?

FYI: None of this data is very important, so I won't complain too loud
if you ask me to do something and it ends up blowing everything away.

Thanks
Greg
-- 
Greg Freemyer
