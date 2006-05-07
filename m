Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k47ETS0M004781
	for <linux-lvm@redhat.com>; Sun, 7 May 2006 10:29:28 -0400
Received: from russell.fmi.uni-sofia.bg (russell.fmi.uni-sofia.bg
	[62.44.101.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k47ETLXK007023
	for <linux-lvm@redhat.com>; Sun, 7 May 2006 10:29:22 -0400
Received: from [192.168.1.2] (unknown [84.22.12.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by russell.fmi.uni-sofia.bg (Postfix) with ESMTP id ECAC81B8C7
	for <linux-lvm@redhat.com>; Sun,  7 May 2006 17:41:45 +0300 (EEST)
Message-ID: <445E0440.70007@fmi.uni-sofia.bg>
Date: Sun, 07 May 2006 17:29:20 +0300
From: Ognyan Kulev <ogi@fmi.uni-sofia.bg>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050306040301080706030706"
Subject: [linux-lvm] lseek errors after pvcreate on RAID5
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------050306040301080706030706
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit

Hi,

I've made RAID5 on 4 disks in (unreleased) Debian GNU/Linux Etch, which
means linux-image-2.6.15-1-686 2.6.15-8, mdadm 1.12.0-1 and lvm2
2.01.04-5.  Here is the output of mdadm -D /dev/md1:

/dev/md1:
         Version : 00.90.03
   Creation Time : Fri May  5 17:26:32 2006
      Raid Level : raid5
      Array Size : 467394816 (445.74 GiB 478.61 GB)
     Device Size : 155798272 (148.58 GiB 159.54 GB)
    Raid Devices : 4
   Total Devices : 4
Preferred Minor : 1
     Persistence : Superblock is persistent

     Update Time : Fri May  5 20:45:07 2006
           State : clean
  Active Devices : 4
Working Devices : 4
  Failed Devices : 0
   Spare Devices : 0

          Layout : left-symmetric
      Chunk Size : 64K

            UUID : 1f3449d3:840d444b:2a767e13:7f2f67b3
          Events : 0.102

     Number   Major   Minor   RaidDevice State
        0       3        2        0      active sync   /dev/hda2
        1       3       66        1      active sync   /dev/hdb2
        2      22        2        2      active sync   /dev/hdc2
        3      22       66        3      active sync   /dev/hdd2

The problem is that after pvcreate /dev/md1, pvs command shows the
following:

   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
   PV         VG   Fmt  Attr PSize      PFree
   /dev/hdd2       lvm2 --   248064.43T 248064.43T
   /dev/md1        lvm2 --      445.74G    445.74G

Any idea what's happening?

Regards,
ogi


--------------050306040301080706030706
Content-Type: text/plain;
 name="md1.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="md1.txt"

/dev/md1:
        Version : 00.90.03
  Creation Time : Fri May  5 17:26:32 2006
     Raid Level : raid5
     Array Size : 467394816 (445.74 GiB 478.61 GB)
    Device Size : 155798272 (148.58 GiB 159.54 GB)
   Raid Devices : 4
  Total Devices : 4
Preferred Minor : 1
    Persistence : Superblock is persistent

    Update Time : Fri May  5 20:45:07 2006
          State : clean
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0

         Layout : left-symmetric
     Chunk Size : 64K

           UUID : 1f3449d3:840d444b:2a767e13:7f2f67b3
         Events : 0.102

    Number   Major   Minor   RaidDevice State
       0       3        2        0      active sync   /dev/hda2
       1       3       66        1      active sync   /dev/hdb2
       2      22        2        2      active sync   /dev/hdc2
       3      22       66        3      active sync   /dev/hdd2


--------------050306040301080706030706
Content-Type: text/plain;
 name="pvs.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pvs.txt"

  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  /dev/hdd2: lseek 4611824548366092288 failed: Invalid argument
  PV         VG   Fmt  Attr PSize      PFree     
  /dev/hdd2       lvm2 --   248064.43T 248064.43T
  /dev/md1        lvm2 --      445.74G    445.74G


--------------050306040301080706030706--
