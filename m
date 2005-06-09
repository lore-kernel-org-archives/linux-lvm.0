Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5999TO05435
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 05:09:29 -0400
Received: from baghus1.baghus.net (mail@ns.baghus.net [62.245.167.30])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5999MPW026016
	for <linux-lvm@redhat.com>; Thu, 9 Jun 2005 05:09:23 -0400
Received: from [192.168.1.254] (helo=bagex01.BAGHUS-LAN.NET)
	by baghus1.baghus.net with esmtp (Exim 3.35 #1 (Debian))
	id 1DgJ2G-0006U5-00
	for <linux-lvm@redhat.com>; Thu, 09 Jun 2005 11:09:12 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 9 Jun 2005 11:05:29 +0200
Message-ID: <6A58CFF91886D54BBDA1FE988C4DF79D025065@bagex01.baghus-lan.net>
From: "Sven Riedel" <sr@baghus.net>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvcreate goes into deep-sleep while creating an xfs
	snapshot
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi,
I'm creating a backup script for a database using lvm snapshots.
The script ran fine for a few test runs, then I added xfs_freeze -f=20
just before the lvcreate command, as per HOWTO recipe. Now
lvcreate went into deep-sleep and wont wake up:

update:~/bin# ps ax | grep lvcreate
25053 pts/2    D<L+   0:00 lvcreate -s -L 55M -n tables_snap=20
   /dev/database_vg/tables_lv

Running lvdisplay in a different terminal to see if lvm itself
is still seeing all LVs results in lvdisplay going into=20
deep-sleep mode as well. Doing an strace -p 25053=20
doesn't display anything (strace won't catch my interrupts
either, but according to ps it's in a regular sleep).

dmesg doesn't say anything to this situation.

Is there a known issue with snapshots and xfs_freeze?=20
Any way I can gather pertinent debugging info?

I'm running lvm 2.01.04 (package from debian unstable).

Regs,
Sven

------------------------------------------

BAGHUS GmbH
EDV und Internetdienstleistungen

Staffelseestr. 2
81477 M=EF=BF=BDnchen

Tel.: 0 89 / 8 71 81 - 4 84
Fax.: 0 89 / 8 71 81 - 4 88

www.baghus.net, info@baghus.net
HRB: 144283, USt-IdNr: DE224865405

------------------------------------------
=20
