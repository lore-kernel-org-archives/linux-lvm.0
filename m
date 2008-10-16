Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9G30Y1o022486
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 23:00:34 -0400
Received: from QMTA08.westchester.pa.mail.comcast.net
	(qmta08.westchester.pa.mail.comcast.net [76.96.62.80])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9G30HXM002585
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 23:00:19 -0400
Received: from jrv by vanzandt.comcast.net with local (Exim 3.36 #1 (Debian))
	id 1KqJ60-0002Ei-00
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 23:00:16 -0400
Message-Id: <E1KqJ60-0002Ei-00@vanzandt.comcast.net>
From: "James R. Van Zandt" <jrvz@comcast.net>
Date: Wed, 15 Oct 2008 23:00:16 -0400
Subject: [linux-lvm] recent kernels can't access my encrypted disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


I have an encrypted disk which I've accessed with kernels 2.6.18
through 2.6.24, but 2.6.25 and 2.6.26 kernels fail.

The disk was configured by a Debian installation CDROM, with an ext3
filesystem and swap in an LVM volume, encrypted with dmcrypt and LUKS.
An attempt to boot with 2.6.26 fails like this (hand transcribed):

  hda: max request size: 512KiB
  hda: 195371568 sectors (100030 MB), CHS=16383/255/63
  hda: cache flushes supported
   hda: hda1 hda2 < hda5 >
  hdb: ATAPI 24X DVD-ROM DVD-R-RAM CD-R/RW drive, 2048kB Cache
  uniform CD-ROM driver Revision: 3.20
  ...
  Volume group "ista" not found
  Enter passphrase to unlock the disk /dev/hda5 (hda5_crypt):
  key slot 0 unlocked.
  Command successful.
  File descriptor 3 left open
    Volume group "ista" not found
  cryptsetup: failed to setup lvm device
  done.
  Begin: Waiting for root file system ... done.
  Gave up waiting for root device.  Common problems:
   - Boot args (cat /proc/cmdline)
     - Check rootdelay= (did the system wait long enough?)
     - Check root= (did the system wait for the right device?)
   - Missing modules (cat /proc/modules; ls /dev)
  ALERT! /dev/master/ista-root does not exist. Dropping to a shell!
----------------------------------------------

None of the suggestions seem to help.  I can determine the following
with what is in the initramfs.  The command line is:

  cat /proc/cmdline
  root=/dev/mapper/ista-root ro vga=771 resume=swap:/dev/mapper/ista-swap_1

The cleartext interface to /dev/hda5 is created, but not the logical
volumes:

  ls -l /dev/mapper
  crw-rw----  1  0     0    10,  61 Sep 28 20:07 control
  crw-rw----  1  0     6   254,   0 Sep 28 20:07 hda5_crypt

The decrypted volume is an lvm2 volume:

  fstype < /dev/mapper/hda5_crypt
  FSTYPE=lvm2
  FSSIZE=0

  dmsetup info
  Name:              hda5_crypt
  State:             ACTIVE
  Read Ahead:        256
  Tables present:    LIVE
  Open count:        0
  Event number:      0
  Major, minor:      254, 0
  Number of targets: 1
  
Manually activating the volume group fails:

  vgchange -ay ista
    Volume group "ista" not found

The modules:

  cat /proc/modules
  sha256_generic 11392 0 - Live 0xf89d0000
  aes_i586 7744 2 - Live 0xf89ab000
  aes_generic 27784 1 aes_i586, Live 0xf89ec000
  ide_cd_mod 27524 0 - Live 0xf89e4000
  cdrom 30424 1 ide_cd_mod, Live 0xf89db000
  ide_disk 10272 2 - Live 0xf8856000
  ide_pci_generic 3876 0 [permanent], Live 0xf884b000
  ohci1394 24624 0 - Live 0xf89c8000
  e100 28684 0 - Live 0xf89a2000
  mii 4928 1 e100, Live 0xf8993000
  ieee1394 74760 1 ohci1394, Live 0xf8869000
  piix 6504 0 [permanent], Live 0xf885a000
  ide_core 95084 4 ide_cd_mod,ide_disk,ide_pci_generic,piix, Live 0xf89af000
  ehci_hcd 28140 0 - Live 0xf8861000
  huci_hcd 18672 0 - Live 0xf883f000
  usbcore 116752 3 ehci_hcd,uhci_hcd, Live 0xf8975000
  thermal 14972 0 - Live 0xf8846000
  processor 31920 2 thermal, Live 0xf884d000
  fan 3200 0 - Live 0xf883d000

----------------------------------

I configure and run my own kernels.  LVM support is compiled in:

  CONFIG_BLK_DEV_DM=y
  # CONFIG_DM_DEBUG is not set
  CONFIG_DM_CRYPT=y
  # CONFIG_DM_SNAPSHOT is not set
  # CONFIG_DM_MIRROR is not set
  # CONFIG_DM_ZERO is not set
  # CONFIG_DM_MULTIPATH is not set
  # CONFIG_DM_DELAY is not set
  # CONFIG_DM_UEVENT is not set


-------------------------------------------------
A similarly configured 2.6.24 kernel boots fine:

  ...
  Volume group "ista" not found
  Enter passphrase to unlock the disk /dev/hda5 (hda5_crypt):
  key slot 0 unlocked.
  Command successful.
    2 logical volume(s) in volume group "ista" now active
  Done.
  ...

After this successful boot:

  ls -l /dev/mapper
  total 0
  crw-rw---- 1 root root  10, 62 2008-08-05 19:53 control
  brw-rw---- 1 root disk 254,  0 2008-08-05 19:53 hda5_crypt
  brw-rw---- 1 root disk 254,  1 2008-08-05 19:53 ista-root
  brw-rw---- 1 root disk 254,  2 2008-08-05 19:53 ista-swap_1
  
  # pvdisplay
    --- Physical volume ---
    PV Name               /dev/dm-0
    VG Name               ista
    PV Size               92.92 GB / not usable 0
    Allocatable           yes (but full)
    PE Size (KByte)       4096
    Total PE              23787
    Free PE               0
    Allocated PE          23787
    PV UUID               S02gFl-Rtbv-C4ly-h4nG-ShA4-p0lB-Hb8sOA

  # vgdisplay
    --- Volume group ---
    VG Name               ista
    System ID
    Format                lvm2
    Metadata Areas        1
    Metadata Sequence No  3
    VG Access             read/write
    VG Status             resizable
    MAX LV                0
    Cur LV                2
    Open LV               2
    Max PV                0
    Cur PV                1
    Act PV                1
    VG Size               92.92 GB
    PE Size               4.00 MB
    Total PE              23787
    Alloc PE / Size       23787 / 92.92 GB
    Free  PE / Size       0 / 0
    VG UUID               dxXXxz-ESU9-zqDb-N3pv-3L6o-Y80h-R6hTJO

  # lvdisplay
    --- Logical volume ---
    LV Name                /dev/ista/root
    VG Name                ista
    LV UUID                ze3aL9-miiY-u6ls-GqtP-UxvG-9AIl-6nPxea
    LV Write Access        read/write
    LV Status              available
    # open                 1
    LV Size                90.33 GB
    Current LE             23124
    Segments               1
    Allocation             inherit
    Read ahead sectors     0
    Block device           254:1
  
    --- Logical volume ---
    LV Name                /dev/ista/swap_1
    VG Name                ista
    LV UUID                8QVLWx-r1Ov-oYxu-tN3i-mBxV-jTyy-NBBOKS
    LV Write Access        read/write
    LV Status              available
    # open                 1
    LV Size                2.59 GB
    Current LE             663
    Segments               1
    Allocation             inherit
    Read ahead sectors     0
    Block device           254:2

  dmsetup info
  Name:              ista-root
  State:             ACTIVE
  Read Ahead:        256
  Tables present:    LIVE
  Open count:        1
  Event number:      0
  Major, minor:      254, 0
  Number of targets: 1
  UUID: LVM-dxXXxzESU9zqDbN3pv3L6oY80hR6hTJOze3aL9miiYu6lsGqtPUxvG9AI16nPxea
  
  Name:              ista-swap_1
  State:             ACTIVE
  Read Ahead:        256
  Tables present:    LIVE
  Open count:        1
  Event number:      0
  Major, minor:      254, 2
  Number of targets: 1
  UUID: LVM-dxXXxzESUzqDbN3pv3L6oY80hR6hTJO8QVLWxr10voYxutN3imBxVjTyyNBBOKS
  
  Name:              hda5_crypt
  State:             ACTIVE
  Read Ahead:        256
  Tables present:    LIVE
  Open count:        2
  Event number:      0
  Major, minor:      254, 0
  Number of targets: 1
  
  cat /proc/modules
  <many modules omitted>
  ...
  jbd 43828 1 ext3, Live 0xf8a18000
  mbcache 8288 1 ext3, Live 0xf89f4000
  sha256_generic 11168 0 - Live 0xf887c000
  aes_i586 32628 2 - Live 0xf8a00000
  aes_generic 26728 0 - Live 0xf89f8000
  ide_cd 35844 0 - Live 0xf89aa000
  cdrom 32796 1 ide_cd, Live 0xf89e8000
  ide_disk 15296 3 - Live 0xf8877000
  generic 4356 0 [permanent], Live 0xf8874000
  ohci1394 29808 0 - Live 0xf89a1000
  e100 33420 0 - Live 0xf8997000
  mii 5280 1 e100, Live 0xf886c000
  piix 7428 0 [permanent], Live 0xf885e000
  ieee1394 84640 2 sbp2,ohci1394, Live 0xf89d2000
  ide_core 111308 4 ide_cd,ide_disk,generic,piix, Live 0xf89b5000
  ehci_hcd 31628 0 - Live 0xf8861000
  uhci_hcd 23184 0 - Live 0xf8840000
  usbcore 131688 6 usb_storage,usbhid,hci_usb,ehci_hcd,uhci_hcd, Live 0xf8975000
  thermal 15804 0 - Live 0xf8847000
  processor 35784 3 acpi_cpufreq,thermal, Live 0xf884c000
  fan 4740 0 - Live 0xf883d000
  
  head /sys/fs/ecryptfs/*
  ==> /sys/fs/ecryptfs/version <==
  55
  
  ==> /sys/fs/ecryptfs/version_str <==
  passphrase
  pubkey
  plaintext passthrough
  metadata in extended attribute
  multiple keys per file


I found and unpacked the initrd filesystem. The message "cryptsetup:
failed to setup lvm device" comes from this script:
  /tmp/initramfs-2.6.26/scripts/local-top/cryptroot

...which relies on this configuration file:
  
  cat /tmp/initramfs-2.6.26/conf/conf.d/cryptroot
  target=hda5_crypt,source=/dev/hda5,key=none,lvm=ista-root
  target=hda5_crypt,source=/dev/hda5,key=none,lvm=ista-swap_1
  

the cryptroot script runs the shell function
     activate_vg "/dev/mapper/ista-root"
which runs the command
     vgchange -ay ista
which fails with the 2.6.26 kernel ("No volume groups found", as noted
above).  With the 2.6.24 kernel, I get:
     vgchange -ay
       2 logical volume(s) in volume group "ista" now active

lvm_dump results and kernel configrations are here:
  http://jrv.oddones.org/tx27/lvmdump-ista-2008101413111.tgz     
  http://jrv.oddones.org/tx27/config-2.6.24
  http://jrv.oddones.org/tx27/config-2.6.26

I got one suggestion to check the filter statement in /etc/lvm/lvm.conf.
After a boot fails and it drops into a shell, /etc/lvm is an empty
directory.  In an unpacked initramfs (for either kernel), there is no
/etc/lvm at all, nor a file lvm.conf anywhere in the filesystem.  So
either lvm is running without a configuration file, or else it gets
created by some other magic.

After a successful boot, I find this:

  $ grep filter /etc/lvm/lvm.conf 
      # A filter that tells LVM2 to only use a restricted set of devices.
      # The filter consists of an array of regular expressions.  These
      # Don't have more than one filter line active@once: only one gets used.
      # filter = [ "a/.*/" ]
      filter = [ "r|/dev/cdrom|" ]
      # filter = [ "a/loop/", "r/.*/" ]
      # filter =[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
      # filter = [ "a|^/dev/hda8$|", "r/.*/" ]
      # The results of the filtering are cached on disk to avoid

so it apparently defaults to accepting anything not on a cdrom.  

     

I would appreciate any suggestions.

            - Jim Van Zandt
