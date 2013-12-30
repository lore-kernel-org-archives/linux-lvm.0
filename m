Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rBUD4GP3021050
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 08:04:16 -0500
Received: from homiemail-a59.g.dreamhost.com (caibbdcaaaaf.dreamhost.com
	[208.113.200.5])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBUD4FFJ022518
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 08:04:15 -0500
Received: from homiemail-a59.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a59.g.dreamhost.com (Postfix) with ESMTP id 237A056406C
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 05:04:15 -0800 (PST)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a59.g.dreamhost.com (Postfix) with ESMTPSA id 03766564061
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 05:04:14 -0800 (PST)
Message-ID: <52C16F30.9090501@libertytrek.org>
Date: Mon, 30 Dec 2013 08:03:44 -0500
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question re: deleting an LV...
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM List <linux-lvm@redhat.com>

Hello,

Due to a misunderstanding about how LVM snapshots work when I set up 
this system, I now need to delete an LV I had created to use for this 
purpose (I thought I had to pre-create the LV).

Currently I have:

  # lvscan
   ACTIVE            '/dev/vg/tmp' [5.00 GiB] inherit
   ACTIVE            '/dev/vg/log' [5.00 GiB] inherit
   ACTIVE            '/dev/vg/vtmp' [5.00 GiB] inherit
   ACTIVE            '/dev/vg/var' [700.00 GiB] inherit
   ACTIVE            '/dev/vg/snaps' [4.00 GiB] inherit

I just need to delete the /dev/vg/snaps LV, so that that 4GB is 
available for my LVM snapshots.

Am I correct that all I have to do is:

# umount /dev/vg/snaps
# lvremove /dev/vg/snaps

Then remove this line from fstab?

This would then result in my VG having 4GB available for taking LVM 
snapshots?

Thanks
