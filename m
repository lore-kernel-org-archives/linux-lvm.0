From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange with lvm_snapshot_fill_COW_page failed
Message-ID: <20021126122034.A28853@sistina.com>
References: <007001c29531$c63392c0$dc64a8c0@pcjeffrey>
Mime-Version: 1.0
In-Reply-To: <007001c29531$c63392c0$dc64a8c0@pcjeffrey>; from jvhout@van-boxtel-software.nl on Tue, Nov 26, 2002 at 10:54:11AM +0100
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
Date: Tue Nov 26 05:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 26, 2002 at 10:54:11AM +0100, Jeffrey van Hout - Van Boxtel Software BV wrote:
> Hi,
> 
> When we changed the physical position of the harddrives we were able to
> mount the existing volumegroup.
> 
> When we rechanged these drives to the original position and tried to
> activate the volume group with vhchange -a y we got the following error:

If you changed everything to the original io paths, that shouldn't
be the case :(

Anyway: LVM1 stores the physical addresses of snapshot exceptions
LVM2 is smarter ITR stroing logical addresses so that you can relocate drives
to different io paths without any problems.

If you are back to your _original_ paths and don't get your VG with snapshots
in up agian, you might need to run "vgscan -r" to remove the snapshots.
"vgscan -r" or "vgscan -remove_snapshots" is supported in LVM1 since LVM 1.0.3.

Regards,
Heinz    -- The LVM Guy --


> 
> 
> vgchange -ay
> vgchange -- ERROR "Bad address" activating volume group "lvmgroup1"
> .
> vm -- _pv_get_number failed for rdev = 65535
> lvm -- lvm_snapshot_fill_COW_page failed
> 
> (I tried:
> lvscan -D
> vgscan
> vgchange -a y)
> 
> Do you have any suggestions?
> 
> Regards,
> Jeffrey (jvhout@van-boxtel-sftware.nl)
> 
> 

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
