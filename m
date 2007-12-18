Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIESjWc032156
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 09:28:45 -0500
Received: from serenity.mcc.ac.uk (serenity.mcc.ac.uk [130.88.200.93])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIESDpw010376
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 09:28:14 -0500
Received: from kelvin.its.manchester.ac.uk ([130.88.25.195])
	by serenity.mcc.ac.uk with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.63 (FreeBSD))
	(envelope-from <cs@networkingnewsletter.org.uk>) id 1J4dQb-000Ncv-4t
	for linux-lvm@redhat.com; Tue, 18 Dec 2007 14:28:13 +0000
Received: from veri.phy.umist.ac.uk ([130.88.15.180]:47856)
	by kelvin.its.manchester.ac.uk with esmtpa (Exim 4.43)
	id 1J4dQb-0007pM-0Y
	for linux-lvm@redhat.com; Tue, 18 Dec 2007 14:28:13 +0000
From: michael <cs@networkingnewsletter.org.uk>
Date: Tue, 18 Dec 2007 14:28:12 +0000
Message-Id: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] won't dual boot: 2 disks and LVM
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

I'm looking for a solution for (re-)installing WinXP on my slave disk
when I have Fedora and LVM on the master disk. In the past I've opened
up the box and unplugged the Fedora/LVM disk in order for WinXP to
install okay. But this seems much too drastic. Even swapping disk order
(in BIOS) doesn't help - WinXP installation sits there "forever" when
checking current config.

Whilst I cannot find any definite reference stating "MS WinXP cannot
handle LVM" it does seem to be the culprit. 

Anybody got any such definitive references or other help?

Thanks, Michael
