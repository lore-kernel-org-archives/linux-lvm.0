Message-ID: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca>
From: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Subject: [linux-lvm] lvm'ing root fs
Date: Mon, 10 Apr 2000 21:59:11 -0300
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I've created an init ramdisk (lvmcreate_initrd), and now I'm in the process
of trying to copy my root fs to my new lvm_root.  To reduce the disk I/O,
I've gone down to single user mode to try to copy (cp -a *) all my files
from root to lvm_root.  Twice I get the same results:

# cd /
# cp -a * /mnt/root_vg
cp: /mnt/root_vg/proc/kcore_elf: Invalid argument
cp: proc/sys/net/ipv4/route/flush: Invalid argument

This is all I see on my screen, then at some point, the copying stops, and
my system will not respond to keyboard input, except it will respond to
Alt-F1/4 to switch virtual terms, but still no keyboard input accepted.

Should I tar/untar instead, or did I miss some fundamental step?

Thanks,
Marco
