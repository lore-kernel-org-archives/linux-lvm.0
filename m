Message-ID: <3D1AD32B.400@ti.com>
From: christian e <cej@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem running vgscan..Is it a megaraid issue or an LVM issue ??
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
Date: Thu Jun 27 03:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux lvm <linux-lvm@sistina.com>

Hi,all

I posted this on the megaraid devel list thinking it was a megaraid 
problem..But maybe it's LVM doing tricks..Here goes:

I've had problems with a volume group not showing up after a reboot..
After booting up the volume group on the megaraid is not 
detected.Running vgcfgrestore on the individual disks the volume group 
can bring it back...That is until I run a vgscan resulting in this output:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg0"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 0
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 2
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 4
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 6
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 0
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 2
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 4
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 6
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 0
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 2
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 4
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 6
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 0
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 2
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 4
SCSI disk error : host 2 channel 2 id 0 lun 0 return code = 25040001
  I/O error: dev 08:21, sector 6

these errors appear on the console after running it along with a lot of:
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer

and the volume group vg1 is completely gone..It can be brought up again 
like this:

vgcfgrestore -v -n vg1 /dev/sdb1
vgcfgrestore -v -n vg1 /dev/sdc
vgchange -ay

and then it's OK until vgscan is run...

setup:

Poweredge 2550

Megaraid (2 adapters)..from dmesg:
  megaraid: v1.18 (Release Date: Thu Oct 11 15:02:53 EDT 2001
)<5>megaraid: found 0x101e:0x1960:idx 0:bus 2:slot 0:func 0
scsi1 : Found a MegaRAID controller at 0xf8805000, IRQ: 20
scsi1 : Enabling 64 bit support
megaraid: [161N:3.17] detected 1 logical drives
megaraid: channel[1] is raid.
megaraid: channel[2] is raid.
megaraid: found 0x101e:0x1960:idx 1:bus 4:slot 0:func 0
scsi2 : Found a MegaRAID controller at 0xf8807000, IRQ: 18
scsi2 : Enabling 64 bit support
megaraid: [161N:3.17] detected 1 logical drives
megaraid: channel[1] is raid.
megaraid: channel[2] is raid.
scsi1 : LSI Logic MegaRAID 161N 254 commands 16 targs 5 chans 7 luns
scsi2 : LSI Logic MegaRAID 161N 254 commands 16 targs 5 chans 7 luns

running Debian 2.2 with kernel 2.4.17
lvm version 1.0.1

Anyone know what's going on with this ?? It's our main server so it's 
not possible to boot very often..That's why I'd like to investigate all 
possible options before trying to debug further..

best regards

Christian
-- 
Christian Ejstrup, IT Admin / RF Development Engineer
Texas Instruments A/S, Denmark ,Sofiendalsvej 93,DK-9200 Aalborg SV,Denmark
Phone:+45 96346868, Phone(direct):+45 96346860, GSM:+45 22234304
