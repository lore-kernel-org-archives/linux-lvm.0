Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1PLlMgF012232
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 16:47:22 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.230])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1PLkojm004114
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 16:46:51 -0500
Received: by wr-out-0506.google.com with SMTP id 70so2918450wra.7
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 13:46:47 -0800 (PST)
Message-ID: <47C33742.3000409@easystreet.net>
Date: Mon, 25 Feb 2008 13:46:42 -0800
From: Don Buchholz <buchholz@easystreet.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] add mirror to already existing LV?
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


  I have Fedora 8 system with operating system installed on a small
(18GB) hard disk.  A second disk (320GB) is being added to hold
user data.  Now that there is a second disk, I would like to alter
the existing LVs so they have mirrors.  Is this possible?
  I couldn't find anything that looked promising on the lvchange(8)
man page.

- Don


=========================================================
Some of the gory details:
-------------------------
# lvmdiskscan
  /dev/sda1 [      196.08 MB]
  /dev/sda2 [       16.75 GB] LVM physical volume
  /dev/sdb1 [      196.08 MB]
  /dev/sdb2 [      297.90 GB] LVM physical volume
  0 disks
  2 partitions
  0 LVM physical volume whole disks
  2 LVM physical volumes

# pvscan
  PV /dev/sda2   VG vg00   lvm2 [16.75 GB / 32.00 MB free]
  PV /dev/sdb2   VG vg00   lvm2 [297.88 GB / 297.88 GB free]
  Total: 2 [314.62 GB] / in use: 2 [314.62 GB] / in no VG: 0 [0   ]

# vgs
  VG   #PV #LV #SN Attr   VSize   VFree 
  vg00   2   5   0 wz--n- 314.62G 297.91G

# lvscan
  ACTIVE            '/dev/vg00/lv00_root' [8.00 GB] inherit
  ACTIVE            '/dev/vg00/lv04_home' [4.22 GB] inherit
  ACTIVE            '/dev/vg00/lv02_var' [1.50 GB] inherit
  ACTIVE            '/dev/vg00/lv03_varlog' [2.00 GB] inherit
  ACTIVE            '/dev/vg00/lv01_swap' [1.00 GB] inherit




-- 
- Don Buchholz, Sr. Systems Admin.             <buchholz@imoveinc.com>
- iMove, Inc., 1732 NW Quimby St., Suite #200, Portland, Oregon  97209
- 503.273.2926 (phone)                              503.221.2172 (fax)
