Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBH9ijpY021755
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 04:44:45 -0500
Received: from mx1.lunarix.de (mx1.lunarix.de [85.131.251.86])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBH9iMMN000519
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2007 04:44:23 -0500
Received: from dslb-088-066-050-098.pools.arcor-ip.net ([88.66.50.98]
	helo=[192.168.1.24])
	by mx1.lunarix.de with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.68) (envelope-from <corinl@gmx.de>) id 1J4CWG-0001KH-J8
	for linux-lvm@redhat.com; Mon, 17 Dec 2007 10:44:16 +0100
Message-ID: <476644EF.4030103@gmx.de>
Date: Mon, 17 Dec 2007 10:44:15 +0100
From: Corin Langosch <corinl@gmx.de>
MIME-Version: 1.0
Subject: [linux-lvm] dynamic allocation
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi!

I'm using lvm2. Currently I have on big VG (100GB) and several LV for
VServers each 20GB. So my system is limited to having 5 Vservers.

Is it possible to tell lvm2 to start with only little allocation and
dynamically grow the LV? I know I can grow it using the command line
tools but I want it to happen fully automatically.

So in terms of comands something like:
lvcreate --size-max 20GB --size-grow 100MB --size-start 1GB vserver06 data

So the LV would intitially allocate only 1GB of the VG and allocate new
space in 100MB as it needs, stopping at a maximum size of 20GB. Of
course I would then have to make sure the VG has enough free blocks for
the LVs to grow, but that shouldn't be a problem.

I think this should technically be possible as software like VirtualBox
can grow it's image file the same way to. If lvm can't to that, could
that be done with some kind of loopback device? Which is the best way
(also in terms of performance) to handle such a setup?

Best regards,
Corin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
