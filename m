Message-Id: <200002230134.CAA01886@e35.marxmeier.com>
Subject: Re: [linux-lvm] Linux2.3.47 problems
Date: Wed, 23 Feb 2000 2:34:07 MEZ
In-Reply-To: <20000222212528.19158.qmail@www0l.netaddress.usa.net>; from "Eric Gandt" at Feb 22, 100 4:27 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: egandt@netscape.net
Cc: linux-lvm@msede.com

> 
> I can not get LVM to complie in 2.3.47, when I try I get:
> 
> lvm.c:313: `blkdev_close' undeclared here (not in a function)
> lvm.c:313: initializer element for `lvm_blk_fops.release' is not constant
> lvm.c:318: `block_fsync' undeclared here (not in a function)
> lvm.c:318: initializer element for `lvm_blk_fops.fsync' is not constant
> lvm.c:318: initializer element for `lvm_blk_fops' is not constant
> lvm.c:318: initializer element for `lvm_blk_fops' is not constant
> /usr/src/linux/include/linux/blk.h:454: warning: `end_request' defined but not
> used
> 
> There does not look to be anything wrong with the code at first glance, has
> anyone else encountered this problem? if so is there away around it?

You need to apply sone patches. Some bits have obviously been missed
in the kernel merge and the v0.8 "final" version introduced a few minor
issues as well.
My patch patch-2.3.47-lvm-2 you should fix the kernel build problems.

In addition, you need to ge the matching usermode tools . If youare
on glibc 2.1 you may need to apply my patch patch-lvm_0.8final which
includes the changes which were required for me to build the user mode
tools.

Patches are available at:
ftp://linux.msede.com/lvm/v0.8final/

Please have a look at the README file for any recent notes.


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
