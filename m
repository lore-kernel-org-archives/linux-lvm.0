Message-Id: <200002211920.UAA11649@e35.marxmeier.com>
Subject: Re: [linux-lvm] 2.2.14
Date: Mon, 21 Feb 2000 20:20:52 MEZ
In-Reply-To: <200002211859.TAA07466@seger.axis.se>; from "Lars Segerlund" at Feb 21, 100 7:59 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lars.segerlund@axis.com
Cc: linux-lvm

>  Hmm, is there 0.7 or 0.8 patches against 2.2.14 ??
>  I'mgetting some compile errors.

No. But i don't remember any particular problem applying the 2.2.13
patch against 2.2.14 (besides the documented one).

You had a look at the known issues file?
ftp://linux.msede.com/lvm/v0.8pre/BUGS

--- snip ---

3. Compile with kernel 2.2.13 or 2.2.14 fails:

> drivers/block/block.a(ll_rw_blk.o): In function `blk_dev_init':
> ll_rw_blk.o(.text.init+0xb0): undefined reference to `lvm_init'

Terry Hardie (terryh@orcas.net) notes:
> Actually, on line 362 of lvm.c in your kernel source, block/drivers,
> change the word "static" to "extern". The problem doesn't show up if
> you're compiling LVM as a module.

The line in question is:
__initfunc(static int lvm_init(void))

This should be changed to:
__initfunc(extern int lvm_init(void))

--- snip ---


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
