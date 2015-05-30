Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4U3jD8a028952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 May 2015 23:45:13 -0400
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
	[80.67.18.14]) by mx1.redhat.com (Postfix) with ESMTPS id 0F2F638C363
	for <linux-lvm@redhat.com>; Sat, 30 May 2015 03:45:10 +0000 (UTC)
Received: from [80.67.16.121] (helo=webmailfront01.ispgateway.de)
	by smtprelay02.ispgateway.de with esmtpsa
	(TLSv1:DHE-RSA-AES256-SHA:256) (Exim 4.84)
	(envelope-from <st@ateneto.com>) id 1YyXhs-00031Y-T0
	for linux-lvm@redhat.com; Sat, 30 May 2015 05:45:08 +0200
Date: Sat, 30 May 2015 05:45:08 +0200
Message-ID: <20150530054508.Horde.UHD8nrE6gSp5bNvnIOGDQA5@webmail.df.eu>
From: st@ateneto.com
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM problem: Unable to mount encrypted Luks HDs after
 reinstalling Ubuntu; Error: unknown filesystem type 'LVM2_member'
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
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="Yes"
To: linux-lvm@redhat.com

Hallo,

thank you very much for anyone taking the time to read this.

I am using a Thinkpad Edge E145 with Ubuntu 14.04 installed.
I have recently reinstalled Ubuntu to a new HD. This installation is  
LUKS encrypted LVM and works without problems.

My old installation on a LVM Luks encrypted drive would no longer start up.
I had deleted old kernels. Maybe the problems are related to that.

Now I can no longer mount the old LVM Luks encrypted drive when I plug  
it in to the notebook through a USB port.

Here is the present situation in nautilus:
http://postimg.org/image/4cq099iej/

cog wheels.
Bottom left:
Format
Create Disk image
Restore Disk image
Benchmark

Top right:
Create Disk image
Restore Disk image
Benchmark
Power Off

http://postimg.org/image/6shypz5th/

Here I have the additional cog wheel options to:
Edit partition
Change pass phrase
Edit Encryption options

This is the situation in the terminal:
sog@sog-workstation:~$ sudo cryptsetup luksOpen /dev/sdb5 encrypted
Enter passphrase for /dev/sdb5:
sog@sog-workstation:~$ sudo mkdir /media/encrypted
sog@sog-workstation:~$ sudo mount /dev/mapper/encrypted /media/encrypted
mount: unknown filesystem type 'LVM2_member'

sog@sog-workstation:~$ sudo vgscan --mknodes
   Reading all physical volumes. This may take a while...
   Found volume group "it-vg" using metadata type lvm2
   Found volume group "it-vg" using metadata type lvm2
sog@sog-workstation:~$ sudo vgchange -ay
   device-mapper: create ioctl on it--vg-root failed: Device or resource busy
   device-mapper: create ioctl on it--vg-swap_1 failed: Device or resource busy
   0 logical volume(s) in volume group "it-vg" now active
   2 logical volume(s) in volume group "it-vg" now active
sog@sog-workstation:~$ sudo lvscan -a
   inactive '/dev/it-vg/root' [462.20 GiB] inherit
   inactive '/dev/it-vg/swap_1' [3.27 GiB] inherit
sog@sog-workstation:~$ sudo ls -l /dev/mapper /dev/it-vg
/dev/it-vg:
total 0
lrwxrwxrwx 1 root root 7 5月 30 07:52 root -> ../dm-1
lrwxrwxrwx 1 root root 7 5月 30 07:52 swap_1 -> ../dm-2

/dev/mapper:
total 0
crw------- 1 root root 10, 236 5月 30 07:52 control
lrwxrwxrwx 1 root root 7 5月 30 07:57 encrypted -> ../dm-3
lrwxrwxrwx 1 root root 7 5月 30 07:52 it--vg-root -> ../dm-1
lrwxrwxrwx 1 root root 7 5月 30 07:52 it--vg-swap_1 -> ../dm-2
lrwxrwxrwx 1 root root 7 5月 30 07:52 sda5_crypt -> ../dm-0
sog@sog-workstation:~$ df -h
Filesystem Size Used Avail Use% Mounted on
/dev/mapper/it--vg-root 47G 4.7G 40G 11% /
none 4.0K 0 4.0K 0% /sys/fs/cgroup
udev 1.6G 4.0K 1.6G 1% /dev
tmpfs 316M 1.3M 315M 1% /run
none 5.0M 0 5.0M 0% /run/lock
none 1.6G 156K 1.6G 1% /run/shm
none 100M 44K 100M 1% /run/user
/dev/sda1 236M 83M 141M 38% /boot
/dev/sdb1 236M 48M 176M 22% /media/sog/4e1bce6a-3555-4b0e-a7e2-4dfc81831bfc
sog@sog-workstation:~$ mount
/dev/mapper/it--vg-root on / type ext4 (rw,errors=remount-ro)
proc on /proc type proc (rw,noexec,nosuid,nodev)
sysfs on /sys type sysfs (rw,noexec,nosuid,nodev)
none on /sys/fs/cgroup type tmpfs (rw)
none on /sys/fs/fuse/connections type fusectl (rw)
none on /sys/kernel/debug type debugfs (rw)
none on /sys/kernel/security type securityfs (rw)
udev on /dev type devtmpfs (rw,mode=0755)
devpts on /dev/pts type devpts (rw,noexec,nosuid,gid=5,mode=0620)
tmpfs on /run type tmpfs (rw,noexec,nosuid,size=10%,mode=0755)
none on /run/lock type tmpfs (rw,noexec,nosuid,nodev,size=5242880)
none on /run/shm type tmpfs (rw,nosuid,nodev)
none on /run/user type tmpfs (rw,noexec,nosuid,nodev,size=104857600,mode=0755)
none on /sys/fs/pstore type pstore (rw)
/dev/sda1 on /boot type ext2 (rw)
systemd on /sys/fs/cgroup/systemd type cgroup  
(rw,noexec,nosuid,nodev,none,name=systemd)
gvfsd-fuse on /run/user/1000/gvfs type fuse.gvfsd-fuse  
(rw,nosuid,nodev,user=sog)
/dev/sdb1 on /media/sog/4e1bce6a-3555-4b0e-a7e2-4dfc81831bfc type ext2  
(rw,nosuid,nodev,uhelper=udisks2)
sog@sog-workstation:~$ sudo fsck -vy /dev/mapper/encrypted
fsck from util-linux 2.20.1
fsck: fsck.LVM2_member: not found
fsck: error 2 while executing fsck.LVM2_member for /dev/mapper/encrypted

sog@sog-workstation:~$ sudo mount /dev/mapper/encrypted  
/media/encryptedmount: unknown filesystem type 'LVM2_member'
sog@sog-workstation:~$

Thank you!
Sebastian
