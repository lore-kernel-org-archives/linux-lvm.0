Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k869EUM0013358
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 05:14:30 -0400
Received: from mtagate6.de.ibm.com (mtagate6.de.ibm.com [195.212.29.155])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k869EKV1007027
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 05:14:20 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.7/8.13.7) with ESMTP id k869EEmI144548
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 09:14:14 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id k869IdsM2576628
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 11:18:39 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id k869EEGc031017
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 11:14:14 +0200
Received: from dyn-9-152-216-91.boeblingen.de.ibm.com
	(dyn-9-152-216-91.boeblingen.de.ibm.com [9.152.216.91])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id k869EEeS031014
	for <linux-lvm@redhat.com>; Wed, 6 Sep 2006 11:14:14 +0200
From: Jens Wilke <jens.wilke@de.ibm.com>
Date: Wed, 6 Sep 2006 11:14:13 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200609061114.13521.jens.wilke@de.ibm.com>
Subject: [linux-lvm] pvmove: moving a mirror logical volume not supported?
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

Hello!

When trying to do a pvmove on a mirrored logical volume
I get the message "No data to move..."

pvmove /dev/dasdx1
  Skipping mirror LV m1m
  Skipping mirror LV m1m_mlog
  Skipping mirror image LV m1m_mimage_0
  Skipping mirror image LV m1m_mimage_1
  No data to move for main

Looking in the pvmove code reveals that mirror lvs are
intentionally skipped:

--snip--
		if (lv->status & MIRRORED) {
			log_print("Skipping mirror LV %s", lv->name);
			continue;
		}
		if (lv->status & MIRROR_LOG) {
			log_print("Skipping mirror log LV %s", lv->name);
			continue;
		}
		if (lv->status & MIRROR_IMAGE) {
			log_print("Skipping mirror image LV %s", lv->name);
			continue;
		}
--snip--

What is the reason for this?

Best,

Jens
