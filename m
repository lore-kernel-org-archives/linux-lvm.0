Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k857Mcr2018973
	for <linux-lvm@redhat.com>; Tue, 5 Sep 2006 03:22:38 -0400
Received: from mail.opendreams.net ([69.88.106.142])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k857MVWv008598
	for <linux-lvm@redhat.com>; Tue, 5 Sep 2006 03:22:31 -0400
Message-ID: <44FD25AA.8050502@opendreams.net>
Date: Tue, 05 Sep 2006 00:22:18 -0700
From: Jesse Molina <jesse@opendreams.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Internal error: LV segments corrupted in MyLV. -- Can't
 mount LVM1 VGs in new LVM2 kernel initramfs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


Hello

I have a Debian/Unstable system that has a few LVM1 LVs, the kernel is 
2.4.  I decided that it was finally time to upgrade, so I started the 
process.  Unfortunately, I've run into a bit of trouble.

I have Googled and searched around for bug reports on the Debian system 
for anything similar to this and did not find anything very useful.

Because of a SATA adapter module that I need to load, I have a initramfs 
image.  I believe that I created the initramfs correctly and the boot 
process appears to run normally, until it's time to do the vgchange -ay 
from the "/scripts/local-top/lvm" script.  At this point, I get an error 
message and the boot process fails.

My root is not on LVM, but /var and /tmp are on LVs.

I'm not sure why the initramfs is dumping me at the BusyBox shell 
instead of pivoting root, since it should be able to do that.  I am 
thinking that it's some other problem with the initramfs that I built. 
That being said, I'm able to mount my ext3 root from the BusyBox shell 
without any trouble.  I need to read the docs more on initramfs.



Here is what I see on the screen during bootup.  Shortly after this, I 
end up at the BusyBox prompt;

device-mapper: 4.6.0-ioctrl (2006-02-17) initialised: dm-devel@redhat.com
	LV tmp: inconsistent LE count 32 != 64
	Internal error: LV segments corrupted in tmp.
	Volume group "vg0" no found
	LV bak1: inconsistent LE count 6076 != 12152
	Internal error: LV segments corrupted in bak1.
	Volume group "vgbak1" not found
Done.



The troubling thing about this is that I just created the "vgbak1" VG 
and "bak1" LV minutes before I rebooted into the new kernel.  I had been 
troubleshooting and decided to wipe the disks that were the PVs for 
vgbak1.  I used dd and /dev/zero to clear out the first 512B or so of 
the disks, after doing the whole vgchange -an, then removing the LVs, 
VGs and so on.  So, this freshly created VG/LV has the same problem as 
my other VG.  I made the new PVs, made the VG, made the LV, and then 
created an ext3 fs on top.  Under the 2.4 kernel, it mounts and 
everything looks good.

tmp is one of three LVs on the vg0 VG.  It is a small 2GB LV to mount 
for /tmp.

The 2.4 kernel is 2.4.31, custom built.  The 2.6 kernel is also custom 
built, based on 2.6.17.11.

I have run vgck and even did a vgcfgbackup/vgcfgrestore on the "vg0" 
PVs, but nothing helped.  The fact that the new "vgbak1" VG also has 
this problem is somewhat suspicious.

Doing a "vgchange -ay -v" on the BusyBox shell simply gave the same errors.



Any advice or RTFAs would be appreciated.  I'm stuck on this one.  If 
you need additional info, I'll be happy to provide.





--

root@sorrows# dpkg -l |grep -i lvm
ii  lvm-common                      1.5.20                The Logical 
Volume Manager for Linux (common
ii  lvm10                           1.0.8-12              The Logical 
Volume Manager for Linux
ii  lvm2                            2.02.06-2             The Linux 
Logical Volume Manager

--

root@sorrows# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda3" of VG "vg0"    [180.56 GB / 2.28 GB free]
pvscan -- ACTIVE   PV "/dev/sdb3" of VG "vg0"    [185.78 GB / 7.50 GB free]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "vgbak1" [189.88 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "vgbak1" [189.88 GB / 0 free]
pvscan -- total: 4 [746.27 GB] / in use: 4 [746.27 GB] / in no VG: 0 [0]

--

root@sorrows# vgdisplay
--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               366.34 GB
PE Size               32 MB
Total PE              11723
Alloc PE / Size       11410 / 356.56 GB
Free  PE / Size       313 / 9.78 GB
VG UUID               RpRpg4-bXW7-4FTF-pi3q-OI3i-jPv7-lBs17d

--- Volume group ---
VG Name               vgbak1
VG Access             read/write
VG Status             available/resizable
VG #                  2
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               379.75 GB
PE Size               32 MB
Total PE              12152
Alloc PE / Size       12152 / 379.75 GB
Free  PE / Size       0 / 0
VG UUID               tYH829-eexE-trsb-42bR-bbRj-5hSI-7ydBF3

--





-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/
