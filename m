Date: Tue, 06 Jun 2000 18:01:24 -0700 (PDT)
From: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Subject: [linux-lvm] core dump with 0.8-pre02.10.1999
Message-id: 
 <Pine.GSO.4.10.10006061753520.16737-100000@flora04.SLAC.Stanford.EDU>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: linux-lvm@msede.com

Hello,

thanks for the answer ..finally I rebuild the kernel and installed _lvm_

I was trying to create a Volume Group but I have a core dump ... 

# ./vgcreate -d test /dev/hdb1 /dev/hdc1 

I have also _core_dump_ with vgchange -a y

My machine has installed: kernel 2.2.13 plus lvm kernel patch and  
lvm 0.8-pre02.10.1999 .
 
Thanks Cristina


_____________________________________________________________________________

       Cristina Bulfon              E-mail Cristina.Bulfon@slac.stanford.edu
Stanford Linear Accelerator Center  Phone +1-650-926-5028
PO Box 4349, M/S 88		    Fax   +1-650-926-3329
Stanford, CA 94309, USA
_____________________________________________________________________________
