From: "saviour saviour" <saviour_cs@hotmail.com>
Mime-Version: 1.0
Message-ID: <Sea2-F20WcISKEHRfOM00043876@hotmail.com>
Subject: [linux-lvm] LVM that went bad, need data off it (newbie)
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
Date: Mon Sep  8 08:56:08 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, I have an LVM called "raid" that had 2 HDs go bad. The 2 HDs have been 
replaced, is there a way to simply replace the bad 1s with the good 1s, 
activate the LVM, salvage whatever data I can then format it all ?

Heres some info, not too sure which is relevant and which isn't:
Notes: devices hdn and hdp were the 2 that were replaced.

# fdisk -l

Disk /dev/hdo: 203.9 GB, 203928109056 bytes
255 heads, 63 sectors/track, 24792 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdo doesn't contain a valid partition table

Disk /dev/hdp: 203.9 GB, 203928109056 bytes
255 heads, 63 sectors/track, 24792 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdp doesn't contain a valid partition table

Disk /dev/hdm: 203.9 GB, 203928109056 bytes
255 heads, 63 sectors/track, 24792 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdm doesn't contain a valid partition table

Disk /dev/hdn: 203.9 GB, 203928109056 bytes
255 heads, 63 sectors/track, 24792 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

Disk /dev/hdn doesn't contain a valid partition table

Disk /dev/hdk: 80.0 GB, 80054059008 bytes
16 heads, 63 sectors/track, 155114 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes

Disk /dev/hdk doesn't contain a valid partition table

Disk /dev/hdl: 80.0 GB, 80054059008 bytes
16 heads, 63 sectors/track, 155114 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes

Disk /dev/hdl doesn't contain a valid partition table

Disk /dev/hdi: 81.9 GB, 81964302336 bytes
16 heads, 63 sectors/track, 158816 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes

Disk /dev/hdi doesn't contain a valid partition table

Disk /dev/hdj: 81.9 GB, 81964302336 bytes
16 heads, 63 sectors/track, 158816 cylinders
Units = cylinders of 1008 * 512 = 516096 bytes

Disk /dev/hdj doesn't contain a valid partition table

Disk /dev/hda: 122.9 GB, 122942324736 bytes
255 heads, 63 sectors/track, 14946 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1        61    489951   83  Linux
/dev/hda2            62       304   1951897+  83  Linux
/dev/hda3           305       669   2931862+  83  Linux
/dev/hda4           670     14946 114680002+   5  Extended
/dev/hda5           670       730    489951   83  Linux
/dev/hda6           731       973   1951866   83  Linux
/dev/hda7           974      1035    497983+  82  Linux swap
/dev/hda8          1036     14946 111740076   8e  Linux LVM

----------------------

# vgchange -a y raid
vgchange -- ERROR: physical volume "/dev/hdp" of volume group "raid" is 
offline
vgchange -- ERROR: physical volume "/dev/hdo" of volume group "raid" is 
inconsistent
vgchange -- ERROR: physical volume "/dev/hdm" of volume group "raid" is 
inconsistent
vgchange -- ERROR: physical volume "/dev/hdn" of volume group "raid" is 
inconsistent
vgchange -- ERROR: physical volume "/dev/hdk" of volume group "raid" is 
inconsistent
vgchange -- ERROR: physical volume "/dev/hdl" of volume group "raid" is 
inconsistent
vgchange -- ERROR: physical volume "/dev/hdi" of volume group "raid" is 
inconsistent
vgchange -- ERROR: physical volume "/dev/hdj" of volume group "raid" is 
inconsistent

----------------------

pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdo " with UUID 
"sn2bP4-NmhN-IM1I-C36F-lGNN-JPjt-OyOmVf"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- inactive PV "/dev/hdm " with UUID 
"yRxxMy-xJIk-sLFj-yWQY-JDdf-nPrJ-shQ8Os"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- inactive PV "/dev/hdn " with UUID 
"4YUiI2-1ykn-9svr-yKrp-HGh0-Mjyu-R1M22g" is in no VG  [189.92 GB]
pvscan -- inactive PV "/dev/hdk " with UUID 
"0DnLyd-i5ti-782c-P4iR-IBsh-lcKO-mhU6bP"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- inactive PV "/dev/hdl " with UUID 
"T36lq6-n0Id-jjxO-56o0-Zt8h-nXcM-SOj40d"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- inactive PV "/dev/hdi " with UUID 
"ZFwi9R-vOT4-nQb7-aGyP-tN4P-ZQyS-PC7yI1"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- inactive PV "/dev/hdj " with UUID 
"girQRL-fI1T-A84X-n9CW-7SIO-rTLP-CAvWhg"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- inactive PV "/dev/hda8" with UUID 
"FgbqdX-n2om-bESF-qNf2-tCBl-Smwh-S4WrB6"  is associated to unknown VG "raid" 
(run vgscan)
pvscan -- total: 8 [978.11 GB] / in use: 7 [788.19 GB] / in no VG: 1 [189.92 
GB]


Thanks for any help, Saviour

_________________________________________________________________
Sign-up for a FREE BT Broadband connection today! 
http://www.msn.co.uk/specials/btbroadband
