Message-Id: <200308152011.h7FKBto08466@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate with a 52 drive volume
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
Date: Fri Aug 15 15:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm having trouble creating a striped logical volume across all 52 disks
in a volume group.  This is what happens when I try to create the
logical volume:

# lvcreate -i52 -I4 -l450996 -n mydata data_volume
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'data_volume-mydata'.
  Failed to activate new LV.

I see these two lines echoed to the console:
device-mapper: couldn't split parameters
device-mapper: error adding target to table

Here's the output for vgdisplay:

  --- Volume group ---
  VG Name               data_volume
  System ID             
  Format                lvm2
  Metadata Areas        52
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                0
  Open LV               0
  Max PV                256
  Cur PV                52
  Act PV                52
  VG Size               1.72 TB
  PE Size               4.00 MB
  Total PE              450996
  Alloc PE / Size       0 / 0   
  Free  PE / Size       450996 / 1.72 TB
  VG UUID               kKlfs8-CWAA-zMg5-ELOm-GmI7-zOhx-KsXyAA


I reduced the number of disks in the stipe set by 4 drives (and the
logical volume size appropriately) until I could create a logical
volume with these parameters:
	lvcreate -i12 -I4 -l104076 -n mydata data_volume

Any suggestions?

Thanks!
-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://www.osdl.org/archive/markw/
