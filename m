Date: Sat, 26 Aug 2000 20:47:38 -0700 (PDT)
From: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Subject: [linux-lvm] LVM & NFS
Message-id: <Pine.SOL.4.21.0008262033450.13945-100000@flora01.SLAC.Stanford.EDU>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: linux-lvm@msede.com
Cc: Shahram Rahatlou <rahatlou@SLAC.Stanford.EDU>


Hello,

I have a PC with RH 6.1 kernel 2.2.13, lvm kernel patch for 2.2.13, and
lvm 0.8-pre02,10.1999.

lvm works fine but when I tried to export a logical volume of 82GB, to
another Linux machine I got:

mount: my_server:/my_logica_volume failed, reason given by
server: Permission denied

I did the same NFS configuration with a small partition (not LVM) and it
worked.

Any idea ? Is there any special configuration/setting to export LVM
volumes via NFS?

Thanks in advance
	Cristina   



_____________________________________________________________________________

       Cristina Bulfon              E-mail Cristina.Bulfon@slac.stanford.edu
Stanford Linear Accelerator Center  Phone +1-650-926-5028
PO Box 4349, M/S 88		    Fax   +1-650-926-3329
Stanford, CA 94309, USA
_____________________________________________________________________________
