Message-ID: <388B01A3.B313730F@msede.com>
Date: Sun, 23 Jan 2000 14:26:59 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: sbibb@pacelabs.com
MIME-Version: 1.0
Subject: [linux-lvm] my kernel builds but... (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

-------- Original Message --------
Date: Sat, 22 Jan 2000 12:07:07 -0600
From: "Shawn Bibb" <sbibb@pacelabs.com>
Subject: [linux-lvm] my kernel builds but...

the system hangs at the "Finding module dependencies" point of the
boot
process.  my system is a dual pII-300 running under mandrake linux
rel.
6.5.  i have done:

(patch my 2.2.13 in /usr/src/linux with the 0.8i patch)
make xconfig
make dep
make clean
make bzImage
(move the kernel)
make modules
lilo

all goes well until the point above.  i have lvm in as a module and am
booting ide (always have on this box).  i have always had aic7870, sb,
ne2k-pci in as modules.  old kernel boots fine still so i am not down
but
i want to put in my mylex bt-958d and some decommissioned drives to
work
with lvm on linux.

please, any help will be appreciated.  i understand this is *not* the
kernel list but it involves lvm.  i have tried to follow the INSTALL
in
the lvm ftp archive but it is not clear.  it talks of a make.tmpl and
i
haven't got one!  or do i?

well, thanks in advance.

=AF-shawn





Shawn Bibb  - Manager of Technical Support
Pace Analytical Services, Inc.
Shawn.Bibb@pacelabs.com
