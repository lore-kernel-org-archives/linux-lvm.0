Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9U7FSd1030537
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 03:15:28 -0400
Received: from mu-out-0910.google.com (mu-out-0910.google.com [209.85.134.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9U7FH0c005573
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 03:15:18 -0400
Received: by mu-out-0910.google.com with SMTP id g7so395288muf.1
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 00:15:17 -0700 (PDT)
Message-ID: <91b13c310810300015j25be4feeqdab86d28ecfb0866@mail.gmail.com>
Date: Thu, 30 Oct 2008 15:15:17 +0800
From: "rae l" <crquan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] How to make lvm error handling robust?
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

How to make lvm error handling robust?

Steps:
1. create pv,vg,lv on multiple disks, one group (sda,sdb,sdc), other
groups (sdd, sde, ...);
2. unplug one disk (sda, one pv);

then all LVM broken, even other unrelated groups of lvm cannot work
from then on,

all lvm commands report error and stops executing.

How to solve this?

then it can only be resolved with rebooting?

-- 
Cheng Renquan, Shenzhen, China

Samuel Goldwyn  - "Give me a couple of years, and I'll make that
actress an overnight success."
