Date: Wed, 9 Feb 2000 00:11:18 +0000 (GMT)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: [linux-lvm] Library strangeness
Message-ID: <Pine.LNX.4.10.10002090009460.18572-100000@greebo.jj.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi!

Just saw something that confused me for a while:

[root@greebo][/root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

Even though I am running on LVM at the moment! After some looking round I
discovered that it was trying to use liblvm in totally the wrong
directory, which I had been hacking around with:

[root@greebo][/root]# ldd `which vgscan`
        /lib/libNoVersion.so.1 => /lib/libNoVersion.so.1 (0x40014000)
        liblvm.so => /root/LVM/0.8-pre02.10.1999/tools/lib/liblvm.so
(0x40016000)
        libc.so.6 => /lib/libc.so.6 (0x4003a000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)
[root@greebo][/root]# mv LVM LVM-hacked
[root@greebo][/root]# ldd `which vgscan`
        /lib/libNoVersion.so.1 => /lib/libNoVersion.so.1 (0x40014000)
        liblvm.so => /lib/liblvm.so (0x40016000)
        libc.so.6 => /lib/libc.so.6 (0x4003a000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)
[root@greebo][/root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg00"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual backup of your volume group
[root@greebo][/root]#

So, removing /root/LVM solved the problem! Why does the linker try and
use the library here first rather than what's in /lib ? My ld.so.conf has
nothing to do with /root/LVM in it!

I think this could be the offending line, from tools/Makefile:

XLINKER = -Xlinker -rpath $(TOP)/tools/lib -Xlinker -rpath /lib -Xlinker

Perhaps -rpath $(TOP)/tools/lib needs to be /after/ the rest?

Cheers!

James (running Dual Celeron 450 / LVM 0.8i / 2.2.14 / devfs)
