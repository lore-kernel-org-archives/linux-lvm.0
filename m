Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j71DWeV06292
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 09:32:40 -0400
Received: from itspmx1.state.ms.us (e3000a.state.ms.us [205.144.224.140])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j71DWYEL025062
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 09:32:35 -0400
Received: from tcmail.mstc.state.ms.us (tcmail.mstc.state.ms.us [10.3.60.220])
	by itspmx1.state.ms.us (8.12.11/8.12.11) with ESMTP id j71DWXSi020481
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 08:32:33 -0500 (CDT)
	(envelope-from rray@mstc.state.ms.us)
Received: from rray.drdc.mstc.ms.gov (localhost.localdomain [127.0.0.1])
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1) with ESMTP id j71DTt8R028022
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 08:29:55 -0500
Received: from localhost (rray@localhost)
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1/Submit) with ESMTP id
	j71DTtVl028019
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 08:29:55 -0500
Date: Mon, 1 Aug 2005 08:29:55 -0500 (CDT)
From: Richard Ray <rray@mstc.state.ms.us>
Message-ID: <Pine.LNX.4.62.0508010816320.27345@rray.drdc.mstc.ms.gov>
MIME-Version: 1.0
Subject: [linux-lvm] vgexport/vgimport fails
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've run Fedora 2 for some time.
I have /dev/mapper/vg00-lvol0 460G  448G   12G  98% /src.
I installed Fedora 4 on a different partition.
In Fedora 2 I run
umount /src
vgchange -a n vg00
vgexport vg00
all run ok.
I reboot to Fedora 4.
I run
[~]$ pvscan -v
     Wiping cache of LVM-capable devices
     Wiping internal VG cache
     Walking through all physical volumes
   No matching physical volumes found

In /var/log/messages I see where the drives in the volume group are found.

Any suggestion?

Richard
