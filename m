From: Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Message-ID: <Pine.A41.4.43.0211111646050.33292-100000@hera.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] mkfs.ext3 on a LV stoped working
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
Date: Mon Nov 11 17:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

Using LVM 1.0.3 on redhat 7.3 (2.4.18-3 kernel).

When I run "mkfs.ext3 /dev/homevg/templv homevg" I get the following:

mke2fs 1.27 (8-Mar-2002)
mkfs.ext3: bad blocks count - homevg

The VG and LV are there:

--- Volume group ---
VG Name               homevg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               477.68 GB
PE Size               4 MB
Total PE              122285
Alloc PE / Size       1000 / 3.91 GB
Free  PE / Size       121285 / 473.77 GB
VG UUID               B5NdPc-D3oa-sgTO-Avfe-kXmh-LTGN-gT85FW

--- Logical volume ---
LV Name                /dev/homevg/templv
VG Name                homevg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                3.91 GB
Current LE             1000
Allocated LE           1000
Allocation             next free
Read ahead sectors     1024
Block device           58:0

--- Physical volumes ---
PV Name (#)           /dev/sdb (1)
PV Status             available / allocatable
Total PE / Free PE    122285 / 121285



So, what I did was, I removed the LV and VG, then rebuilt it, and then I
was able to make the filesystem once again. So my question is, does LVM
work? Or do you have to blow away a VG in order to fix those bugs? Or
maybe I'm doing something wrong.

Thanks in advance,

Alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
