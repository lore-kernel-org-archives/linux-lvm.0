Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8GJRQj8019641
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:27:26 -0400
Received: from smtp6.versatel.nl (smtp6.versatel.nl [62.58.50.97])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8GJR8mf030356
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 15:27:09 -0400
Received: from [192.168.1.102] (unknown [192.168.1.102])
	by mail.vermeer.tv (Postfix) with ESMTPA id C9BEA26F1BB
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2008 21:19:50 +0200 (CEST)
From: Koen Vermeer <koen@vermeer.tv>
Date: Tue, 16 Sep 2008 21:20:27 +0200
Message-Id: <1221592827.6037.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mirrored LV
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

Hi,

I was thinking of using a mirrored LV as a easier to use alternative to
a RAID1 PV (with matching VG and LV). I tried to find the information I
need on how this works and how to set it up, but so far, I failed.

First, am I right in trying to use LVM in this way? I have two disks,
and I just want to mirror some LVs.

Second, I am confused by the apparent need to have this log stored on
another device. Actually, this doesn't seem true in two ways: There's
the option of having the log in memory and then the documentation only
says that the log is 'usually on a separate device'. Does that mean that
using a mirrored LV makes no sense on a system with two disks? Or should
I just keep the log in memory in this case? Or can I use another PV on
one of the disks? Should this be mirrored as well? What happens if I
loose that data?

From what I found when searching for answers, it seems that I'm not the
only one that's confused... But maybe my searching skills are just
lacking. Anyway, I appreciate any help and insights!

Best,
Koen
