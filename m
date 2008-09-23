Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8N9lp9E025137
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 05:47:52 -0400
Received: from smtp2.versatel.nl (smtp2.versatel.nl [62.58.50.89])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8N9ldKu023823
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 05:47:39 -0400
Received: from [192.168.1.18] (unknown [80.101.105.201])
	by mail.vermeer.tv (Postfix) with ESMTPSA id AAA4126F1BB
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 11:46:30 +0200 (CEST)
From: Koen Vermeer <koen@vermeer.tv>
Date: Tue, 23 Sep 2008 11:47:36 +0200
Message-Id: <1222163256.9690.17.camel@koenws.oogziekenhuis.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Remove PV from VG
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I have a VG with two PVs. I'd like to remove one PV from the VG, but
some of the data of the LVs in the VG is written on this PV. There is
sufficient space on the other PV to contain everything in the VG. I
tried to simply run 'vgreduce VG PV', but it tells me that the PV is
still in use.

How can I tell LVM to free a specific PV within a VG? Alternatively, I
could move all LVs in the VG to the other PV, but again, I don't know
how.

Best,
Koen
