From: Bradley M Alexander <storm@tux.org>
Message-ID: <20021026045558.GA7158@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Repairing LVM installations
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
Date: Fri Oct 25 23:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have a machine which is running lvm, though not on the root filesystem:

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda2              2626536   1590228   1036308  61% /
/dev/vg00/lv_tmp        204788     33008    171780  17% /tmp
/dev/vg00/lv_var       1572812    834604    738208  54% /var
/dev/vg00/lv_home      2621356   1335196   1286160  51% /home
/dev/vg00/lv_usrlocal
                       1572812   1216152    356660  78% /usr/local
/dev/vg00/lv_opt        524268    272348    251920  52% /opt
/dev/vg00/lv_backup   10485436   8017728   2467708  77% /backup
/dev/vg00/lv_video    11533980   5271576   6262404  46% /usr/local/video
/dev/vg00/lv_archive  18873788  17288044   1585744  92% /archive

This machine has three 30GB drives on it. Drives 2 and 3 (/dev/hdc and
/dev/hde)

I have a separate drive with Win98. Two nights ago, I booted into Windows
to defrag the drive on my Archos mp3 player using Norton. When I fired up
Norton, I misread the message and ended up letting Norton try to find the
partition table, thinking it was the Archos. After about a minute without
seeing the Archos' drive light flicker, I found that something was amiss.
It was cabbaging the LVM drives. /dev/hdc shows the following information
in a pvscan:

pvscan -- physical volume "/dev/ide/host0/bus1/target0/lun0/disc" is not
active
--- Physical volume ---
PV Name               /dev/ide/host0/bus1/target0/lun0/disc
VG Name               
PV Size               8.03 GB / NOT usable 1.99 TB [LVM: 3.85 GB]
PV#                   0
PV Status             NOT available
Allocatable           yes
Cur LV                260964353
PE Size (KByte)       2097151
Total PE              4255186944
Free PE               4255186029
Allocated PE          915
PV UUID               JXhNLv-TtpF-62Lg-CoIs-TMLT-Xg9L-GFfndV
System Id             defiant1008649744

Since it was on a Promise controller, which locked up due to the filesystem
damage, I moved the drive on hde to hdd to get it to boot. LVM sees the
data on the PVs. I want to move the extents off of the damaged drives,
starting with hdc. However, when I attempt to do so, I get a message about
the PV being in an inconsistent state:

[defiant /home/storm]# pvmove /dev/hdc                             
pvmove -- ERROR "pv_check_consistency(): current LV" physical volume
"/dev/hdc" is inconsistent

The same occurs when I try to pvmove /dev/ide/host0/bus1/target0/lun0/disc.
I would like to move the PEs off of the damaged drive and rebuild it, then
move the data back. Is there a way to fix the PV on that particular drive
so I can move the data off (there should be enough free PEs on the other
two drives) and rebuild the drive?

Thanks,
-- 
--Brad
============================================================================
Bradley M. Alexander                |   storm [at] debian.org
Debian Developer, Security Engineer |   storm [at] tux.org
Debian/GNU Linux Developer          | Visit the 99th VFS website at:
99th VFS 'Tuskegee Airmen'          |   http://99thvfs-ta.org
============================================================================
Key fingerprints:
DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
============================================================================
The American Revolution would never have happened with Gun Control.
