Return-Path: <wim@comned.com>
From: "wim bakker" <wim@comned.com>
Date: Wed, 24 Jan 2001 15:41:32 +0100
Message-ID: <web-8135966@comned.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgextend segfault - additional info
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

Extension on my previous question
a vgdisplay -v testl shows:
--------------------------------
# vgdisplay -v testl
--- Volume group ---
VG Name               testl
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                10
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                20
Cur PV                2
Act PV                2
VG Size               1.53 GB
PE Size               4 MB
Total PE              392
Alloc PE / Size       0 / 0
Free  PE / Size       392 / 1.53 GB
VG UUID               g5vEgW-vKih-aG64-IcxB-8TeD-kC9U-IInEVt
 
--- No logical volumes defined in "testl" ---
 
 
--- Physical volumes ---
PV Name (#)           /dev/sdb1 (1)
PV Status             available / allocatable
Total PE / Free PE    392 / 392
 
PV Name (#)           /dev/sdb2 (2)
PV Status             available / allocatable
Total PE / Free PE    392 / 392
---------------------------
and echo $? gives errorcode 139 back
Is the kernel part unable updating the vg ???
TIA
wim bakker
ComNed Netwerken BV
31 20 4350025
