Date: Sun, 25 Apr 1999 19:55:04 +0100 (GMT)
From: Tony Rogers <tony@racsys.demon.co.uk>
Subject: [linux-lvm] Solved(?) System locks solid
Message-ID: <Pine.LNX.4.04.9904251512570.2939-100000@racsys.demon.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM Mailing List <linux-lvm@msede.com>

Hello All,

As promised, here are the findings of my experiments into trying to solve
my lock-up problems, which have been plaguing me over the last few weeks.

Basically, under LVM the system was locking solid, but not without it!

The main suggestions from the list were that there was either a
hardware/configuration problem, or perhaps a compiler problem.

There were no obvious conflicts IRQs etc, and even removing all but the
most essential cards from the system did not help!

The instructions which came with a PCI Ethernet card which I bought
recently said that "Any PCI video card should be installed in the LAST PCI
slot, and the Ethernet card in the FIRST slot".

To cut a long story short, I experimented by moving my PCI SCSI card
around, from slot to slot, and timing how long it took to lock.

That in conjunction with resetting all my motherboard settings to the
factory defaults (as a precaution - I haven`t deliberately changed them)
seems to have had a beneficial effect.

I am currently typing this on a home networked PC attached to my machine
running LVM. It`s been up for nearly 7 hours now - a record!

I`m not totally happy about the situation - maybe it`s time to change my
old VX motherboard!

Many thanks for your support - I may be back!

Tony Rogers
===========
