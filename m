From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What command do I use to make a PV active?
Message-ID: <20030704134905.A28295@sistina.com>
References: <20030703165707.LXFV15998.imf16aec.bellsouth.net@tiger2>
Mime-Version: 1.0
In-Reply-To: <20030703165707.LXFV15998.imf16aec.bellsouth.net@tiger2>; from freemyer@NorcrossGroup.com on Thu, Jul 03, 2003 at 01:05:43PM -0400
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
Date: Fri Jul  4 06:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jul 03, 2003 at 01:05:43PM -0400, Greg Freemyer wrote:
>  
> Somehow I inactived a PV

Hmm, there's no direct (in)activation of PVs.
A bit strange, that both are in diffrent states (they should be either inactive
in case the VG is or both active in case the VG got activated).

> 
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sda3" of VG "TruStore-Data" [53.63 GB / 48.63 GB free]
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "TruStore-Data" [74.54 GB / 13.54 GB free]
> pvscan -- total: 2 [128.19 GB] / in use: 2 [128.19 GB] / in no VG: 0 [0]
> 
> What command do I use to make it active?

If the VG "TruStore-Data" is inactive, "vgchange -ay TruStore-Data" should turn
/dev/sda3 active as well.

Is "TruStore-Data" accessable fine (LVs ok) ?

> 
> Thanks
> Greg
> -- 
> Greg Freemyer
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
