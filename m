Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j33KDhO26982
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 16:13:43 -0400
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j33KDbZd013033
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2005 16:13:37 -0400
Received: from pd5mr1so.prod.shaw.ca
	(pd5mr1so-qfe3.prod.shaw.ca [10.0.141.232]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0IEE00H5J06KGQTR@l-daemon> for linux-lvm@redhat.com; Sun,
	03 Apr 2005 14:13:33 -0600 (MDT)
Received: from pn2ml10so.prod.shaw.ca ([10.0.121.80])
	by pd5mr1so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IEE00DYP06KYTD0@pd5mr1so.prod.shaw.ca> for
	linux-lvm@redhat.com; Sun, 03 Apr 2005 14:13:32 -0600 (MDT)
Received: from [192.168.1.124]
	(S01060050ba84447c.vc.shawcable.net [24.86.200.241])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IEE00B0206KDP@l-daemon> for linux-lvm@redhat.com; Sun,
	03 Apr 2005 14:13:32 -0600 (MDT)
Date: Sun, 03 Apr 2005 12:13:39 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Subject: Re: [linux-lvm] LVM Error
In-reply-to: <20050403195141.GR14307@agk.surrey.redhat.com>
Message-id: <200504031313.39260.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <200504031040.05910.t-rigby@shaw.ca>
	<200504031238.16673.t-rigby@shaw.ca>
	<20050403195141.GR14307@agk.surrey.redhat.com>
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

This is from "vgcfgbackup -P -f file.txt"

fileserver:~# cat file.txt |grep "id ="
VG (4474)      id = "lIoGSW-jLzj-HDN6-1mdY-0yqV-bily-BU9xzF"
pv0 (hda2)     id = "hxeJjE-AgPR-letG-U0rH-FlDP-hOu9-o7UH7e"
pv1 (hdc)       id = "KMzdEO-aigL-KoHL-2ZED-SgWf-CsoW-7qEWQP"
pv2 (hdb)       id = "2MKTrn-jv8Y-hUPU-8W6m-Uur1-ItpE-Abq3w4"
pv3  (hdd)      id = "ISBKAD-7SQt-B9Bo-ppng-G5Q6-Iu3D-uABjz7"
LV  (storage) id = "SoVzKi-y750-swPF-xT8D-0ijX-GNAi-3FddlG"

and

fileserver:~# vgdisplay -v |grep "UUID"
  VG UUID               lIoGSW-jLzj-HDN6-1mdY-0yqV-bily-BU9xzF
  LV UUID                SoVzKi-y750-swPF-xT8D-0ijX-GNAi-3FddlG
  PV UUID               hxeJjE-AgPR-letG-U0rH-FlDP-hOu9-o7UH7e <-- hda2
  PV UUID               KMzdEO-aigL-KoHL-2ZED-SgWf-CsoW-7qEWQP <-- hdc
  PV UUID               2MKTrn-jv8Y-hUPU-8W6m-Uur1-ItpE-Abq3w4 <-- hdb
  PV UUID               ISBKAD-7SQt-B9Bo-ppng-G5Q6-Iu3D-uABjz7 <-- hdd

vgchange -a y 4474 -vvvv can be see@
http://ultimate.kicks-ass.net/files/lvm2.txt

I dont see any differences there.  Any other advice?

Terry Rigby
