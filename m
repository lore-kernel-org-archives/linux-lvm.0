From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] kernel-Oops in 2.4.19 with LVM-1.0.5 + devfs
Message-ID: <20020814125258.A3448@sistina.com>
References: <20020814150744kaoru@rifu.bsd.tnes.nec.co.jp>
Mime-Version: 1.0
In-Reply-To: <20020814150744kaoru@rifu.bsd.tnes.nec.co.jp>; from kaoru@bsd.tnes.nec.co.jp on Wed, Aug 14, 2002 at 03:07:44PM +0900
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
Date: Wed Aug 14 06:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Kaoru,

thanks for pointing this one out :)

It is the only occurence where we forgot to store the return value.
Patch looks correct to me.
Will integrate and test...
Soon to be in CVS in branch LVM_BRANCH_1-0.

Regards,
Heinz    -- The LVM Guy --

On Wed, Aug 14, 2002 at 03:07:44PM +0900, kaoru@bsd.tnes.nec.co.jp wrote:
> Hi,
> 
> When I executed the following commands, I get oops 
> running under 2.4.19-rc3 kernel with LVM-1.0.5 + devfs.
> 
> # lvrename /dev/vg11/lv11_01 /dev/vg11/lv11_01new
> # vgdisplay -v vg11
> 
> I executed "cat /proc/partitions" instead of "vgdisplay",
> oops occurred, too. 
> 
> I think that the cause of this is the return value of 
> lvm_fs_create_lv() is ignored which is called within 
> a lvm_do_lv_rename function.
> 
> I made the following patch for this problem, and it seems 
> to work. Any comments? 
> 
> ---8<-----------8<----------8<----------8<----------8<----------
> 
> --- linux/drivers/md/lvm.c.orig  Fri Aug  2 08:51:06 2002
> +++ linux/drivers/md/lvm.c       Fri Aug  2 08:50:48 2002
> @@ -2710,6 +2710,7 @@
>                 {
>                         lvm_fs_remove_lv(vg_ptr, lv_ptr);
>                         strncpy(lv_ptr->lv_name, lv_req->lv_name, NAME_LEN);
> +                       lvm_gendisk.part[MINOR(lv_ptr->lv_dev)].de =
>                         lvm_fs_create_lv(vg_ptr, lv_ptr);
>                         break;
>                 }
> 
> ---8<-----------8<----------8<----------8<----------8<----------
> 
> --------------------
> Kaoru
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
