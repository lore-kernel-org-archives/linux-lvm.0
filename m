Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E3BDr20988
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 23:11:13 -0400
Received: from ms.usish.com (ms.usish.com [61.152.132.204])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9E3B4P1028105
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 23:11:11 -0400
Received: from usish000045 (usish000045.usish.com.cn [192.168.56.150])
	by ms.usish.com (8.12.8/8.12.8) with SMTP id i9E3AvEW004959
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 11:10:57 +0800
Message-Id: <200410140310.i9E3AvEW004959@ms.usish.com>
From: "=?GB2312?Q?=B2=CC=E4=DE?=" <yearn_cai@usish.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 14 Oct 2004 11:10:19 +0800
Subject: [linux-lvm] pvcreate is successful but can't vgcreate
Reply-To: yearn_cai@usish.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

i want to use LVM to manage my SATA disks attached on arm system and:

pvcreate /dev/sda
Physical volume "/dev/sda" successfully created

vgcreate group1 /dev/sda
No physical volume label read from /dev/sda
/dev/sda not identified as an existing physical volume
Unable to add physical volume '/dev/sda' to volume group 'group1'.

what's wrong and why?
