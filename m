Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4RNvtqB009400
	for <linux-lvm@redhat.com>; Sun, 27 May 2007 19:57:55 -0400
Received: from mu-out-0910.google.com (mu-out-0910.google.com [209.85.134.191])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4RNvoPt031168
	for <linux-lvm@redhat.com>; Sun, 27 May 2007 19:57:51 -0400
Received: by mu-out-0910.google.com with SMTP id i10so1640408mue
	for <linux-lvm@redhat.com>; Sun, 27 May 2007 16:57:50 -0700 (PDT)
Message-ID: <7dd6ce6e0705271657y151dd198wc1a7f617d4267ee7@mail.gmail.com>
Date: Mon, 28 May 2007 01:57:49 +0200
From: Jonathan <arbitraryuser@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_122085_25697046.1180310269953"
Subject: [linux-lvm] pvcreate is successful but nothing is reported by
	pvdisplay
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

------=_Part_122085_25697046.1180310269953
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I've been running LVM for about a year on non-raided gear and just recently
got two 500gb drives to RAID 1. I've got a 15gig OS partition, 2gigs swap
and the rest is going to the LVM where it will be joined later by additional
raided drive pairs.

My problem is that my pvcreate *appears* to work but my pvdisplay doesn't
seem to agree as it always reports no physical volumes.

I've pasted all the relevant bits and pieces below. I'd love to get some
feedback!

Thanks in advance.
Jonathan.

############################################
                                        First some history
############################################

root@dingo:~# lvm version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.11.0


root@dingo:~# lvmdiskscan
  /dev/ram0  [       64.00 MB]
  /dev/md0   [       14.65 GB]
  /dev/ram1  [       64.00 MB]
  /dev/md1   [        1.95 GB]
  /dev/ram2  [       64.00 MB]
  /dev/md2   [      449.16 GB] LVM physical volume
  /dev/ram3  [       64.00 MB]
  /dev/ram4  [       64.00 MB]
  /dev/ram5  [       64.00 MB]
  /dev/ram6  [       64.00 MB]
  /dev/ram7  [       64.00 MB]
  /dev/ram8  [       64.00 MB]
  /dev/ram9  [       64.00 MB]
  /dev/ram10 [       64.00 MB]
  /dev/ram11 [       64.00 MB]
  /dev/ram12 [       64.00 MB]
  /dev/ram13 [       64.00 MB]
  /dev/ram14 [       64.00 MB]
  /dev/ram15 [       64.00 MB]
  0 disks
  18 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume


####################################
And now the verbose pvcreate
####################################

root@dingo:~# pvcreate /dev/md2 -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/P_orphans WB
      /dev/md2: lvm2 label detected
      /dev/md2: lvm2 label detected
    Wiping cache of LVM-capable devices
      /dev/sndstat: stat failed: No such file or directory
      /dev/ram0: size is 131072 sectors
      /dev/ram0: size is 131072 sectors
      /dev/ram0: No label detected
      /dev/sda: size is 976773168 sectors
      /dev/md0: size is 30716032 sectors
      /dev/md0: size is 30716032 sectors
      /dev/md0: No label detected
      /dev/ram1: size is 131072 sectors
      /dev/ram1: size is 131072 sectors
      /dev/ram1: No label detected
      /dev/sda1: size is 30716217 sectors
      /dev/sda1: size is 30716217 sectors
      /dev/md1: size is 4096384 sectors
      /dev/md1: size is 4096384 sectors
      /dev/md1: No label detected
      /dev/ram2: size is 131072 sectors
      /dev/ram2: size is 131072 sectors
      /dev/ram2: No label detected
      /dev/sda2: size is 4096575 sectors
      /dev/sda2: size is 4096575 sectors
      /dev/md2: size is 941955072 sectors
      /dev/md2: size is 941955072 sectors
      /dev/md2: lvm2 label detected
      /dev/ram3: size is 131072 sectors
      /dev/ram3: size is 131072 sectors
      /dev/ram3: No label detected
      /dev/sda3: size is 941955210 sectors
      /dev/sda3: size is 941955210 sectors
      /dev/ram4: size is 131072 sectors
      /dev/ram4: size is 131072 sectors
      /dev/ram4: No label detected
      /dev/ram5: size is 131072 sectors
      /dev/ram5: size is 131072 sectors
      /dev/ram5: No label detected
      /dev/ram6: size is 131072 sectors
      /dev/ram6: size is 131072 sectors
      /dev/ram6: No label detected
      /dev/ram7: size is 131072 sectors
      /dev/ram7: size is 131072 sectors
      /dev/ram7: No label detected
      /dev/ram8: size is 131072 sectors
      /dev/ram8: size is 131072 sectors
      /dev/ram8: No label detected
      /dev/ram9: size is 131072 sectors
      /dev/ram9: size is 131072 sectors
      /dev/ram9: No label detected
      /dev/ram10: size is 131072 sectors
      /dev/ram10: size is 131072 sectors
      /dev/ram10: No label detected
      /dev/ram11: size is 131072 sectors
      /dev/ram11: size is 131072 sectors
      /dev/ram11: No label detected
      /dev/ram12: size is 131072 sectors
      /dev/ram12: size is 131072 sectors
      /dev/ram12: No label detected
      /dev/ram13: size is 131072 sectors
      /dev/ram13: size is 131072 sectors
      /dev/ram13: No label detected
      /dev/ram14: size is 131072 sectors
      /dev/ram14: size is 131072 sectors
      /dev/ram14: No label detected
      /dev/ram15: size is 131072 sectors
      /dev/ram15: size is 131072 sectors
      /dev/ram15: No label detected
      /dev/sdb: size is 976773168 sectors
      /dev/sdb1: size is 30716217 sectors
      /dev/sdb1: size is 30716217 sectors
      /dev/sdb2: size is 4096575 sectors
      /dev/sdb2: size is 4096575 sectors
      /dev/sdb3: size is 941955210 sectors
      /dev/sdb3: size is 941955210 sectors
      /dev/md2: size is 941955072 sectors
      metadata/pvmetadatasize not found in config: defaulting to 255
      metadata/pvmetadatacopies not found in config: defaulting to 1
      /dev/md2: size is 941955072 sectors
    Set up physical volume for "/dev/md2" with 941954688 available sectors
      Scanning for labels to wipe from /dev/md2
      /dev/md2: Wiping label at sector 1
    Zeroing start of device /dev/md2
      Writing physical volume data to disk "/dev/md2"
      /dev/md2: Writing label to sector 1
  Physical volume "/dev/md2" successfully created
      Unlocking /var/lock/lvm/P_orphans

###################################
And now the verbose pvdisplay
###################################

root@dingo:~# pvdisplay -vvv
        Processing: pvdisplay -vvv
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Scanning for physical volume names
        /dev/ram0: Not using O_DIRECT
        Opened /dev/ram0 RO
        /dev/ram0: block size is 1024 bytes
      /dev/ram0: No label detected
        Closed /dev/ram0
        Opened /dev/md0 RO O_DIRECT
        /dev/md0: block size is 4096 bytes
      /dev/md0: No label detected
        Closed /dev/md0
        /dev/ram1: Not using O_DIRECT
        Opened /dev/ram1 RO
        /dev/ram1: block size is 1024 bytes
      /dev/ram1: No label detected
        Closed /dev/ram1
        Opened /dev/md1 RO O_DIRECT
        /dev/md1: block size is 4096 bytes
      /dev/md1: No label detected
        Closed /dev/md1
        /dev/ram2: Not using O_DIRECT
        Opened /dev/ram2 RO
        /dev/ram2: block size is 1024 bytes
      /dev/ram2: No label detected
        Closed /dev/ram2
        Opened /dev/md2 RO O_DIRECT
        /dev/md2: block size is 4096 bytes
      /dev/md2: lvm2 label detected
        lvmcache: /dev/md2: now orphaned
        Closed /dev/md2
        /dev/ram3: Not using O_DIRECT
        Opened /dev/ram3 RO
        /dev/ram3: block size is 1024 bytes
      /dev/ram3: No label detected
        Closed /dev/ram3
        /dev/ram4: Not using O_DIRECT
        Opened /dev/ram4 RO
        /dev/ram4: block size is 1024 bytes
      /dev/ram4: No label detected
        Closed /dev/ram4
        /dev/ram5: Not using O_DIRECT
        Opened /dev/ram5 RO
        /dev/ram5: block size is 1024 bytes
      /dev/ram5: No label detected
        Closed /dev/ram5
        /dev/ram6: Not using O_DIRECT
        Opened /dev/ram6 RO
        /dev/ram6: block size is 1024 bytes
      /dev/ram6: No label detected
        Closed /dev/ram6
        /dev/ram7: Not using O_DIRECT
        Opened /dev/ram7 RO
        /dev/ram7: block size is 1024 bytes
      /dev/ram7: No label detected
        Closed /dev/ram7
        /dev/ram8: Not using O_DIRECT
        Opened /dev/ram8 RO
        /dev/ram8: block size is 1024 bytes
      /dev/ram8: No label detected
        Closed /dev/ram8
        /dev/ram9: Not using O_DIRECT
        Opened /dev/ram9 RO
        /dev/ram9: block size is 1024 bytes
      /dev/ram9: No label detected
        Closed /dev/ram9
        /dev/ram10: Not using O_DIRECT
        Opened /dev/ram10 RO
        /dev/ram10: block size is 1024 bytes
      /dev/ram10: No label detected
        Closed /dev/ram10
        /dev/ram11: Not using O_DIRECT
        Opened /dev/ram11 RO
        /dev/ram11: block size is 1024 bytes
      /dev/ram11: No label detected
        Closed /dev/ram11
        /dev/ram12: Not using O_DIRECT
        Opened /dev/ram12 RO
        /dev/ram12: block size is 1024 bytes
      /dev/ram12: No label detected
        Closed /dev/ram12
        /dev/ram13: Not using O_DIRECT
        Opened /dev/ram13 RO
        /dev/ram13: block size is 1024 bytes
      /dev/ram13: No label detected
        Closed /dev/ram13
        /dev/ram14: Not using O_DIRECT
        Opened /dev/ram14 RO
        /dev/ram14: block size is 1024 bytes
      /dev/ram14: No label detected
        Closed /dev/ram14
        /dev/ram15: Not using O_DIRECT
        Opened /dev/ram15 RO
        /dev/ram15: block size is 1024 bytes
      /dev/ram15: No label detected
        Closed /dev/ram15

#####################################
                     The not so verbose pvdisplay
#####################################

root@dingo:~# pvdisplay -v
    Scanning for physical volume names
root@dingo:~#

------=_Part_122085_25697046.1180310269953
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,<br><br>I&#39;ve been running LVM for about a year on non-raided gear and just recently got two 500gb drives to RAID 1. I&#39;ve got a 15gig OS partition, 2gigs swap and the rest is going to the LVM where it will be joined later by additional raided drive pairs.
<br><br>My problem is that my pvcreate *appears* to work but my pvdisplay doesn&#39;t seem to agree as it always reports no physical volumes.<br><br>I&#39;ve pasted all the relevant bits and pieces below. I&#39;d love to get some feedback!
<br><br>Thanks in advance.<br>Jonathan.<br><br>############################################<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First some history<br>############################################<br><br>root@dingo:~# lvm version
<br>&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.06 (2006-05-12)<br>&nbsp; Library version: 1.02.08 (2006-07-17)<br>&nbsp; Driver version:&nbsp; 4.11.0<br><br><br>root@dingo:~# lvmdiskscan <br>&nbsp; /dev/ram0&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/md0&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14.65 GB] 
<br>&nbsp; /dev/ram1&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/md1&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.95 GB] <br>&nbsp; /dev/ram2&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/md2&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 449.16 GB] LVM physical volume<br>&nbsp; /dev/ram3&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram4&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00
 MB] <br>&nbsp; /dev/ram5&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram6&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram7&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram8&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram9&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram10 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram11 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
64.00 MB] <br>&nbsp; /dev/ram12 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram13 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram14 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; /dev/ram15 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64.00 MB] <br>&nbsp; 0 disks<br>&nbsp; 18 partitions<br>&nbsp; 0 LVM physical volume whole disks
<br>&nbsp; 1 LVM physical volume<br><br><br>####################################<br>And now the verbose pvcreate<br>####################################<br><br>root@dingo:~# pvcreate /dev/md2 -vv<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_type to 1
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_dir to /var/lock/lvm<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File-based locking enabled.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Locking /var/lock/lvm/P_orphans WB<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: lvm2 label detected<br>&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable devices
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sndstat: stat failed: No such file or directory<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram0: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram0: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram0: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda: size is 976773168 sectors
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md0: size is 30716032 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md0: size is 30716032 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md0: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram1: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram1: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram1: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda1: size is 30716217 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda1: size is 30716217 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: size is 4096384 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: size is 4096384 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram2: size is 131072 sectors
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram2: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram2: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda2: size is 4096575 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda2: size is 4096575 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: size is 941955072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: size is 941955072 sectors
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram3: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram3: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram3: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda3: size is 941955210 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda3: size is 941955210 sectors
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram4: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram4: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram4: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram5: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram5: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram5: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram6: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram6: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram6: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram7: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram7: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram7: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram8: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram8: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram8: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram9: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram9: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram9: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram10: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram10: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram10: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram11: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram11: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram11: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram12: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram12: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram12: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram13: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram13: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram13: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram14: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram14: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram14: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram15: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram15: size is 131072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram15: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb: size is 976773168 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb1: size is 30716217 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb1: size is 30716217 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb2: size is 4096575 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb2: size is 4096575 sectors
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb3: size is 941955210 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb3: size is 941955210 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: size is 941955072 sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metadata/pvmetadatasize not found in config: defaulting to 255<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metadata/pvmetadatacopies not found in config: defaulting to 1
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: size is 941955072 sectors<br>&nbsp;&nbsp;&nbsp; Set up physical volume for &quot;/dev/md2&quot; with 941954688 available sectors<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Scanning for labels to wipe from /dev/md2<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: Wiping label at sector 1
<br>&nbsp;&nbsp;&nbsp; Zeroing start of device /dev/md2<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Writing physical volume data to disk &quot;/dev/md2&quot;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: Writing label to sector 1<br>&nbsp; Physical volume &quot;/dev/md2&quot; successfully created<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking /var/lock/lvm/P_orphans
<br><br>###################################<br>And now the verbose pvdisplay<br>###################################<br><br>root@dingo:~# pvdisplay -vvv<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Processing: pvdisplay -vvv<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O_DIRECT will be used
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_type to 1<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_dir to /var/lock/lvm<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File-based locking enabled.<br>&nbsp;&nbsp;&nbsp; Scanning for physical volume names<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram0: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram0 RO
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram0: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram0: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram0<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/md0 RO O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md0: block size is 4096 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md0: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/md0<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram1: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram1 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram1: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram1: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram1<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/md1 RO O_DIRECT
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: block size is 4096 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/md1<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram2: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram2 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram2: block size is 1024 bytes
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram2: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram2<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/md2 RO O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: block size is 4096 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md2: lvm2 label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvmcache: /dev/md2: now orphaned
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/md2<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram3: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram3 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram3: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram3: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram3<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram4: Not using O_DIRECT
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram4 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram4: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram4: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram4<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram5: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram5 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram5: block size is 1024 bytes
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram5: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram5<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram6: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram6 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram6: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram6: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram6<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram7: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram7 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram7: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram7: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram7<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram8: Not using O_DIRECT
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram8 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram8: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram8: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram8<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram9: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram9 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram9: block size is 1024 bytes
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram9: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram9<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram10: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram10 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram10: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram10: No label detected
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram10<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram11: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram11 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram11: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram11: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram11<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram12: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram12 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram12: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram12: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram12<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram13: Not using O_DIRECT
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram13 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram13: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram13: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram13<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram14: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram14 RO
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram14: block size is 1024 bytes<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram14: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram14<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram15: Not using O_DIRECT<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/ram15 RO<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram15: block size is 1024 bytes
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/ram15: No label detected<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/ram15<br><br>#####################################<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The not so verbose pvdisplay<br>#####################################<br><br>root@dingo
:~# pvdisplay -v<br>&nbsp;&nbsp;&nbsp; Scanning for physical volume names<br>root@dingo:~# <br><br><br><br>

------=_Part_122085_25697046.1180310269953--
