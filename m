From: Terje Kvernes <terjekv@math.uio.no>
Message-ID: <wxxptjd83jl.fsf@nommo.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] LVM problems after 2.6.0-test1
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
Date: Sun Aug 10 19:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  in 2.6.0-test3-mm1 and earlier I get "Couldn't deactivate device
  vgname-lvname" for every LV except a very recent addition,
  "system-opt".  I've tried the both ioctl versions (1 and 4) without
  success.  LVM is built into the kernel.

  any suggestions are welcome, below is the output from "vgchange -ay
  -vvv" showing the problem.

 setlocale failed
    global/locking_type not found in config: defaulting to 1
    global/locking_dir not found in config: defaulting to /var/lock/lvm
    File-based locking enabled.
  Finding all volume groups
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Locking /var/lock/lvm/V_system RB
  Finding volume group "system"
    Found /dev/hda6 in VG system
      Getting device info for system-usr
      dm version   
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
  1 logical volume(s) in volume group "system" already active
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Found existing layer 'system-opt'
      Getting device info for system-opt
      dm info system-opt  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS30000000000000000000  Couldn't deactivate device system-opt
000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
  Loading system-usr
      Adding target: 0 4194304 linear /dev/hda6 8568
      Adding target: 4194304 1024000 linear /dev/hda6 11018616
      Adding target: 5218304 1073152 linear /dev/hda6 14139768
      Adding target: 6291456 565248 linear /dev/hda6 47694200
      Adding target: 6856704 1228800 linear /dev/hda6 18858360
      Adding target: 8085504 4194304 linear /dev/hda6 24363384
      dm create system-usr XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
    Removing /dev/system/usr
    Linking /dev/system/usr -> /dev/mapper/system-usr
    Removing system-opt
  Removing system-opt
  Removing system-opt
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Found existing layer 'system-usr'
      Getting device info for system-usr
      dm info system-usr  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oi  Couldn't deactivate device system-usr
Couldn't deactivate device system-home
RE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-home
      Adding target: 0 1048576 linear /dev/hda6 4202872
      dm create system-home XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
    Removing /dev/system/home
    Linking /dev/system/home -> /dev/mapper/system-home
    Removing system-usr
  Removing system-usr
  Removing system-usr
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Found existing layer 'system-home'
      Getting device info for system-home
      dm info system-home  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-var
      Adding target: 0 524288 linear /dev/hda6 5251448
      Adding target: 524288 4194304 linear /dev/hda6 6824312
      Adding target: 4718592 409600 linear /dev/hda6 48259448
      dm create system-var XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
    Removing /dev/system/var
    Linking /dev/system/var -> /dev/mapper/system-var
    Removing system-home
  Removing system-home
  Removing system-home
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Found existing layer 'system-var'
      Getting device  Couldn't deactivate device system-var
nfo for system-var
      dm info system-var  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-tmp
      Adding target: 0 1048576 linear /dev/hda6 5775736
      dm create system-tmp XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
    Removing /dev/system/tmp
    Linking /dev/system/tmp -> /dev/mapper/system-tmp
    Removing system-var
  Removing system-var
  Removing system-var
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Found existing layer 'system-tmp'
      Getting device info for system-tmp
      dm info system-tmp  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN  Couldn't deactivate device system-tmp
Couldn't deactivate device system-data
S3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-data
      Adding target: 0 2097152 linear /dev/hda6 12042616
      Adding target: 2097152 7700480 linear /dev/hda6 48669048
      Adding target: 9797632 688128 linear /dev/hda6 28557688
      dm create system-data XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
    Removing /dev/system/data
    Linking /dev/system/data -> /dev/mapper/system-data
    Removing system-tmp
  Removing system-tmp
  Removing system-tmp
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Found existing layer 'system-data'
      Getting device info for system-data
      dm info system-data  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-site
      Adding target: 0 1024000 linear /dev/hda6 15212920
      dm create system-site XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
    Removing /dev/system/site
    Linking /dev/system/site -> /dev/mapper/system-site
    Removing system-data
  Removing system-data
  Removing system-data
    Findin  Couldn't deactivate device system-site
volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Found existing layer 'system-site'
      Getting device info for system-site
      dm info system-site  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-cvs
      Adding target: 0 524288 linear /dev/hda6 16236920
      dm create system-cvs XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
    Removing /dev/system/cvs
    Linking /dev/system/cvs -> /dev/mapper/system-cvs
    Removing system-site
  Removing system-site
  Removing system-site
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Found existing layer 'system-cvs'
      Getting device info for system-cvs
      dm info system-cvs  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
 Couldn't deactivate device system-cvs
     dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-storage
      Adding target: 0 2097152 linear /dev/hda6 16761208
      Adding target: 2097152 17399808 linear /dev/hda6 30294392
      dm create system-storage XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
    Removing /dev/system/storage
    Linking /dev/system/storage -> /dev/mapper/system-storage
    Removing system-cvs
  Removing system-cvs
  Removing system-cvs
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Found existing layer 'system-storage'
      Getting device info for system-storage
      dm info system-storage  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oic  Couldn't deactivate device system-storage
Couldn't deactivate device system-uclibc
E7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-uclibc
      Adding target: 0 4194304 linear /dev/hda6 20087160
      dm create system-uclibc XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
    Removing /dev/system/uclibc
    Linking /dev/system/uclibc -> /dev/mapper/system-uclibc
    Removing system-storage
  Removing system-storage
  Removing system-storage
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Found existing layer 'system-uclibc'
      Getting device info for system-uclibc
      dm info system-uclibc  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-flash
      Adding target: 0 65536 linear /dev/hda6 24281464
      dm create system-flash XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
    Removing /dev/system/flash
    Linking /dev/system/flash -> /dev/mapper/system-flash
    Removing system-uclibc
  Removing system-uclibc
  Removing system-uclibc
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm in  Couldn't deactivate device system-flash
 system-rootfs  
      Found existing layer 'system-flash'
      Getting device info for system-flash
      dm info system-flash  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-rootfs
      Adding target: 0 16384 linear /dev/hda6 24347000
      dm create system-rootfs XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
    Removing /dev/system/rootfs
    Linking /dev/system/rootfs -> /dev/mapper/system-rootfs
    Removing system-flash
  Removing system-flash
  Removing system-flash
    Finding volume group for uuid XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b
    /dev/hda: No label detected
    /dev/hda1: No label detected
    /dev/hda2: No label detected
    /dev/hda3: No label detected
      /dev/hda4: Failed to read label area
    /dev/hda5: No label detected
    /dev/hda6: lvm1 label detected
    Found /dev/hda6 in VG system
  Found volume group "system"
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
      Found existing layer 'system-rootfs'
      Getting device info for system-rootfs
      dm info system-rootfs  
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000  Couldn't deactivate device system-rootfs
0000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
      dm info system-opt  
  Loading system-opt
      Adding target: 0 1048576 linear /dev/hda6 29245816
      dm create system-opt XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
    Removing /dev/system/opt
    Linking /dev/system/opt -> /dev/mapper/system-opt
    Removing system-rootfs
  Removing system-rootfs
  Removing system-rootfs
      Getting device info for system-usr
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000000 
      dm info system-usr  
      Getting device info for system-home
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000001 
      dm info system-home  
      Getting device info for system-var
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000002 
      dm info system-var  
      Getting device info for system-tmp
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000003 
      dm info system-tmp  
      Getting device info for system-data
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000004 
      dm info system-data  
      Getting device info for system-site
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000005 
      dm info system-site  
      Getting device info for system-cvs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000006 
      dm info system-cvs  
      Getting device info for system-storage
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000007 
      dm info system-storage  
      Getting device info for system-uclibc
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000008 
      dm info system-uclibc  
      Getting device info for system-flash
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS3000000000000000000000000000000009 
      dm info system-flash  
      Getting device info for system-rootfs
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000a 
      dm info system-rootfs  
      Getting device info for system-opt
      dm info  XCf7oicxRE7iVVr8tA1wYPFp4sN6xS300000000000000000000000000000000b 
1 logical volume(s) in volume group "system" now active
    Unlocking /var/lock/lvm/V_system

 
-- 
Terje
