Return-Path: <todd@staff.nm.org>
Date: 15 May 2001 21:21:29 -0600
Date: Tue, 15 May 2001 21:21:29 -0600 (MDT)
From: Todd Underwood <todd@osogrande.com>
Message-ID: <Pine.LNX.4.10.10105141942530.5506-100000@staff>
MIME-Version: 1.0
Subject: [linux-lvm] successes & resizing
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

folx, 

i resolved the problem i posted about last week:  unable to mount root
device in trying to set up lvmroot using a bootable real ext2 partition
and initrd. they key (and this maybe a FAQ but i didn't see it) was
getting my scsi driver loaded into the initrd.  this was as simple as
unzipping the initrd-lvm-2.4.3.gz file, mouting on the loopback.  copying
the scsi module into place in /lib/modules and adding a modprobe to
linuxrc.  after that, all was good.  this may be worth documenting
somewhere (i was considering taking the existing info about lvm root and
doing a HOWTO given that i've set it up 5 or 8 times in the last two
weeks).

i have a separate question about ext2 resizing on a separate system:  when
i try to resize the root (using the ext2online resize patch to 2.4.3) i
get:

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/rootvg/root        495844    250577    219667  54% /
/dev/rootvg/usr        2590504   1444748   1014072  59% /usr
/dev/rootvg/home       1032088        20    979640   1% /home
/dev/rootvg/var         495844    105794    364450  23% /var
/dev/hda1               101089      6029     89841   7% /boot
bash-2.04# e2fsadm -L +200M / 
e2fsadm -- invalid logical volume name "/dev/root"


e2fsadm [-d|--debug] [-h|--help] [-n|--nofsck]
	{[-l|--extents] [+|-]LogicalExtentsNumber |
	 [-L|--size] [+|-]LogicalVolumeSize[kKmMgGtT]}
	[-t|--test] [-v|--verbose] [--version] LogicalVolumePath

bash-2.04# e2fsadm -L +200M /dev/rootvg/root 
lvextend -- extending logical volume "/dev/rootvg/root" to 700 MB
lvextend -- doing automatic backup of volume group "rootvg"
lvextend -- logical volume "/dev/rootvg/root" successfully extended

ext2online v1.1.17 - 2001/03/18 for EXT2FS 0.5b
new filesystem size 716800
ext2online: group 0, block 4 not reserved

ext2online: unable to resize /dev/rootvg/root past 524288 blocks


------------------------

any suggestions?

todd underwood
vice president & 
   chief technology officer
oso grande technologies, inc.
todd@osogrande.com
