From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange error code -22
Message-ID: <20011114113139.A16026@sistina.com>
References: <01111415112606.02444@nerds>
Mime-Version: 1.0
In-Reply-To: <01111415112606.02444@nerds>; from frode@gangstah.net on Wed, Nov 14, 2001 at 03:11:26PM +0100
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
Date: Wed Nov 14 04:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 14, 2001 at 03:11:26PM +0100, Frode Ulsund wrote:
> Hi there!
> 
> I have read all the documentation in the LVM-package, but
> i can't find a sollution to my problem in the HOW-TOs.
> 
> I run kernel 2.4.13 with Slackware 8.0. I tried to patch the rc.S with the 
> LVM-patch, but it looks like the patch is allready applied in the 
> distribution.

Frode,

I don't understand which LVM chnges you applied to your system.
Did you install new LVM tools and library but didn't patch the kernel
with the LVM driver as described in PATCHES/README?

Regards,
Heinz    -- The LVM Guy --


> 
> When i run  : vgchange -v -d -a y i get the following output, but I don't 
> really know what the problem is.
> 
> Any help is aprichiated.
> 
> .....
> Frode Ulsund
> -----------------------------------------------------------------
> <333> vg_check_name -- vg_name: "vg01"
> <4444> lvm_check_chars -- CALLED with name: "vg01"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_check_consistency -- LEAVING with ret: 0
> <1> vg_create_remove -- IOCTL
> <1> vg_create_remove -- IOCTL returned: -22
> <1> vg_create_remove -- LEAVING with ret: -22
> <> vgchange -- vg_create returned: -22
> <1> lvm_error -- CALLED with: -22
> <1> lvm_error -- LEAVING with: "Invalid argument"
> vgchange -- ERROR "Invalid argument" activating volume group "vg01"
> <1> vg_free -- CALLED
> <1> vg_free -- entering PV loop
> <1> vg_free -- entering LV loop
> <1> vg_free -- LEAVING with ret: 0
> vgchange -- unlocking logical volume manager
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: -104
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
