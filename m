Message-ID: <379B82D9.6845F39@thephaedo.com>
Date: Sun, 25 Jul 1999 21:34:17 +0000
From: "S. Ryan Quick" <ryan@thephaedo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Compile Problems
Content-Type: multipart/mixed;
 boundary="------------1522DC9BA156EEE9F4533386"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------1522DC9BA156EEE9F4533386
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Enclosed are some more details about the system and the output from 'make' on the
0.7 LVM:

Output from dmesg:    dmesg.out
Output from make:      make.out
make.tmpl                  --enclosed


# find / -name lvm.h
/usr/src/linux/include/linux/lvm.h
/usr/src/linux/include/config/blk/dev/lvm.h
#

Thanks again,

Ryan

--------------1522DC9BA156EEE9F4533386
Content-Type: text/plain; charset=us-ascii;
 name="dmesg.out"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmesg.out"

Linux version 2.2.10 (root@camus) (gcc version 2.7.2.3) #1 Thu Jul 22 01:09:30 EDT 1999
Detected 367507133 Hz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 367.00 BogoMIPS
Memory: 62912k/65472k available (1104k kernel code, 408k reserved, 992k data, 56k init)
CPU: Intel Celeron (Mendocino) stepping 05
Checking 386/387 coupling... OK, FPU using exception 16 error reporting.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
PCI: PCI BIOS revision 2.10 entry at 0xfb360
PCI: Using configuration type 1
PCI: Probing PCI hardware
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
NET4: Unix domain sockets 1.0 for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
Starting kswapd v 1.5 
Serial driver version 4.27 with no serial options enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
ttyS01 at 0x02f8 (irq = 3) is a 16550A
pty: 256 Unix98 ptys configured
PIIX4: IDE controller on PCI bus 00 dev 39
PIIX4: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xf000-0xf007, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0xf008-0xf00f, BIOS settings: hdc:pio, hdd:pio
hda: QUANTUM TRB635A, ATA DISK drive
hdc: QUANTUM TRB420A, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
hda: QUANTUM TRB635A, 607MB w/96kB Cache, CHS=617/32/63, DMA
hdc: QUANTUM TRB420A, 402MB w/96kB Cache, CHS=1010/16/51, DMA
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
LVM version 0.7  by Heinz Mauelshagen  (12/07/1999)
lvm -- Driver successfully initialized
md driver 0.36.6 MAX_MD_DEV=4, MAX_REAL=8
linear personality registered
raid1 personality registered
raid5 personality registered
sym53c8xx: at PCI bus 0, device 10, function 0
sym53c8xx: setting PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: 53c875J detected with Symbios NVRAM
sym53c875J-0: rev=0x04, base=0xe5000000, io_port=0xe800, irq=5
sym53c875J-0: Symbios format NVRAM, ID 7, Fast-20, Parity Checking
sym53c875J-0: initial SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 05/4e/80/01/00/24
sym53c875J-0: final   SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 05/46/80/00/08/24
sym53c875J-0: on-chip RAM at 0xe5001000
sym53c875J-0: resetting, command processing suspended for 2 seconds
sym53c875J-0: restart (scsi reset).
sym53c875J-0: enabling clock multiplier
sym53c875J-0: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.3c
scsi : 1 host.
sym53c875J-0: command processing resumed
  Vendor: QUANTUM   Model: FIREBALL ST4.3S   Rev: 0F0C
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 0, lun 0
sym53c875J-0-<1,*>: WIDE SCSI (16 bit) enabled.
sym53c875J-0-<1,*>: FAST-5 WIDE SCSI 10.0 MB/s (200 ns, offset 15)
  Vendor: COMPAQ    Model: ST15150W          Rev: 6216
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sdb at scsi0, channel 0, id 1, lun 0
sym53c875J-0-<0,0>: tagged command queue depth set to 4
sym53c875J-0-<1,0>: tagged command queue depth set to 4
scsi : detected 2 SCSI disks total.
sym53c875J-0-<0,*>: FAST-20 SCSI 20.0 MB/s (50 ns, offset 15)
SCSI device sda: hdwr sector= 512 bytes. Sectors= 8471232 [4136 MB] [4.1 GB]
SCSI device sdb: hdwr sector= 512 bytes. Sectors= 8386000 [4094 MB] [4.1 GB]
eth0: 3c509 at 0x300 tag 1, 10baseT port, address  00 20 af db 0d 3f, IRQ 10.
3c509.c:1.16 (2.2) 2/3/98 becker@cesdis.gsfc.nasa.gov.
Partition check:
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 >
 sdb: sdb1 sdb2 sdb3
 hda: hda1 hda2
 hdc: hdc1 hdc2
Coda Kernel/Venus communications, v4.6.0, braam@cs.cmu.edu
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 56k freed
Adding Swap: 64052k swap-space (priority -1)
Adding Swap: 51180k swap-space (priority -2)
rtl8139.c:v1.04 9/22/98 Donald Becker http://cesdis.gsfc.nasa.gov/linux/drivers/rtl8139.html
eth1: RealTek RTL8139 Fast Ethernet (mislabeled) at 0xe400, IRQ 12, 00:e0:29:46:a2:04.
REGISTER_DEV hdc1 to md0 done
REGISTER_DEV sda1 to md0 done
REGISTER_DEV sda5 to md1 done
REGISTER_DEV sda8 to md1 done
REGISTER_DEV sdb2 to md2 done
REGISTER_DEV sda3 to md2 done
REGISTER_DEV sda9 to md2 done
eth0: Setting Rx mode to 1 addresses.
NET4: AppleTalk 0.18 for Linux NET4.0
eth0: Setting Rx mode to 2 addresses.
eth0: Setting Rx mode to 3 addresses.

--------------1522DC9BA156EEE9F4533386
Content-Type: text/plain; charset=us-ascii;
 name="make.out"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="make.out"

make[1]: Entering directory `/usr/local/junk/LVM/0.7/tools'
make[2]: Entering directory `/usr/local/junk/LVM/0.7/tools/lib'
make[3]: Entering directory `/usr/local/junk/LVM/0.7/tools/lib'
cc -c -pipe -Wall -I/usr/local/junk/LVM/0.7/tools -I/usr/local/junk/LVM/0.7/tools/lib -D__KERNEL__ -O2 -DDEBUG -o basename.o basename.c
In file included from basename.c:26:
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:101: linux/lvm.h: No such file or directory
In file included from /usr/local/junk/LVM/0.7/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/genhd.h:82: parse error before `__u32'
/usr/include/linux/genhd.h:82: warning: no semicolon at end of struct or union
/usr/include/linux/genhd.h:83: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:84: parse error before `d_subtype'
/usr/include/linux/genhd.h:84: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:87: parse error before `d_secsize'
/usr/include/linux/genhd.h:87: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:88: parse error before `d_nsectors'
/usr/include/linux/genhd.h:88: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:89: parse error before `d_ntracks'
/usr/include/linux/genhd.h:89: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:90: parse error before `d_ncylinders'
/usr/include/linux/genhd.h:90: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:91: parse error before `d_secpercyl'
/usr/include/linux/genhd.h:91: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:92: parse error before `d_secperunit'
/usr/include/linux/genhd.h:92: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:93: parse error before `d_sparespertrack'
/usr/include/linux/genhd.h:93: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:94: parse error before `d_sparespercyl'
/usr/include/linux/genhd.h:94: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:95: parse error before `d_acylinders'
/usr/include/linux/genhd.h:95: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:96: parse error before `d_rpm'
/usr/include/linux/genhd.h:96: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:97: parse error before `d_interleave'
/usr/include/linux/genhd.h:97: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:98: parse error before `d_trackskew'
/usr/include/linux/genhd.h:98: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:99: parse error before `d_cylskew'
/usr/include/linux/genhd.h:99: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:100: parse error before `d_headswitch'
/usr/include/linux/genhd.h:100: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:101: parse error before `d_trkseek'
/usr/include/linux/genhd.h:101: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:102: parse error before `d_flags'
/usr/include/linux/genhd.h:102: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:104: parse error before `d_drivedata'
/usr/include/linux/genhd.h:104: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:106: parse error before `d_spare'
/usr/include/linux/genhd.h:106: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:107: parse error before `d_magic2'
/usr/include/linux/genhd.h:107: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:108: parse error before `d_checksum'
/usr/include/linux/genhd.h:108: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:111: parse error before `d_npartitions'
/usr/include/linux/genhd.h:111: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:112: parse error before `d_bbsize'
/usr/include/linux/genhd.h:112: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:113: parse error before `d_sbsize'
/usr/include/linux/genhd.h:113: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:115: parse error before `__u32'
/usr/include/linux/genhd.h:115: warning: no semicolon at end of struct or union
/usr/include/linux/genhd.h:116: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:117: parse error before `p_fsize'
/usr/include/linux/genhd.h:117: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:118: parse error before `p_fstype'
/usr/include/linux/genhd.h:118: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:119: parse error before `p_frag'
/usr/include/linux/genhd.h:119: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:120: parse error before `p_cpg'
/usr/include/linux/genhd.h:120: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:121: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:122: parse error before `}'
In file included from basename.c:26:
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:221: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:221: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:221: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:222: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:222: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:222: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:225: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:226: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:231: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:232: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:233: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:236: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:236: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:236: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:237: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:237: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:237: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:238: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:239: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:240: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:242: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:243: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:246: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:247: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:248: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:249: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:253: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:254: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:255: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:256: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:257: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:258: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:259: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:260: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:261: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:262: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:265: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:269: parse error before `kdev_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:271: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:272: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:273: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:276: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:277: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:278: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:279: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:280: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:281: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:283: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:285: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:286: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:286: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:286: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:287: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:287: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:287: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:289: parse error before `pv_create_kdev_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:289: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:290: warning: parameter names (without types) in function declaration
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:293: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:294: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:296: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:298: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:300: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:302: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:303: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:304: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:305: parse error before `disk_pe_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:306: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:307: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:308: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:309: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:310: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:311: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:312: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:313: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:314: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:315: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:316: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:317: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:318: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:319: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:320: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:321: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:322: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:329: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:330: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:331: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:332: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:336: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:336: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:336: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:337: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:337: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:337: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:338: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:339: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:341: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:342: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:343: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:344: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:345: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:346: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:347: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:348: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:349: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:350: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:351: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:352: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:353: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:354: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:355: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:356: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:358: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:359: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:360: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:361: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:362: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:363: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:364: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:365: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:366: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:367: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:368: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:369: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:411: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:413: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:414: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:416: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:417: parse error before `*'
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/local/junk/LVM/0.7/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/local/junk/LVM/0.7/tools/lib'
make[2]: Entering directory `/usr/local/junk/LVM/0.7/tools/man8'
make[3]: Entering directory `/usr/local/junk/LVM/0.7/tools/man8'
make[3]: Leaving directory `/usr/local/junk/LVM/0.7/tools/man8'
make[2]: Leaving directory `/usr/local/junk/LVM/0.7/tools/man8'
make[2]: Entering directory `/usr/local/junk/LVM/0.7/tools'
cc -c -pipe -Wall -I/usr/local/junk/LVM/0.7/tools -I/usr/local/junk/LVM/0.7/tools/lib -D__KERNEL__ -O2 -DDEBUG -o e2fsadm.o e2fsadm.c
In file included from /usr/local/junk/LVM/0.7/tools/lvm_user.h:43,
                 from e2fsadm.c:35:
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:101: linux/lvm.h: No such file or directory
In file included from e2fsadm.c:35:
/usr/local/junk/LVM/0.7/tools/lvm_user.h:78: linux/lvm.h: No such file or directory
In file included from /usr/local/junk/LVM/0.7/tools/lib/liblvm.h:103,
                 from /usr/local/junk/LVM/0.7/tools/lvm_user.h:43,
                 from e2fsadm.c:35:
/usr/include/linux/genhd.h:82: parse error before `__u32'
/usr/include/linux/genhd.h:82: warning: no semicolon at end of struct or union
/usr/include/linux/genhd.h:83: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:84: parse error before `d_subtype'
/usr/include/linux/genhd.h:84: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:87: parse error before `d_secsize'
/usr/include/linux/genhd.h:87: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:88: parse error before `d_nsectors'
/usr/include/linux/genhd.h:88: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:89: parse error before `d_ntracks'
/usr/include/linux/genhd.h:89: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:90: parse error before `d_ncylinders'
/usr/include/linux/genhd.h:90: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:91: parse error before `d_secpercyl'
/usr/include/linux/genhd.h:91: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:92: parse error before `d_secperunit'
/usr/include/linux/genhd.h:92: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:93: parse error before `d_sparespertrack'
/usr/include/linux/genhd.h:93: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:94: parse error before `d_sparespercyl'
/usr/include/linux/genhd.h:94: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:95: parse error before `d_acylinders'
/usr/include/linux/genhd.h:95: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:96: parse error before `d_rpm'
/usr/include/linux/genhd.h:96: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:97: parse error before `d_interleave'
/usr/include/linux/genhd.h:97: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:98: parse error before `d_trackskew'
/usr/include/linux/genhd.h:98: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:99: parse error before `d_cylskew'
/usr/include/linux/genhd.h:99: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:100: parse error before `d_headswitch'
/usr/include/linux/genhd.h:100: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:101: parse error before `d_trkseek'
/usr/include/linux/genhd.h:101: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:102: parse error before `d_flags'
/usr/include/linux/genhd.h:102: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:104: parse error before `d_drivedata'
/usr/include/linux/genhd.h:104: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:106: parse error before `d_spare'
/usr/include/linux/genhd.h:106: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:107: parse error before `d_magic2'
/usr/include/linux/genhd.h:107: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:108: parse error before `d_checksum'
/usr/include/linux/genhd.h:108: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:111: parse error before `d_npartitions'
/usr/include/linux/genhd.h:111: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:112: parse error before `d_bbsize'
/usr/include/linux/genhd.h:112: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:113: parse error before `d_sbsize'
/usr/include/linux/genhd.h:113: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:115: parse error before `__u32'
/usr/include/linux/genhd.h:115: warning: no semicolon at end of struct or union
/usr/include/linux/genhd.h:116: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:117: parse error before `p_fsize'
/usr/include/linux/genhd.h:117: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:118: parse error before `p_fstype'
/usr/include/linux/genhd.h:118: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:119: parse error before `p_frag'
/usr/include/linux/genhd.h:119: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:120: parse error before `p_cpg'
/usr/include/linux/genhd.h:120: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:121: warning: data definition has no type or storage class
/usr/include/linux/genhd.h:122: parse error before `}'
In file included from /usr/local/junk/LVM/0.7/tools/lvm_user.h:43,
                 from e2fsadm.c:35:
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:221: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:221: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:221: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:222: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:222: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:222: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:225: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:226: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:231: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:232: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:233: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:236: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:236: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:236: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:237: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:237: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:237: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:238: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:239: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:240: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:242: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:243: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:246: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:247: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:248: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:249: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:253: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:254: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:255: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:256: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:257: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:258: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:259: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:260: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:261: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:262: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:265: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:269: parse error before `kdev_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:271: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:272: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:273: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:276: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:277: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:278: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:279: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:280: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:281: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:283: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:285: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:286: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:286: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:286: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:287: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:287: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:287: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:289: parse error before `pv_create_kdev_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:289: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:290: warning: parameter names (without types) in function declaration
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:293: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:294: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:296: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:298: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:300: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:302: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:303: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:304: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:305: parse error before `disk_pe_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:306: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:307: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:308: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:309: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:310: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:311: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:312: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:313: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:314: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:315: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:316: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:317: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:318: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:319: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:320: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:321: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:322: parse error before `pv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:329: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:330: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:331: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:332: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:336: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:336: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:336: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:337: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:337: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:337: warning: data definition has no type or storage class
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:338: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:339: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:341: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:342: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:343: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:344: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:345: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:346: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:347: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:348: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:349: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:350: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:351: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:352: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:353: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:354: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:355: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:356: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:358: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:359: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:360: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:361: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:362: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:363: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:364: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:365: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:366: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:367: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:368: parse error before `*'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:369: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:411: parse error before `lv_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:413: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:414: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:416: parse error before `vg_t'
/usr/local/junk/LVM/0.7/tools/lib/liblvm.h:417: parse error before `*'
e2fsadm.c: In function `main':
e2fsadm.c:61: `UNDEF' undeclared (first use this function)
e2fsadm.c:61: (Each undeclared identifier is reported only once
e2fsadm.c:61: for each function it appears in.)
e2fsadm.c:71: `FALSE' undeclared (first use this function)
e2fsadm.c:86: `NAME_LEN' undeclared (first use this function)
e2fsadm.c:86: size of array `buffer' has non-integer type
e2fsadm.c:87: size of array `command' has non-integer type
e2fsadm.c:94: `lv_t' undeclared (first use this function)
e2fsadm.c:94: `lv' undeclared (first use this function)
e2fsadm.c:95: `vg_t' undeclared (first use this function)
e2fsadm.c:95: `vg' undeclared (first use this function)
e2fsadm.c:96: parse error before `*'
e2fsadm.c:220: `TRUE' undeclared (first use this function)
e2fsadm.c:327: `super' undeclared (first use this function)
e2fsadm.c: In function `lvm_find_command':
e2fsadm.c:436: `NAME_LEN' undeclared (first use this function)
e2fsadm.c:436: warning: unused variable `command'
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/local/junk/LVM/0.7/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/local/junk/LVM/0.7/tools'
make: *** [all] Error 2

--------------1522DC9BA156EEE9F4533386
Content-Type: text/plain; charset=us-ascii;
 name="make.tmpl"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="make.tmpl"

#
# make.tmpl
#
# Copyright (C)  1997 - 1999  Heinz Mauelshagen, Germany
#
# February 1997
# May,June 1998
# January 1999
#
# lvm is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
# 
# lvm is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with GNU CC; see the file COPYING.  If not, write to
# the Free Software Foundation, 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA. 
#
#
#
# top level make template
#


# Uncomment this for multiprocessor and set the number of your cpus
# MAKEFLAGS = -j2

TOP = /usr/local/junk/LVM/0.7

KERNEL_LOCATION = /usr/src/linux

.SUFFIXES =
.SUFFIXES = .o.c

%.a:	%.o
	$(AR) -r $@ $*.o

%.o:	%.c
	$(CC) -c -pipe $(CFLAGS) -o $@ $*.c

%:	%.o $(LIBS)
	$(CC) $(LDFLAGS) -o $@ $*.o $(LIBS)

CFLAGS = -Wall -I$(TOP)/tools -I$(TOP)/tools/lib -D__KERNEL__ -O2

BINDIR = /sbin
ALL_SOURCES = $(shell ls *.c)
ALL_TARGETS = $(ALL_SOURCES:.c=)
ALL_EXECS = $(ALL_TARGETS)
ALL_HEADERS = $(shell ls *.h)
ALL_FILES = $(ALL_SOURCES) $(ALL_HEADERS)
ALL_OBJECTS = $(ALL_SOURCES:.c=.o)
OTHER_DEP = Makefile /usr/src/linux/include/linux/lvm.h

all:	
	@for d in $(SUBDIRS); \
	 do \
	    if [ "$$d" = "." ]; \
	    then \
	       $(MAKE) all_this; \
	    else \
	       $(MAKE) -C $$d all; \
	    fi; \
	 done

install:	all
	@for d in $(SUBDIRS); \
	 do \
	    if [ "$$d" = "." ]; \
	    then \
	       $(MAKE) install_this; \
	    else \
	       $(MAKE) -C $$d install; \
	    fi; \
	 done

remove:	
	@for d in $(SUBDIRS); \
	 do \
	    if [ "$$d" = "." ]; \
	    then \
	       $(MAKE) -C $$d remove_this; \
	    else \
	       $(MAKE) -C $$d remove; \
	    fi; \
	 done

clean:
	@for d in $(SUBDIRS); \
	 do \
	    if [ "$$d" = "." ]; \
	    then \
	       $(MAKE) clean_this; \
	    else \
	       $(MAKE) -C $$d clean; \
	    fi; \
	 done

--------------1522DC9BA156EEE9F4533386--
