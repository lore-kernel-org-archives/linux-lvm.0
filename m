Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i656T5015237
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2004 02:29:05 -0400
Received: from kidushin.jct.ac.il ([147.161.1.19])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i656T2e2031732
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2004 02:29:03 -0400
Message-ID: <40E8F527.3020200@jct.ac.il>
Date: Mon, 05 Jul 2004 09:28:55 +0300
From: Yedidia Klein <yedidia@jct.ac.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] creation of snapshot fail somtimes w/ "Cannot allocate
	memory"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: avi@jct.ac.il, unixstaff@jct.ac.il

Hello,

I've a daily snapshot that cron umount, delete, recreate and mount every 
night.
sometimes (about once a week) I'm getting the following output:

  Logical volume "daily" successfully removed
  device-mapper ioctl cmd 9 failed: Cannot allocate memory
  Couldn't load device 'ext-daily'.
  Problem reactivating origin part1
mount: special device /dev/ext/daily does not exist


mean that the umount and delete worked but the recreation and therefor 
the mount failed...
how could this be debugged ? any idea what could be the problem ?

thanks,

--Yedidia
