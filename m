From: "Ireneusz Kupiec" <irq@go2.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20031223110817.735D01A34A2@kogut.o2.pl>
Subject: [linux-lvm] pvmove doesnt work with LVM2?
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
Date: Tue Dec 23 05:10:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


Hi.

I was using LVM1 for long time - about 3 years i think. yesterday i wanted to
change to kernel 2.6.0 which has support for dev-mapper and LVM2 (at least I
thaught so).

I've downloaded newest stable lvm2-tools, and dev-mapper, compiled, and
installed.
all seems to work ok.

but i have few questions, and 1 big problem.

problem:

when i try to extend my current old volume pvmove gives me an error:

rn:~# pvmove /dev/hde1
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'hyp-pvmove0'.
  ABORTING: Temporary mirror activation failed.
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'hyp-rn'.

this is what i did:
i have volume group:

rn:~# vgdisplay
  --- Volume group ---
  VG Name               hyp
  System ID             rn1037982351
  Format                lvm2
  Metadata Areas        9
  Metadata Sequence No  30
  VG Access             read/write
  VG Status             resizable
  MAX LV                2048
  Cur LV                2
  Open LV               0
  Max PV                24
  Cur PV                9
  Act PV                9
  VG Size               989.19 GB
  PE Size               16.00 MB
  Total PE              63308
  Alloc PE / Size       53232 / 831.75 GB
  Free  PE / Size       10076 / 157.44 GB
  VG UUID               46QFpN-LocC-JvQw-PDlc-5be6-x7pu-burVMz

ive formated, and pvcreate /dev/hdk1

rn:~# pvdisplay /dev/hdk1
  --- Physical volume ---
  PV Name               /dev/hdk1
  VG Name               hyp
  PV Size               233.73 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       16384
  Total PE              14959
  Free PE               10076
  Allocated PE          4883
  PV UUID               Yu16JP-A65t-pbC0-93FR-kI3B-3Jv4-duKJMT

it shows that i have enough free space to move hde1 to hdk1.

rn:~# pvdisplay /dev/hde1
  --- Physical volume ---
  PV Name               /dev/hde1
  VG Name               hyp
  PV Size               76.30 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       16384
  Total PE              4883
  Free PE               0
  Allocated PE          4883
  PV UUID               GSRC0l-keb2-0BN2-Kgi5-8Hou-KVwE-ZtNPKS


now I dont know what i do wrong. i always used to do this things with lvm1, but
here is smth wrong.
and my additional question is, why vgdisplay shows only MAX LV  256 when ive
just turned to kernel 2.6.0 & dev-mapper & lvm2? it was supposed to be at least
1024, or 2048 (like it is now, coz ive edited some files - dont know if i did
smth bad).


how to fix my problem?

i want to remove hde1 and hdg1. i got enough space on hdk.
rn:~# pvs
PV         VG       Fmt  Attr PSize   PFree
/dev/hda2  hyp     lvm2 a-   110.58G      0
/dev/hdb1  hyp     lvm2 a-   114.47G      0
/dev/hdc1  hyp     lvm2 a-   111.77G      0
/dev/hdd1  hyp     lvm2 a-   114.47G      0
/dev/hde1  hyp     lvm2 a-    76.30G      0
/dev/hdf1  hyp     lvm2 a-    76.67G      0
/dev/hdg1  hyp    lvm2 a-    74.53G      0
/dev/hdh1  hyp    lvm2 a-    76.67G      0
/dev/hdk1           lvm2 --   233.73G 233.73G

and is there any good manual (like for veriosn lvm1, step-by-step configuring
lvm2, and converting lvm1->lvm2?)

and on dmesg i got this:
device-mapper: error adding target to table
device-mapper: device 254:001 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table
device-mapper: error adding target to table
device-mapper: device 254:001 too small for target
device-mapper: dm-linear: Device lookup failed
device-mapper: error adding target to table

I searched a lot on mailing list, but there is no solution for me.
