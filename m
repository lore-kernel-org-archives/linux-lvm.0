Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4TAdT2Y003127
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 06:39:29 -0400
Received: from violent.skystorm.net (lan-84-240-51-34.vln.skynet.lt
	[84.240.51.34])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4TAdEIj022064
	for <linux-lvm@redhat.com>; Fri, 29 May 2009 06:39:15 -0400
Received: from [127.0.0.1] (helo=violent.skystorm.net ident=www-data)
	by violent.skystorm.net with esmtp (Exim 4.63)
	(envelope-from <lvm@violent.skystorm.net>) id 1M9zUX-0001Nw-DE
	for linux-lvm@redhat.com; Fri, 29 May 2009 13:39:13 +0300
Message-ID: <58285.212.59.11.18.1243593553.squirrel@violent.skystorm.net>
Date: Fri, 29 May 2009 13:39:13 +0300 (EEST)
From: "Da Ma" <lvm@violent.skystorm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM problem after RAID resync
Reply-To: lvm@violent.skystorm.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

After problems with linux software raid have been fixed, I am unable to
start using LVM again - no device nodes are created for logical volumes
and virtual groups.

My system is debian etch

Please help - I am attaching vgdisplay and lvdisplay outputs
