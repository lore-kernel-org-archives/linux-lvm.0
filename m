Date: Mon, 20 Mar 2000 10:05:59 -0600 (CST)
From: Michael Bartosh <bartosh@ocean.tamu.edu>
Subject: Re: [linux-lvm] tools make error?
In-Reply-To: <200003200920.KAA03049@e35.marxmeier.com>
Message-ID: <Pine.OSF.4.02.10003201004080.477644-100000@ocean.tamu.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: linux-lvm@msede.com



On Mon, 20 Mar 2000, Michael Marxmeier wrote:

> > I have 0.8final compiled (w/ patch) into kernel, but am getting the
> > following when I try to make the new tools. What's up?
> 
> Known problem.
> 
> You need to apply patch
> patch-lvm_0.8final-2    - patch against LVM 0.8final user mode tools


Cool! Patch applied correctly. Still getting a different err though (see
below)

Thanks for your help!

-mab

err:

cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8final/tools -o e2fsadm.o e2fsadm.c
In file included from /root/LVM/0.8final/tools/lvm_user.h:44,
                 from e2fsadm.c:45:
/root/LVM/0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or
directory
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/LVM/0.8final/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/LVM/0.8final/tools'
make: *** [all] Error 2
root@heretic:/LVM/0.8final > 

> 
> For more inormation please refer to
> ftp://linux.msede.com/lvm/v0.8final/BUGS
> 
> 
> Hope this helps
> Michael
> 
> --
> Michael Marxmeier           Marxmeier Software AG
> E-Mail: mike@msede.com      Besenbruchstrasse 9
> Phone : +49 202 2431440     42285 Wuppertal, Germany
> Fax   : +49 202 2431420     http://www.msede.com/
> 
