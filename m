Message-Id: <9902130131.AA01815@mailgate99.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Snapshot compile...
Date: Sat, 13 Feb 1999 2:30:38 MET
In-Reply-To: <4.1.19990212192108.00958d40@mail.msy.bellsouth.net>; from "Daniel Whicker" at Feb 12, 99 7:23 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
Reply-To: linux-lvm@msede.com
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: mge@ts1.ez-darmstadt.telekom.de

> 
> Heinz,
> I was able to get the kernel compiled fine.  Ran into a problem compiling
> the modules, though.  I think that it may be due to attempting to compile
> it under a 2.0.36 kernel as opposed to a 2.2.0 kernel, but I'm unsure.
> Here's the output:
> ----------------------------------------------------------------------------
> --------------------------------------------
> [root@Bifrost linux]# make modules
> make[1]: Entering directory `/usr/src/linux-2.0.36/kernel'
> make[1]: Nothing to be done for `modules'.
> make[1]: Leaving directory `/usr/src/linux-2.0.36/kernel'
> make[1]: Entering directory `/usr/src/linux-2.0.36/drivers'
> set -e; for i in block char net  scsi sound cdrom isdn; do make -C $i
> modules; done
> make[2]: Entering directory `/usr/src/linux-2.0.36/drivers/block'
> updating /usr/src/linux-2.0.36/include/linux/modversions.h
> gcc -D__KERNEL__ -I/usr/src/linux-2.0.36/include -Wall -Wstrict-prototypes
> -O2 -fomit-frame-pointer -fno-strength-reduce -pipe -m386 -DCPU=386
> -DMODULE -DMODVERSIONS -include
> /usr/src/linux-2.0.36/include/linux/modversions.h  -c -o loop.o loop.c
> gcc -D__KERNEL__ -I/usr/src/linux-2.0.36/include -Wall -Wstrict-prototypes
> -O2 -fomit-frame-pointer -fno-strength-reduce -pipe -m386 -DCPU=386
> -DMODULE -DMODVERSIONS -include
> /usr/src/linux-2.0.36/include/linux/modversions.h  -c -o lvm.o lvm.c
> lvm.c:250: `LVM_DRIVER_IOP_VERSION' undeclared here (not in a function)
> lvm.c:336: warning: excess elements in struct initializer after `lvm_gendisk'
> lvm.c:1363: `inode' undeclared here (not in a function)
> lvm.c:1363: initializer element is not constant
> lvm.c:1364: `inode' undeclared here (not in a function)
> lvm.c:1364: initializer element is not constant
> lvm.c:1367: variable-size type declared outside of any function
> lvm.c:1367: variable-sized object may not be initialized
> lvm.c:1367: warning: data definition has no type or storage class
> lvm.c:1371: parse error before `return'
> make[2]: *** [lvm.o] Error 1
> make[2]: Leaving directory `/usr/src/linux-2.0.36/drivers/block'
> make[1]: *** [modules] Error 2
> make[1]: Leaving directory `/usr/src/linux-2.0.36/drivers'
> make: *** [modules] Error 2

Did you copy LVM/0.6alpha/kernel/lvm.h to /usr/src/linux/include/linux/lvm.h
and LVM/0.6alpha/kernel/lvm.c to /usr/src/linux/drivers/block/lvm.c to
compile the kernel parts?

Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
