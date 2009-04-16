Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GAHjvi026478
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 06:17:45 -0400
Received: from n12-vm0.bullet.mail.in.yahoo.com
	(n12-vm0.bullet.mail.in.yahoo.com [202.86.4.246])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n3GAHSqJ022530
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 06:17:29 -0400
Message-ID: <29070.706.qm@web94806.mail.in2.yahoo.com>
Date: Thu, 16 Apr 2009 15:47:07 +0530 (IST)
From: yogeen honnavar <yogeen@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Simulating LVM Mirror Failure and recovery
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


Dear users,

We have created a mirrored logical volume(lv1) in a volume group vg1. we have 2 disks /dev/sda and /dev/sdb. output of lvs command shows that mirror image_0 is stored on /dev/sda3 and image_1 on /dev/sdb3 and mirror log on /dev/sdb2. Copy % shows 100%. so mirroring is setup correctly.

now we wish to simulate mirror leg failure and recovery. as per the redhat lvm administrators guide we used the following command to trigger the failure of mirror leg1

dd if=/dev/zero of=/dev/vg1/lv1 count=10

as per the redhat guide this should result in mirror leg failure and any subsequent write activity to the mirror should convert the mirror into linear volume. but the output of lvs command still shows copy % as 100%. also data in filesystem of lv1 is erased and it is converted into read only filesystem.

can anyone please let us know the correct way to simulate lvm mirror failure and recovery.

thanks and regards
-yogeen


      Add more friends to your messenger and enjoy! Go to http://messenger.yahoo.com/invite/
