Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Mon, 15 Jan 2001 16:25:23 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] hard-lock seems to have caused serious LVM problems
Message-ID: <20010115162523.A31019@srv.t-online.de>
References: <20010115100048.B23471@yendi.dmeyer.net>
Mime-Version: 1.0
In-Reply-To: <20010115100048.B23471@yendi.dmeyer.net>; from dmeyer@dmeyer.net on Mon, Jan 15, 2001 at 10:00:48AM -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@Sistina.com

On Mon, Jan 15, 2001 at 10:00:48AM -0500, dmeyer@dmeyer.net wrote:
> Thanks to help from Jan Niehusmann, I have more information, now.
> After applying this patch:
> 
> > The following patch from Jan (with a minor correction "against" segfaults :-)
> > corrected the problem for me:
> ------------------------------------------------------------------------------
> *** pv_read_all_pv_of_vg.c.orig	Mon Nov 20 03:47:20 2000
> --- pv_read_all_pv_of_vg.c.patched	Sat Jan 13 18:31:00 2001
> ***************
> *** 101,117 ****
>         for ( p = 0; pv_tmp[p] != NULL; p++) {
>            if ( strncmp ( pv_tmp[p]->vg_name, vg_name, NAME_LEN) == 0) {
>               pv_this_sav = pv_this;
>               if ( ( pv_this = realloc ( pv_this,
> !                                        ( np + 2) * sizeof ( pv_t*))) == NULL) {
>                  fprintf ( stderr, "realloc error in %s [line %d]\n",
>                                    __FILE__, __LINE__);
>                  ret = -LVM_EPV_READ_ALL_PV_OF_VG_MALLOC;
>                  if ( pv_this_sav != NULL) free ( pv_this_sav);
>                  goto pv_read_all_pv_of_vg_end;
>               }
> !             pv_this[np] = pv_tmp[p];
> !             pv_this[np+1] = NULL;
> !             np++;
>            }
>         }
>   
> --- 101,117 ----
>         for ( p = 0; pv_tmp[p] != NULL; p++) {
>            if ( strncmp ( pv_tmp[p]->vg_name, vg_name, NAME_LEN) == 0) {
>               pv_this_sav = pv_this;
> + 	    if ( np < pv_tmp[p]->pv_number) np = pv_tmp[p]->pv_number;
>               if ( ( pv_this = realloc ( pv_this,
> !                                        ( np + 1) * sizeof ( pv_t*))) == NULL) {
>                  fprintf ( stderr, "realloc error in %s [line %d]\n",
>                                    __FILE__, __LINE__);
>                  ret = -LVM_EPV_READ_ALL_PV_OF_VG_MALLOC;
>                  if ( pv_this_sav != NULL) free ( pv_this_sav);
>                  goto pv_read_all_pv_of_vg_end;
>               }
> ! 	    pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
> !             pv_this[np] = NULL;
>            }
>         }
>   
> vgscan stopped giving me an error.  Unfortunately, it stopped
> mentioning my second VG (named misc_vg) at all :-(.
> 
> misc_vg has 5 PVs, /dev/{hdb1,hdb5,hdb6,sda1,sda2}.  It turns out,
> vgscan was ignoring misc_vg because it didn't think all the PVs were
> online.  It was reading the uuid list from /dev/sda1, and /dev/sda1
> only had 4 PVs in it's uuid list.  Commenting out the block of code in
> pv_read_all_pv_of_vg.c that starts with "if (uuids > 0) {" fixes the
> problem, though I kind of doubt that it's the right fix.
> 
> Does the following seem right?

No.
Every PV is assumed to hold all the PV UUIDs of all PVs in the volume group
the PV belongs to.

I am going to check, if there's any obvious reason that the array is screwed...

> # pvdata -U /dev/hdb1 /dev/hdb5 /dev/hdb6 /dev/sda1 /dev/sda2
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: --- EMPTY ---
> 002: --- EMPTY ---
> 003: --- EMPTY ---
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: --- EMPTY ---
> 003: --- EMPTY ---
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: 931SNJ6F66g3n3qA9Nts3r4jqe4TOHW8
> 003: --- EMPTY ---
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: 931SNJ6F66g3n3qA9Nts3r4jqe4TOHW8
> 003: m2wuLpJ9AQmzXnbk4sCuQu8hjAev7pax
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: 931SNJ6F66g3n3qA9Nts3r4jqe4TOHW8
> 003: m2wuLpJ9AQmzXnbk4sCuQu8hjAev7pax
> 004: fdNejQ2DAp9A8KN0UrePxscwoY8vqVSu
> 
> Each PV only has the uuids from the PVs before it.  Should each PV
> have the complete list of uuids in its VG (in which case there's
> something screwy with my PVs)?  Or did pv_read_all_pv_of_vg somehow
> pick the wrong PV to read the uuid list from?  Or something else?
> 
>      Dave
>      
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
