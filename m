Message-ID: <36F9717A.986B8EF1@US.ORACLE.COM>
Date: Wed, 24 Mar 1999 23:12:58 +0000
From: KANDARP PATEL <KANPATEL@US.oracle.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM Installation problem , Patching is not working.
Content-Type: multipart/mixed; boundary="------------5C3273F36E97CEA582728595"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------5C3273F36E97CEA582728595
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi, Gurus.
My Box Detail
Kernel    2.0.35 ( REDHAT)
Problem:
I followed all steps given in INSTALL doc. ,which comes with LVM
software.
The step:

/LVM/0.6>gzip -dc kernel-patchs/lvm_patch-2.0.36.gz | (cd /usr/src/linux
; patch -p1)

ERROR STACK::

"can't find file to patch at input line 3
Perhaps you used the wrong -p or --strip option
........................

File to patch:
"
This is the story,it stops at "File To Patch:" prompt.
If somebody guides me here , I really appreciate.
Could you just reply to me at this address?
Thanks
Kan.


--------------5C3273F36E97CEA582728595
Content-Type: text/x-vcard; charset=us-ascii; name="vcard.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Kan Patel
Content-Disposition: attachment; filename="vcard.vcf"

begin:          vcard
fn:             Kan Patel
n:              Patel;Kan
org:            Oracle Corp.
adr:            570 RT.1, Suite 4000,;;;Iselin,;NJ;08830;USA
email;internet: KANPATEL@US.ORACLE.COM
title:          Senior Consultant
tel;home:       (732)339-0246
note:           Beeper- Access Number # (800)PAGE-MCI,PIN# 1408125
x-mozilla-cpt:  ;0
x-mozilla-html: FALSE
version:        2.1
end:            vcard


--------------5C3273F36E97CEA582728595--
