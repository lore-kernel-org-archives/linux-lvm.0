Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59GZ7pg021426
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:35:07 -0400
Received: from mail3.mckesson.com (mail3.mckesson.com [143.112.129.38])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59GZ64Q003641
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:35:06 -0400
From: "Allen, Jack" <Jack.Allen@McKesson.com>
Content-class: urn:content-classes:message
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Using LVM with EMC Powerpath...
Date: Fri, 9 Jun 2006 11:34:42 -0500
Message-ID: <4905EFD192EEDF4A9A19EEE98C32B7F7D9E0A6@DBQV3005.na.corp.mckesson.com>
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
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Gary Mansell
Sent: Friday, June 09, 2006 9:20 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Using LVM with EMC Powerpath...

Hi,

I have a powerpath device that I want to encapsulate in LVM so that I
can grow it in the future but when I try and create the physical volume,
I get an error:

[root@ricserver ~]# powermt display dev=emcpowera
Pseudo name=emcpowera
CLARiiON ID=29R231J [Ricardo]
Logical device ID=600601604EC01000E0FC2ED6AAF5DA11 [5FCALRAID5]
state=alive; policy=CLAROpt; priority=0; queued-IOs=0
Owner: default=SP B, current=SP B
========================================================================
======
---------------- Host ---------------   - Stor -   -- I/O Path -  --
Stats ---
### HW Path                 I/O Paths    Interf.   Mode    State  Q-IOs
Errors
========================================================================
======
   1 lpfc                      sde       SP B0     active  alive      0
0
   2 lpfc                      sdi       SP A1     active  alive      0
0
   3 lpfc                      sdm       SP A0     active  alive      0
0
   4 lpfc                      sdq       SP B1     active  alive      0
0


When I try to create the physical volume:

[root@ricserver ~]# pvcreate /dev/emcpowera1
  Physical volume "/dev/emcpowera1" successfully created


[root@ricserver ~]# pvscan
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0:
using /dev/emcpowera1 not /dev/sdq1
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sde1
not /dev/sdq1
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sdi1
not /dev/sdq1
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sdm1
not /dev/sdq1
  PV /dev/sda2   VG VolGroup00   lvm2 [33.75 GB / 32.00 MB free]
  PV /dev/sdq1                   lvm2 [266.42 GB]
  Total: 2 [300.17 GB] / in use: 1 [33.75 GB] / in no VG: 1 [266.42 GB]

What am I doing wrong?

Any help gladly recieved

Regards

Gary Mansell

====================
Depending on the Linux version you are using, look at /etc/lvm/lvm.conf
and do man on lvm.conf. Basically you need to exclude the /dev/sd*
entries so the various LVM commands will not look at them. They will
only look at the emcpower* names.

Jack Allen
