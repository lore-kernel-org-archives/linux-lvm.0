From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003221151.MAA07591@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: LVM kernel patch request
In-Reply-To: <38D880C1.FD5131F5@randmeer.nl> from Manfred Martin at "Mar 22, 2000  9:13:53 am"
Date: Wed, 22 Mar 2000 12:51:18 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Manfred Martin <mmn@randmeer.nl>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Please change the "lv" in line 934 to "lv_ptr" and retry.
(Somebody changed my code there and didn't tell me directly)

Heinz

> Hi,
> 
> Due to my pIII 500 the kernels 2.3.47-2.3.50 didnt work
> 
> Now i run 2.3.99-pre2 but when compiling the modules it complains about
> lvm...
> Know how to fix this?
> 
> make -C block modules
> make[2]: Entering directory `/usr/src/linux-2.3.99-2/drivers/block'
> gcc -D__KERNEL__ -I/usr/src/linux-2.3.99-2/include -Wall
> -Wstrict-prototypes -O2 -fomit-frame-pointer -pipe   -DCPU=686
> -march=i686 -fno-strict-aliasing -DMODULE   -c -o lvm.o lvm.c
> lvm.c: In function `lvm_blk_ioctl':
> lvm.c:934: `lv' undeclared (first use in this function)
> lvm.c:934: (Each undeclared identifier is reported only once
> lvm.c:934: for each function it appears in.)
> lvm.c:934: warning: `__ret_pu' might be used uninitialized in this
> function
> /usr/src/linux-2.3.99-2/include/linux/blk.h: At top level:
> /usr/src/linux-2.3.99-2/include/linux/blk.h:444: warning: `end_request'
> defined but not used
> make[2]: *** [lvm.o] Error 1
> make[2]: Leaving directory `/usr/src/linux-2.3.99-2/drivers/block'
> make[1]: *** [_modsubdir_block] Error 2
> make[1]: Leaving directory `/usr/src/linux-2.3.99-2/drivers'
> make: *** [_mod_drivers] Error 2
> 
> 
> scripts/ver_linux :
> -- Versions installed: (if some fields are empty or look
> -- unusual then possibly you have very old versions)
> Linux ns1 2.3.51 #2 Mon Mar 20 13:25:04 CET 2000 i686 unknown
> Kernel modules         2.1.121
> Gnu C                  egcs-2.91.66
> Binutils               2.9.1.0.24
> Linux C Library        2.1.2
> Dynamic linker         ldd (GNU libc) 2.1.2
> Procps                 2.0.4
> Mount                  2.9u
> Net-tools              1.53
> Console-tools          1999.03.02
> Sh-utils               2.0
> Modules Loaded         hp100
> 
> 
> 
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
