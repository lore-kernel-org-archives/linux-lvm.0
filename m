Message-Id: <m121EZ1-000D4UC@londo.rhein-main.de>
From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: [linux-lvm] problems with mdutils(raid1) and lvm
Date: Thu, 23 Dec 1999 21:10:19 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm <linux-lvm@msede.com>

Hi,

I managed to setup a system with lvm and raid1 on the root volume (using
initrd , SuSE 6.3 )
Now I think of what will happen in case of disk failures. With "normal" 
raid1 (say /dev/md0 = /dev/sda1 /dev/sdb1 ) I am able to mount /dev/sda1 
even if ckraid failed. With lvm : vgscan didn't find my vg00 if /dev/md0 is
not present. Therefor I can't recover my system from the remaining disk(s).
Is there a way to activate such a volume group ?
Mirroring is useless if it requires that all disks are sane.

	Torsten
