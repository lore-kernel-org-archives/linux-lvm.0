From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Advice needed: vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg0" from physical volume(s)
Message-ID: <20021119113149.A30328@sistina.com>
References: <200211190903.gAJ93mM15712@batty.ecr.mu.oz.au>
Mime-Version: 1.0
In-Reply-To: <200211190903.gAJ93mM15712@batty.ecr.mu.oz.au>; from longi@batty.ecr.mu.oz.au on Tue, Nov 19, 2002 at 08:03:48PM +1100
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
Date: Tue Nov 19 04:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 19, 2002 at 08:03:48PM +1100, James Longworth wrote:
> Hi,
> 
> I got your email address from the LVM man pages, hopefully I'm emailing
> the right person.
> 
> I have an LVM device that has lost its LVM data.

James,
how did that happen ?
Accidential overwrite or something (i.e. written an MBR) ?

> 
> The error I'm getting is vgscan -- ERROR "vg_read_with_pv_and_lv():
> current PV" can't get data of volume group "vg0" from physical volume(s)
> 
> I haven't tried recreating any of the devices because I didn't want to
> risk overwriting any data on the disks.
> 
> Can you point me at some documentation on rescuing an LVM partition, or
> if you have time, possibly give me some advice on where to start?

Use vgcfgrestore (presuming that /etc/lvmconf/vg0.conf still exists)
to restore the metadata to the physical volume(s).

First of all, please save all the hopefully still existing rest of the
LVM metadata by "dd if=/dev/YourPV of=YourPV.vgda bs=1k count=4k" and copy
that to backup media.
Insert _all_ your physical volume device pathes (i.e. /dev/hdb1) in sequence
for "YourPV".

To list which ones that were (presumably _no_ hardware reconfiguration happend):

# vgcfgrestore -ll -n vg0 -f /etc/lvmconf/vg0.conf

Do the actual restore:

# pvcreate -ff /dev/YourPV
# vgcfgrestore -n vg0 -f /etc/lvmconf/vg0.conf /dev/YourPV
# vgscan
# vgchange -ay

No you volume group should be back to life.
If more than just the LVM metadata area at the beginning of a PV has been
overwritten, you'll loose data (filesystem or whatever is in logical volumes)
too :(

> 
> It would be greatly appreciated.
> 
> James
> 
> -- 
> James Longworth
> longi@unimelb.edu.au
> (03) 8344-3361
> "Working for Melbourne University gives people real incentives to want
> things that nobody else wants."  -- Apologies to Andy Warhol.
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
