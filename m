Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBREQVB0009650
	for <linux-lvm@redhat.com>; Thu, 27 Dec 2007 09:26:31 -0500
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBREQBis013281
	for <linux-lvm@redhat.com>; Thu, 27 Dec 2007 09:26:11 -0500
Received: by py-out-1112.google.com with SMTP id p76so5657559pyb.6
	for <linux-lvm@redhat.com>; Thu, 27 Dec 2007 06:26:10 -0800 (PST)
Message-ID: <a9b19e850712270618p16d62ae9w7200be49ebe74386@mail.gmail.com>
Date: Thu, 27 Dec 2007 15:18:53 +0100
From: Hiamal <hiamall@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Crashed disk with LVM
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

Hi,

I have tow disks(hda and hdb) where tow partitions(hda2 and hdb1) a
part of one LVM group VG01.
Now disk hdb has crashed and I'am trying to save the data on hdb1 to
another disk.
I tried with knoppix dumping(dd) hda2(works) and hdb1(don't work) and
I also tried activating the lvm group and dd the lvm volume but when
dd comes to hdb1 the disk just hacks and sounds noisy :-P

What should I do?


/h
