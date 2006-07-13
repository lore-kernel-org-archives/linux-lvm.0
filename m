Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DFqmJH032662
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 11:52:48 -0400
Received: from bronze.cs.yorku.ca (bronze.cs.yorku.ca [130.63.90.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DFqlJR030184
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 11:52:47 -0400
Received: from [130.63.86.107] (ident=jas)
	by bronze.cs.yorku.ca with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.62)
	(envelope-from <jas@cse.yorku.ca>) id 1G13UX-0007Yg-KM
	for linux-lvm@redhat.com; Thu, 13 Jul 2006 11:52:41 -0400
Message-ID: <44B66C49.90500@cse.yorku.ca>
Date: Thu, 13 Jul 2006 11:52:41 -0400
From: Jason Keltz <jas@cse.yorku.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 volumes not available on boot
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

Hi.

I have what is probably a very simple question concerning lvm2.    If I 
create an lvm2 volume, and reboot, I no longer see the volume.  The 
system startup scripts do "vgchange -a y", but if I do this by hand, I get:

No volume groups found

On the other hand, if I manually type "pvscan", I see:
   PV /dev/sdb1   VG scratch   lvm2 [558.75 GB / 508.75 GB free]
   Total: 1 [558.75 GB] / in use: 1 [558.75 GB] / in no VG: 0 [0   ]

... and then when I type "vgchange -ay", I get:
   1 logical volume(s) in volume group "scratch" now active

I was under the impression that "vgchange -ay" should have picked up 
physical volumes as well?  Since I don't see a pvscan command in the 
system startup scripts (RedHat Enterprise 4), I wonder what I might be 
doing wrong.

Thanks for any help you can provide..

Jason.
