Date: Mon, 20 Mar 2000 10:53:13 -0600 (CST)
From: Michael Bartosh <bartosh@ocean.tamu.edu>
Subject: Re: [linux-lvm] tools make error?
In-Reply-To: <200003201642.RAA09501@e35.marxmeier.com>
Message-ID: <Pine.OSF.4.02.10003201051260.477644-100000@ocean.tamu.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: linux-lvm@msede.com


I thought I applied the patch correctly.

cp'd it to the LVM dir and did a 'cat filename | patch -p0'

Anyway made the other change to liblvm.h and all tools compiled and worked
:-)



On Mon, 20 Mar 2000, Michael Marxmeier wrote:

> > On Mon, 20 Mar 2000, Michael Marxmeier wrote:
> > > > I have 0.8final compiled (w/ patch) into kernel, but am getting the
> > > > following when I try to make the new tools. What's up?
> > > 
> > > Known problem.
> > > 
> > > You need to apply patch
> > > patch-lvm_0.8final-2    - patch against LVM 0.8final user mode tools
> > 
> > Cool! Patch applied correctly. Still getting a different err though (see
> > below)
> > ...
> > In file included from /root/LVM/0.8final/tools/lvm_user.h:44,
> >                  from e2fsadm.c:45:
> > /root/LVM/0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or
> 
> Did you apply the patch correctly?
> It should replace gnu/types.h with sys/types.h in lib/liblvm.h.
> 
> I just check the patch and it looks correct.
> 
> --- 0.8final/tools/lib/liblvm.h.orig    Tue Feb 22 03:51:00 2000
> +++ 0.8final/tools/lib/liblvm.h Tue Feb 22 03:54:36 2000
> @@ -47,7 +47,7 @@
>  #  include <linux/version.h>
>  #endif
>  
> -#include <gnu/types.h>
> +#include <sys/types.h>
>  
>  #include <sys/stat.h>
> 
> 
> Michael
> 
> --
> Michael Marxmeier           Marxmeier Software AG
> E-Mail: mike@msede.com      Besenbruchstrasse 9
> Phone : +49 202 2431440     42285 Wuppertal, Germany
> Fax   : +49 202 2431420     http://www.msede.com/
> 
