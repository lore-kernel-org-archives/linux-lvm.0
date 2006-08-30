Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7U8Ggr6002305
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 04:16:42 -0400
Received: from nz-out-0102.google.com (nz-out-0102.google.com [64.233.162.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7U8GVt2025189
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 04:16:31 -0400
Received: by nz-out-0102.google.com with SMTP id n1so55287nzf
	for <linux-lvm@redhat.com>; Wed, 30 Aug 2006 01:16:30 -0700 (PDT)
Message-ID: <80d985600608300116q2453135fua378dbf1138daa2d@mail.gmail.com>
Date: Wed, 30 Aug 2006 17:16:30 +0900
From: "Craig Hagerman" <craighagerman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Safeguarding LMV data?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I am using LVM to make two SATA discs (200GB and 250GB respectively)
into one big logical volume. As well I have an ATA (80GB) disc which
has 3 partitions (Debian /, and /usr, and another partition with
Ubuntu installed)

If I understand things correctly, if one of those drives fails I will
lose all the data spread across both drives. Is this correct? When I
set this up (over a year ago) I guess I kind of assumed that if one
drive failed I could shrink the LV and still have access to the data
on the good drive.

I think I have read that the best way to safeguard my data would be to
set up the hard drives as RAID 5 (which would require an additional
drive - minimum 3, right). I didn't consider this when I first set up
the LVM.

I am wondering if there is anything I can do now to mitigate the
chance of one drive failing and losing all data? I have thought about
buying another drive (say a 400GB), moving the data on there, setting
up LVM with RAID 5 and then moving the data back .... except that the
new drive would be intended to be used in that RAID 5 configuration. I
don't think I have a good enough understanding of either RAID 5 or LVM
and would really appreciate some advice for what I can do.

Craig Hagerman
