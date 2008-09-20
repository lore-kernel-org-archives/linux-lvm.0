Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with SMTP id m8KFIU1D004527
	for <linux-lvm@redhat.com>; Sat, 20 Sep 2008 11:18:30 -0400
Received: from mcw.edu (fortimail.fm.mcw.edu [141.106.20.130])
	by mx2.redhat.com (8.13.8/8.13.8) with SMTP id m8KFIB5o005741
	for <linux-lvm@redhat.com>; Sat, 20 Sep 2008 11:18:11 -0400
Received: from kaiso.biophysics.mcw.edu (kaiso.biophysics.mcw.edu
	[141.106.202.68])
	by fortimail2.fm.mcw.edu  with ESMTP id m8KFIBQ0017900
	for <linux-lvm@redhat.com>; Sat, 20 Sep 2008 10:18:11 -0500
Date: Sat, 20 Sep 2008 10:18:11 -0500 (CDT)
From: vinai <vroopcha@mcw.edu>
Message-ID: <Pine.OSX.4.62.0809201012250.31987@kaiso.biophysics.mcw.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Problems growing a logical volume with LVM tools.
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

Hi Folks,

I've been using Linux SuSE and openSUSE for a little while now, but this 
is my first foray into LVM.  This message was originally posted to an 
openSUSE list, but it was suggested to ask a crowd better versed in lvm.

First off - the setup is a rack-mounted server running 64-bit openSUSE 
10.3, with all updates installed.  There are 16 hard drives are split 
up into 2 8-disk RAID-5 volumes using a 3ware SATA RAID controller card. 
Each volume was made up of disks that were previously 400 GB, but now 
upgraded to 1 TB, hence the total volume size grew from 2.4 TB to 6.3 
TB.  The initial setup on this machine did not include LVM, and I would 
like to implement it to handle future size increases.  But I am stuck at 
the final step of extending the logical volume.  Here's what I did so 
far:

- On the 6.3 TB RAID-5 volume, I created a partition (with parted, type 
GPT, with the lvm flag on).  This partition was 2.4 TB (or thereabouts) 
in size, to simulate the growth from 2.4 to 6.3 TB (we were previously 
able to grow the underlying RAID-5 volume successfully).

- I made this partition (sdc1) a physical volume.

- I then made a volume group (array2) from this single partition

- After that, I made a logical volume (rd2) from the array2 volume group

- I used parted and mkfs on this logical partition (rd2) to create a 
partition with the "loop" label and format it.

- I put some data on there and ran a checksum.

- Then I unmounted the rd2 logical partition from the computer's file 
system.

- I ran pvresize on it and maxed out the number of extents available on 
the physical volume successfully.

- I repeated the same for vgresize successfully.

- And finally (or so I thought) I ran lvextend to resize the logical 
volume.  But here's where I ran into issues.  Here's the command I've 
been trying and the output:

# lvresize -d -v -l 1668910  /dev/array2/rd2
     Finding volume group array2
     Archiving volume group "array2" metadata (seqno 4).
   Extending logical volume rd2 to 6.37 TB
     Creating volume group backup "/etc/lvm/backup/array2" (seqno 5).
     Found volume group "array2"
     Found volume group "array2"
     Loading array2-rd2 table
   device-mapper: reload ioctl failed: Invalid argument
   Failed to suspend rd2

The size of the logical volume does not change.  I even tried this using 
the GUI in YaST2, but the error message that popped up was essentially 
the same thing.  What did I miss, or what I am not doing ?  I got the 
same results with "lvextend" ...

Thanks all.

cheers
vinai
