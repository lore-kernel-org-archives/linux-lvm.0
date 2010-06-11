Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5BGssap032248
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2010 12:54:54 -0400
Received: from smtp02.lnh.mail.rcn.net (smtp02.lnh.mail.rcn.net
	[207.172.157.102])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5BGsiWd011105
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2010 12:54:45 -0400
Message-ID: <4C126A55.6C149CB5@biochem.uthscsa.edu>
Date: Fri, 11 Jun 2010 12:57:40 -0400
From: "Gary S. Trujillo" <vm@biochem.uthscsa.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] unable to mount encrypted LVM volume
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
To: linux-lvm@redhat.com

Disaster has struck!  I recently got a 2TB drive to supplement the 500GB drive I've been using for the past year.  My first order of business was to partition the drive using the Debian installer, so I could do a backup of what's on the smaller drive, which I've never backed up previously.

It appears that the installer touched something on the 500GB drive, though I was careful to avoid doing anything to it myself during the partitioning phase of the installation procedure.  Now when I attempt to boot from the older drive, I get:

| device-mapper: ioctl: 4.7.8-ioctl (2006-06-24) initialised: dm-devel@redhat.com
|   Volume group "vg1" not found
|   Volume group "vg1" not found
| Setting up cryptographic volume sda6_crypt (based on /dev/sda6)
| Enter passphrase:

I originally set up the partition as an encrypted LVM volume, using the Debian 4.0 installer.  Previously, the password prompt I got mentioned LUKS, however.

Booting from a filesystem in another partition, I've checked the partition table, and find that it looks identical to the state it was in prior to my (unsuccessful - see details below) attempt to install Debian Linux.

I've also used "od" to dump the first part of the partition, and see what looks as if it might be LVM header information:

0000000  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
*
0001000   L   A   B   E   L   O   N   E 001  \0  \0  \0  \0  \0  \0  \0
0001020   R 247   U   J      \0  \0  \0   L   V   M   2       0   0   1
0001040   Y   e   6   M   R   Z   9   U   W   a   H   Z   a   H   0   L
0001060   i   2   8   n   V   P   4   a   7   w   A   A   G   o   0   K
0001100  \0 344 035 037   ]  \0  \0  \0  \0  \0 003  \0  \0  \0  \0  \0
0001120  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0001140  \0  \0  \0  \0  \0  \0  \0  \0  \0 020  \0  \0  \0  \0  \0  \0
0001160  \0 360 002  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
0001200  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0  \0
*
0004000 006 337   Y 024  \a   j   <   d   i 330 003 371 255   P   <   *


Obviously, I hope that the partitioning utility ("partman," used by the Debian installer) did not make any changes inside the partition.  (As I say, I was careful to avoid myself referring to any partitions on that drive - but if I had it to do all over again, I would have physically uncabled that drive before starting the new install.)

Any help would be very much appreciated, particularly as I hope I can return this machine to service prior to departing on a three week trip.

Thanks in advance.

Gary Trujillo

--

Here's a listing of the layout of the drive I've been using - before installing the 2TB drive:

/dev/mapper/vg1-root  26213596  21595380   4618216  83% /
/dev/mapper/vg1-av   298294380 297094200   1200180 100% /av
/dev/mapper/vg1-home  62912636  62195664    716972  99% /home

Disk /dev/sda: 500.1 GB, 500107862016 bytes
255 heads, 63 sectors/track, 60801 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        4863    39062016   83  Linux
/dev/sda2            4864        4881      144585   83  Linux
/dev/sda3            4882        6097     9767520    e  W95 FAT16 (LBA)
/dev/sda4            6098       60801   439409880    5  Extended
/dev/sda5            6098       12176    48829536    b  W95 FAT32
/dev/sda6           12177       60801   390580281   8e  Linux LVM



Partition table entries are not in disk order


vgdisplay vg1
  --- Volume group ---
  VG Name               vg1
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  5
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               4
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               372.48 GB
  PE Size               4.00 MB
  Total PE              95356
  Alloc PE / Size       95356 / 372.48 GB
  Free  PE / Size       0 / 0
  VG UUID               B3DfAi-H30F-vP6E-3k1H-ObG2-xaQQ-QBYddP

--

lvm> lvdisplay vg1
  --- Logical volume ---
  LV Name                /dev/vg1/root
  VG Name                vg1
  LV UUID                y4ia2y-DB5M-uJEJ-LR8S-G9cY-sV2W-i1uTN6
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                25.00 GB
  Current LE             6400
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:1

  --- Logical volume ---
  LV Name                /dev/vg1/swap
  VG Name                vg1
  LV UUID                oWin9E-upNz-fCdA-gM0P-GRsh-VQdi-hsuV0y
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                3.00 GB
  Current LE             768
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:2

  --- Logical volume ---
  LV Name                /dev/vg1/home
  VG Name                vg1
  LV UUID                n2qJgo-up2G-h1zn-02zP-HVvl-iBU4-Iqtoyf
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                60.00 GB
  Current LE             15360
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:3

  --- Logical volume ---
  LV Name                /dev/vg1/av
  VG Name                vg1
  LV UUID                CHTWpc-Qszq-XGhR-BN01-X9hA-t3Zu-7IuveY
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                284.48 GB
  Current LE             72828
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:4

--
  
Here's some of what I posted to a Debian list, which gives more specifics of the problems I had trying to install a new version of Debian, during which the problem just reported emerged.
  
  The problem I am experiencing was documented on this list nearly a year ago, in a posting by Giorgos Pallas, to whom I'm cc'ing a copy of this message, at:

    http://lists.debian.org/debian-user/2009/07/msg00171.html
    
It appears, however, that the problem reported there was not really resolved at the time.  To make a long story short, it seems to me that the partitioning procedure in the installation script for Debian 5.04, which uses "partman," will not permit one to create an encrypted LVM partition that is less than the full size of the device onto which Debian is being installed (though I think it does create a small unencrypted boot partition as well).  However, I know from my own experience that the installer for Debian 4.0r0, which I have been using for nearly a couple of years, both allows one to set up encrypted LVM on a partition one has created within the install procedure, and to select the file system type used within that partition (the new installer insists on using ext3).

More serious to me personally is that the older (4.0) installer seems to have done some damage to the contents of another drive than the one onto which Debian was being installed (and to which I never referred within the partitioning procedure).  Presumably, the damage was to the partition table (but beyond what is visible using "fdisk," since it reports the same information about the partition table as it had before the installation was started - or perhaps the damage was done elsewhere in the file system, somewhere that has to do with the "volume group" information on an LVM volume).

Here's the situation.

Since I found myself unable to get the Debian 5.0 installer to create an encrypted LVM volume on a partition I had created on a new drive (not the one containing my existing Debian system), I decided to use the 4.0 installer, since I know I had used it successfully to do what I wanted back when I installed my current system.  My thought was to get the new drive set up the way I wanted it and then switch to the new installer, skipping the partitioning step, and let the 5.04 installer do the installation to the new encrypted LVM partition.  I wasn't able to satisfy the old installer script with respect to there being both a root and a swap partition (for reasons still unknown - it just never proceeded to the file system creation step on this drive, though obviously it had worked when I installed Debian to the other drive a couple of years ago).  So I decided to instead see if I could use my existing system to create what is required.

Here's where the real tragedy became clear - I found myself unable to boot into the older system - instead of getting the familiar prompt for a LUKS password, I got two repetitions of a short error message that said that the volume group (which presumably is known about somewhere on the drive - maybe as part of the header of the volume or hidden away in the partition table?) was unknown.  I did get a password prompt, but it didn't mention "LUKS."

Since I had a root on another partition on the old drive (which doesn't know about the LVM partition), I was able to boot into a rudimentary version of Debian, where I could verify that the partition table looks OK, and that (judging from the octal dump), the header of what's in the encrypted LVM volume seems OK (I don't know enough about what should be there, but I see a string of ASCII characters that look as if they're introducing an LVM header).  This fact would seem to further confirm that if there was damage to the partition table of the old drive, it wasn't such as to mess up the alignment with what's on the drive - at least with respect to this partition.  (I was careful to never refer to the old drive within the new installation, either under 5.04 or 4.0, so partman should not have touched the partition table of that drive, except to read and report on its contents.)

Before starting the installation, I used "vgdisplay" and "lvdisplay" to look at the contents of the volume - and I have that information in a file on another computer.  If there is any hope of recovering the LVM volume, I suppose some of the information contained in this listing might be helpful.

Well, that's pretty much it.  If anyone has any thoughts, please post them here.  One more thing is that I have to make a trip to the other side of the country, where I'll be for a few weeks, in a few days.  I had hoped to leave the machine, which is used as a server, running during my absence.

One more thing - I have no backups of what's on the ~400 GB partition - that's what I was preparing to do in installing the new (2 TB) drive.  If I had it to do again, I would have uncabled the old drive before starting the procedure, of course.  Now I'm really stuck!
