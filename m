Return-Path: <gerben@oxygen.nl>
Message-ID: <006c01c0e3d3$c871a6f0$1500a8c0@gerben>
From: "Gerben Meijer" <gerben@oxygen.nl>
Date: Thu, 24 May 2001 00:00:30 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan - volume group not found, panic!
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Dear LVM users and developers,

I am experiencing problems with LVM. I am running Debian GNU/Linux 2.2 with
a 2.4.3-ac11 kernel, and LVM utils v0.9 (i use the packages from bunk at
http://people.debian.org/~bunk/debian/dists/potato/main/binary-i386/). I had
created a volume group called 'progressive', with one logical volume called
'protition'. It consists of 3 physical volumes: /dev/hda2 (4918MB),
/dev/sda1 (9138MB) and /dev/sdb1 (9138MB). Everything was running fine.

There was one problem though: it didn't mount at boottime. So i did some
reading and i thought that i had found the problem: vgscan wasn't ran at
boottime in /etc/init.d/lvm (vgchange -a y was, though). I changed the
script so that it ran vgscan. However, when i rebooted, vgscan removed my
/etc/lvmtab and /etc/lvmtab.d/* and it didn't recreate them: - no volume
groups found - ....

*panic* :)

I immediately ran to my best friend (google :)). I quickly found out about
vgcfgrestore. However, restoring that didn't help me one bit. It restored
fine for all my 3 physical volumes (/dev/hda2, /dev/sda1 and /dev/sdb1) but
vgscan still didn't recognize my volume group.

Then I decided to try to upgrade to the latest LVM version, both in the
kernel and the userspace utilities. So i patched my 2.4.3 kernel with the
latest LVM patches (0.9.1beta7). I got an error while compiling my kernel
though, get_hardblocksize wasn't defined anywhere. So i went back digging on
google and found one patch that fixed that for me:
http://www.stacken.kth.se/pub/linux/kernel/people/andrea/kernels/v2.4/2.4.4a
a2.bz2.

So finally i had a working kernel with the latest LVM drivers, and i had the
latest LVM userspace utils, and i had my hopes up. Unfortunately, vgscan
still didn't see anything, and vgcfgrestore gave me an error
(vg_check_consistency_with_pv_and_lv).

Next, I tried using 2.4.4-ac9 with the original 0.9 userspace utilities.
Still nothing.

I'm out of options here, and I am hoping that you can help me rescue my
data. If you have any idea what I could try to fix this, please let me know.

Debugged output i created:

# lvmdiskscan -v -d
# pvdata -a /dev/hda2 /dev/sda1 /dev/sdb1
# vgscan -d
# pvdisplay -d /dev/hda2 /dev/sda1 /dev/sdb1

I also included my progressive.conf file. The output can be found at
http://infernix.net/pvt/lvmtrouble, i didn't think it'd be useful to attach
over 1MB of debug output. You can also grab the tar.bz2:
http://infernix.net/pvt/lvmtrouble/lvmtrouble.tar.bz2

Thank you in advance.

Yours sincerely,

Gerben Meijer
Oxygen Internet Services
