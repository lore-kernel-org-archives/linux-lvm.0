From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003201620.RAA02569@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] tools make error?
In-Reply-To: <Pine.OSF.4.02.10003201004080.477644-100000@ocean.tamu.edu> from Michael Bartosh at "Mar 20, 2000 10: 5:59 am"
Date: Mon, 20 Mar 2000 17:20:38 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Michael Bartosh <bartosh@ocean.tamu.edu>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> 
> On Mon, 20 Mar 2000, Michael Marxmeier wrote:
> 
> > > I have 0.8final compiled (w/ patch) into kernel, but am getting the
> > > following when I try to make the new tools. What's up?
> > 
> > Known problem.
> > 
> > You need to apply patch
> > patch-lvm_0.8final-2    - patch against LVM 0.8final user mode tools
> 
> 
> Cool! Patch applied correctly. Still getting a different err though (see
> below)
> 
> Thanks for your help!
> 
> -mab
> 
> err:
> 
> cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/root/LVM/0.8final/tools/lib
> -I/root/LVM/0.8final/tools -o e2fsadm.o e2fsadm.c
> In file included from /root/LVM/0.8final/tools/lvm_user.h:44,
>                  from e2fsadm.c:45:
> /root/LVM/0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or
> directory

This is a GLIBC 2.0/2.1 related problem.
Please change "gnu/types.h" to "linux/types.h" and retry.

Heinz

> make[2]: *** [e2fsadm.o] Error 1
> make[2]: Leaving directory `/LVM/0.8final/tools'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/LVM/0.8final/tools'
> make: *** [all] Error 2
> root@heretic:/LVM/0.8final > 
> 
> > 
> > For more inormation please refer to
> > ftp://linux.msede.com/lvm/v0.8final/BUGS
> > 
> > 
> > Hope this helps
> > Michael
> > 
> > --
> > Michael Marxmeier           Marxmeier Software AG
> > E-Mail: mike@msede.com      Besenbruchstrasse 9
> > Phone : +49 202 2431440     42285 Wuppertal, Germany
> > Fax   : +49 202 2431420     http://www.msede.com/
> > 
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
