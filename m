Message-ID: <39CFB8EA.7890B91D@cup.hp.com>
Date: Mon, 25 Sep 2000 13:43:22 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM on 2.2.17 (again)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

I've checked the LVM email archives so I know there has
been lots of discussions on how to get LVM to work on
2.2.17, but unfortunately I'm having problems just
building the kernel. I started with Turbolinux Server
6.0.2 (which is 2.2.14) and then added the 2.2.15-2.2.17
patches. When I build I get:

lvm-snap.c:28: linux/iobuf.h: No such file or directory
lvm-snap.c: In function `lvm_snapshot_COW':
lvm-snap.c:253: dereferencing pointer to incomplete type
lvm-snap.c:257: warning: implicit declaration of function
`brw_kiovec'
lvm-snap.c: In function `lvm_snapshot_alloc_iobuf_pages':
lvm-snap.c:308: warning: implicit declaration of function
`expand_kiobuf'

Any ideas?

Thanks!
-- 
==========
John DeFranco          (defranco@cup.hp.com)
Hewlett Packard
408-447-7543
