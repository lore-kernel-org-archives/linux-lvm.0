Message-ID: <000d01be889c$1a9f8450$1401a6c0@aloha.lc.ca.org>
From: "parkercj" <cparker1@pacbell.net>
Subject: [linux-lvm] SYLOG MESSAGES
Date: Fri, 16 Apr 1999 23:32:43 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


Hi,

This is a great feature for Linux and looong overdue. I'm usually using some
form of volume management  be it Dec OSF Volume Manager, Solaris's Veritas
 really DEC's version of a.k.a Veritas) , IBM's AIX ( really great product)
, and even HP's LVM ( which can be tricky without patches). This software is
closer to HP's implementation than the others I usually deal with.

I only have one small sniggling problem. Whenever I issue any type of "pv"
or "vg" command  I see a number of the following messages in my syslog file:


Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-33
Apr 16 23:16:11 sabrina last message repeated 5 times
Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-34
Apr 16 23:16:11 sabrina last message repeated 5 times
Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-9
Apr 16 23:16:12 sabrina last message repeated 9 times
Apr 16 23:16:12 sabrina modprobe: can't locate module block-major-8


This doesn't happen with any of the "lv" commands, but I'm keeping my eyes
open for anything strange.  Am I missing something in my module
configuration????  The LVM program is built into my kernel not as a module
and my kernel is mostly monolithic except for a few networking and msdos
filesystem devices.

Acck ... here is my config before you ask! :)

RedHat Linux 2.2.5 #12 SMP ( Dual P200's MMX)
64 meg ram
LVM version 0.6 with the latest patch lvm_0.6-patch-15031999a.gz
and the usual stuff ... Sound, CDROM, 3com NIC  etc cetera...


The box has all of my partitions created using LVM in three volume groups
except for the root partition.. I need it to boot for now. The configuration
is strictly IDE. The only SCSI device is a 6 pack 4mm HP SureStore Dat tape
drive using an Adaptec 2120 card. It's the only device on the chain.

Other than these messages the box is solid ... I currently run the Linux
version of Oracle8 ... nothing heavy duty with the application yet. I'm
still poking around with some web and RDBMS application stuff.

Any ideas???


C.J.
