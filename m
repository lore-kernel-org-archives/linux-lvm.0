From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: [linux-lvm] SuSE 6.4: Bug in lvmcreate_initrd
Date: 31 Mar 2000 22:05:16 +0200
Message-ID: <8c30ds$elj$1@londo.rhein-main.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Moin,

in LVM 0.8e (4/1/2000) (shipped with SuSE 6.4) there is a bug in
lvmcreate_intrd. The new vgscan needs(?) /proc, but mount and umount are not
copied to the initrd.

Fix: Add /bin/mount and /bin/umount to INTRDFILES, and rerun
lvmcreate_intrd.

	Torsten
