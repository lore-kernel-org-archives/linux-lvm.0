Return-Path: <root@srv.sistina.com>
Date: Tue, 26 Jun 2001 01:09:29 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvcreate: possible problem near line 98 of lib/pv_get_size.c
Message-ID: <20010626010929.A23215@sistina.com>
References: <20010625100253.A2770@mallard.plaza.ds.adp.com>
Mime-Version: 1.0
In-Reply-To: <20010625100253.A2770@mallard.plaza.ds.adp.com>; from setha@plaza.ds.adp.com on Mon, Jun 25, 2001 at 10:02:53AM -0700
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
To: linux-lvm@sistina.com

Seth,

if you run LVM tools in a chroot environment without the necesarry /dev entries,
the segfault can happen.
I've put in a fix in order to avoid that segfault.

Nevertheless you *need* block device nodes for the devices you want to
use/access as physical volumes in /dev in order to run LVM tools successfully.

Regards,
Heinz    -- The LVM Guy --


On Mon, Jun 25, 2001 at 10:02:53AM -0700, Seth D. Alford wrote:
> I'm trying to install RedHat 7.1 onto a system which has no existing partitions.
> I want one of the filesystems to be an LVM volume.  I modified the RH 7.1
> BOOT kernel to include an lvm-mod.o, and I managed to get the LVM binaries
> included in the ramdisk itself.  When I try to run pvcreate, though, it
> gets a segmentation fault.
> 
> The partitions which RedHat is trying to create are in /mnt/sysimage.
> Part of my installation process runs chrooted in /mnt/sysimage.
> 
> The segfault is happening, I think, near line 98 of lib/pv_get_size.c.  I
> isolated it there by running pvcreate with the debug flag, both chrooted to
> /mnt/sysimage and not chrooted to /mnt/sysimage, while in ramdisk.  There's a
> for loop just before line 98.  The for loop looks at an st_rdev (which I think
> is a system call parameter) and tries to match it with a record in an array of
> records.  At line 98, the code references the matching array element.  I'm
> guessing, but in the non-chrooted environment, the for loop doesn't match any
> of the members of the array.  The index variable, i, is one greater than the
> size of the array.  The code proceeds to dereference with that value, anyway,
> and causes the segmentation fault.
> 
> Here's the fragment from pv_get_size.c where I think the problem happens:
> 
>          for ( i = 0; i < dir_cache_count; i++) {
>             if ( dir_cache[i].st_rdev == st_rdev)
>                break;
>          }
> 	
> 	 /* The above loop assumes that it exits with the break.
> 	 If it doesn't exit with the break, then i is one more
> 	 than the size of the array, which will cause a segmentation
> 	 fault. */
>          strncpy ( disk_dev_name, dir_cache[i].dev_name,
>                    sizeof ( disk_dev_name) - 1);
> 
> This is in 0.9.1_beta6 of LVM.  I would send you a core file, but
> the ramdisk environment doesn't allow for creation of core files.
> 
> --Seth
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
