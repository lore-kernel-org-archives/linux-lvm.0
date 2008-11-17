Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAHNS5Zi007440
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 18:28:05 -0500
Received: from troy.its.carleton.edu (Troy.its.carleton.edu [137.22.94.86])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAHNRjaS010961
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 18:27:45 -0500
Received: from mail.carleton.edu (mail2.its.carleton.edu [137.22.194.92])
	by troy.its.carleton.edu (8.13.1/8.13.1) with ESMTP id mAHNRiMp010542
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 17:27:44 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.carleton.edu (Postfix) with ESMTP id B67BB57E2F42
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 17:27:44 -0600 (CST)
Received: from mail.carleton.edu ([127.0.0.1])
	by localhost (mail.carleton.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiaYl9MiNxBZ for <linux-lvm@redhat.com>;
	Mon, 17 Nov 2008 17:27:44 -0600 (CST)
Received: from mail.carleton.edu (mail.carleton.edu [137.22.194.90])
	by mail.carleton.edu (Postfix) with ESMTP id C1AA757E2F03
	for <linux-lvm@redhat.com>; Mon, 17 Nov 2008 17:27:43 -0600 (CST)
Date: Mon, 17 Nov 2008 17:27:43 -0600 (CST)
From: Rich Graves <rgraves@carleton.edu>
Sender: rgraves@carleton.edu
Message-ID: <2142931778.33051391226964463527.JavaMail.root@mail2.its.carleton.edu>
In-Reply-To: <1755237768.33050951226964401629.JavaMail.root@mail2.its.carleton.edu>
Subject: Re: [linux-lvm] steps to clone a volume group
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I've had that problem too. Two workarounds. Here's what I usually do:

 1a) Map the snapshot LUN to a *different* host than the production machine.
 1b) Change the UUID and VG/LV there.
 1c) *Then* map the LUN to the production machine.

Alternatively (untested):

 2a) service haldaemon stop; service multipathd stop; service lvm2-monitor stop (not sure which of these is really necessary)
 2b) Map the snapshot to the production server in the SAN.
 2c) Manually add with echo '- - -' > /sys/class/scsi_host/hostN/scan
 2d) Change UUID and VG/LV.
 2e) Manually remove with echo 1 > /sys/block/sdX/device/delete
 2f) service haldaemon start; service multipathd start; service lvm2-monitor start
-- 
Rich Graves http://claimid.com/rcgraves
Carleton.edu Sr UNIX and Security Admin
CMC135: 507-222-7079 Cell: 952-292-6529
