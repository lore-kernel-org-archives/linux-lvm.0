Message-ID: <389DC915.F7FEC89C@msede.com>
Date: Sun, 06 Feb 2000 20:18:45 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: dccotey@dragon.elfwerks.com
MIME-Version: 1.0
Subject: [linux-lvm] minor vgscan oops (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
From: "DanielC" <dccotey@dragon.elfwerks.com>
Date: Sat, 5 Feb 2000 18:05:39 -0700 (MST)
Subject: minor vgscan oops

Greetings,
  I was playing around with a brand new RedHat 6.1 box with a 2.2.14
kernel patched with the unified IDE and lvm patches and found a couple
of
problems.

1. Its been mentioned before that RH ships with more md devices than a
stock kernel can handle, and when vgscan touches them the box locks
solid.
Might I suggest that tidbit be added to either the BUGS or INSTALL
file?

2. When network block support is compiled into a kernel vgscan will
produce 5+ pages of errors when scanning them, is there a way to tell
vgscan to skip a set of devices?

--
DanielC
