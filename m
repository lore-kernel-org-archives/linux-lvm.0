Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6178ku05676
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2005 03:08:46 -0400
Received: from baghus1.baghus.net (mail@ns.baghus.net [62.245.167.30])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6178jlM004043
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2005 03:08:46 -0400
Received: from [192.168.1.254] (helo=bagex01.BAGHUS-LAN.NET)
	by baghus1.baghus.net with esmtp (Exim 3.35 #1 (Debian))
	id 1DoFdc-0007Tn-00
	for <linux-lvm@redhat.com>; Fri, 01 Jul 2005 09:08:36 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvremove -- ERROR:
Date: Fri, 1 Jul 2005 09:04:15 +0200
Message-ID: <6A58CFF91886D54BBDA1FE988C4DF79D0250E0@bagex01.baghus-lan.net>
From: "Sven Riedel" <sr@baghus.net>
Content-Transfer-Encoding: 8bit
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

> pvscan -- inactive PV "/dev/cciss/c0d1" is in no VG 
> lvremove -f /dev/cciss/c0d1

PV != LV. Use lvscan (better: use lvdisplay) to see
what LVs you have. What you're trying to do above is
akin to saying to your CD player: Eject track 7.


Regs,
Sven
