Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5RHwm1a025923
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 13:58:48 -0400
Received: from apollo.sr.unh.edu (apollo.sr.unh.edu [132.177.249.110])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5RHwhKK025874
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 13:58:43 -0400
Received: from [132.177.249.85] (lxion.sr.unh.edu [132.177.249.85])
	by apollo.sr.unh.edu (8.12.8/8.12.8) with ESMTP id l5RHwbdv015691
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 13:58:37 -0400
Message-ID: <4682A5BE.1050409@apollo.sr.unh.edu>
Date: Wed, 27 Jun 2007 14:00:30 -0400
From: burlen <burlen@apollo.sr.unh.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] recover one LVM disk without the other
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
To: linux-lvm@redhat.com

Hi recently we had a FC4 system with 2 disks go down do to disk failure. 
I replaced the bad drive, and installed Ubuntu 7 on the new drive with 
out the old drive. Unknown to us, FC4 was apparently using a LVM. I try 
to mount the remaining FC4 drive but get the mount error:

burlen@terra:~$ sudo mount /dev/sdb2 /mount_hd/
mount: unknown filesystem type 'LVM2_member'

How can I recover this drive? Really all I need to do is mount it and 
recover some data then we can repartion/ format it as well.

Burlen
