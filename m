Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DGWX4m031844
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 12:32:33 -0400
Received: from echeyde.banot.net (67-207-140-183.slicehost.net
	[67.207.140.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6DGWGcw018527
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 12:32:16 -0400
Received: from gofio.localnet (166.Red-88-5-143.dynamicIP.rima-tde.net
	[88.5.143.166])
	by echeyde.banot.net (Postfix) with ESMTPSA id 34642D8947
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 16:32:16 +0000 (UTC)
From: Imobach =?iso-8859-1?q?Gonz=E1lez_Sosa?= <imobachgs@banot.net>
Date: Mon, 13 Jul 2009 17:32:20 +0100
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200907131732.20178.imobachgs@banot.net>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM mirroring or mdadm
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi all,

I've got a pair of identical Seagate disks on a server and I'm considering 
using a software RAID (RAID1). I was thinking of setting up LVM on a mdadm 
RAID, but I've read that LVM has support itself for mirroring.

So, what is the better approach? Using LVM mirroring capabilities or putting 
the LVM on a mdadm RAID 1?

Thank you in advance!

-- 
Imobach Gonz�lez Sosa
Banot.net
Web: http://www.banot.net/
Correo-e: info@banot.net
Tel�fono: +34 928459949
