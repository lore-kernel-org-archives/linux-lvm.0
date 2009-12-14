Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBEDjcVG008543
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 08:45:38 -0500
Received: from er-systems.de (er-systems.de [85.25.136.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBEDjM0o010128
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 08:45:23 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
	by er-systems.de (Postfix) with ESMTP id 3B645174059
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 14:45:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by er-systems.de (Postfix) with ESMTP id 16D6D17401F
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 14:45:21 +0100 (CET)
Date: Mon, 14 Dec 2009 14:45:21 +0100 (CET)
From: Thomas Voegtle <tv@lio96.de>
Sender: thomas@er-systems.de
Message-ID: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate does not respect units?
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com



Hi,


I ran in a problem while creating a lv with units in powers of 1000.

I looked up the free space with vgdisplay:

root@(none):~# vgdisplay --units G | grep Size
vgdisplay  VG Size               25.70 GB
vgdisplay  PE Size               0.00 GB
vgdisplay  Alloc PE / Size       0 / 0 GB
vgdisplay  Free  PE / Size       6127 / 25.70 GB


And then I tried to create the lv a little bit smaller, like this:

root@(none):~# lvcreate -L 25.50G datavolume -n datavolume
lvcreate  Insufficient free extents (6127) in volume group datavolume: 
6528 required


You even get the same message using a small g:


root@(none):~# lvcreate -L 25.50g datavolume -n datavolume
lvcreate  Insufficient free extents (6127) in volume group datavolume: 
6528 required


So it seems lvcreate does not respect the unit in power of 1000?

I used 2.02.56.
