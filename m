From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcfgrestore error !
Message-ID: <20011120121947.B18529@sistina.com>
References: <3BF8E5DE.ABAEB618@LTUtech.com> <20011119125632.A12388@sistina.com> <3BF8F8BF.3FE1491C@LTUtech.com> <20011119151746.A13040@sistina.com> <3BF923C3.A2060FDD@LTUtech.com>
Mime-Version: 1.0
In-Reply-To: <3BF923C3.A2060FDD@LTUtech.com>; from Igor.Dumaire@LTUtech.com on Mon, Nov 19, 2001 at 04:22:43PM +0100
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
Date: Tue Nov 20 05:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 19, 2001 at 04:22:43PM +0100, Igor Dumaire wrote:
> > 
> > I overlooked the 'active VG' message vgcfgrestore is displaying.
> > Because 'vgchange -an lvm1' wont't work in your situation I am afraid you need
> > to reboot before being able to run vgcfgrestore successfully.
> > 
> After the reboot vgcfgrestore doesn't work !
> 
> # vgchange -an lvm1
> vgchange -- volume group "lvm1" does not exist
> 
> # vgcfgrestore  -n lvm1  /dev/hde1
> vgcfgrestore -- can't restore part of active volume group "lvm1"

Strange.
Please provide "vgdisplay -v;pvscan;lvmdiskscan" and "pvdata -PP" for all
PVs belonging to the missing VG.

Thanks,
Heinz    -- The LVM Guy --

> 
> What do I do ?
> 
> Regards,
> -- 
> Igor Dumaire
> 
> www.LTUtech.com - Making Sense of Visual Content
> ------------------------------------------------
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
