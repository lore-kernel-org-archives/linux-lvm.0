Message-ID: <393C8A1D.30BD26E4@msede.com>
Date: Tue, 06 Jun 2000 07:20:29 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem with kernel 2.2.13
References: <Pine.GSO.4.10.10006052054560.952-100000@flora04.SLAC.Stanford.EDU>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Cc: linux-lvm@msede.com

Cristina Bulfon wrote:
> I'm trying to rebuild the kernel 2.2.13 with lvm patch
> "patch-2.2.13-LVM-0.8i.gz" and during the _make_bzImage_ I got the
> following error:
> ...

Please refer to
http://linux/lvm/doc/BUGS

for a list of kown problems and solutions.

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
