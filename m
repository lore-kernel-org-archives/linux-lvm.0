Message-ID: <38616C38.636DF278@msede.com>
Date: Thu, 23 Dec 1999 01:26:32 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM 0.8 2.3.33 compile error
References: <199912220022.BAA19406@novworld.Novecom.Fr> <3860CF2B.615B86F7@xinit.se>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Josef =?iso-8859-1?Q?H=F6=F6k?= <joh@xinit.se>
Cc: Willy Tarreau <willy@novworld.Novecom.Fr>, linux-kernel <linux-kernel@vger.rutgers.edu>, Heinz Mauelshagen <mge@ez-darmstadt.telekom.de>, linux-lvm@msede.com

Josef H��k wrote:
> got this error when compiling 2.3.33-LVM
> 
> make[3]: Entering directory `/usr/src/linux/drivers/block'
> gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
> -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
> -DCPU=686 -march=i686   -DEXPORT_SYMTAB -c ll_rw_blk.c
> In file included from /usr/src/linux/include/linux/lvm.h:92,
>                  from ll_rw_blk.c:32:
> /usr/src/linux/include/asm/spinlock.h:36: warning: `SPIN_LOCK_UNLOCKED'
> redefined
...
> is it me or is it a bug :)?

In include/linux/lvm.h please change the
#include <asm/spinlock.h>
against
#include <linux/spinlock.h>

This fixed it for me (lvm 0.8i)

Hope this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
