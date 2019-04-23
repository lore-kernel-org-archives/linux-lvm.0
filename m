Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA84E5C269
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 05:16:01 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A40130833A1
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 05:16:00 +0000 (UTC)
Message-Id: <5CBE9F89020000F900061398@prv1-mh.provo.novell.com>
Date: Mon, 22 Apr 2019 23:15:53 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvscan: /dev/sdc: open failed: No medium found
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

Hello List,

One user complained this error message.
The user has a usb sd card reader with no media present.  When they issue a pvscan under lvm2-2.02.180 the device is opened which results in 'No medium found' being reported. 
But lvm2-2.02.120 did not do this (the device appears to get filtered out earlier). The customer views the 'No medium found' message as an issue/bug.
Any suggest/comments for this error message?

The detailed information is as below,
lvm2 2.02.180-9.4.2
OS: SLES12 SP4
Kernel 4.12.14-95.3-default
Hardware: HP ProLiant DL380 Gen10

After upgrade from sles12SP3 to SP4, customer is reporting the following error message:

 # pvscan
 /dev/sdc: open failed: No medium found
 PV /dev/sdb   VG Q11vg10         lvm2 [5.24 TiB / 2.00 TiB free]
 Total: 1 [5.24 TiB] / in use: 1 [5.24 TiB] / in no VG: 0 [0   ]


Thanks
Gang
