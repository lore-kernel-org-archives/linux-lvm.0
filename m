Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m18E6sdI027649
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 09:06:54 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.224])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m18E6Tae022858
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 09:06:29 -0500
Received: by wr-out-0506.google.com with SMTP id 70so3570149wra.7
	for <linux-lvm@redhat.com>; Fri, 08 Feb 2008 06:06:24 -0800 (PST)
Message-ID: <fe11eda90802080606m1d35da7dv755b7a4331681002@mail.gmail.com>
Date: Fri, 8 Feb 2008 11:06:23 -0300
From: "Martin Sarsale" <martin@malditainternet.com>
Sender: martin.sarsale@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Disk dying and LVM2
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
To: linux-lvm@redhat.com

Guys,

I have a volume made up by two SATA disks, one 80g other 250g. The 80g
is dying and I'm about to replace it.
The volume is mounted as the root fs.


This is my plan, can you tell me if I'm on the right track?

1) empty at least 80g in the volume
2) reboot, mount readonly and resize the reiserfs to 80gb less than
current (this is, to 250g)
3) pvmove /dev/old_disk
4) reboot
5) take the old disk out

While the system boots and works more-or-less, when trying to open
some files I get input/output errors: what will happen when pvmove
tries to move the sector containing this file? After the pvmove the
system shouldn't be in a worse condition that it's now, right?

thanks!

-- 
Martin Sarsale - martin@malditainternet.com
