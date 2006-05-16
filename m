Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GIlaMu004055
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 14:47:36 -0400
Received: from zcars04f.nortel.com (zcars04f.nortel.com [47.129.242.57])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4GIlS2h029153
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 14:47:28 -0400
Received: from zrtphxs1.corp.nortel.com
	(zrtphxs1.corp.nort...s0.corp.nortel.com [47.140.202.46])
	by zcars04f.nortel.com (Switch-2.2.6/Switch-2.2.0) with ESMTP id
	k4GIlLY13728
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 14:47:21 -0400 (EDT)
Message-ID: <446A1E23.7050306@dogpad.net>
Date: Tue, 16 May 2006 13:46:59 -0500
From: Joe Harvell <jharvell@dogpad.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 tools<-->library<-->driver compatibility
References: <4468C22C.4050908@dogpad.net>
In-Reply-To: <4468C22C.4050908@dogpad.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

A clarification on versions:

The 2006.0 install environment versions (the ones used to create the 
VGs/LVs) are below:

LVM: 2.01.09 (2005-04-04)
Library: 1.01.03 (2005-06-13)
Driver: 4.4.0-ioctl

In my installed environment, the tools are newer and the driver is older 
(due to the 2.4 kernel):

LVM: 2.02.05 (2006-04-21)
Library: 1.02.03 (2006-02-08)
Driver: 4.1.1-ioctl

How can I determine which combinations should be compatible?  What 
version of the tools/library do I need to downgrade to in my installed 
environment?  Is there going to be a compatibility problem with the 
metadata created by the 4.4.0 driver since it will be used by the 4.1.1 
driver?

Joe Harvell wrote:
> I am installing Gentoo Linux on my machine and I'm running into LVM 
> problems.  The installer CD is 2.6 kernel based, but I am installing a 
> 2.4 kernel based system.  Gentoo has an install profile for this to 
> prevent programs and libraries that have a dependency on 2.6 kernel 
> headers from being installed when a 2.4 profile is being used.
>
> As part of the install process, I created an LVM2 volume group 
> containing LVs for /, /usr, /var, /opt, and /home.  I created 
> filesystems on these LVs and performed the installation no problem.  I 
> also configured and compiled the kernel, which is a 2.4.32 based 
> kernel with LVM2 backported into it by the Gentoo developer team.
>
> I created the initrd which is based on an initrd I created myself and 
> have been using successfully on 2.4 and 2.6 based kernels.  It 
> contains the LVM tools and libraries, along with disk drivers and the 
> device-mapper driver.
>
> When I run vgscan, it finds the volume group no problem.  However, 
> when I run 'vgchange -ay <vgname>', I see three problems.
>
> 1.  There are entries in /dev/mapper/<vgname>-<lvname>, but no symlinks
> in the form /dev/<vgname>/<lvname> --> /dev/mapper/<vgname>/<lvname>.  I
> run 'lvm vgmknodes' and it remedies this.
>
> 2. I see five complaints from 'vgchange -ay <vgname>' (one for each LV)
> as follows:
>
> on stderr:   device-mapper: table ioctl failed: Invalid argument
> on console (from dm-mod driver): device-mapper: one of name or uuid must
> be supplied, cmd (12)
>
> I ran vgchange under strace and here is the following snippet:
>
> open("/dev/mapper/control", O_RDWR|O_LARGEFILE) = 9
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> mlockall(MCL_CURRENT|MCL_FUTURE)        = 0
> brk(0x8936000)                          = 0x8936000
> brk(0x8b1e000)                          = 0x8b1e000
> getpriority(PRIO_PROCESS, 0)            = 20
> setpriority(PRIO_PROCESS, 0, -18)       = 0
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> ioctl(9, DM_DEV_STATUS, 0x8109958)      = -1 ENXIO (No such device or
> address)
> stat64("/dev/ide/host0/bus0/target0/lun0/part10", {st_mode=S_IFBLK|0600,
> st_rdev=makedev(3, 10), ...}) = 0
> stat64("/dev/ide/host0/bus0/target0/lun0/part11", {st_mode=S_IFBLK|0600,
> st_rdev=makedev(3, 11), ...}) = 0
> stat64("/dev/ide/host0/bus0/target0/lun0/part12", {st_mode=S_IFBLK|0600,
> st_rdev=makedev(3, 12), ...}) = 0
> ioctl(9, DM_DEV_CREATE, 0x8109958)      = 0
> ioctl(9, DM_TABLE_STATUS, 0x8109958)    = -1 EINVAL (Invalid argument)
> write(2, "  ", 2)                       = 2
> write(2, "device-mapper: table ioctl faile"..., 51) = 51
> write(2, "\n", 1)                       = 1
>
> 3.  When I try to mount the filesystem in that LV, it fails.  I tried
> with different filesystem types and it's the same result.  From within
> the 2.4 kernel based initrd, it fails.  If I reboot into the 2.6 kernel
> based installer environment, no problem.
>
> This looks like an incompatibility between the lvm2 and/or device-mapper
> library code and the kernel device-mapper code.  Here are the versions
> installed in the install environment (the one that works):
>
> lvm> version
>   LVM version:     2.02.05 (2006-04-21)
>   Library version: 1.02.03 (2006-02-08)
>   Driver version:  4.4.0
>
> In the initrd, the only thing different would be the driver version. 
> Later today I will have access to the machine again and I can run the 
> lvm version command there to see what the driver version is.  In the 
> meantime, I am looking at the kernel sources and I don't see anything 
> obvious in the driver/md directory.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
