From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lv_usr not updated after extention
Message-ID: <20031007153729.B25676@sistina.com>
References: <OFA250C8DB.F227705D-ONC1256DB4.002ACA22-C1256DB4.002C0295@itet.no>
Mime-Version: 1.0
In-Reply-To: <OFA250C8DB.F227705D-ONC1256DB4.002ACA22-C1256DB4.002C0295@itet.no>; from Runar.Ingebrigtsen@itet.no on Fri, Oct 03, 2003 at 09:59:35AM +0200
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
Date: Tue Oct  7 08:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: mge@sistina.com

Extending the Logical Volume doesn't automatically extend your filesystem.
Use the filesystem specific resizer, which might require unmounting the filesystem
(e.g. resize2fs for ext2/3 or resize_reiserfs for reiser).

Regards,
Heinz    -- The LVM Guy --

On Fri, Oct 03, 2003 at 09:59:35AM +0200, Runar Ingebrigtsen wrote:
> Hi,
> 
> My system is running with LVM and the VG's vg_system and vg_data.
> 
> Extending any partition in vg_data just works.
> Extending lv_swap in vg_system works.
> But the extended space never shows up in the /usr partition lv_usr! Look 
> yourself:
> 
> #df -h | grep usr
> /dev/vg_system/lv_usr   1.4G  1.3G   82M  95% /usr
> 
> # lvdisplay /dev/vg_system/lv_usr
> --- Logical volume ---
> LV Name         /dev/vg_system/lv_usr
> VG Name         vg_system
> LV Write Access read/write
> LV Status               available
> LV #                    3
> # open                  1
> LV Size                 4.09 GB
> Current LE              131
> Allocated LE            131
> Allocation              next free
> Read ahead sectors      1024
> Block device            58:3
> 
> How come? Is this caused by the /usr partition containing running system 
> files?
> If so, why does the change still not show up after a reboot?
> 
> Now, I would appreciate any help :) Thanks.
> 
> mvh Runar Ingebrigtsen
> 
>       -o)
>       /\\    Message void if penguin violated
>      _\_V    Don't mess with the penguin
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
