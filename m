Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3S4Fmpg015006
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 00:15:48 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3S4FcGM021411
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 00:15:38 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m3S4FWk3030000
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 00:15:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m3S4FWKt028202
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 00:15:32 -0400
Date: Mon, 28 Apr 2008 00:15:32 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0804280013170.28191-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Expanding VM filesystem
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a mail system running as a VM with LVs mounted as SCSI disks.  Is 
it safe to lvexpand the LV, then run resize2fs inside the VM?  Or is it
necessary to shutdown the VM first?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
