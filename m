Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5RKlM7w003257
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 16:47:22 -0400
From: Turbo Fredriksson <turbo@bayour.com>
Date: Wed, 27 Jun 2007 22:47:12 +0200
Message-ID: <87abuljfan.fsf@pumba.bayour.com>
MIME-Version: 1.0
Sender: Turbo Fredriksson <turbo@pumba.redhat.com>
Subject: [linux-lvm] moving disk from PPC to x86
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

I'm trying to move some disks from my PPC desktop to a dedicated
server. Yesterday my system looked like this:

  1. /dev/md0     372.61Gb  (sda1+missing)
  2. /dev/hdb      74.53Gb
  3. /dev/sdb     298.09Gb

Now with the paycheck, I bought a third SATA disk (400Gb). I new from
the start that disk wouldn't fit in my desktopbox, so I also bought a
500W PSU (I had a huge server case without PSU from previously).

I was a little impatient, so I added the new disk (physically just
dangling outside the box :) to the LVM (as md1+missing).

The idea was to re-create sdb as mdX+missing, so I tried pvmove sdb.
But instantly received a lot of errors. Now I can't remove it
from the VG!

I figured this had/might have something to do with the (very) small
PSU in the workstation (250W I think it is).


My new server is a i386, and I already had a disk with Linux installed
for Intel, so that disk was also moved (from another server I don't
need any more - it was a Pentium 1 - to slow! :).

In with the system disk, in with the LVM disk and started. The system
had to be upgraded (from Ubuntu 6.xx to 7.04 - Feisty). Took a couple
of hours, and when that was done, I started to get the MD's working.
No go... One of the disks didn't even have a partition table!? None
of the disks had a MD [info/rootblock/whatever-it-was-called].

I wasn't really scared, I knew I haven't tried to modify the disks.
Put everything back into the PPC, and yes, everything works as
expected (exept the read errors from sdc/md1).


So, long winded explanation of what i've done, any idea about:

  1. How do I remove md1/sdc before I get data on it (i have the
     LVM unmounted for the time being).
  2. How do I move a VG/PV/LV from PPC to x86?
