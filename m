Return-Path: <falcon_lvm@yahoo.com>
Message-ID: <005c01c05a4d$ee072080$a56cfea9@miguel>
From: "Falcon" <falcon_lvm@yahoo.com>
References: <OLEAJMNOEMOMMNEIMMINMENJCBAA.pswartz@digitalrom.com> <20001129211909.C26635@srv.t-online.de>
Subject: Re: [linux-lvm] lvm 0.9 kernel build problems
Date: Wed, 29 Nov 2000 22:47:09 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: mge@sistina.com

You must to change gcc by kgcc in the Makefile
----- Original Message -----
From: "Heinz J. Mauelshagen" <Heinz.Mauelshagen@t-online.de>
To: <linux-lvm@sistina.com>
Cc: <mge@sistina.com>
Sent: Wednesday, November 29, 2000 10:19 PM
Subject: Re: [linux-lvm] lvm 0.9 kernel build problems


>
> I guess that this could be a nasty gcc flaw showing up here.
>
> Anybody else who tried to patch/compile LVM 0.9 with linux-2.4.0-test10
> on RH 7.0 who is able to help?
>
>
> On Wed, Nov 29, 2000 at 09:05:32AM -0600, Patrick Swartz wrote:
> > Hello,
> >
> > Could someone give me some hints to why I get the following error when
> > trying to build my kernel with the lvm 0.9patches.  This box started out
as
> > a RH7.0 with all current RH updates, then installed the stock
2.4.0-test10
> > kernel with lvm built into the kernel.  This build worked.  I then
applied
> > the two patches for 2.4.0-test10 and they applied cleanly.  I normally
build
> > kernels using the following approach -- make dep clean bzImage modules
> > modules_install, then take care of lilo.  This error happens during the
> > bzImage stage.
> >
> >
> > lvm.c: In function `lvm_do_vg_extend':
> > lvm.c:2020: warning: implicit declaration of function
> > `lvm_do_create_proc_entry_
> > of_pv'
> > lvm.c: In function `lvm_do_create_proc_entry_of_lv':
> > lvm.c:3012: `pde' undeclared (first use in this function)
> > lvm.c:3012: (Each undeclared identifier is reported only once
> > lvm.c:3012: for each function it appears in.)
> > lvm.c: At top level:
> > lvm.c:3040: warning: type mismatch with previous implicit declaration
> > lvm.c:2020: warning: previous implicit declaration of
> > `lvm_do_create_proc_entry_
> > of_pv'
> > lvm.c:3040: warning: `lvm_do_create_proc_entry_of_pv' was previously
> > implicitly
> > declared to return `int'
> > lvm.c: In function `lvm_do_create_proc_entry_of_pv':
> > lvm.c:3046: `pde' undeclared (first use in this function)
> > lvm.c: At top level:
> > lvm.c:146: warning: `lvm_short_version' defined but not used
> > make[3]: *** [lvm.o] Error 1
> > make[3]: Leaving directory `/usr/src/linux-2.4.0-test10/drivers/md'
> > make[2]: *** [first_rule] Error 2
> > make[2]: Leaving directory `/usr/src/linux-2.4.0-test10/drivers/md'
> > make[1]: *** [_subdir_md] Error 2
> > make[1]: Leaving directory `/usr/src/linux-2.4.0-test10/drivers'
> > make: *** [_dir_drivers] Error 2
> >
> > Thanks for your help,
> >
> > Patrick Swartz
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>
> --
>
> Regards,
> Heinz      -- The LVM guy --
>
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Bartningstr. 12
>                                                   64289 Darmstadt
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 6151 7103 86
>                                                        FAX 7103 96
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
