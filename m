From: stk@rmi.de
Message-Id: <200004260937.LAA23751@musashi.stan.de>
Date: Wed, 26 Apr 2000 11:37:52 +0200 (CEST)
Subject: Re: [linux-lvm] Tools - Compile Problem
In-Reply-To: <20000425110435.A8218@colombina.comedia.it>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bluca@comedia.it
Cc: linux-lvm@msede.com, rgooch@atnf.csiro.au

Hello Luca,

thanks for your thoughts.
Meanwhile i have got the user tools to compile.

I added your #ifdef statement in /usr/include/devfs_kernel.h , 
and additionnally  i needed to add the following :

in /usr/include/linux/genhd.h

 #ifdef __KERNEL__
 #include <linux/devfs_kernel.h>
 #endif /* __KERNEL__ */

and in 0.8final/tools/lib/liblvm.h

 typedef struct devfs_entry * devfs_handle_t;

with this changes the user tools compiled cleanly,
but I still need to check the functionality - which
will happen early next week, when i return from a short
trip.

thanx and
best regards

Stefan



On 25 Apr, Luca Berra wrote:
> This is a problem with devfs, i believe.
> Actually it is due to kernel includes residing into /usr/include
> where they should not be.
> 
> anyway i addedd 
> #ifdef __KERNEL__
> and
> #endif  /*  __KERNEL__  */
> at the beginning and end of /usr/include/linux/devfs_fs_kernel.h
> 
> i CCed Richard Gooch, author of devfs so maybe he can comment on this
> 
> Regards,
> Luca
> 
> On Tue, Apr 25, 2000 at 12:44:26AM +0200, stk@rmi.de wrote:
>> Hello,
>> 
>> i have problems compiling the user space tools from lvm0.8final,
>> I have already applied patch-lvm_0.8final-2 cleanly.

-- 
 Stefan K                                       email:     stk@rmi.de
 Aix-la-Chapelle                                fax/data: +49-241-533353
