Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k32CjMfJ006648
	for <linux-lvm@redhat.com>; Sun, 2 Apr 2006 08:45:22 -0400
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 02 Apr 2006 14:43:35 +0200
Message-ID: <m2psk0i1vs.fsf@janus.isnogud.escape.de>
MIME-Version: 1.0
Subject: [linux-lvm] dmsetup works, but LVM2 fails
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
To: linux-lvm@sistina.com

I want to migrate from linux-2.4.32 kernel with LVM and LVM1 user
space tools to linux-2.4.32 with DM, patched from the device_mapper
package and LVM2 user space tools.

I installed dmsetup from device-mapper.1.02.03 from source and patched
the linux-2.4.32 with linux-2.4.28-pre4-devmapper-ioctl.patch which
worked also with the 2.4.32 sources.  I renamed all LVM1 tools by
appending .lvm1 and installed LVM2.2.02.02, also from source.

I changed my initrd to load the dm kernel module instead of the lvm
module and to use the LVM2 tools.  vgscan seems to find the old lvm1
formatted VGs und LVs but fails to activate the LVs.  I don't remember
the exact error message.  I will try again and post more details here.
However, with dmsetup I was able to create mappings which I also could
read with dd.

Because I have limited testing and tracing tools in my initrd, I tried
to set up LV with LVM2 on my fully running system.  For testing, I
installed another hard disk /dev/hdb, which I had lying around and
then booted my old config with the lvm kernel module.

First, I loaded the dm kernel module (the kernel had then lvm and dm
modules loaded at the same time, which shouldn't be a problem) and
tested the device mapper with dmsetup.  This works fine:

    janus:root# modprobe dm-mod
    janus:root# lsmod | grep dm
    dm-mod                 43620   0  (unused)
    janus:root# echo 0 8192 linear /dev/hdb 0 | dmsetup create foo
    janus:root# dmsetup table      
    foo: 0 8192 linear 003:064 0
    janus:root# dd if=/dev/mapper/foo of=/dev/null
    8192+0 records in
    8192+0 records out
    janus:root# dmsetup remove foo

Next, I created a PV and VG with success:

    janus:root# rm -rf /etc/lvm
    janus:root# dd if=/dev/zero of=/dev/hdb count=8192
    8192+0 records in
    8192+0 records out
    janus:root# pvcreate /dev/hdb
      Physical volume "/dev/hdb" successfully created
    janus:root# vgcreate vgtest /dev/hdb
      /dev/ram0: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram0: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram1: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram1: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram2: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram2: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram3: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram3: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram4: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram4: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram5: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram5: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram6: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram6: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram7: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram7: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram0: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram1: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram2: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram3: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram4: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram5: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram6: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram7: ioctl BLKBSZGET failed: Invalid argument
      Volume group "vgtest" successfully created
    
But creating a LV in the new VG failed halfway:

    janus:root# dmsetup ls
    No devices found
    janus:root# strace -o /tmp/trace lvcreate -n foo vgtest -L1G
      /dev/ram0: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram1: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram2: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram3: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram4: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram5: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram6: ioctl BLKBSZGET failed: Invalid argument
      /dev/ram7: ioctl BLKBSZGET failed: Invalid argument
      device-mapper: table ioctl failed: Invalid argument
      Failed to activate new LV.
    janus:root# dmsetup ls
    vgtest-foo      (254, 0)
    janus:root# dmsetup table
    vgtest-foo: 
    
The lvcreate command was able to create the new device in the device
mapper but failed to setup the mapping table.  The strace shows:

    stat64("/dev/mapper/control", {st_mode=S_IFCHR|0600, st_rdev=makedev(10, 63), ...}) = 0
    open("/dev/mapper/control", O_RDWR|O_LARGEFILE) = 3
    ...
    ioctl(3, DM_DEV_STATUS, 0x80ce950)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80ce948)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80ce900)      = -1 ENXIO (No such device or address)
    mlockall(MCL_CURRENT|MCL_FUTURE)        = 0
    brk(0x88e5000)                          = 0x88e5000
    brk(0x8ace000)                          = 0x8ace000
    getpriority(PRIO_PROCESS, 0)            = 20
    setpriority(PRIO_PROCESS, 0, -18)       = 0
    ioctl(3, DM_DEV_STATUS, 0x80d6ad8)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6ad0)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6a98)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6ad8)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6ad8)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6aa0)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6ad8)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6ad8)      = -1 ENXIO (No such device or address)
    ioctl(3, DM_DEV_STATUS, 0x80d6aa0)      = -1 ENXIO (No such device or address)
    stat64("/dev/hdb", {st_mode=S_IFBLK|0660, st_rdev=makedev(3, 64), ...}) = 0
    ioctl(3, DM_DEV_CREATE, 0x80d7378)      = 0
    ioctl(3, DM_TABLE_STATUS, 0x80dc4b0)    = -1 EINVAL (Invalid argument)
    write(2, "  ", 2)                       = 2
    write(2, "device-mapper: table ioctl faile"..., 51) = 51
    write(2, "\n", 1)                       = 1

I can post the complete trace if someone wants it.

Here is the relevant version info:

    janus:root# pvscan --version
      LVM version:     2.02.02 (2006-02-07)
      Library version: 1.02.03 (2006-02-08)
      Driver version:  4.1.1

On another system running a current Debian testing with linux-2.4,
where I use LVM2 for quite some time now, I get:

    janus:urs$ ssh -4 root@frickel pvscan --version
    Password: 
      LVM version:     2.01.04 (2005-02-09)
      Library version: 1.01.04 (2005-08-02)
      Driver version:  4.1.1

Is LVM2.2.02.02 too new to use it with device-mapper.1.02.03?

What should I do to get LVM2 running?
    
urs
