From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove: ERROR "pv_read(): device major number"
Message-ID: <20020604152042.D17699@sistina.com>
References: <20020604145334.A8663@babbage.hcsd.de>
Mime-Version: 1.0
In-Reply-To: <20020604145334.A8663@babbage.hcsd.de>; from au@hcsd.de on Tue, Jun 04, 2002 at 02:53:34PM +0200
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
Date: Tue Jun  4 08:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Stephan,

you seem to run LVM 1.1-rc1 as pvmove states which
had a flaw checking used devices.

Could you please either use LVM 1.1-rc2 or LVM 1.1 from top of CVS
(see instructions at www.sistina.com IRT CVS repository on how to check
that out) and tell me, if that works.

Please keep in mind that LVM 1.1 is unstable development software not meant
for production systems!

On Tue, Jun 04, 2002 at 02:53:34PM +0200, Stephan Austermuehle wrote:
> Hi,
> 
> using Kernel 2.4.18+XFS 1.1+LVM 1.1rc2+VFS lock I want to move an LV
> to a different PV to move the currently unprotected data to a mirrored
> device. I entered the following line as root (no su -):
> 
> 	# pvmove --version
> 	pvmove: Logical Volume Manager 1.1-rc1
> 	Heinz Mauelshagen, Sistina Software  15/03/2002 (IOP 10)
> 
> 	# pvmove /dev/vg00/lv_swap /dev/hda1 /dev/md0
> 	pvmove -- ERROR "pv_read(): device major number" reading source physical volume "/dev/vg00/lv_swap"
> 
> The mentioned LV is not in use.
> 
> Same problem with a native disk partition:
> 
> 	# pvmove /dev/vg00/lv_swap /dev/hda1 /dev/hdc1         
> 	pvmove -- ERROR "pv_read(): device major number" reading source physical volume "/dev/vg00/lv_swap"
> 
> The root file system is on an LV, too.
> 
> What's going on here?
> 
> Stephan
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
