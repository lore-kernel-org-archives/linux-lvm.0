Date: Fri, 15 Sep 2000 09:01:14 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: [linux-lvm] Re: [PATCH] align lv_on_disk.base to 512K blocks
Message-ID: <20000915090114.B15090@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20000914204833.A25390@ns.lst.de> <20000914214554.A29553@ns.lst.de>
Mime-Version: 1.0
In-Reply-To: <20000914214554.A29553@ns.lst.de>; from hch@ns.lst.de on Thu, Sep 14, 2000 at 09:45:54PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@ns.lst.de>
Cc: mge@sistina.com, linux-lvm@msede.com


Done.

How far are you with your driver enhancements?

Regards,
Heinz

On Thu, Sep 14, 2000 at 09:45:54PM +0200, Christoph Hellwig wrote:
> On Thu, Sep 14, 2000 at 08:48:33PM +0200, Christoph Hellwig wrote:
> > Hi Heinz,
> > 
> > this patch makes vgcreate align the lv structures to 512K on disk,
> > this makes reading them from kernel using bread much easier.
> > 
> > Could you apply it to 0.9?
> > 
> > 	Christoph
> 
> Sorry, forgot to attach the patch ;)
> 
> Here it is:
> 
> 	Christoph
> 
> -- 
> Always remember that you are unique.  Just like everyone else.
> 
> 
> --- vg_setup_for_create.c~	Thu Sep 14 19:30:11 2000
> +++ vg_setup_for_create.c	Thu Sep 14 19:30:22 2000
> @@ -43,6 +43,7 @@
>     int ret = 0;
>     uint pe_total = 0;
>     ulong rest = 0;
> +   ulong size = 0;
>  
>  #ifdef DEBUG
>     debug_enter ( "vg_setup_for_create -- CALLED\n");
> @@ -89,8 +90,11 @@
>        vg->pv[p]->vg_on_disk.size = LVM_VG_DISK_SIZE;
>        vg->pv[p]->pv_namelist_on_disk.base = LVM_PV_NAMELIST_DISK_BASE;
>        vg->pv[p]->pv_namelist_on_disk.size = ( max_pv + 1) * NAME_LEN;
> -      vg->pv[p]->lv_on_disk.base = vg->pv[p]->pv_namelist_on_disk.base +
> -                                   vg->pv[p]->pv_namelist_on_disk.size;
> +      
> +      size = vg->pv[p]->pv_namelist_on_disk.base + vg->pv[p]->pv_namelist_on_disk.size;
> +      vg->pv[p]->lv_on_disk.base = (size / SECTOR_SIZE) * SECTOR_SIZE;
> +      if (size % SECTOR_SIZE)
> +         vg->pv[p]->lv_on_disk.base += SECTOR_SIZE;
>        vg->pv[p]->lv_on_disk.size = ( max_lv + 1) * sizeof ( lv_t);
>        LVM_PE_ON_DISK_BASE ( vg->pv[p]);
>        strcpy ( vg->pv[p]->vg_name, vg->vg_name);

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
