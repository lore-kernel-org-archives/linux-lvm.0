From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] bad vgexport/import
Message-ID: <20021203120817.A25172@sistina.com>
References: <B2C5CF6E-0615-11D7-9BB3-000393B2C740@po.cwru.edu>
Mime-Version: 1.0
In-Reply-To: <B2C5CF6E-0615-11D7-9BB3-000393B2C740@po.cwru.edu>; from tod@po.cwru.edu on Mon, Dec 02, 2002 at 11:47:09AM -0500
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
Date: Tue Dec  3 05:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 02, 2002 at 11:47:09AM -0500, Tod Detre wrote:
> I've been having troubles with one of my systems so I did a vgexport on 
> one of my volume groups in case I found part of the system to be 
> unrecoverable. When I got the system back online I tried to do a 
> vgimport, but it complained about the first disk not being in the same 
> group as the other disks. I looked at the pvscan output found that the 
> first disk did not appear to have been exported with the rest of the 
> disks. This could have been from the troubles I was originally having.

You don't know what exactly happend to your system any longer, do you ?
Anyway, let's try to fix it.

> 
> Well, I did some google searches and found someone with a similar 
> problem and he used lde (linux disk editor) to change the volume group 
> name to match the other disks, well, I tried changing the unexported 
> disk to be "exported" and it seems to have somewhat worked, but not 
> completely. I now get this error:
> 
> vgimport mirror /dev/hdc1 /dev/hde1 /dev/hdg1 /dev/hdi1 /dev/hdk1
> vgimport -- ERROR: only 5 physical volumes of 4 given for volume group 
> "mirror"

Well, the message is funny but your metadata now says that only 4 PVs
belong to the VG.
You need to patch the pv_cur member of the VG structure (should start at
offset 4k; see "pvdata -PP /dev/hdc1" and look for vg_on_disk.base;pv_cur is
at offset 156 into the structure which I assume to be 4 now) as well in
order to reflect the correct amount of 5 PVs. You need to patch pv_cur
on all 5 PVs.
Get back to me directly in case that doesn't help it.

> 
> any ideas on how to fix this?
> 
> --
> Tod Detre
> Unix Technical Support
> Case Western Reserve University
> usworkstation@po.cwru.edu
> 216-368-3060
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
