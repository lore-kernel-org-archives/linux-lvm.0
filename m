Message-ID: <387DD4C0.BF36517A@ep-ag.com>
Date: Thu, 13 Jan 2000 14:36:00 +0100
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Problems compiling client utilities
References: <387CCD28.5C188941@ep-ag.com> <387D0648.1AD34B95@osp.nl>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com
Cc: Jos Visser <josv@osp.nl>

Jos Visser wrote:
> 
> Hi Klaus,
> 
> Unfortunately not. As it turns out, the devfs patch modifies certain
> kernel include files to the extent that the LVM client utilities run
> into all sorts of compile problems. However, it is my educated guess
> that you can compile the client utilities on a non-devfs system, and
> the use them on a devfs enabled system.
> 
> ++Jos
> 
> Klaus Strebel wrote:
> >
> > Hi Jos,
> >
> > i ran into the same problems, did you find a solution?
Ok Jos, i diffed in like swine and found a very very dirty hack!

First, remove the "-D__KERNEL__" from the Makefiles in the tools
directory. Then do the following around the include of <linux/kdev_t.h>
in <linux/lvm.h>:

/* KS : Look out! Following is a bad, bad hack to solve compile
problems         * when for tools with devfs and lvm! */
#if !defined (__KERNEL__)
#define  __KERNEL__ oh_no_no_no
#include <linux/kdev_t.h>
#undef __KERNEL__
#else
#include <linux/kdev_t.h>
#endif

It works for me, hope it helps you!

Ciao
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
