Message-Id: <200002230038.BAA01203@e35.marxmeier.com>
Subject: Re: [linux-lvm] Linux2.3.47 problems
Date: Wed, 23 Feb 2000 1:38:07 MEZ
In-Reply-To: <20000222212528.19158.qmail@www0l.netaddress.usa.net>; from "Eric Gandt" at Feb 22, 100 4:27 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: egandt@netscape.net
Cc: linux-lvm

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

After adding a few minor things (see patch-2.3.47-lvm on the ftp server)
i was able to compile 2.3.47 with LVM. No problems besides the ones
mentioned in the patch which are not related.
Maybe your kernel source has been corrupted by a patch?

According to Heinz some symbol exports might currently be missed in
the merge to 2.3.47 which might affect people using LVM 0.8final as a
module. But this does not seem related to your problem either.

In addition, at least for glibc2.1 a minor patch against the new user
mode tools is required as well (see patch-lvm_0.8final on the ftp server).


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
