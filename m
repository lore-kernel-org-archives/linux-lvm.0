Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2KAeU105207
	for <linux-lvm@redhat.com>; Mon, 20 Mar 2006 05:40:30 -0500
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 20 Mar 2006 11:39:03 +0100
Message-ID: <m2wtepcse0.fsf@janus.isnogud.escape.de>
MIME-Version: 1.0
Subject: [linux-lvm] Reducing size of user space lvm binary
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am currently converting from LVM1 to DM + LVM2.  I have my root fs
on LVM so I need to load the kernel modules and scan for VGs in initrd
before mounting the real root device.

With LVM1, I had copied liblvm-10.so, vgscan and vgchange to my initrd
file system.  With LVM2, everything is in one large binary, which
consumes considerably more space on my initrd, which I'd like to
reduce.

I changed tools/commands.h to only contain vgscan and vgchange, and
then relinked the lvm binary with

    gcc -s -o lvm lvm.o lvmcmdline.o vgchange.o vgscan.o vgmknodes.o \
        pvmove.o toollib.o polldaemon.o -Wl,--export-dynamic         \
        -L../lib -L/lib -llvm -ldevmapper -ldl  -rdynamic

The size is still 300 kB.  Is there a way to further reduce its size?

Is vgscan required in the initrd?  The man page for vgscan says that
in LVM2, vgscans take place automatically.  What does this mean?  When
is the scan done automatically?  Is it done as part of other commands
like vgchange?

urs
