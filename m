Message-Id: <5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
Date: Sun, 14 Oct 2018 23:39:20 -0600
From: "Gang He" <ghe@suse.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
In-Reply-To: <20181008150016.GB21471@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fails to create LVM volume on the top of RAID1
 after upgrade lvm2 to v2.02.180
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
To: teigland@redhat.com
Cc: linux-lvm@redhat.com

Hell David,

>>> On 2018/10/8 at 23:00, in message <20181008150016.GB21471@redhat.com>, David
Teigland <teigland@redhat.com> wrote:
> On Mon, Oct 08, 2018 at 04:23:27AM -0600, Gang He wrote:
>> Hello List
>> 
>> The system uses lvm based on raid1. 
>> It seems that the PV of the raid1 is found also on the single disks that 
> build the raid1 device:
>> [  147.121725] linux-472a dracut-initqueue[391]: WARNING: PV 
> qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sda2 was already found on 
> /dev/md1.
>> [  147.123427] linux-472a dracut-initqueue[391]: WARNING: PV 
> qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sdb2 was already found on 
> /dev/md1.
>> [  147.369863] linux-472a dracut-initqueue[391]: WARNING: PV 
> qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device 
> size is correct.
>> [  147.370597] linux-472a dracut-initqueue[391]: WARNING: PV 
> qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device 
> size is correct.
>> [  147.371698] linux-472a dracut-initqueue[391]: Cannot activate LVs in VG 
> vghome while PVs appear on duplicate devices.
> 
> Do these warnings only appear from "dracut-initqueue"?  Can you run and
> send 'vgs -vvvv' from the command line?  If they don't appear from the
> command line, then is "dracut-initqueue" using a different lvm.conf?
> lvm.conf settings can effect this (filter, md_component_detection,
> external_device_info_source).

mdadm --detail --scan -vvv
/dev/md/linux:0:
           Version : 1.0
     Creation Time : Sun Jul 22 22:49:21 2012
        Raid Level : raid1
        Array Size : 513012 (500.99 MiB 525.32 MB)
     Used Dev Size : 513012 (500.99 MiB 525.32 MB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Mon Jul 16 00:29:19 2018
             State : clean 
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

              Name : linux:0
              UUID : 160998c8:7e21bcff:9cea0bbc:46454716
            Events : 469

    Number   Major   Minor   RaidDevice State
       0       8       17        0      active sync   /dev/sdb1
       1       8       33        1      active sync   /dev/sdc1
/dev/md/linux:1:
           Version : 1.0
     Creation Time : Sun Jul 22 22:49:22 2012
        Raid Level : raid1
        Array Size : 1953000312 (1862.53 GiB 1999.87 GB)
     Used Dev Size : 1953000312 (1862.53 GiB 1999.87 GB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

     Intent Bitmap : Internal

       Update Time : Fri Oct 12 20:16:25 2018
             State : clean 
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : bitmap

              Name : linux:1
              UUID : 17426969:03d7bfa7:5be33b0b:8171417a
            Events : 326248

    Number   Major   Minor   RaidDevice State
       0       8       18        0      active sync   /dev/sdb2
       1       8       34        1      active sync   /dev/sdc2

Thanks
Gang

> 
>> This is a regression bug? since the user did not encounter this problem with 
> lvm2 v2.02.177.
> 
> It could be, since the new scanning changed how md detection works.  The
> md superblock version effects how lvm detects this.  md superblock 1.0 (at
> the end of the device) is not detected as easily as newer md versions
> (1.1, 1.2) where the superblock is at the beginning.  Do you know which
> this is?
