Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0VHGG1x029507
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2012 12:16:16 -0500
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0VHGFUV022578
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2012 12:16:15 -0500
Received: by werb13 with SMTP id b13so308096wer.33
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2012 09:16:14 -0800 (PST)
From: Mario Deng <mariodeng@googlemail.com>
Date: Tue, 31 Jan 2012 18:16:17 +0100
Message-Id: <4f2821de.e866b40a.42ac.0886@mx.google.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Moving RHEL 6 to new HDD, EFI and LVM2 questions
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
To: linux-lvm@redhat.com

Hello everyone,
 
one year ago I installed RHEL6 on one HDD. This was my first RHEL installation, so I did not spent so much time on partitioning and so on. The partition table looks like this:
 
sda1: /boot/efi; 200MB
sda2: /boot; 200MB
tmpfs: /dev/shm: 50GB
LVM2:
/dev/mapper/lv_root: 50GB
/dev/mapper/lv_home 50GB
 
Now I want to change the HDD.
I have done that some times using "dd" or "cp -ax" and fitting the partitions and so on.
 
- But how to deal with /boot/efi? can I just dd or cp it?
- And what about the LVM? dd the partitions themselfs or the whole LVM?
 
With best,
 
Mario
__
md
mariodeng@googlemail.com
