Date: Mon, 05 Jun 2000 21:00:02 -0700 (PDT)
From: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Subject: [linux-lvm] Problem with kernel 2.2.13
Message-id: <Pine.GSO.4.10.10006052054560.952-100000@flora04.SLAC.Stanford.EDU>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: linux-lvm@msede.com


Hello,

I'm trying to rebuild the kernel 2.2.13 with lvm patch
"patch-2.2.13-LVM-0.8i.gz" and during the _make_bzImage_ I got the
following error:

drivers/block/block.a(ll_rw_blk.o): In function `blk_dev_init':
ll_rw_blk.o(.text.init+0xb0): undefined reference to `lvm_init'
make: *** [vmlinux] Error 1

Any suggestion ? 

Thanks Cristina

_____________________________________________________________________________

       Cristina Bulfon              E-mail Cristina.Bulfon@slac.stanford.edu
Stanford Linear Accelerator Center  Phone +1-650-926-5028
PO Box 4349, M/S 88		    Fax   +1-650-926-3329
Stanford, CA 94309, USA
_____________________________________________________________________________
