Message-Id: <199910151952.AA28793@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] lvmcreate_initrd
Date: Fri, 15 Oct 1999 21:52:32 METDST
In-Reply-To: <Pine.HPP.3.96.991015141634.18374A-100000@falstaff.ucs.indiana.edu>; from "theodore russell wickell" at Oct 15, 99 2:24 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: twickell@indiana.edu
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> I finally got my system to boot except for one problem. My ramdisk is too
> big! The lvmcreate_initrd tries to crete an initrd image of size 8192K but
> my ramdisks such as /dev/ram1 is only 4096K I believe. The library file
> libc.so.6 alone is 4017K. Am I doing something wrong? I have been trying
> to cut things out of my image to that It all will fit in the ramdisk at
> bootup. I trimmed out alot the device files that REdhat comes with by
> default which were in the lvmcreate_initrd script, but still it is around
> 5002K. Anyone know how to make a ramdisk such as /dev/ram1 which is size
> 8192? 
> 

Put an

append = "ramdisk_size=8192"

into your lilo.conf.

> The ramdisk image sizes I quoted are before gzip'ing because I figured
> that was what had to be able to fit in ram at bootup. It zips down to 1.8M
> but when unzipped at boot-time it overflows my ramdisk device.
> 

Regards,
Heinz

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
