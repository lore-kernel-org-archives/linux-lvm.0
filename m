Message-ID: <000501beca08$afa30c40$0102010a@adminstation.sgymsdam.nl>
From: "Lennert Buytenhek" <buytenh@dsv.nl>
Subject: [linux-lvm] loopback support?
Date: Fri, 9 Jul 1999 14:43:46 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com

Hi all,

I know this question has been asked before (Mar 16),
but are there patches for making lvm work over the
loopback device? I need to do some testing of my
ext2 resizer on 2gig+ filesystems. All my partitions
together (including the DOS ones*) might just have
enough space free for this. I�ve tried some patching
lvm before, but I believe the lvm code thinks that p�s
in a device name are special in some way
(/dev/loo�p�0 **).

Thanks in advance,

Lennert Buytenhek
<buytenh@dsv.nl>

* Yes, I know, and flames go to /dev/null. I have parents
and I can�t do much about it :-). And I�m getting tired of
this needing to defend myself.

** Is this related to the c0s0p0t0x0y0z0 stuff that devfs
is so fond of?
