From: laurent.ml@linuxfr.org
Message-ID: <wazza.87fzhdbh1t.fsf@message.id>
MIME-Version: 1.0
Subject: [linux-lvm] access beyond end of the device :(
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
Date: Tue Oct 28 06:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I've been experienced "access beyond end of the device" kind of error
on my lvm1 logical volume.
I'm using:
- LVM2.2.00.07
- DM 2.4.23-pre7-dm3
- linux kernel 2.4.23-pre8
- debian sid
- ext3

I'm not sure it has something to do with it, but I tried 2.6.0-test9 +
2.6.0-t6-mm1-dm2 for 5 minutes and went back to 2.4.23-pre8.

I'm now having that kind of errors:
kernel: attempt to access beyond end of device
kernel: fe:00: rw=0, want=1898713640, limit=183500800
kernel: attempt to access beyond end of device
kernel: fe:00: rw=0, want=1543813092, limit=183500800
kernel: attempt to access beyond end of device
kernel: fe:00: rw=0, want=214402632, limit=183500800

fsck complains about a file system with errors.
(illegal block #### (######) in inode ####)
I did not let it correct them.

How can I correct that ?
What informations do you need ?

vgdisplay -v
    Finding all volume groups
    Finding volume group "data"
  --- Volume group ---
  VG Name               data
  System ID             fozzy1051979424
  Format                lvm1
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               1
  Max PV                256
  Cur PV                2
  Act PV                2
  VG Size               175.00 GB
  PE Size               32.00 MB
  Total PE              5600
  Alloc PE / Size       5600 / 175.00 GB
  Free  PE / Size       0 / 0   
  VG UUID               06g3cd-Jd4B-bYvU-xLhA-pYMX-OZSH-LVShS4
   
  --- Logical volume ---
  LV Name                /dev/data/data
  VG Name                data
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                175.00 GB
  Current LE             5600
  Segments               2
  Allocation             next free
  Read ahead sectors     1024
  Block device           254:0
   
  --- Physical volumes ---
  PV Name               /dev/hdc1     
  PV UUID               7Ny8DG-mLrZ-3wkK-aXEI-LPfA-NGx4-vMVoha
  PV Status             allocatable
  Total PE / Free PE    3680 / 0
   
  PV Name               /dev/hda9     
  PV UUID               XVbt8d-RFx0-z6Db-yfC3-lN32-P7Dt-mdH84j
  PV Status             allocatable
  Total PE / Free PE    1920 / 0

pvdisplay -v
    Scanning for physical volume names
  Physical volume "/dev/hdc1" of volume group "data" is exported
  --- Physical volume ---
  PV Name               /dev/hdc1
  VG Name               data (exported)
  PV Size               115.04 GB / not usable 36.90 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3680
  Free PE               0
  Allocated PE          3680
  PV UUID               7Ny8DG-mLrZ-3wkK-aXEI-LPfA-NGx4-vMVoha
   
  Physical volume "/dev/hda9" of volume group "data" is exported
  --- Physical volume ---
  PV Name               /dev/hda9
  VG Name               data (exported)
  PV Size               60.06 GB / not usable 63.72 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              1920
  Free PE               0
  Allocated PE          1920
  PV UUID               XVbt8d-RFx0-z6Db-yfC3-lN32-P7Dt-mdH84j

Any help would be greatly appreciated.

-- 
Laurent
