Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j64JbIV01153
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2005 15:37:18 -0400
Received: from ms-dienst.rz.rwth-aachen.de (ms-2.rz.RWTH-Aachen.DE
	[134.130.3.131])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j64JbDNE023509
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2005 15:37:14 -0400
Received: from r220-1 (r220-1.rz.RWTH-Aachen.DE [134.130.3.31])
	by ms-dienst.rz.rwth-aachen.de
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IJ400MP3BTWE3@ms-dienst.rz.rwth-aachen.de> for
	linux-lvm@redhat.com; Mon, 04 Jul 2005 21:37:09 +0200 (MEST)
Received: from hak-nam.dyndns.org
	(pc-68-055.ram.RWTH-Aachen.DE [137.226.68.55])	by relay.rwth-aachen.de
	(8.13.3/8.13.3/1) with ESMTP id j64Jb8XO010857	for
	<linux-lvm@redhat.com>; Mon, 04 Jul 2005 21:37:08 +0200 (MEST)
Date: Mon, 04 Jul 2005 21:37:07 +0200
From: Dirk Meul <dirk.meul@rwth-aachen.de>
Message-id: <1120505828.9114.5.camel@hak-nam.dyndns.org>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] LBA sector to VG sector?
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

Hello list,

is there an easy way to calculate the logical sector within a VG from a
given LBA sector?

Best regards
Dirk
