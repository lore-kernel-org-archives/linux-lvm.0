Message-ID: <38934C75.9206A8E3@msede.com>
Date: Sat, 29 Jan 2000 21:24:21 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: chris@alwan.com
MIME-Version: 1.0
Subject: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My first time)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Sat, 29 Jan 2000 13:41:49 -0600
Resent-Date: Sat, 29 Jan 2000 21:14:28 MEZ
From: Chris Anderson <chris@alwan.com>
Organization: Alwan, Inc.
Subject: Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My
first time)

Ok this is my first try at LVM and I did not get it working.

I ran the 2.2.13 patch on the linux source and it seemed to compile
file.  I want to setup LVM as a module so I set the flag in the config
to module.  Do all the compiles then after a reboot i run the below
commands.  Note I did poke around in the doc and found nothing.

$ depmod -a
/lib/modules/2.2.14/block/lvm.o: unresolved symbol(s)

$ modprobe lvm
/lib/modules/2.2.14/block/lvm.o: unresolved symbol lvm_map_ptr

It looks like something is wrong.  Any help please?  I hope this is a
easy one.

chris@alwan.com
