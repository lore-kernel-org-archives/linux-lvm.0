Date: Fri, 8 Sep 2000 00:02:53 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908000253.A23165@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <200009071825.MAA08578@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009071825.MAA08578@lynx.turbolabs.com>; from adilger@turbolinux.com on Thu, Sep 07, 2000 at 12:25:07PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: mge@sistina.com, linux-lvm@msede.com

On Thu, Sep 07, 2000 at 12:25:07PM -0600, Andreas Dilger wrote:
> Heinz,
> Michael Kellen and I have been working to add LILO support for booting
> from a LV (i.e. have /boot be an LV, and then not have ANY DOS partitions).

THX, that's good news :-{)

> 
> However, the main problem that we are having is that you cannot use
> an LV device major/minor to do anything with liblvm.  All of the liblvm
> functions use an LV name, it would be good to add an ioctl which takes
> a dev_t (e.g. 0x3a01) and returns an LV name, or maybe an lv_t which
> we can use with liblvm.

Actually you can achieve this by

	int l = int lv_get_index_by_kdev_t(vg_t * vg, kdev_t dev);

after reading the VG structure hierarchy pointed too by "vg" with

	int lvm_tab_vg_read_with_pv_and_lv(char * vg_name, vg_t ** vg);



After this you can access the lv_t structure of the LV by

	vg->lv[l]

and the LV name by

	vg->lv[l]->lv_name


> Along the same lines, it may be good to have
> an ioctl which takes a dev_t and returns a vg_t of the VG which this LV
> is a part of.

Please use

	int vg_status_with_pv_and_lv(char * vg_name, vg_t ** vg);

by inserting the VG name using the index you got like in the
lv_get_index_by_kdev_t() example

	vg_status_with_pv_and_lv(vg->lv[l]->vg_name, vg_t ** vg);


> Finally, it would be good to take the code out of lvm_map()
> which only does block/dev remapping (which lvm_map() will call), but
> which also be called by an ioctl like FIBMAP.

Yes, i can do that.

> 
> How this all fits together is:
> 
> 1) LILO gets the name of a kernel image (e.g. /boot/vmlinuz) and does stat()
>    on it to get the dev_t.
> 
> 2) LILO does FIBMAP ioctl for each block in the kernel image to find the
>    absolute block on the dev_t, and stores this into boot.map.

O.k.

> 
> We need to take the LV dev_t and map it to an lv_t.  Then after LILO does
> the FIMBAP on a file block (which returns an LV relative block number),
> we need to call a function (ioctl) with (lv_t, lv_block) to return the PV
> (dev_t, block), which will then be stored in the boot.map.  LILO needs
> the underlying dev_t, because this is translated into a BIOS drive number.
> 
> All of these things are relatively easy to do, but it is useless if it
> is not in the standard LVM code.  Mapping from a LV dev_t to an lv_t is
> simply checking MAJOR(dev) == LVM_MAJOR, return lv[MINOR(dev) + 1] or so.
> Doing the block remapping is already in lvm_map(), and just needs to be
> moved into a separate function that can be called via ioctl.
> 


So if i got you right and the use of the above mentioned library functions
serves your needs, the only change to the existing LVM software would be
in the driver to support an ioctl which returns a dev_t and block on a
PV given the LV dev_t and the relative block number.

I'ld recommend LV_MAP_LVA2PVA (Logical Volume MAP Logical Volume Address
to Physical Volume Address).


Question: how do you want to ensure that all kernel image blocks really
          are BIOS addressable? They could for eg. live on a MD or could be out
          of the BIOS addressable range of blocks.

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
