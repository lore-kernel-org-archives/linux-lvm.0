Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6B61057060
	for <linux-lvm@redhat.com>; Mon,  8 Oct 2018 10:23:34 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA86530820E6
	for <linux-lvm@redhat.com>; Mon,  8 Oct 2018 10:23:33 +0000 (UTC)
Message-Id: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
Date: Mon, 08 Oct 2018 04:23:27 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Fails to create LVM volume on the top of RAID1 after
 upgrade lvm2 to v2.02.180
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello List

The system uses lvm based on raid1. 
It seems that the PV of the raid1 is found also on the single disks that build the raid1 device:
[  147.121725] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sda2 was already found on /dev/md1.
[  147.123427] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV on /dev/sdb2 was already found on /dev/md1.
[  147.369863] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device size is correct.
[  147.370597] linux-472a dracut-initqueue[391]: WARNING: PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/md1 because device size is correct.
[  147.371698] linux-472a dracut-initqueue[391]: Cannot activate LVs in VG vghome while PVs appear on duplicate devices.

This is a regression bug? since the user did not encounter this problem with lvm2 v2.02.177.


Thanks
Gang
