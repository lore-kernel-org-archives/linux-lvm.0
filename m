Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2BKUWHo014268
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 16:30:32 -0400
Received: from AMSGEG02.apollogrp.edu (mgw02.apollogrp.edu [204.17.31.133])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2BKTPfQ028190
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 16:29:54 -0400
Date: Wed, 11 Mar 2009 13:28:34 -0700
From: Zach Buckholz <zach.buckholz@apollogrp.edu>
Message-ID: <C5DD6D02.2F006%zach.buckholz@apollogrp.edu>
Mime-version: 1.0
Content-type: multipart/alternative;
	boundary="B_3319622914_1148203"
Subject: [linux-lvm] LVM - Hitachi USP tier 2 to tier 1 migration then
 "couldn't find device with uuid"
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
To: linux-lvm@redhat.com

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3319622914_1148203
Content-type: text/plain;
	charset="Big5"
Content-transfer-encoding: quoted-printable


I am looking for feedback regarding an issue with LVM, Hitachi USP storage
virtualization and SAN migration from tier 2 to tier 1.

We had a customer complaining about disk IO latency so the SAN team used
some Hitachi USP magic to migrate the servers existing SAN disks from tier=
 2
to tier 1. Three nights later I rebooted the server during a maintenance
window and the server hung with a console message
=A1=A7Couldn=A1=A6t find all physical volumes for volume group vg2
Volume group =A1=A7vg2=A1=A8 not found=A1=A8

I commented out the necessary lines in fstab so I could get the server back
on the network and ssh into it.

Once in it appeared as if 4 disks were missing.

Metadata does not appear to be corrupt. It just isn=A1=A6t there.

Fdisk =A1Vl shows 4 disks as not having any partition information.
=A1=A7 doesn't contain a valid partition table =A1=A7

Did something happen during the tier 2 to tier 1 migration several nights
earlier, and I caused it to surface with the reboot? Or do you think
something else caused this.

Has anyone experienced storage migration using an Hitachi USP with LVM? Are
there any known gotcha=A1=A6s?

Thanks
Zach


[root@server001 ~]# pvscan
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  Couldn't find device with uuid 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.
  Couldn't find device with uuid 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.
  Couldn't find device with uuid 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.
  Couldn't find device with uuid 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.
  PV unknown device      VG vg2   lvm2 [58.25 GB / 0    free]
  PV unknown device      VG vg2   lvm2 [58.25 GB / 0    free]
  PV unknown device      VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-30          VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-37          VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-33          VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-35          VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-40          VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-38          VG vg2   lvm2 [58.25 GB / 0    free]
  PV unknown device      VG vg2   lvm2 [58.25 GB / 0    free]
  PV /dev/dm-41          VG vg3   lvm2 [992.00 MB / 0    free]
  PV /dev/dm-29          VG vg3   lvm2 [992.00 MB / 0    free]
  PV /dev/dm-23          VG vg3   lvm2 [992.00 MB / 0    free]
  PV /dev/dm-22          VG vg3   lvm2 [992.00 MB / 0    free]
  PV /dev/dm-26          VG vg3   lvm2 [992.00 MB / 0    free]
  PV /dev/dm-21          VG vg3   lvm2 [992.00 MB / 0    free]
  PV /dev/cciss/c0d0p2   VG vg1   lvm2 [68.22 GB / 35.31 GB free]
  Total: 17 [656.53 GB] / in use: 17 [656.53 GB] / in no VG: 0 [0   ]
=20
--=20
Zachary Buckholz, Senior Unix Systems Administrator
University of Phoenix  |  IT Operations
4025 S. Riverpoint Parkway =A2x  Phoenix, Arizona 85040
phone: 602.557.6809  |  cell: 602.377.8023  | email:
zach.buckholz@apollogrp.edu

P Please consider the environment before printing this email.
=20




This message is private and confidential. If you have received it in error,=
 please notify the sender and remove it from your system.
--B_3319622914_1148203
Content-type: text/html;
	charset="Big5"
Content-transfer-encoding: quoted-printable

<HTML>
<HEAD>
<TITLE>LVM - Hitachi USP tier 2 to tier 1 migration then &quot;couldn't=
 find device with uuid&quot;</TITLE>
</HEAD>
<BODY>
<FONT FACE=3D"Calibri, Verdana, Helvetica, Arial"><SPAN STYLE=
=3D'font-size:11pt'>I am looking for feedback regarding an issue with LVM,=
 Hitachi USP storage virtualization and SAN migration from tier 2 to tier=
 1.<BR>
<BR>
We had a customer complaining about disk IO latency so the SAN team used=
 some Hitachi USP magic to migrate the servers existing SAN disks from tier=
 2 to tier 1. Three nights later I rebooted the server during a maintenance=
 window and the server hung with a console message<BR>
&#8220;Couldn&#8217;t find all physical volumes for volume group vg2<BR>
Volume group &#8220;vg2&#8221; not found&#8221;<BR>
<BR>
I commented out the necessary lines in fstab so I could get the server back=
 on the network and ssh into it.<BR>
<BR>
Once in it appeared as if 4 disks were missing.<BR>
<BR>
Metadata does not appear to be corrupt. It just isn&#8217;t there.<BR>
<BR>
Fdisk &#8211;l shows 4 disks as not having any partition information.<BR>
&#8220; doesn't contain a valid partition table &#8220;<BR>
<BR>
Did something happen during the tier 2 to tier 1 migration several nights=
 earlier, and I caused it to surface with the reboot? Or do you think=
 something else caused this.<BR>
<BR>
Has anyone experienced storage migration using an Hitachi USP with LVM? Are=
 there any known gotcha&#8217;s?<BR>
<BR>
Thanks<BR>
Zach<BR>
<BR>
<BR>
[root@server001 ~]# pvscan<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'tRZN01-N7bG-SKAw-D9Fd-RxRF-lS4D-U5QfPt'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'jRwTAu-N0Zs-KBrC-7d6q-uUOA-EHpx-QJeydD'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'iu1aeD-XVe3-qSHr-cea3-ATGP-ML76-2isZwS'.<BR>
&nbsp;&nbsp;Couldn't find device with uuid=
 'CgJvgU-cND9-Wtfe-cx3Z-g6sH-0tan-Qa21YC'.<BR>
&nbsp;&nbsp;PV unknown device &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV unknown device &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV unknown device &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-30=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-37=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-33=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-35=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-40=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-38=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV unknown device &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg2=
 &nbsp;&nbsp;lvm2 [58.25 GB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-41=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg3=
 &nbsp;&nbsp;lvm2 [992.00 MB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-29=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg3=
 &nbsp;&nbsp;lvm2 [992.00 MB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-23=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg3=
 &nbsp;&nbsp;lvm2 [992.00 MB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-22=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg3=
 &nbsp;&nbsp;lvm2 [992.00 MB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-26=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg3=
 &nbsp;&nbsp;lvm2 [992.00 MB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/dm-21=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG vg3=
 &nbsp;&nbsp;lvm2 [992.00 MB / 0 &nbsp;&nbsp;&nbsp;free]<BR>
&nbsp;&nbsp;PV /dev/cciss/c0d0p2 &nbsp;&nbsp;VG vg1 &nbsp;&nbsp;lvm2 [68.22=
 GB / 35.31 GB free]<BR>
&nbsp;&nbsp;Total: 17 [656.53 GB] / in use: 17 [656.53 GB] / in no VG: 0 [0=
 &nbsp;&nbsp;]<BR>
&nbsp;<BR>
-- <BR>
</SPAN></FONT><FONT COLOR=3D"#800000"><FONT FACE=3D"Arial"><SPAN STYLE=
=3D'font-size:12pt'><B>Zachary Buckholz, </B>Senior Unix Systems=
 Administrator<BR>
</SPAN></FONT></FONT><FONT SIZE=3D"2"><FONT FACE=3D"Verdana, Helvetica,=
 Arial"><SPAN STYLE=3D'font-size:10pt'>University of Phoenix &nbsp;|=
 &nbsp;IT Operations<BR>
4025 S. Riverpoint Parkway </SPAN></FONT><SPAN STYLE=
=3D'font-size:10pt'><FONT FACE=3D"Arial">=A2x</FONT><FONT FACE=3D"Verdana,=
 Helvetica, Arial"> &nbsp;Phoenix, Arizona 85040<BR>
phone: 602.557.6809 &nbsp;| &nbsp;cell: 602.377.8023 &nbsp;| email: <a href=
=3D"zach.buckholz@apollogrp.edu">zach.buckholz@apollogrp.edu</a><BR>
<BR>
</FONT></SPAN></FONT><FONT COLOR=3D"#008000"><FONT SIZE=3D"4"><FONT FACE=
=3D"Webdings"><SPAN STYLE=3D'font-size:13pt'>P</SPAN></FONT></FONT><FONT=
 SIZE=3D"2"><FONT FACE=3D"Times New Roman"><SPAN STYLE=3D'font-size:10pt'>=
 </SPAN></FONT></FONT><FONT SIZE=3D"1"><FONT FACE=3D"Verdana, Helvetica,=
 Arial"><SPAN STYLE=3D'font-size:7pt'>Please consider the environment=
 before printing this email.<BR>
</SPAN></FONT></FONT></FONT><FONT FACE=3D"Calibri, Verdana, Helvetica,=
 Arial"><SPAN STYLE=3D'font-size:11pt'> <BR>
<BR>
</SPAN></FONT>
</BODY>
</HTML>


<table><tr><td bgcolor=3D#ffffff><font color=3D#000000>This message is=
 private and confidential. If you have received it in error, please notify=
 the sender and remove it from your system.<br>
</font></td></tr></table>
--B_3319622914_1148203--
