Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1HGuA101601
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 11:56:10 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1HGu9tA026771
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 11:56:09 -0500
Received: from wolverine (wolverine.planbit.co.uk [192.168.0.104])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 4E54112EC7
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 16:55:43 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Fri, 17 Feb 2006 16:56:04 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20060217165543.4E54112EC7@bluewhale.planbit.co.uk>
Subject: [linux-lvm] FW: Unrecognised segment type mirror
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Forwarded on behalf of Jose (reasons below) and it doesn't look like the
usual spam in my inbox :-)

-----Original Message-----
From: Jose Massa [mailto:firulo@googlemail.com] 
Sent: 17 February 2006 16:02
To: Roger Lucas
Subject: Unrecognised segment type mirror

Dear Roger,
I'm sorry to bother you with this, but I honestly don't know whom else
to ask regarding an LVM problem that I'm having. I've subscribed to
the LVM list, confirmed my email address, posted twice, but the email
doesn't get through. I've also email the list administrator about the
problem, and he has not replied to my email either. Maybe they are
blocking all googlemail account? Not sure.

But I've thought that maybe you could post it for me (just got a post
from you today so I've thought why not ask...)
If you don't feel comfortable don't worry, I'd understand. But if you
don't mind, I'll really appreciate. I haven't found a reference to
this issue anywhere else so it's one of my last hopes.
Thanks a lot,
-Jose

---------- Forwarded message ----------
From: Jose Massa <firulo@googlemail.com>
Date: Feb 15, 2006 4:39 PM
Subject: Unrecognised segment type mirror
To: linux-lvm@redhat.com

I'm having some strange error with lvm2.
During booting, a pvscan, lvscan, or pretty much any lvm2 command I
get the message "Unrecognised segment type mirror".

My system still works (I hope fine), but I don't like this messages
and I'm not sure what the cause is or whether it could cause
corruption. Anyone has a clue?
The following lines show the console output

mafalda julian # lvscan
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 ACTIVE            '/dev/vg2/misc' [40.00 GB] inherit
 ACTIVE            '/dev/vg2/backup' [43.76 GB] inherit
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 ACTIVE            '/dev/vg1/home' [9.71 GB] inherit
 ACTIVE            '/dev/vg1/multimedia' [87.74 GB] inherit
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 Unrecognised segment type mirror
 ACTIVE            '/dev/vg0/var' [10.00 GB] inherit
 ACTIVE            '/dev/vg0/opt' [5.00 GB] inherit
 ACTIVE            '/dev/vg0/tmp' [2.00 GB] inherit
 ACTIVE            '/dev/vg0/usr' [15.00 GB] inherit
mafalda julian #

vg0 is running on top of a software RAID-0 device combining two disks.
Vg1 is a concatenation of LVM partitions on the first disk, and vg2 is
a concatenation of LVM partions on the second disk.

thanks
