From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] reuses an existing LV number
Message-ID: <20030128115833.C17531@sistina.com>
References: <005c01c2c624$2fff0680$4b66699f@win.doc.state.vt.us>
Mime-Version: 1.0
In-Reply-To: <005c01c2c624$2fff0680$4b66699f@win.doc.state.vt.us>; from jkezar@doc.state.vt.us on Mon, Jan 27, 2003 at 11:50:24AM -0500
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
Date: Tue Jan 28 05:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Joseph,

there's 2 options you've got (2nd one looks a bit hacky ;):

a. boot a rescue media with LVM installed on it and run "vgscan -f"

b. presuming you don't have devfs, detach the JBOD, boot from HD, move all /dev
   entries belonging to the JBOD to a different directory (i.e. /dev/.SAV),
   shutdown and reattach the JBOD, boot, move /dev/.SAV/* back to /dev and
   run "vgscan -f"

Regards,
Heinz    -- The LVM Guy --


On Mon, Jan 27, 2003 at 11:50:24AM -0500, Joseph Kezar wrote:
> I have a situation here where I have to Volume groups
> 
> VolumeMailData
> and
> vg0
> 
> I just created 2 more Logical Volumes(LV) on VolumeMailData to make a total
> of 4.
> I then rebooted and got this error
> 
> vgscan - found an inactive volume group "VolumeMailData"
> vgscan - found an inactive volume group "vg0"
> vgscan - volume group "vg0" reuses an existing logical volume number; please
> vgexport/vgimport that VG or use option -f
> 
> ....
> 
> kernel panic: no init found; try passing init=
> 
> VolumeMailData gets activated.  But my root (/) is on vg0 which doesnt get
> activated and I am dead in the water.
> 
> I can detach my JBOD/RAID Array which makes up VolumeMailData so I can boot.
> This way it doesnt find the inactive volume group VolumeMailData and vgo is
> able to come up normaly
> 
> How can I fix this problem, as it is I kinda need both volume groups
> functioning simantaniously :)
> Thanks,
> Joe Kezar
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
