Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9SLP5JR009207
	for <linux-lvm@redhat.com>; Sat, 28 Oct 2006 17:25:05 -0400
Received: from mail7.sea5.speakeasy.net (mail7.sea5.speakeasy.net
	[69.17.117.9])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9SLP3S3018639
	for <linux-lvm@redhat.com>; Sat, 28 Oct 2006 17:25:04 -0400
Received: from dsl093-060-083.pit1.dsl.speakeasy.net (HELO [192.168.0.5])
	([66.93.60.83]) (envelope-sender <jerith@speakeasy.org>)
	by mail7.sea5.speakeasy.net (qmail-ldap-1.03) with AES256-SHA encrypted
	SMTP for <linux-lvm@redhat.com>; 28 Oct 2006 21:24:58 -0000
Date: Sat, 28 Oct 2006 17:26:55 -0400 (EDT)
From: Matt McHenry <jerith@speakeasy.org>
Message-ID: <Pine.LNX.4.64.0610281720370.9047@localhost>
MIME-Version: 1.0
Content-ID: <Pine.LNX.4.58.0610231935351.12042@shell2.speakeasy.net>
Subject: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


 	[2nd try sending; apologies if duplicate]

 	I'm running lvm2 under gentoo, and I'm getting this error when I
try to create a new logical volume:

# lvcreate -L 15G -n dvd maingroup
   /dev/cdrom: open failed: Read-only file system
   Attempt to close device '/dev/cdrom' which is not open.
   device-mapper: reload ioctl failed: Invalid argument
   Failed to activate new LV.

The new vg shows up in only one of two places under /dev:

# ls /dev/maingroup/
c-p  capture  gen-website  home  music  opt  swap1  swap2  tmp  usr  var

# ls /dev/mapper/
control            maingroup-gen--website  maingroup-swap1  maingroup-var
maingroup-c--p     maingroup-home          maingroup-swap2
maingroup-capture  maingroup-music         maingroup-tmp
maingroup-dvd      maingroup-opt           maingroup-usr

And I can't create a file system on it:

# mke2fs -j /dev/mapper/maingroup-dvd
mke2fs 1.39 (29-May-2006)
mke2fs: Device size reported to be zero.  Invalid partition specified, or
         partition table wasn't reread after running fdisk, due to
         a modified partition being busy and in use.  You may need to reboot
         to re-read your partition table.

 	I found this mailing list post 
[http://www.redhat.com/archives/linux-lvm/2006-April/msg00047.html] and 
thought that maybe one of my pvs was bad, so I tried to add a new pv 
(sda12) and migrate off of the most-recently-added one (sda11), but the 
'pvmove' command gave a similar error and said to run 'pvmove --abort'. 
But that just hung.  I tried to shut down in order to abort it, but that 
hung 'unmounting local filesystems'.  When I forced a reboot, another of 
my volumes (named gen-website) seemed to have been lost.

 	My first try sending this message included a level 7 log file as 
an attachment.  I think the mailing list may have rejected the message 
because it was too big (262k), so I'm excluding it for now.  Below are 
some more details on my setup.  Forgive me if there's extraneous stuff 
here, but I want to try to provide as much detail as necessary; if there's 
any more info that would be useful, please let me know.

# uname -a
Linux localhost 2.6.14-gentoo-r5 #4 SMP PREEMPT Wed Sep 13 22:40:49 EDT
2006 i686 Intel(R) Pentium(R) 4 CPU 3.00GHz GNU/Linux

# lvm version
   LVM version:     2.02.06 (2006-05-12)
   Library version: 1.02.07 (2006-05-11)
   Driver version:  4.4.0

# fdisk -l /dev/sda

Disk /dev/sda: 320.0 GB, 320072933376 bytes
255 heads, 63 sectors/track, 38913 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

    Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          17      136521   83  Linux
/dev/sda2              18          34      136552+  da  Non-FS data
/dev/sda3              35          66      257040   da  Non-FS data
/dev/sda4              67       38913   312038527+   5  Extended
/dev/sda5              67        1312    10008463+  83  Linux
/dev/sda6            1313        3803    20008926   8e  Linux LVM
/dev/sda7            3804        8784    40009851   8e  Linux LVM
/dev/sda8            8785       18745    80011701   8e  Linux LVM
/dev/sda9           18746       28706    80011701   8e  Linux LVM
/dev/sda10          28707       33687    40009851   8e  Linux LVM
/dev/sda11          33688       36178    20008926   8e  Linux LVM
/dev/sda12          36179       38668    20000893+  8e  Linux LVM
/dev/sda13          38669       38913     1967931   83  Linux

# pvs
   /dev/cdrom: read failed after 0 of 4096 at 0: Input/output error
   PV         VG        Fmt  Attr PSize  PFree
   /dev/sda10 maingroup lvm2 a-   38.15G 516.00M
   /dev/sda11 maingroup lvm2 a-   38.15G  23.15G
   /dev/sda12 maingroup lvm2 a-   19.07G   4.07G
   /dev/sda6  maingroup lvm2 a-   19.08G      0
   /dev/sda7  maingroup lvm2 a-   38.15G      0
   /dev/sda8  maingroup lvm2 a-   76.30G      0
   /dev/sda9  maingroup lvm2 a-   76.30G      0

# vgs
   /dev/cdrom: read failed after 0 of 4096 at 0: Input/output error
   VG        #PV #LV #SN Attr   VSize   VFree
   maingroup   7  12   0 wz--n- 305.21G 27.73G

# lvs
   /dev/cdrom: read failed after 0 of 4096 at 0: Input/output error
   LV          VG        Attr   LSize   Origin Snap%  Move Log Copy%
   c-p         maingroup -wi-a-   4.00G
   capture     maingroup -wi-ao  68.00G
   gen-website maingroup -wI-d-  15.00G
   home        maingroup -wi-ao 110.00G
   music       maingroup -wi-ao  30.00G
   opt         maingroup -wi-ao   4.00G
   swap1       maingroup -wi-ao   1.00G
   swap2       maingroup -wi-ao   1.00G
   tmp         maingroup -wi-ao   2.00G
   usr         maingroup -wi-ao  20.00G
   var         maingroup -wi-ao   7.49G

# dmsetup table
maingroup-tmp: 0 4194304 linear 8:8 154018176
maingroup-c--p: 0 8388608 linear 8:7 47980928
maingroup-capture: 0 23642112 linear 8:7 56369536
maingroup-capture: 23642112 40009728 linear 8:6 384
maingroup-capture: 63651840 78954496 linear 8:10 384
maingroup-usr: 0 19996672 linear 8:9 73400704
maingroup-usr: 19996672 974848 linear 8:8 150946176
maingroup-usr: 20971520 3891200 linear 8:8 48619904
maingroup-usr: 24862720 7708672 linear 8:8 384
maingroup-usr: 32571392 9371648 linear 8:8 52511104
maingroup-var: 0 10485760 linear 8:9 62914944
maingroup-var: 10485760 5218304 linear 8:8 145727872
maingroup-gen--website:
maingroup-music: 0 1810432 linear 8:8 158212480
maingroup-music: 1810432 17317888 linear 8:9 142705024
maingroup-music: 19128320 43786240 linear 8:7 384
maingroup-swap2: 0 2097152 linear 8:7 45883776
maingroup-opt: 0 2097152 linear 8:8 151921024
maingroup-opt: 2097152 6291456 linear 8:8 42328448
maingroup-dvd:
maingroup-swap1: 0 2097152 linear 8:7 43786624
maingroup-pvmove0:
maingroup-home: 0 62914560 linear 8:9 384
maingroup-home: 62914560 29310976 linear 8:9 113394048
maingroup-home: 92225536 19996672 linear 8:9 93397376
maingroup-home: 112222208 34619392 linear 8:8 7709056
maingroup-home: 146841600 83845120 linear 8:8 61882752

----------------------
Matt McHenry
http://www.speakeasy.org/~jerith/
jerith@speakeasy.org
be052@scn.org
