Return-Path: <dave@galilean.d2g.com>
Date: Tue, 8 May 2001 18:33:26 +0200
From: Dave Wapstra <dave@xs4all.nl>
Message-ID: <20010508183326.A8213@mercury.mercury.multiweb.nl>
Mime-Version: 1.0
Subject: [linux-lvm] SCSI/LVM problems after power outage
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

After a power outage, our ftp server with LVM has not survived very well.

System: UltraSparc II, Linux 2.4(2) + io.path + LVM 0.9.1beta6

All normal ext2 paritions were fsck'd fine, however, the volume is having problems.

The syslog has a lot of SCSI errors:

May  7 19:15:52 ftp kernel: sym53c8xx_reset: pid=0 reset_flags=1 serial_number=0 serial_number_at_timeout=0
May  7 19:15:52 ftp kernel: scsi2: device driver called scsi_done() for a synchronous reset.
May  7 19:15:53 ftp kernel: sym53c875-2-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:15:53 ftp kernel: sym53c875-2-<1,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:15:53 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:53 ftp kernel: sym53c875-2-<3,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:15:53 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:53 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:53 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:53 ftp kernel: SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002
May  7 19:15:53 ftp kernel: [valid=0] Info fld=0x0, Current sd08:20: sense key Aborted Command
May  7 19:15:53 ftp kernel: Additional sense indicates Initiator detected error message received
May  7 19:15:53 ftp kernel:  I/O error: dev 08:20, sector 2239227
May  7 19:15:53 ftp kernel: EXT2-fs error (device lvm(58,0)): ext2_read_inode: unable to read inode block - inode=1245185, block
=2490377
May  7 19:15:53 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:53 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:53 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:56 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:56 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:56 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:57 ftp kernel: scsi2 channel 0 : resetting for second half of retries.
May  7 19:15:57 ftp kernel: SCSI bus is being reset for host 2 channel 0.
May  7 19:15:57 ftp kernel: sym53c8xx_reset: pid=0 reset_flags=1 serial_number=0 serial_number_at_timeout=0
May  7 19:15:57 ftp kernel: scsi2: device driver called scsi_done() for a synchronous reset.
May  7 19:15:58 ftp kernel: sym53c875-2-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:15:58 ftp kernel: sym53c875-2-<3,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:15:58 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:58 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:58 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:15:58 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:15:58 ftp kernel: SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002
May  7 19:15:58 ftp kernel: [valid=0] Info fld=0x0, Current sd08:20: sense key Aborted Command
May  7 19:15:58 ftp kernel: Additional sense indicates Initiator detected error message received
May  7 19:15:58 ftp kernel:  I/O error: dev 08:20, sector 17443579
May  7 19:15:58 ftp kernel: EXT2-fs error (device lvm(58,0)): ext2_read_inode: unable to read inode block - inode=2195457, block
=4390921
May  7 19:15:58 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:00 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:00 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:01 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:01 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:01 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:02 ftp kernel: scsi2 channel 0 : resetting for second half of retries.
May  7 19:16:02 ftp kernel: SCSI bus is being reset for host 2 channel 0.
May  7 19:16:02 ftp kernel: sym53c8xx_reset: pid=0 reset_flags=1 serial_number=0 serial_number_at_timeout=0
May  7 19:16:02 ftp kernel: scsi2: device driver called scsi_done() for a synchronous reset.
May  7 19:16:02 ftp kernel: sym53c875-2-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:16:03 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:03 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:03 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:03 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:03 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:03 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:04 ftp kernel: scsi2 channel 0 : resetting for second half of retries.
May  7 19:16:04 ftp kernel: SCSI bus is being reset for host 2 channel 0.
May  7 19:16:04 ftp kernel: sym53c8xx_reset: pid=0 reset_flags=1 serial_number=0 serial_number_at_timeout=0
May  7 19:16:04 ftp kernel: scsi2: device driver called scsi_done() for a synchronous reset.
May  7 19:16:04 ftp kernel: sym53c875-2-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
May  7 19:16:05 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:05 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:05 ftp kernel: sym53c875-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 16)
May  7 19:16:05 ftp kernel: sym53c875-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae
May  7 19:16:05 ftp kernel: SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002
May  7 19:16:05 ftp kernel: [valid=0] Info fld=0x0, Current sd08:20: sense key Aborted Command

May  8 10:20:50 ftp kernel: scsi2 channel 0 : resetting for second half of retries. 
May  8 10:20:50 ftp kernel: SCSI bus is being reset for host 2 channel 0.  
May  8 10:20:50 ftp kernel: sym53c8xx_reset: pid=0 reset_flags=1 serial_number=0 serial_number_at_timeout=0 
May  8 10:20:50 ftp kernel: scsi2: device driver called scsi_done() for a synchronous reset. 
May  8 10:20:50 ftp kernel: sym53c876-2: restart (scsi reset). 
May  8 10:20:50 ftp kernel: sym53c876-2: Downloading SCSI SCRIPTS. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: wide msgout: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgout: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: wide msgin: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: wide: wide=1 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: wide msgout: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgin: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide: wide=1 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: wide msgin: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: wide: wide=1 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: sync msgout: 1-3-1-c-10. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgout: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: sync msg in: 1-3-1-c-f. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=15 fak=0 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<0,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15) 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgin: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide: wide=1 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: sync msgout: 1-3-1-c-10. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: sync msg in: 1-3-1-c-10. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=16 fak=0 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 16) 
May  8 10:20:50 ftp kernel: sym53c876-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgout: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgin: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide: wide=1 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: sync msgout: 1-3-1-c-10. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: sync msg in: 1-3-1-c-10. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=16 fak=0 chg=0. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 16) 
May  8 10:20:50 ftp kernel: sym53c876-2: SCSI parity error detected: SCR1=3 DBC=11000c00 SBCL=ae 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgout: 1-2-3-1. 
May  8 10:20:50 ftp kernel: sym53c876-2-<2,0>: wide msgin: 1-2-3-1. 
May  8 10:20:51 ftp kernel: sym53c876-2-<2,0>: wide: wide=1 chg=0. 
May  8 10:20:51 ftp kernel: SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002 
May  8 10:20:51 ftp kernel: [valid=0] Info fld=0x0, Current sd08:20: sense key Aborted Command 
May  8 10:20:51 ftp kernel: Additional sense indicates Initiator detected error message received 
May  8 10:20:51 ftp kernel:  I/O error: dev 08:20, sector 6695675 
May  8 10:20:51 ftp kernel: sym53c876-2-<2,0>: sync msgout: 1-3-1-c-10. 
May  8 10:20:51 ftp kernel: sym53c876-2-<2,0>: sync msg in: 1-3-1-c-10. 
May  8 10:20:51 ftp kernel: sym53c876-2-<2,0>: sync: per=12 scntl3=0x90 scntl4=0x0 ofs=16 fak=0 chg=0. 
May  8 10:20:51 ftp kernel: sym53c876-2-<2,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 16) 
May  8 10:20:52 ftp kernel: sym53c876-2: SCSI parity error detected: SCR1=3 DBC=11007c00 SBCL=ae 
May  8 10:20:52 ftp kernel: sym53c876-2-<2,0>: wide msgout: 1-2-3-1. 


How can I find out which disks are having problems, and what are possibilities to fix this?

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdc" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdd" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sde" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdf" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdg" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdh" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdi" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdj" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdk" of VG "ftp" [8.43 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdl" of VG "ftp" [8.43 GB / 0 free]
pvscan -- total: 11 [92.78 GB] / in use: 11 [92.78 GB] / in no VG: 0 [0]


# vgdisplay ftp
--- Volume group ---
VG Name               ftp
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                11
Act PV                11
VG Size               92.77 GB
PE Size               4 MB
Total PE              23749
Alloc PE / Size       23749 / 92.77 GB
Free  PE / Size       0 / 0
VG UUID               eFMVIQ-SMBr-ecsj-TDkc-bGvw-0fyE-jibMIU


# lvdisplay /dev/ftp/pub
--- Logical volume ---
LV Name                /dev/ftp/pub
VG Name                ftp
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                92.77 GB
Current LE             23749
Allocated LE           23749
Allocation             next free
Read ahead sectors     120
Block device           58:0


-Dave

-- 
Dave Wapstra
dave@xs4all.nl
