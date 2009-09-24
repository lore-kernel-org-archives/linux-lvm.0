Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8OJcTOE019527
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 15:38:29 -0400
Received: from smtp-out1.berkeley.edu (smtp-out1.Berkeley.EDU [128.32.61.106])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8OJcCvS013272
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 15:38:12 -0400
Received: from adsl-99-60-4-64.dsl.pltn13.sbcglobal.net ([99.60.4.64]
	helo=venus.gateway.2wire.net)
	by fe3.calmail with esmtpsa (TLSv1:AES128-SHA:128) (Exim 4.69)
	(auth plain:ashworth@berkeley.edu)
	(envelope-from <julie.ashworth@berkeley.edu>) id 1Mqu8o-0000C8-Ad
	for linux-lvm@redhat.com; Thu, 24 Sep 2009 12:38:12 -0700
Date: Thu, 24 Sep 2009 12:38:04 -0700
From: Julie Ashworth <julie.ashworth@berkeley.edu>
Message-ID: <20090924193804.GC5230@venus.gateway.2wire.net>
References: <20090924100622.GA3517@venus.neuro.bekeley.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090924100622.GA3517@venus.neuro.bekeley.edu>
Subject: [linux-lvm] Re: missing physical volumes after upgrade to rhel 5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Some additional information:

----------------------
# lvm dumpconfig
  devices {
    dir="/dev"
    scan="/dev"
    preferred_names=[]
    filter="a/.*/"
    cache_dir="/etc/lvm/cache"
    cache_file_prefix=""
    write_cache_state=1
    sysfs_scan=1
    md_component_detection=1
    ignore_suspended_devices=0
  }
  activation {
    missing_stripe_filler="/dev/ioerror"
    reserved_stack=256
    reserved_memory=8192
    process_priority=-18
    mirror_region_size=512
    readahead="auto"
    mirror_log_fault_policy="allocate"
    mirror_device_fault_policy="remove"
  }
  global {
    umask=63
    test=0
    units="h"
    activation=1
    proc="/proc"
    locking_type=1
    fallback_to_clustered_locking=1
    fallback_to_local_locking=1
    locking_dir="/var/lock/lvm"
  }
  shell {
    history_size=100
  }
  backup {
    backup=1
    backup_dir="/etc/lvm/backup"
    archive=1
    archive_dir="/etc/lvm/archive"
    retain_min=10
    retain_days=30
  }
  log {
    verbose=0
    syslog=1
    overwrite=0
    level=0
    indent=1
    command_names=0
    prefix="  "
  }

----------------------
(I powered off 2 of the storage devices, so only
one (12TB) device remains accessible):

# lvmdiskscan
  /dev/ramdisk   [       16.00 MB] 
  /dev/md0       [      148.94 MB] 
  /dev/ram       [       16.00 MB] 
  /dev/md1       [        3.91 GB] 
  /dev/ram2      [       16.00 MB] 
  /dev/md2       [      105.46 GB] 
  /dev/dm-2      [       11.83 TB] 
  /dev/ram3      [       16.00 MB] 
  /dev/sda3      [        3.91 GB] 
  /dev/md3       [        3.91 GB] 
  /dev/ram4      [       16.00 MB] 
  /dev/md4       [      800.46 GB] 
  /dev/ram5      [       16.00 MB] 
  /dev/ram6      [       16.00 MB] 
  /dev/ram7      [       16.00 MB] 
  /dev/ram8      [       16.00 MB] 
  /dev/ram9      [       16.00 MB] 
  /dev/ram10     [       16.00 MB] 
  /dev/ram11     [       16.00 MB] 
  /dev/ram12     [       16.00 MB] 
  /dev/ram13     [       16.00 MB] 
  /dev/ram14     [       16.00 MB] 
  /dev/ram15     [       16.00 MB] 
  /dev/sdb6      [        3.91 GB] 
  /dev/sdb8      [        6.05 GB] 
  3 disks
  23 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume



-- 
Julie Ashworth <julie.ashworth@berkeley.edu>
Computational Infrastructure for Research Labs, UC Berkeley 
http://cirl.berkeley.edu/
PGP Key ID: 0x17F013D2
