From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Some questions after starting to use 1.1-rc1
Message-Id: <20020426103904.A20196@sistina.com>
References: <mauelshagen@sistina.com>
    <E170qrT-0006EB-00@whittlesey.cl.cam.ac.uk>
MIME-Version: 1.0
In-Reply-To: <E170qrT-0006EB-00@whittlesey.cl.cam.ac.uk>; from
    Piete.Brooks@cl.cam.ac.uk on Thu, Apr 25, 2002 at 10:33:07PM +0100
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
Date: Fri Apr 26 03:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Piete.

On Thu, Apr 25, 2002 at 10:33:07PM +0100, Piete Brooks wrote:
> >> 1) I've been comparing the speed of LVM over RAID0 with striped LVM, using:
> >> 	perl -e '$n=1900;$x="X"x(1024*1024);foreach $i(1..$n){print $x}'
> >>    and I find that striped LVM takes 50% longer.
> > which stripe size did you use?
> 
> I don't think I specified -- so "the default" ?

That's 16k then.

> 
> > Were the PVs on non-saturated pathes?
> 
> What are "non-saturated pathes" ?

Those with enough (free) bandwidth.

> 
> There were two PVs, each on an otherwise unused IDE bus.
> 
> > Did you compare LVM1 Raid0 to MD Raid0 on the very same hardware?
> 
> Yes.
> 
> >> 2) When I tried to extend the striped partition, it failed when it used up
> >>    the first two PVs, and will not start the next two.  Ideas ?
> > That's a LVM1 constraint which will disapear with LVM2.
> 
> :-(
> 
> Is there an introductory document on device-mapper ?

Download the device-mapper code from

   ftp://ftp.sistina.com/pub/LVM2/device-mapper/

and read the INTRO file.

> 
> > No need to vgexport to test it.
> 
> Hmmm ...
> 
> > Just stop one PV as you did
> 
> stop the RAID device while it's in use by LVM ?

Well, if you do this while the extents on it are actively used, Linux
will soon start to expose io errors. If you deactivate/activate the VG
then  it should still come up with "vgchange -qn".

If you want to avoid the io errors in your test case, deactivate the VG,
deactivate the PV and "vgchange -qn" the VG again.


> 
> >>     b) should it be possible to export a VG if there is a PV of that VG 
> which
> >>       is still exported ?
> 
> ?
> 
> >> 5) is there some utility to display the contents of VGDA on disk, /etc/lvm*,
> >>    etc;  show where the first PE is in a PV, etc ? 
> > Run "pvdata -a" on the particular PV.
> 
> Where does it say "PE 0 starts at byte offset <n> of the device" ?

Sorry, my fault.

Use "pvdata -PP" and calculate "pe_on_disk.base" + "pe_on_disk_size",
which gives you the offset of the first PE in bytes.

Or run "pvdisplay -v" on the PV, which lists the offsets for all PEs
in sectors of 512 byte.

> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
