Return-Path: <jay@lazy.accessus.net>
Date: Wed, 29 Nov 2000 11:22:15 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: RE: [linux-lvm] lvm 0.9 kernel build problems
In-Reply-To: <OLEAJMNOEMOMMNEIMMINIENLCBAA.pswartz@digitalrom.com>
Message-ID: <Pine.OSF.4.21.0011291121240.18343-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ah thats' it.  Now my brain kicks in since you mentioned it.  That failure
from earlier only happens when you don't enable LVM proc-fs option.  I
guess it's a bug.  That's what I had todo.

On Wed, 29 Nov 2000, Patrick Swartz wrote:

> I have found a way around the problem I was having.  The first time I tried
> to build the kernel I built lvm into the kernel, but I said "no" to the lvm
> proc fs question.  This time I went ahead and said "yes" and everything
> worked.
> Now my question is having lvm report things to /proc will I notice any slow
> downs?
> Just courious.
> 
> Thanks for all of the hard work everyone is putting into lvm!!!!!!!
> 
> Patrick
> 
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Jay Weber
> Sent: Wednesday, November 29, 2000 9:42 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvm 0.9 kernel build problems
> 
> 
> I had the same errors in past when compiling it on 2.2.18pre kernels.
> I believe my problem was that my /usr/src/linux didn't point back to the
> proper kernel source tree.  It was a while ago though, but I'm thinking
> that solved it for me.  I believe one of the files included in lvm.c is a
> <linux/*whatever*> and that didn't exist or have the proper struct or
> such.
> 
> On Wed, 29 Nov 2000, Patrick Swartz wrote:
> 
> > Hello,
> >
> > Could someone give me some hints to why I get the following error when
> > trying to build my kernel with the lvm 0.9patches.  This box started out
> as
> > a RH7.0 with all current RH updates, then installed the stock 2.4.0-test10
> > kernel with lvm built into the kernel.  This build worked.  I then applied
> > the two patches for 2.4.0-test10 and they applied cleanly.  I normally
> build
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
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
