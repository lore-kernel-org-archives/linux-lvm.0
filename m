From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Cannot create an lvm.
Message-ID: <20020827091053.A20836@sistina.com>
References: <000001c24d67$78d30220$3200a8c0@warl0k>
Mime-Version: 1.0
In-Reply-To: <000001c24d67$78d30220$3200a8c0@warl0k>; from warl0k@lvcm.com on Mon, Aug 26, 2002 at 06:17:06PM -0700
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
Date: Tue Aug 27 02:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Glenn,

I guess you are not using devfs and your /dev/ nodes for the
LVM devices might be wrong.

Please run "vgmknodes;vgchange -ay" and retry to create your LV in VG "mass".

BTW: you should better try LVM2 (our new development code base) rather than
     LVM1.1, which has been an interim development version. In case you need
     to stick with version 1, please take the recent 1.0.5 production version.

Regards,
Heinz    -- The LVM Guy --


On Mon, Aug 26, 2002 at 06:17:06PM -0700, Glenn Shannon wrote:
>  
> Hi all.
> 
> I am having a problem creating a new LVM on my system.
> 
> I currently have one on there, and am trying to replace it with a
> bigger set of drives.
> 
> It is failing when I go to lvcreate a logical volume.
> 
> Vgdisplay reports:
> 
> root@warlock:~# vgdisplay
> --- Volume group ---
<SNIP>
> VG UUID               NxrOxe-GXEF-Cslo-D3NH-oXBg-mlxu-jsqdMo
> 
> 
> root@warlock:~# vgdisplay --version
> vgdisplay: Logical Volume Manager 1.1-rc2
> Heinz Mauelshagen, Sistina Software  23/04/2002 (IOP 10)
> 
> root@warlock:~#
> 
> root@warlock:~# dmesg|grep LVM
> LVM version 1.1-rc2(23/04/2002)
> root@warlock:~#
> 
> 
> 
> 
> 
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
