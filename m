From: iafilius@xs4all.nl
Date: Sun, 10 Sep 2000 15:55:46 +0200 (CEST)
Reply-To: Arjan Filius <iafilius@xs4all.nl>
Subject: [linux-lvm] 2.4.0-test8 LVM(vgscan) on SCSI problems (report)
Message-ID: <Pine.LNX.4.21.0009101525490.1920-100000@sjoerd.sjoerdnet>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-lvm@msede.com

Hello,

With 2.4.0-test8 (test8-pre6 seems to be OK) vgscan (at
boottime) "sees" al my volumegroups which are on IDE disk, but not those
on SCSI disk.
I had no problems mounting a "plain" ext2 scsi partition on same disk.


After some "research" i found sd.c is patched, but not yet in test8-pre6.

vgscan version:
sjoerd:~ # vgscan -h
Logical Volume Manager 0.8 by Heinz Mauelshagen  04/11/1999  (IOP 6)

lvm,scsi-disk compiled into the kernel, but mostly as modules.


Arjan Filius
mailto:iafilius@xs4all.nl
