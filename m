Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2TMfsOn012678
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 17:41:54 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2TMfiqG002457
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 17:41:45 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1FOjLx-0003ng-6v
	for linux-lvm@redhat.com; Thu, 30 Mar 2006 00:41:28 +0200
Received: from awork104102.netvigator.com ([203.198.16.102])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 00:41:25 +0200
Received: from thomas by awork104102.netvigator.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 00:41:25 +0200
From: Thomas <thomas@meiwing.com>
Date: Thu, 30 Mar 2006 06:40:57 +0800
Message-ID: <e0f2dq$eck$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Data recover on error deleted PV/VG
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

Hi all,

My story is:

1 x 20G (hda) + 1 x 40G (hdb) running more than half year.
The two hard disk formed with a LVM2, (100M swap) on hda1 and 19.9G 
(hda2) + 40G (hdb1).
All LVM mounted as / (root). Yesterday, I add a 40G (hdd).
Used fdisk with 8e type to format the new 40g (hdd)
Used lvm extend command to add +20G /dev/VolGroup00/VolLog00 and +10G
/dev/VolGroup00/VolLog01
After that, I wanted to remove the VolLog01 but failed and said it is using.
Then I tried to use fdisk again to format the 40g (hdd).
After reboot the server, kernel panic even un-plug 40g (hdd).

Should I just try to re-create hda2+hdb1's LV with command "lvcreate -n
VolLog00 -l <max size> VolGroup00" ?

I can provide more information if needed.

Thanks in advance.

Lion
