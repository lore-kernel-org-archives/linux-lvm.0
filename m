Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8MFditp002662
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 11:39:45 -0400
Received: from nm16-vm0.bullet.mail.ne1.yahoo.com
	(nm16-vm0.bullet.mail.ne1.yahoo.com [98.138.91.49])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o8MFdXtO011040
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 11:39:34 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with ESMTP id 829524B00232
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 08:39:31 -0700 (PDT)
Received: from pebblebeach.thenewhams.com ([127.0.0.1])
	by localhost (pebblebeach.thenewhams.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id bTw1-hPNRtmu for <linux-lvm@redhat.com>;
	Wed, 22 Sep 2010 08:39:27 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with ESMTP id A01EE4B00234
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 08:39:27 -0700 (PDT)
Received: from pebblebeach.thenewhams.com (localhost.localdomain [127.0.0.1])
	by pebblebeach.thenewhams.com (Postfix) with SMTP id 5EC994B00232
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2010 08:39:27 -0700 (PDT)
From: =?windows-1252?Q?Adam_NEWHAM?= <adam@thenewhams.com>
Date: Wed, 22 Sep 2010 08:39:27 -0700
Mime-Version: 1.0
In-Reply-To: <20100922062125.GA4707@maude.comedia.it>
References: <4C8677BF.40500@thenewhams.com>
Message-Id: <vmime.4c9a232f.1c6f.4fef62426d1bdb0e@pebblebeach.thenewhams.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small
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
Content-Type: text/plain; charset="utf-8"
To: =?windows-1252?Q?LVM_general_discussion_and_development?= <linux-lvm@redhat.com>

Thanks for looking into this. Here is the requested info, but I think something might be up with the array. I've captured additional info - I also have a screen capture from the Disk Utility but I will probably have to send that in a private email as it requires an attachment.

Here is my mdadm.conf (I recently uncommented the #DEVICE partitions as I thought Ubuntu might be picking up invalid metadata (see output from examine below). This is the same config used in the RHEL 5 install, again I tried with/without the DEVICE partitions line

#DEVICE partitions
ARRAY /dev/md0 level=raid5 num-devices=4 UUID=b5e0fcd0:cfadbb04:a5b6f22e:457f47ae

Here is what comes from mdmadm --examine --scan

ARRAY /dev/md0 level=raid5 num-devices=4 UUID=b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
ARRAY /dev/md0 level=raid5 num-devices=4 UUID=08558923:881d9efd:464c249d:988d2ec6

This ties in with what the Disk Utility is seeing, hence why I deleted the second line as I think one of the disks has invalid meta data.
 
Performing examine on each of the RAID members gives:
mdadm: No md superblock detected on /dev/sda.

I've listed the other 3 drives below so that the most relevant info is at the start of this email.

vgchange -a y displays the following at the console:

$ sudo vgchange -a y lvm-raid5
  device-mapper: resume ioctl failed: Invalid argument
  Unable to resume lvm--raid5-lvm0 (252:0)
  1 logical volume(s) in volume group "lvm-raid5" now active

With the following in /var/log/messages
kernel: [  553.685856] device-mapper: table: 252:0: md0p1 too small for target: start=384, len=5860556800, dev_size=1953520002

But any attempt to mount the LVM results in:
mount: /dev/mapper/lvm--raid5-lvm0 already mounted or //mnt/lvm-raid5 busy

Obviously the mount is failing because something is out of whack.

/dev/sdb:
          Magic : a92b4efc
        Version : 00.90.03
           UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
  Creation Time : Sat Nov  1 22:14:18 2008
     Raid Level : raid5
  Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
     Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
   Raid Devices : 4
  Total Devices : 4
Preferred Minor : 0

    Update Time : Mon Sep 20 19:24:26 2010
          State : clean
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0
       Checksum : e9cec762 - correct
         Events : 68

         Layout : left-symmetric
     Chunk Size : 64K

      Number   Major   Minor   RaidDevice State
this     0       8        0        0      active sync   /dev/sda

   0     0       8        0        0      active sync   /dev/sda
   1     1       8       16        1      active sync   /dev/sdb
   2     2       8       32        2      active sync   /dev/sdc
   3     3       8       48        3      active sync   /dev/sdd

/dev/sdc:
          Magic : a92b4efc
        Version : 00.90.03
           UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
  Creation Time : Sat Nov  1 22:14:18 2008
     Raid Level : raid5
  Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
     Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
   Raid Devices : 4
  Total Devices : 4
Preferred Minor : 0

    Update Time : Mon Sep 20 19:24:26 2010
          State : clean
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0
       Checksum : e9cec774 - correct
         Events : 68

         Layout : left-symmetric
     Chunk Size : 64K

      Number   Major   Minor   RaidDevice State
this     1       8       16        1      active sync   /dev/sdb

   0     0       8        0        0      active sync   /dev/sda
   1     1       8       16        1      active sync   /dev/sdb
   2     2       8       32        2      active sync   /dev/sdc
   3     3       8       48        3      active sync   /dev/sdd

/dev/sdd:
          Magic : a92b4efc
        Version : 00.90.03
           UUID : b5e0fcd0:cfadbb04:a5b6f22e:457f47ae
  Creation Time : Sat Nov  1 22:14:18 2008
     Raid Level : raid5
  Used Dev Size : 976762496 (931.51 GiB 1000.20 GB)
     Array Size : 2930287488 (2794.54 GiB 3000.61 GB)
   Raid Devices : 4
  Total Devices : 4
Preferred Minor : 0

    Update Time : Mon Sep 20 19:24:26 2010
          State : clean
 Active Devices : 4
Working Devices : 4
 Failed Devices : 0
  Spare Devices : 0
       Checksum : e9cec786 - correct
         Events : 68

         Layout : left-symmetric
     Chunk Size : 64K

      Number   Major   Minor   RaidDevice State
this     2       8       32        2      active sync   /dev/sdc

   0     0       8        0        0      active sync   /dev/sda
   1     1       8       16        1      active sync   /dev/sdb
   2     2       8       32        2      active sync   /dev/sdc
   3     3       8       48        3      active sync   /dev/sdd

-----Original Message-----
From: bluca@comedia.it [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Luca Berra
Sent: Tuesday, September 21, 2010 11:21 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Unable to mount LVM partition - table too small

On Tue, Sep 07, 2010 at 10:34:55AM -0700, Adam Newham wrote:
> vgdisplay
> --- Volume group ---
> VG Name lvm-raid5
> System ID
> Format lvm2
> Metadata Areas 1
> Metadata Sequence No 2
> VG Access read/write
> VG Status resizable
> MAX LV 0
> Cur LV 1
> Open LV 0
> Max PV 0
> Cur PV 1
> Act PV 1
> VG Size 2.73 TiB
> PE Size 32.00 MiB
> Total PE 89425
> Alloc PE / Size 89425 / 2.73 TiB
> Free PE / Size 0 / 0
> VG UUID wovrCm-knof-Ycdl-LdXt-4t28-mPWq-kngufG

does vgchange -a y fail?
is there any error message

> /proc/partitions (note the missing sub partitions � this I why I belive 
> the lv/pv scan�s don�t see any LVM info)
> major minor #blocks name
>
> 3 0 156290904 hda
> 3 1 200781 hda1
> 3 2 4192965 hda2
> 3 3 151894575 hda3
> 8 0 976762584 sda
> 8 16 976762584 sdb
> 8 32 976762584 sdc
> 8 48 976762584 sdd
> 9 0 2930287488 md0

the partition info for md component devices is corectly removed from the
kernel, to avoid confusion
the md device itself should be partitionable, can i see your
/etc/mdadm.conf ?

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
