Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0H9GDpT001021
	for <linux-lvm@redhat.com>; Wed, 17 Jan 2007 04:16:13 -0500
Received: from smtp5-g19.free.fr (smtp5-g19.free.fr [212.27.42.35])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0H9GBJw009833
	for <linux-lvm@redhat.com>; Wed, 17 Jan 2007 04:16:12 -0500
Received: from imp1-g19.free.fr (imp1-g19.free.fr [212.27.42.1])
	by smtp5-g19.free.fr (Postfix) with ESMTP id 6AC5C27A20
	for <linux-lvm@redhat.com>; Wed, 17 Jan 2007 10:16:11 +0100 (CET)
Message-ID: <1169025371.45ade95b2ffe7@imp.free.fr>
Date: Wed, 17 Jan 2007 10:16:11 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How big must be the log partition on a mirrored VG ?
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

Hi !
I plan to improve security on my system by setting up mirror on my Fedora Core 6
install (Kernel 2.6.18-XXX) X86-64 platform.
Ive the main vg used for /, /usr/var, etccc for which I would like to use
mirorring. For now it uses only one PV residing on a 55 GB hda partition.
I will add a 55 GB partiton on hdb to hold the second copy of the mirror, and
another partiton on sda (SATA disk) to hold the logs.
Question : How big should be this partition ? Does it nedd to be 55GB ? Could it
be smaller ? Way smaller ?
Thanks a lot for yoor help !
Regards
--
