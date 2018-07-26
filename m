Date: Thu, 26 Jul 2018 08:49:52 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180726154951.jupwdd3rzqznwcks@merlins.org>
References: <20180726004154.xcdjyqv7tkdfpvca@merlins.org>
	<20180726072440.372sthb6accswcr4@merlins.org>
	<85e59b54-fb8f-67a9-13cc-6466f097f06a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85e59b54-fb8f-67a9-13cc-6466f097f06a@redhat.com>
Subject: Re: [linux-lvm] Can't create thin lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jul 26, 2018 at 10:40:42AM +0200, Zdenek Kabelac wrote:
> What are you trying to achieve with 'mkdir /dev/vgds2/' ?
> You shall never ever touch  /dev  content - it's always under full control
> of udev - if you start to create there your own files and directories you
> will break whole usability of the system.
> It's always udev having full control over all the symlinks there.
 
Yes, I know udev manages it, but given that things weren't working, I
randomly tried that (and yes I have udev)

> However I can't image in which todays distribution you would want to use it..
> 
> Anyway - the best 'debugging' you will get with  'lvcreate -vvvv'
> it will always tell you what is failing.

Looks like my problem was that udev was too old, and there was no
dependency for the newer package.  I upgraded from udev 232 from 239

It's looking better now:
gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2 
  Using default stripesize 64.00 KiB.
  Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB of data.
  semid 1376260: semop failed for cookie 0xd4d162f: incorrect semaphore state
  Failed to set a proper state for notification semaphore identified by cookie value 223155759 (0xd4d162f) to initialize waiting for incoming notifications.
  Logical volume "thinpool2" created.
  semid 1441796: semop failed for cookie 0xd4dad79: incorrect semaphore state
  Failed to set a proper state for notification semaphore identified by cookie value 223194489 (0xd4dad79) to initialize waiting for incoming notifications.
gargamel:~# lvdisplay
  --- Logical volume ---
  LV Name                thinpool2
  VG Name                vgds2
  LV UUID                rxJCsT-ImNv-ibvM-zOS0-Xzqv-O8AU-1STUH9
  LV Write Access        read/write
  LV Creation host, time gargamel.svh.merlins.org, 2018-07-26 08:42:51 -0700
  LV Pool metadata       thinpool2_tmeta
  LV Pool data           thinpool2_tdata
  LV Status              available
  # open                 0
  LV Size                14.50 TiB
  Allocated pool data    0.00%
  Allocated metadata     0.42%
  Current LE             3801088
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:9


This is what -vvvv said before udev was upgraded.

#mm/memlock.c:373         Locked 20828160 bytes
#activate/dev_manager.c:2945         Creating ACTIVATE tree for vgds2/thinpool2.
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2 [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-pool].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-pool [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2-real [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-real].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2-cow [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-cow].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2-tpool [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-tpool].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-tpool [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2_tmeta [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-tmeta].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-tmeta [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2_tmeta-real [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-real].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2_tmeta-cow [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-cow].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2_tdata [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-tdata].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-tdata [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2_tdata-real [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-real].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-real [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:696         Getting device info for vgds2-thinpool2_tdata-cow [LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-cow].
#ioctl/libdm-iface.c:1848         dm info  LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-cow [ opencount flush ]   [16384] (*1)
#activate/dev_manager.c:2591         Adding new LV vgds2/thinpool2 to dtree
#libdm-deptree.c:623         Not matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-tpool in deptree.
#libdm-deptree.c:623         Not matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVtagm8tt2DwYykD0jixmnUbYQIglsp3ce-tpool in deptree.
#activate/dev_manager.c:2513         Checking kernel supports thin-pool segment type for vgds2/thinpool2-tpool
#activate/dev_manager.c:2591         Adding new LV vgds2/thinpool2_tmeta to dtree
#libdm-deptree.c:623         Not matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-tmeta in deptree.
#libdm-deptree.c:623         Not matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-tmeta in deptree.
#activate/dev_manager.c:2513         Checking kernel supports striped segment type for vgds2/thinpool2_tmeta
#ioctl/libdm-iface.c:1848         dm deps   (253:2) [ opencount flush ]   [16384] (*1)
#metadata/metadata.c:2171         Calculated readahead of LV thinpool2_tmeta is 8192
#activate/dev_manager.c:2591         Adding new LV vgds2/thinpool2_tdata to dtree
#libdm-deptree.c:623         Not matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-tdata in deptree.
#libdm-deptree.c:623         Not matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-tdata in deptree.
#activate/dev_manager.c:2513         Checking kernel supports striped segment type for vgds2/thinpool2_tdata
#metadata/metadata.c:2171         Calculated readahead of LV thinpool2_tdata is 8192
#libdm-config.c:997       Setting activation/thin_pool_autoextend_threshold to 100
#libdm-deptree.c:591         Matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-tmeta in deptree.
#libdm-deptree.c:591         Matched uuid LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-tdata in deptree.
#metadata/metadata.c:2171         Calculated readahead of LV thinpool2 is 8192
#libdm-deptree.c:2004     Creating vgds2-thinpool2_tmeta
#ioctl/libdm-iface.c:1848         dm create vgds2-thinpool2_tmeta LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVB3HuP3X42OjPM31JY4ScCSrRN2WoZWGx-tmeta [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2859     Loading vgds2-thinpool2_tmeta table (253:7)
#libdm-deptree.c:2803         Adding target to (253:7): 0 237568 linear 253:2 31138752512
#ioctl/libdm-iface.c:1848         dm table   (253:7) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1848         dm reload   (253:7) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2912         Table size changed from 0 to 237568 for vgds2-thinpool2_tmeta (253:7).
#libdm-deptree.c:1368     Resuming vgds2-thinpool2_tmeta (253:7)
#ioctl/libdm-iface.c:1848         dm resume   (253:7) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1475         vgds2-thinpool2_tmeta: Stacking NODE_ADD (253,7) 0:6 0660 [trust_udev]
#libdm-common.c:1485         vgds2-thinpool2_tmeta: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-deptree.c:2004     Creating vgds2-thinpool2_tdata
#ioctl/libdm-iface.c:1848         dm create vgds2-thinpool2_tdata LVM-pc1cTHkFo7g0KzdELpj51s1yOOv20WIVj2xjlvzkpKsioFrUJdZAIDTzTm1Yhh8f-tdata [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2859     Loading vgds2-thinpool2_tdata table (253:8)
#libdm-deptree.c:2803         Adding target to (253:8): 0 31138512896 linear 253:2 239616
#ioctl/libdm-iface.c:1848         dm table   (253:8) [ opencount flush ]   [16384] (*1)
#ioctl/libdm-iface.c:1848         dm reload   (253:8) [ noopencount flush ]   [16384] (*1)
#libdm-deptree.c:2912         Table size changed from 0 to 31138512896 for vgds2-thinpool2_tdata (253:8).
#libdm-deptree.c:1368     Resuming vgds2-thinpool2_tdata (253:8)
#ioctl/libdm-iface.c:1848         dm resume   (253:8) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1475         vgds2-thinpool2_tdata: Stacking NODE_ADD (253,8) 0:6 0660 [trust_udev]
#libdm-common.c:1485         vgds2-thinpool2_tdata: Stacking NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1478         vgds2-thinpool2: Skipping NODE_DEL [trust_udev]
#libdm-common.c:1475         vgds2-thinpool2_tmeta: Skipping NODE_ADD (253,7) 0:6 0660 [trust_udev]
#libdm-common.c:1485         vgds2-thinpool2_tmeta: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1239         vgds2-thinpool2_tmeta (253:7): read ahead is 256
#libdm-common.c:1289         vgds2-thinpool2_tmeta (253:7): Setting read ahead to 8192
#libdm-common.c:1475         vgds2-thinpool2_tdata: Skipping NODE_ADD (253,8) 0:6 0660 [trust_udev]
#libdm-common.c:1485         vgds2-thinpool2_tdata: Processing NODE_READ_AHEAD 8192 (flags=1)
#libdm-common.c:1239         vgds2-thinpool2_tdata (253:8): read ahead is 256
#libdm-common.c:1289         vgds2-thinpool2_tdata (253:8): Setting read ahead to 8192
#libdm-config.c:975       global/thin_check_executable not found in config: defaulting to /usr/sbin/thin_check
#config/config.c:1468       global/thin_check_options not found in config: defaulting to thin_check_options = [ "-q" ]
#activate/dev_manager.c:1832   /dev/mapper/vgds2-thinpool2_tmeta: open failed: No such file or directory
#libdm-deptree.c:2933         Reverting vgds2-thinpool2_tdata.
#libdm-deptree.c:1043     Removing vgds2-thinpool2_tdata (253:8)
#ioctl/libdm-iface.c:1848         dm remove   (253:8) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1478         vgds2-thinpool2_tdata: Stacking NODE_DEL [trust_udev]
#libdm-deptree.c:2933         Reverting vgds2-thinpool2_tmeta.
#libdm-deptree.c:1043     Removing vgds2-thinpool2_tmeta (253:7)
#ioctl/libdm-iface.c:1848         dm remove   (253:7) [ noopencount flush ]   [16384] (*1)
#libdm-common.c:1478         vgds2-thinpool2_tmeta: Stacking NODE_DEL [trust_udev]
#libdm-deptree.c:3087         <backtrace>

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
