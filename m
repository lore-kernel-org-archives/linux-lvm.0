Message-ID: <3E293C00.30406@informatik.uni-erlangen.de>
From: Rainer.Lay@informatik.uni-erlangen.de
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cannot extend lv
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
Date: Sat Jan 18 04:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I have a vg (data) with four drives /dev/sd[b-e]1
I created a 2 stripes lv (data1) with sd[bc]1
Now I want to add the remaining two drives to the lv, but lvextend 
complains about missing pes! I tried also with a very small number of 
pes - without success:

lvextend -l +400 /dev/data/data1 /dev/sde1 /dev/sdd1
lvextend -- extending logical volume "/dev/data/data1" to 35.45 GB
lvextend -- not enough free/allocatable physical extents to extend 
logical volume "/dev/data/data1"

It returns error code 12:
12 error setting up VGDA for logical volume extension
which is not very useful in this case.

Any idea?


kind regards,

Rainer


here comes a vgdisplay:
vgdisplay -v
--- Volume group ---
VG Name               data
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               50.83 GB
PE Size               4 MB
Total PE              13012
Alloc PE / Size       8676 / 33.89 GB
Free  PE / Size       4336 / 16.94 GB
VG UUID               sIKhBA-LMrL-e0h0-5NEt-mVSZ-3SrM-2KB7XS

--- Logical volume ---
LV Name                /dev/data/data1
VG Name                data
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 2
LV Size                33.89 GB
Current LE             8676
Allocated LE           8676
Stripes                2
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     1024
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/sdb1 (3)
PV Status             available / allocatable
Total PE / Free PE    4338 / 0

PV Name (#)           /dev/sdc1 (2)
PV Status             available / allocatable
Total PE / Free PE    4338 / 0

PV Name (#)           /dev/sdd1 (1)
PV Status             available / allocatable
Total PE / Free PE    2167 / 2167

PV Name (#)           /dev/sde1 (4)
PV Status             available / allocatable
Total PE / Free PE    2169 / 2169
