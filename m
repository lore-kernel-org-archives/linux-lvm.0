Message-ID: <20000222212528.19158.qmail@www0l.netaddress.usa.net>
Date: 22 Feb 00 16:25:28 EST
From: Eric Gandt <egandt@netscape.net>
Subject: [linux-lvm] Linux2.3.47 problems
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I can not get LVM to complie in 2.3.47, when I try I get:

lvm.c:313: `blkdev_close' undeclared here (not in a function)
lvm.c:313: initializer element for `lvm_blk_fops.release' is not constant=

lvm.c:318: `block_fsync' undeclared here (not in a function)
lvm.c:318: initializer element for `lvm_blk_fops.fsync' is not constant
lvm.c:318: initializer element for `lvm_blk_fops' is not constant
lvm.c:318: initializer element for `lvm_blk_fops' is not constant
/usr/src/linux/include/linux/blk.h:454: warning: `end_request' defined bu=
t not
used

There does not look to be anything wrong with the code at first glance, h=
as
anyone else encountered this problem? if so is there away around it?

ERIC
egandt@netscape.net

____________________________________________________________________
Get your own FREE, personal Netscape WebMail account today at http://webm=
ail.netscape.com.
