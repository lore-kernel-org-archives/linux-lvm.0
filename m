Date: Sun, 3 Sep 2000 19:34:10 -0500
From: Michael J Kellen <idsfa@visi.com>
Subject: [linux-lvm] [patch] LILO with LVM /boot
Message-ID: <20000903193410.B8718@isis.visi.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


The following patch to lilo 21.5 using the 2.4.0-test7 kernel allows
me to boot a machine using no non-lvm partitions in the lilo.conf.  I'd
appreciate some feedback from other testers ...


Michael Kellen
<idsfa@visi.com>



#example lilo.conf:
boot=/dev/system/root
install=/boot/boot-menu.b
lba32
compact
map=/boot/map
vga=normal
delay=50
menu-title="Pick a Kernel"
image=/boot/vmlinuz-2.4.0-test7
        initrd=/boot/initrd.gz
        root=0x3a00
        label=Linux
        read-only



diff -c lilo-21.5/Makefile lilo-21.5+lvm/Makefile
*** lilo-21.5/Makefile	Tue Jul 18 17:00:15 2000
--- lilo-21.5+lvm/Makefile	Sun Sep  3 15:09:21 2000
***************
*** 53,59 ****
  LD86=ld86 -0
  
  AFLAGS=`cat mylilo.h`
! CFLAGS=-Wall -g $(PCONFIG) $(AFLAGS)
  LDFLAGS=#-Xlinker -qmagic
  
  OBJS=lilo.o map.o geometry.o boot.o device.o common.o bsect.o cfg.o temp.o \
--- 53,59 ----
  LD86=ld86 -0
  
  AFLAGS=`cat mylilo.h`
! CFLAGS=-Wall -g $(PCONFIG) $(AFLAGS) -DHAVE_LVM
  LDFLAGS=#-Xlinker -qmagic
  
  OBJS=lilo.o map.o geometry.o boot.o device.o common.o bsect.o cfg.o temp.o \
diff -c lilo-21.5/geometry.c lilo-21.5+lvm/geometry.c
*** lilo-21.5/geometry.c	Sat Jul 15 15:33:06 2000
--- lilo-21.5+lvm/geometry.c	Sun Aug 27 23:09:55 2000
***************
*** 111,116 ****
--- 111,119 ----
      return MAJOR(dev) == MAJOR_HD || MAJOR(dev) == MAJOR_IDE2 ||
        MAJOR(dev) == MAJOR_IDE3 || MAJOR(dev) == MAJOR_IDE4 ||
        MAJOR(dev) == MAJOR_IDE5 || MAJOR(dev) == MAJOR_IDE6 ||
+ #ifdef HAVE_LVM
+       MAJOR(dev) == MAJOR_LVM ||
+ #endif
        MAJOR(dev) == MAJOR_XT || MAJOR(dev) == MAJOR_SD ||
        MAJOR(dev) == MAJOR_ESDI || MAJOR(dev) == MAJOR_DAC960;
  }
***************
*** 354,359 ****
--- 357,376 ----
  	    geo->sectors = hdprm.sectors;
  	    geo->start = hdprm.start;
  	    break;
+ 
+ #ifdef HAVE_LVM
+ 	case MAJOR_LVM:
+ 	    geo->device = 0x80+(MINOR(device) >> 6)+(MAJOR(device)==MAJOR_LVM ?
+ 	      0 : last_dev(MAJOR_LVM,64));
+ 	    if (ioctl(fd,HDIO_GETGEO,&hdprm) < 0)
+ 		die("geo_query_dev HDIO_GETGEO (dev 0x%04x): %s",device,
+ 		  strerror(errno));
+ 	    geo->heads = hdprm.heads;
+ 	    geo->cylinders = hdprm.cylinders;
+ 	    geo->sectors = hdprm.sectors;
+ 	    geo->start = hdprm.start;
+             break;
+ #endif
  
  	default:
  	    die("Sorry, don't know how to handle device 0x%04x",device);
diff -c lilo-21.5/lilo.h lilo-21.5+lvm/lilo.h
*** lilo-21.5/lilo.h	Sun Jul 16 06:09:15 2000
--- lilo-21.5+lvm/lilo.h	Sun Sep  3 15:09:57 2000
***************
*** 47,52 ****
--- 47,56 ----
  #define MAJOR_DAC960	48 /* First Mylex DAC960 PCI RAID controller */
  #define MAJOR_IDE5	55 /* IDE on fifth interface */
  #define MAJOR_IDE6	57 /* IDE on sixth interface */
+ #ifdef HAVE_LVM
+ #include <linux/major.h>
+ #define MAJOR_LVM	LVM_BLK_MAJOR /* Logical Volume Devices */
+ #endif
  #define COMPAQ_SMART2_MAJOR	72 /* First Smart/2 Major */
  
  #define MAX_IMAGES      ((SECTOR_SIZE*2-2)/sizeof(IMAGE_DESCR))
***************
*** 281,284 ****
  
  #endif
  
! #endif
\ No newline at end of file
--- 285,288 ----
  
  #endif
  
! #endif
diff -c lilo-21.5/partition.c lilo-21.5+lvm/partition.c
*** lilo-21.5/partition.c	Wed Oct 14 15:12:42 1998
--- lilo-21.5+lvm/partition.c	Sun Aug 27 17:57:55 2000
***************
*** 46,51 ****
--- 46,54 ----
         MAJOR(dev_nr) != MAJOR_SD && MAJOR(dev_nr) != MAJOR_IDE2 &&
         MAJOR(dev_nr) != MAJOR_IDE3 && MAJOR(dev_nr) != MAJOR_IDE4 &&
         MAJOR(dev_nr) != MAJOR_IDE5 && MAJOR(dev_nr) != MAJOR_IDE6 &&
+ #ifdef HAVE_LVM
+        MAJOR(dev_nr) != MAJOR_LVM &&
+ #endif
        MAJOR(dev_nr) != MAJOR_DAC960)) return;
      geo_get(&geo,dev_nr & ~PART_MASK,-1,1);
      fd = dev_open(&dev,dev_nr & ~PART_MASK,cfg_get_flag(cf_options,"fix-table")
