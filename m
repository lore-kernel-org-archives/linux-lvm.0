Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 11:38:39 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Symbol not found when pvcreating...
Message-ID: <20010528113839.J26710@sistina.com>
References: <3B0E7C7C.E434D0AE@in.tum.de>
Mime-Version: 1.0
In-Reply-To: <3B0E7C7C.E434D0AE@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Fri, May 25, 2001 at 05:38:36PM +0200
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

David,

looks like a messy installation :-(

Did you try to remove and completely reinstall LVM based on a clean
compile/build run of the tools and library?


On Fri, May 25, 2001 at 05:38:36PM +0200, David Vidal Rodriguez wrote:
> Hi (again)!
> When running the CVS version of kernel+tools, the pvcreate utility
> requests the following symbol that apparently isn't present in the
> liblvm-10.so.0 library:
> int pv_check_partitioned_whole(char *pv_name)
> 
> (Error loading shared libraries... blahblah)
> An older version of pvcreate (I'm no sure if beta6 or less) does the job
> correctly.
> Do I have to change anything in the sources in order to get it working?

No.

> 
> Another --developer-- question:
> I've looked at the LVM code and a structure called partition, #include'd
> from <linux/genhd.h>, which contains the relevant information of a
> partition. What I don't understand is how to get this information from
> the kernel/drive (syscall, ioctl???). I'd be glad if somebody explained
> that to me briefly.

That's just needed for the generic disk interface.
It doesn't make any sense to create a partition table on a logical volume.

You could get the virtual geometry (which has nothing to do with the
underlying physical device(s)) of a logical volume though by doing
a block ioctl on its device like:


#include <stdio.h>
#include <fcntl.h>
#include <linux/hdreg.h>

int main ( int argc, char **argv) {
   int fd;
   struct hd_geometry hd;

   if ( ( fd = open ( argv[1], O_RDONLY)) == -1) return 1;

   ioctl ( fd, HDIO_GETGEO, &hd);
   close ( fd);
   printf ( "heads    : %d\n", hd.heads);
   printf ( "sectors  : %d\n", hd.sectors);
   printf ( "cylinders: %d\n", hd.cylinders);
   printf ( "start    : %d\n", hd.start);

   return 0;
}

> 
> Thanks!
> --
>   ------------------------------------------------------------------------
>  David Vidal R. (vidalrod <at> in DOT tum DOT de)
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
