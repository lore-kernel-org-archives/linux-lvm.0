Message-ID: <003401be5a59$6a3c04a0$6630aec1@trpc.dkfz-heidelberg.de>
From: "Tobias Reber" <tobias.reber@dkfz-heidelberg.de>
Subject: [linux-lvm] root filesystem in lvm
Date: Wed, 17 Feb 1999 10:39:28 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

On a test system I have put the root filesystem into lvm. Everything works
fine, however during shutdown I cannot vgchange -a n to the volumegroup,
where the root filesystem sits. Does that any harm?
Also did anybody out there look into lilo in order to make the kernel
bootable from an lvm volume? IMHO lvm looks very keen especially if you have
large disks, where you still have only 8 partitions. I prefer having my
filesystem spread out into several partitions for /, /usr and so forth.
Tobias
