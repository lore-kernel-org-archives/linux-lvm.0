From: Richard Chan <rspchan@starhub.net.sg>
Message-id: <3DF4A591.8010109@starhub.net.sg>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Error with 2.5.50-dm-2; vanilla OK
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
Date: Mon Dec  9 08:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com
Cc: cshihpin@dso.org.sg

Hi, I'm getting an error with 2.5.50-dm2 but vanilla 2.5.50 is OK.

When I try lvm vgchange -ay I get the error messages

Dec  9 21:49:54 dyndns12 kernel: device-mapper: allocating minor 0.
Dec  9 21:49:54 dyndns12 kernel: device-mapper: device /dev/hdb7 too 
small for target
Dec  9 21:49:54 dyndns12 kernel: device-mapper: internal error adding 
target to table
Dec  9 21:49:54 dyndns12 kernel: device-mapper: destroying table

3 of 4 LVs in the VG are OK

If I use vanilla 2.5.50 the LVs are created OK

Dec  9 21:49:54 dyndns12 kernel: device-mapper: allocating minor 0.
Dec  9 21:49:54 dyndns12 kernel: device-mapper: allocating minor 1.
Dec  9 21:49:54 dyndns12 kernel: device-mapper: allocating minor 2.
Dec  9 21:49:54 dyndns12 kernel: device-mapper: allocating minor 3.

lvm version
  LVM version:     1.95.11-cvs (2002-11-18)
  Library version: 0.96.07-ioctl-cvs (2002-11-21)
  Driver version:  1.0.6

lvm vgdisplay vg00
 --- Volume group ---
  VG Name               vg00
  System ID             caesar1000557946
  Format                lvm1
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                4
  Open LV               2
  Max PV                255
  Cur PV                2
  Act PV                2
  VG Size               39.89GB
  PE Size               4.00MB
  Total PE              10212
  Alloc PE / Size       9920 / 38.75GB
  Free  PE / Size       292 / 1.14GB
  VG UUID               SsC7qF-Jb43-vh72-TctL-wlpU-iPvx-1Hr3hS

This is the LV that causes grief:
 
lvm lvdisplay vg00
  --- Logical volume ---
  LV Name                /dev/vg00/LVmisc
  VG Name                vg00
  LV UUID                000000-0000-0000-0000-0000-0000-000001
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                20.00GB
  Current LE             5120
  Segments               2
  Allocation             next free
  Read ahead sectors     120
  Block device           254:1
