Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3L5U8p27898
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 01:30:08 -0400
Received: from newsguy.com (smtp.newsguy.com [129.250.170.69])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3L5U7Mc028841
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 01:30:07 -0400
Received: from pobox.com (node-423a1512.mdw.onnet.us.uu.net [66.58.21.18])
	by newsguy.com (8.12.9/8.12.8) with ESMTP id i3L5U04n021094
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 22:30:01 -0700 (PDT)
	(envelope-from msroark@pobox.com)
Message-ID: <408606D3.60102@pobox.com>
Date: Wed, 21 Apr 2004 00:29:55 -0500
From: Mike Roark <msroark@pobox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] OS (Debian Sarge) reinstall led to my lvm partitions
 being marked 82 "Linux swap!"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,
    After having a failing boot drive on my storage box, I reinstalled 
Debian sarge from scratch on a fresh drive. The box had two lvm (1.0) 
volumes with some PEs for one of them on the failing disk, and the rest 
on other disks. In the installer I tried to only have it partition the 
new /dev/hda, and thought I was successful. However, once I got it up 
and running and tried to get the second, still intact, lvm volume 
working, I discovered that the partition type on all the other drives 
had changed to Linux swap!

Here's a snippet of an fdisk -l on one of my partitions now:

                                Device Boot      Start         End      
Blocks   Id  System
/dev/ide/host0/bus1/target0/lun0/part1               1       24792   
199141708+  82  Linux swap


Here is what it looked like before the reinstall:

                                Device Boot      Start         End      
Blocks   Id  System
/dev/ide/host0/bus1/target0/lun0/part1               1       24792   
199141708+  8e  Linux LVM


Interestingly, pvdisplay seems to somehow be able to see that there is 
lvm information on the drive:

biotron:~# pvdisplay /dev/hdc1
--- Physical volume ---
PV Name               /dev/ide/host0/bus1/target0/lun0/part1
VG Name               group_B
PV Size               189.92 GB [398283417 secs] / NOT usable 32.19 MB 
[LVM: 151 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              6076
Free PE               0
Allocated PE          6076
PV UUID               6he4J4-lpim-BHJG-334y-41DJ-Jz1n-lfMGA1


However, none of the lvm *scan utilities will find it, including vgscan. 
I'm assuming this is because of the partition type.

I'd welcome any suggestions about  whether or not it might be possible 
to fix it. Even when the drive was failing I was still able to 
successfully mount the intact lvm volume with no problem. It was only 
after the reinstall of Sarge that I had problems getting to it.

I'm tempted to try changing the partition type using fdisk or cfdisk, 
but I'd like to be certain that it will only change the partition type 
and not touch anything else before I try it, so I'm appealing here first 
for any lvm-ish wisdom that you can offer.

Unfortunately, the data on those drives was actually very precious (not 
just mp3s and warez). The two lvm volumes were rsynced to each other and 
were on separate disks and this was providing a simple measure of 
redundancy, but the initial hard drive failure took out one volume 
because there were PEs on the failed drive for it, and now this has 
taken out the other, so I'm in dire straits.

                 Thanks for any help,
                         Mike Roark
