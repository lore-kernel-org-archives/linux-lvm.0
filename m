Message-ID: <389FD267.FD41DA95@ep-ag.com>
Date: Tue, 08 Feb 2000 09:23:03 +0100
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Building lvm tools? (fwd)
References: <389F6445.218E6DD7@msede.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lars@larsshack.org
Cc: linux-lvm@msede.com

Hi Lars,

> Howdy,
> 
> I'm trying to build the lvm under RedHat 6.1 (linux 2.2.14 + devfs),
...
> I'm using the 0.8-pre02.10.1999 release of the tools.
> 
> After typing 'make', the build dies with errors along these lines:
> 
>   cc -c -pipe -Wall -I/usr/src/LVM/0.8-pre02.10.1999/tools
> -I/usr/src/LVM/0.8-pre0
>   2.10.1999/tools/lib -I/usr/src/LVM/0.8-pre02.10.1999/kernel
> -D__KERNEL__ -O2 -DD
>   EBUG -o debug.o debug.c
>   In file included from /usr/include/linux/fs.h:20,
>                    from /usr/include/linux/devfs_fs_kernel.h:4,
>                    from /usr/include/linux/genhd.h:14,
>                    from /usr/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
>                    from basename.c:26:
>   /usr/include/linux/stat.h:12: warning: `S_IFMT' redefined
>   /usr/include/sys/stat.h:92: warning: this is the location of the
> previous defini
>   tion
>   /usr/include/linux/stat.h:13: warning: `S_IFSOCK' redefined
>   /usr/include/sys/stat.h:105: warning: this is the location of the
> previous defin
>   ition
>   [...ad nauseum...]
> 
> These errors occur for virtually every file in the distribution.  Has
> anyone else encountered this problem?
well, the devfs includes seem to depend on __KERNEL__ things, it solved
it on my box with the following hack (houuu, real ugly ;-)):

First, remove the -D__KERNEL__ from the Makefiles (of the lvm-tools of
cause!), then add this to $(KERN_SOURCES)/include/linux/lvm.h around the
include of linux/kdev_t.h (about line 90 or so):

/* KS : Look out! Following is a bad, bad hack solving compile problems
for tools! */
#if !defined (__KERNEL__)
#define  __KERNEL__ 1
#include <linux/kdev_t.h>
#undef __KERNEL__
#else
#include <linux/kdev_t.h>
#endif
#include <linux/major.h>
#include <asm/spinlock.h>

Works for, hope the same for you.

Bye
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
