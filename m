Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k738IBql020805
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 04:18:11 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.181])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k738I39P032339
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 04:18:03 -0400
Received: by py-out-1112.google.com with SMTP id o67so3393098pye
	for <linux-lvm@redhat.com>; Thu, 03 Aug 2006 01:18:00 -0700 (PDT)
Message-ID: <ebf0fc470608030118t1ee7f981r4bde007656cd0ac8@mail.gmail.com>
Date: Thu, 3 Aug 2006 17:18:00 +0900
From: "Stanislaw Senotrusov" <senotrusov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] pvresize, resize 8e Linux LVM partition
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

pvresize, resize 8e Linux LVM partition

Hello.

Trying to figure out how to resize LVM partition.

I cloned hard drive using Acronis True Image and now have some space
after LVM partition.

As I see, before run pvresize I need to resize partition itself. Which
tool can help me to do it? man pvresize refers to fdisk, but I can't
understand how to use it for resize.

Simply running pvresize does nothing.

Actually I am trying to build some pipeline to quick make a test and
production box from development one. I can make it manually by
creating new pv and dump/restore, but its a 3 page of commands. And I
still cant figure out that is the right tool for ext3 dump/restore.

Another way is create new pv in free space and add it to volume group
- but after that this box will be a little different from the original
one, thus I need additional tracking of its configuration.

Thank you.

--
Stas Senotrusov
