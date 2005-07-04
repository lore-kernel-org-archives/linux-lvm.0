Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j64GpKV28853
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2005 12:51:20 -0400
Received: from postfix2-c.free.fr (postfix2-c.free.fr [213.228.0.80])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j64GpAbQ030246
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2005 12:51:11 -0400
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by postfix2-c.free.fr (Postfix) with ESMTP id 36991EB6D56
	for <linux-lvm@redhat.com>; Mon,  4 Jul 2005 18:13:41 +0200 (CEST)
Received: from lns-vlq-18f-81-56-213-72.adsl.proxad.net (unknown
	[81.56.213.72])
	by postfix4-2.free.fr (Postfix) with ESMTP id 0960C3215A2
	for <linux-lvm@redhat.com>; Mon,  4 Jul 2005 18:13:33 +0200 (CEST)
From: Marc Cousin <cousinmarc@free.fr>
Date: Mon, 4 Jul 2005 18:15:00 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507041815.00643.cousinmarc@free.fr>
Subject: [linux-lvm] Issues with md RAID-1, LVM2 and snapshots
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

I'm reposting the following email as I answered a 3 month old one (maybe a bad 
idea).

The problem is that I cannot snapshot when using software raid1, with lvm2. I 
only tested it in a Xen Domain0, but I can try to reproduce it without Xen, 
should anyone tell me my problem is not allready known

Setup :
Raid1(md)+LVM2 (2.6.11, Xen Domain0), 
can't snapshot correctly.

In dmesg, I've got :
attempt to access beyond end of device
dm-30: rw=0, want=1905355624, limit=1228800
attempt to access beyond end of device
dm-30: rw=0, want=1905357216, limit=1228800
attempt to access beyond end of device
dm-30: rw=0, want=8390664, limit=1228800

As soon as I remove the Raid1, the problem disappears.

Is it a known problem ? Is there a workaround ?
