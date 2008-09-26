Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8QC59LZ017951
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 08:05:09 -0400
Received: from mail-gx0-f15.google.com (mail-gx0-f15.google.com
	[209.85.217.15])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8QC4elc024393
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 08:04:40 -0400
Received: by gxk8 with SMTP id 8so8127668gxk.3
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 05:04:40 -0700 (PDT)
Message-ID: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
Date: Fri, 26 Sep 2008 14:04:40 +0200
From: "geert Geurts" <begeert@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2824_6936036.1222430680343"
Subject: [linux-lvm] lvm over loop device
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

------=_Part_2824_6936036.1222430680343
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,
I'm trying to create a lvgroup of a few hundred pvolumes witch are virtual
disks (files of +- 1Mb ) over loopdevices.
what I did is the following:
dd if=/dev/urandom of=/disk0 bs=1024 count=1000 #create a file with random
data
losetup -f disk0 #link a loopdevice to the file
after this I'm able to for instance mkfs.ext3 /dev/loop0 and mount it but I
don't want a ext3 I want LVM partition. But fdisk is unable to create it
using fdisk /dev/loop0 fails...
So what I did first create a LVM partition of 1MB on a memorystick and then
change the if of dd to point to the LVM partition, I'm now able to pvcreate
/dev/loop0, vgcreate SmallDisk /dev/loop0.
But I'm unable to create a logical volume in the SmallDisk group...
what am I doing wrong here? is it even possible if not why?

Thanks,
Greetings Geert

ps. for people interested, I'm trying to create a disk of allot of small
virtual disks so I can create a encrypted partition on for instance gmailfs
and minimalize up/download time on changes.
Pretty cool if it's possible no?

------=_Part_2824_6936036.1222430680343
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hello,<br>I&#39;m trying to create a lvgroup of a few hundred pvolumes witch are virtual disks (files of +- 1Mb ) over loopdevices.<br>what I did is the following:<br>dd if=/dev/urandom of=/disk0 bs=1024 count=1000 #create a file with random data<br>
losetup -f disk0 #link a loopdevice to the file<br>after this I&#39;m able to for instance mkfs.ext3 /dev/loop0 and mount it but I don&#39;t want a ext3 I want LVM partition. But fdisk is unable to create it using fdisk /dev/loop0 fails...<br>
So what I did first create a LVM partition of 1MB on a memorystick and then change the if of dd to point to the LVM partition, I&#39;m now able to pvcreate /dev/loop0, vgcreate SmallDisk /dev/loop0.<br>But I&#39;m unable to create a logical volume in the SmallDisk group...<br>
what am I doing wrong here? is it even possible if not why?<br><br>Thanks,<br>Greetings Geert<br><br>ps. for people interested, I&#39;m trying to create a disk of allot of small virtual disks so I can create a encrypted partition on for instance gmailfs and minimalize up/download time on changes.<br>
Pretty cool if it&#39;s possible no?&nbsp; <br></div>

------=_Part_2824_6936036.1222430680343--
