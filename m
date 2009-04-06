Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n36EIK6v028931
	for <linux-lvm@redhat.com>; Mon, 6 Apr 2009 10:18:20 -0400
Received: from smtp138.iad.emailsrvr.com (smtp138.iad.emailsrvr.com
	[207.97.245.138])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n36EHxW7002500
	for <linux-lvm@redhat.com>; Mon, 6 Apr 2009 10:17:59 -0400
Received: from relay23.relay.iad.mlsrvr.com (localhost [127.0.0.1])
	by relay23.relay.iad.mlsrvr.com (SMTP Server) with ESMTP id 3B5E81B403A
	for <linux-lvm@redhat.com>; Mon,  6 Apr 2009 10:17:59 -0400 (EDT)
Received: by relay23.relay.iad.mlsrvr.com (Authenticated sender:
	mfidelman-AT-traversetechnologies.com) with ESMTPSA id 109001B4037
	for <linux-lvm@redhat.com>; Mon,  6 Apr 2009 10:17:59 -0400 (EDT)
Message-ID: <49DA0F16.7000007@traversetechnologies.com>
Date: Mon, 06 Apr 2009 10:17:58 -0400
From: Miles Fidelman <mfidelman@traversetechnologies.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] progress, but... - re. fixing LVM/md snafu
References: <49D8E4EE.3020703@traversetechnologies.com>
	<49DD2D4E-9D47-47D1-BB70-C85DE4D9C9AB@engineyard.com>
In-Reply-To: <49DD2D4E-9D47-47D1-BB70-C85DE4D9C9AB@engineyard.com>
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

Hi Jayson,

Thanks for all the detailed information yesterday.  I've done some more 
digging into my system, and I wonder if you'd be willing to comment on 
what I found, and the recovery procedure I'm considering.

Quick summary of situation:
- machine comes up, but LVM builds / on top of /dev/sdb3 instead of 
/dev/md2 of which /dev/sdb3 is a part
- looks like md2 isn't starting, so I need to fix it (presumably 
offline, using a LiveCD), then reboot and get LVM to use the mirror device

What's confusing is that the raid isn't starting at boot time, but 
depending on which tools I use shows different status.  So first, I have 
to get the raid working again and make sure it has the up-to-date data.

Here are some more details, broken into four sections: RAID, LVM, boot 
process, recovery procedure - the RAID section has a summary at the 
front, followed by details of command listings, the other sections are 
much shorter :-):

Comments on the recovery procedure, please!

---------- re. the RAID array --------
RE. the raid array:

summary:
- /proc/mdstat thinks the array is inactive, containing sdb3 and sdd3

- mdadm thinks it's active, degraded, also containing sdb3 and sdd3 
(mdadm -D /dev/md2)

- looking at superblocks, mdadm seems to think it's active, degraded 
(mdadm -E /dev/sda3 /dev/sdb3 /dev/sdc3 /dev/sdd3)
-- containing sda3, only (mdadm -E /dev/sda3)
-- containing sda3, with sdb3 spare (mdadm -E /dev/sdb3)
-- containing sda3 and sdb3, with sdc3 spare (mdadm -E /dev/sdc3) - with 
the same Magic #, different UUID from above
-- no superblock on /dev/sdd3 (mdadm -E /dev/sdd3)

details:
more /proc/mdstat:
md2 : inactive sdd3[0] sdb3[2]
     195318016 blocks

<looking@RAID>
mdadm -D /dev/md2:
/dev/md2:
       Version : 00.90.01
 Creation Time : Thu Jul 20 06:15:18 2006
    Raid Level : raid1
   Device Size : 97659008 (93.13 GiB 100.00 GB)
  Raid Devices : 2
 Total Devices : 2
Preferred Minor : 2
   Persistence : Superblock is persistent

   Update Time : Fri Apr  3 10:06:41 2009
         State : active, degraded
Active Devices : 0
Working Devices : 2
Failed Devices : 0
 Spare Devices : 2

   Number   Major   Minor   RaidDevice State
      0       8       51        0      spare rebuilding   /dev/sdd3
      1       0        0        -      removed

      2       8       19        -      spare   /dev/sdb3

<looking@component devices>
server1:/etc/lvm# mdadm -E  /dev/sda3 /dev/sdb3 /dev/sdc3 /dev/sdd3
/dev/sda3:
         Magic : a92b4efc
       Version : 00.90.00
          UUID : 3a32acee:8a132ab9:545792a8:0df49d99
 Creation Time : Thu Jul 20 06:15:18 2006
    Raid Level : raid1
  Raid Devices : 2
 Total Devices : 1
Preferred Minor : 2

   Update Time : Fri Apr  3 22:40:39 2009
         State : clean
Active Devices : 1
Working Devices : 1
Failed Devices : 1
 Spare Devices : 0
      Checksum : 71d21f34 - correct
        Events : 0.114704240


     Number   Major   Minor   RaidDevice State
this     0       8        3        0      active sync   /dev/sda3

  0     0       8        3        0      active sync   /dev/sda3
  1     1       0        0        1      faulty removed
/dev/sdb3:
         Magic : a92b4efc
       Version : 00.90.00
          UUID : 3a32acee:8a132ab9:545792a8:0df49d99
 Creation Time : Thu Jul 20 06:15:18 2006
    Raid Level : raid1
  Raid Devices : 2
 Total Devices : 2
Preferred Minor : 2

   Update Time : Fri Apr  3 10:06:41 2009
         State : clean
Active Devices : 1
Working Devices : 2
Failed Devices : 1
 Spare Devices : 1
      Checksum : 71d1d1fa - correct
        Events : 0.114716950


     Number   Major   Minor   RaidDevice State
this     2       8       19        2      spare   /dev/sdb3

  0     0       8        3        0      active sync   /dev/sda3
  1     1       0        0        1      faulty removed
  2     2       8       19        2      spare   /dev/sdb3
/dev/sdc3:
         Magic : a92b4efc
       Version : 00.90.00
          UUID : 635fb32e:6a83a5be:12735af4:74016e66
 Creation Time : Wed Jul  2 12:48:36 2008
    Raid Level : raid1
  Raid Devices : 2
 Total Devices : 3
Preferred Minor : 2

   Update Time : Fri Apr  3 06:42:50 2009
         State : clean
Active Devices : 2
Working Devices : 3
Failed Devices : 0
 Spare Devices : 1
      Checksum : 95973481 - correct
        Events : 0.26


     Number   Major   Minor   RaidDevice State
this     2       8       35        2      spare   /dev/sdc3

  0     0       8        3        0      active sync   /dev/sda3
  1     1       8       19        1      active sync   /dev/sdb3
  2     2       8       35        2      spare   /dev/sdc3
mdadm: No super block found on /dev/sdd3 (Expected magic a92b4efc, got 
00000000)

<looking@devices with --scan>
server1:/etc/lvm# mdadm -E  --scan /dev/sda3 /dev/sdb3 /dev/sdc3 /dev/sdd3
ARRAY /dev/md2 level=raid1 num-devices=2 
UUID=635fb32e:6a83a5be:12735af4:74016e66
  devices=/dev/sdc3
ARRAY /dev/md2 level=raid1 num-devices=2 
UUID=3a32acee:8a132ab9:545792a8:0df49d99
  devices=/dev/sda3,/dev/sdb3

-------- re. LVM ---------

/etc/lvm.conf contains the line:
md_component_detection = 0

I expect that if I set it to 1 that would tell LVM to look for RAIDs first.

Also, /etc/lvm/backup/rootvolume contains:
pv0 {
           id = "2ppSS2-q0kO-3t0t-uf8t-6S19-qY3y-pWBOxF"
           device = "/dev/md2"    # Hint only

which suggests that if the RAID is running, lvm will do the right thing

---------- re. boot process ------------
looks like detailed events are:

- MBR loads grub

- grub knows about md and lvm, mounts read-only
-- kernel        /vmlinuz-2.6.8-3-686 root=/dev/mapper/rootvolume-rootlv 
ro mem=4

- during main boot md comes up first, then lvm
-- from rcS.d/S25mdadm-raid: if not already running ... mdadm -A -s -a
---- I'm guessing this fails for /dev/md2

-- from rcS.d/S26lvm:
-- creates lvm device
-- creates dm device
-- does a vgscan
---- which is where this happens:
 Found duplicate PV 2ppSS2q0kO3t0tuf8t6S19qY3ypWBOxF: using /dev/sdb3 
not /dev/sda3
 Found volume group "backupvolume" using metadata type lvm2
 Found volume group "rootvolume" using metadata type lvm2
-- does a vgchange -a -y
---- which looks like it's picking up on sdb3

--  I'm guessing that if the mirror were active, and based on /dev/sdb3 
- lvm would pick that up as the volume group
** is this where setting md_component_detection = 1 would be helpful?

------------ recovery procedure ------------

here's what I'm thinking of doing - comments please!

1. turn logging on in lvm.conf, reboot, examine logs to confirm above 
guesses (or find out what's really happening)
-- based on the logging, maybe set md_component_detection = 1 in lvm.conf

2. shutdown, boot from LiveCD (I'm using systemrescuecd - great tool by 
the way)

3. backup /dev/sdb3 using partimage (just in case!)

4. try to fix /dev/md2

if it's not running - start it, with only /dev/sdb3; then add in other 
devices
-  A /dev/md2 --add /dev/sdb3 --run  (**is this the right way to do 
this?**)
- add each device back (mdadm -a /dev/sda3; mdadm -a /dev/sdb3; mdadm -a 
/dev/sdd3)
- grow to 3 active devices: mdadm --grow -n 3 /dev/md2

if it's running:
- fail all except /dev/sdb3 (mdadm -f /dev/sda3; mdadm -f /dev/sdb3; 
mdadm -f /dev/sdd3)
- remove all except /dev/sdb3 (mdadm -r /dev/sda3; mdadm -r /dev/sdb3; 
mdadm -r /dev/sdd3)
- add each device back (mdadm -a /dev/sda3; mdadm -a /dev/sdb3; mdadm -a 
/dev/sdd3)
- grow to 3 active devices: mdadm --grow -n 3 /dev/md2

question: do I need to update mdadm.conf?
question: do I need to anything to get rid of the superblock containing 
a different UUID

5. reboot the system

- it may just come up

- if it comes up and lvm is still operating off a single partition, 
repeat the above, but first add a filter to lvm.conf (wash, rinse, 
repeat as necessary)

*** does this seem like a reasonable game plan? ***

Thanks again for  your help!

Miles
