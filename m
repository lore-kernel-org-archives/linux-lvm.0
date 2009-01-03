Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n03CiHhl030325
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 07:44:17 -0500
Received: from mo-p00-ob.rzone.de (mo-p00-ob.rzone.de [81.169.146.160])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n03ChsJ5020793
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 07:43:55 -0500
Received: from [192.168.255.25] (p5791639D.dip.t-dialin.net [87.145.99.157])
	by post.strato.de (klopstock mo56) (RZmta 18.7)
	with ESMTP id 502ed8l03CZe58 for <linux-lvm@redhat.com>;
	Sat, 3 Jan 2009 13:43:53 +0100 (MET)
From: me <lvm@soulsweeper.org>
Date: Sat, 03 Jan 2009 13:43:50 +0100
Message-Id: <1230986630.9671.40.camel@fraws70-gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Please help, [Incorrect metadata area header checksum]
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

i've got a (hopefully not) serious problem with my lvm installation.

I did some changes in my XEN-networking and wanted to reboot my server.
For this I did shutdown every DOM-U and tried to stop lvm with 'vgchange
-a n'. At this point lvm states 'Incorrect metadata area header
checksum', before this every worked fine. I tried to start lvm
immediately without success, a reboot didn't help either.
I searched the net (almost two days now) for a solution, without
success.

1) It's not a filter-issue (lvm.conf), only loop-devices are scanned.
2) vgcfgrestore doesn't work either (tried only testrun)
3) pvcreate --uuid xxx --restorefile /etc/lvm/archive/xxx_00039.vg xxx
says, the uuid is already in use on /dev/loopX (correct device). I
didn't try the '--force'-option, I'm a coward at last :(

The last change (and reboot) was in november. I added two new drives and
growed the raid, rebooted the server and growed one lv. All without any
error. There's only one PV.

If you need any information (configs etc), I'll post everything ;)


--- snip ---

$>pvscan
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  WARNING: Volume Group alice is not consistent
  PV /dev/loop53   VG alice   lvm2 [6.37 TB / 408.57 GB free]
  Total: 1 [376.57 GB] / in use: 1 [376.57 GB] / in no VG: 0 [0   ]


Any help is appreciated!

greets
ralf
