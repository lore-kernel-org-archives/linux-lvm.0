Message-ID: <3906DFFB.10A7FA72@arcormail.de>
Date: Wed, 26 Apr 2000 14:24:27 +0200
From: Joerg Stroettchen <joerg.stroettchen@arcormail.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvm-support for 2.2.13 : compile-probs
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

hello,

just tried to compile a clean 2.2.13-tree+patch-2.2.13-LVM-0.8.i. When
linking an error occurs

In =EF=BF=BDfunction blk_dev_init`:ll_rw_blk.o(.snip.) : undefined referenc=
e to
`lvm_init`.=20

I compared lvm.c an ll-rw_blk.c from this 2.2.13-tree with todays
2.3.99-pre6-7-source. Maybe its some kind of cortical blindness ....
Anyone who can help ?


Thanks in advance

joerg
