Return-Path: <gobo@gimle.nu>
Message-ID: <20010207173431.7660.qmail@fraggle.cs.uit.no>
From: gobo@gimle.nu
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot. 
In-Reply-To: Your message of "Wed, 07 Feb 2001 18:25:06 +0100."
             <20010207172506.7555.qmail@fraggle.cs.uit.no> 
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-21248520920"
Date: Wed, 07 Feb 2001 18:34:31 +0100
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
To: linux-lvm@sistina.com

This is a multipart MIME message.

--==_Exmh_-21248520920
Content-Type: text/plain; charset=us-ascii

gobo@gimle.nu said:
> I have attached the results from that to this mail along with the
> results form running vgcfgrestore -ll. Please note that the pvdata
> outputs are taken after I had tried running vgcfgrestore on all the
> partitions. 

At least I would have if I remembered...
Here goes.

--==_Exmh_-21248520920
Content-Type: text/plain ; name="cfg.txt"; charset=us-ascii
Content-Description: cfg.txt
Content-Disposition: attachment; filename="cfg.txt"

> vgcfgrestore -n widow -ll

--- Volume group ---
VG Name               widow
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                6
Act PV                6
VG Size               100.92 GB
PE Size               16 MB
Total PE              6459
Alloc PE / Size       6400 / 100 GB
Free  PE / Size       59 / 944 MB
VG UUID               FI7LcR-QWYd-BXPd-1db8-r3HA-UbNg-KbeuEV

--- Logical volume ---
LV Name                /dev/widow/Store
VG Name                widow
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                100 GB
Current LE             6400
Allocated LE           6400
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volume ---
PV Name               /dev/hde1
VG Name               widow
PV Size               19.11 GB / NOT usable 3.34 MB [LVM: 125 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              1223
Free PE               0
Allocated PE          1223
PV UUID               fFAg5P-kKUz-lBqn-Vryd-GS21-hM8R-5pJaMZ

--- Physical volume ---
PV Name               /dev/hdf1
VG Name               widow
PV Size               19.01 GB / NOT usable 13.37 MB [LVM: 125 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              1216
Free PE               0
Allocated PE          1216
PV UUID               GwPjBK-QDs1-jFo8-uPSF-MaMO-rE70-AmqW8F

--- Physical volume ---
PV Name               /dev/hdd1
VG Name               widow
PV Size               15.71 GB / NOT usable 4.66 MB [LVM: 124 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              1005
Free PE               0
Allocated PE          1005
PV UUID               qGIXjD-BEvX-0JRu-60dE-bbyg-BVyd-ERCwPN

--- Physical volume ---
PV Name               /dev/hdc1
VG Name               widow
PV Size               15.71 GB / NOT usable 4.66 MB [LVM: 124 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              1005
Free PE               0
Allocated PE          1005
PV UUID               2mdFvi-PRwZ-bELK-hWw4-lQYU-SCTR-2l3gRH

--- Physical volume ---
PV Name               /dev/hdb1
VG Name               widow
PV Size               15.71 GB / NOT usable 4.66 MB [LVM: 124 KB]
PV#                   5
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              1005
Free PE               0
Allocated PE          1005
PV UUID               QLlu9k-KJk7-4lv0-QKKf-PUMO-Lctn-Vblo2z

--- Physical volume ---
PV Name               /dev/hda3
VG Name               widow
PV Size               15.71 GB / NOT usable 4.69 MB [LVM: 124 KB]
PV#                   6
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       16384
Total PE              1005
Free PE               59
Allocated PE          946
PV UUID               g7Z7su-WzkZ-LIaA-w1HY-l7au-HMDH-XHuCRo


> pvdata -U /dev/hda3

--- List of physical volume UUIDs ---

000: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
001: qGIXjDBEvX0JRu60dEbbygBVydERCwPN
002: 2mdFviPRwZbELKhWw4lQYUSCTR2l3gRH
003: QLlu9kKJk74lv0QKKfPUMOLctnVblo2z
004: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
005: --- EMPTY ---

> pvdata -U /dev/hdb1

--- List of physical volume UUIDs ---

000: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
001: qGIXjDBEvX0JRu60dEbbygBVydERCwPN
002: 2mdFviPRwZbELKhWw4lQYUSCTR2l3gRH
003: QLlu9kKJk74lv0QKKfPUMOLctnVblo2z
004: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
005: --- EMPTY ---

> pvdata -U /dev/hdc1

--- List of physical volume UUIDs ---

000: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
001: qGIXjDBEvX0JRu60dEbbygBVydERCwPN
002: 2mdFviPRwZbELKhWw4lQYUSCTR2l3gRH
003: QLlu9kKJk74lv0QKKfPUMOLctnVblo2z
004: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
005: --- EMPTY ---

> pvdata -U /dev/hdd1

--- List of physical volume UUIDs ---

000: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
001: qGIXjDBEvX0JRu60dEbbygBVydERCwPN
002: 2mdFviPRwZbELKhWw4lQYUSCTR2l3gRH
003: QLlu9kKJk74lv0QKKfPUMOLctnVblo2z
004: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
005: --- EMPTY ---

> pvdata -U /dev/hde1

--- List of physical volume UUIDs ---

000: fFAg5PkKUzlBqnVrydGS21hM8R5pJaMZ
001: qGIXjDBEvX0JRu60dEbbygBVydERCwPN
002: 2mdFviPRwZbELKhWw4lQYUSCTR2l3gRH
003: QLlu9kKJk74lv0QKKfPUMOLctnVblo2z
004: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
005: --- EMPTY ---

> pvdata -U /dev/hdf1

--- List of physical volume UUIDs ---

000: GwPjBKQDs1jFo8uPSFMaMOrE70AmqW8F
001: qGIXjDBEvX0JRu60dEbbygBVydERCwPN
002: 2mdFviPRwZbELKhWw4lQYUSCTR2l3gRH
003: QLlu9kKJk74lv0QKKfPUMOLctnVblo2z
004: g7Z7suWzkZLIaAw1HYl7auHMDHXHuCRo
005: --- EMPTY ---

> pvdata -V /dev/hdf1

--- Volume group ---
VG Name               
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                6
Act PV                6
VG Size               100.92 GB
PE Size               16 MB
Total PE              6459
Alloc PE / Size       6400 / 100 GB
Free  PE / Size       59 / 944 MB
VG UUID               FI7LcR-QWYd-BXPd-1db8-r3HA-UbNg-KbeuEV

> vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found


--==_Exmh_-21248520920--
