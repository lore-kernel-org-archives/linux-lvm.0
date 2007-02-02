Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l12Fi8iF012337
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 10:44:09 -0500
Received: from ahlnx01.ah.org (host67.ah.org [66.60.186.67])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l12Fi2Jm007292
	for <linux-lvm@redhat.com>; Fri, 2 Feb 2007 10:44:03 -0500
Received: from [10.35.1.204] (helo=C35ISD02)
	by ahlnx01.ah.org with smtp (Exim 4.50) id 1HD0Zw-0007Cm-0F
	for linux-lvm@redhat.com; Fri, 02 Feb 2007 07:43:56 -0800
Mime-Version: 1.0
Date: Fri, 2 Feb 2007 07:43:22 -0800
Message-ID: <45C2EB9A.81EB.0099.0@charter.net>
From: "Dwight Morgan" <dwightbulk@charter.net>
Content-Type: multipart/alternative; boundary="____RUEFXQQNDBCYYCNYQFJH____"
Subject: [linux-lvm] LVM changing bios from legacy/IDE to AHCI/Sata
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


--____RUEFXQQNDBCYYCNYQFJH____
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; modification-date="Fri, 1 Feb 2007 23:43:22 -0800"

I am running LVM on FC6 2.6.19 and would like to switch over from =
Legacy/IDE in the intel 965 bios to AHCI/SATA.  Of course, as soon as I =
change the bios setting fedora won't boot as it can't find any volumes.  I =
can see how to export the LVM settings, change the text file from hda1 to =
sda1, and restore it.  But I figure the odds of me screwing this up are =
good, and I don't see a good recovery method.

Any help on process/recovery?

Thanks,
-Dwight

PS.  Same drive, nothing changing other than a bios setting.
--____RUEFXQQNDBCYYCNYQFJH____
Content-Type: multipart/related; boundary="____IHULEHMBQPPTCCFBNCEP____"


--____IHULEHMBQPPTCCFBNCEP____
Content-Type: text/html; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline; filename="Text.htm"; modification-date="Fri, 1
	Feb 2007 23:43:22 -0800"

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-15=
">
<META content=3D"MSHTML 6.00.2900.3020" name=3DGENERATOR></HEAD>
<BODY style=3D"MARGIN: 4px 4px 1px; FONT: 10pt Tahoma">
<DIV>I am running LVM on FC6 2.6.19 and would like to switch over from =
Legacy/IDE in the intel 965 bios to AHCI/SATA.&nbsp; Of course, as soon as =
I change the bios setting fedora won't boot as it can't find any volumes.&n=
bsp; I can see how to export the LVM settings, change the text file from =
hda1 to sda1, and restore it.&nbsp; But I figure the odds of me screwing =
this up are good, and I don't see a good recovery method.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Any help on process/recovery?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>-Dwight</DIV>
<DIV>&nbsp;</DIV>
<DIV>PS.&nbsp; Same drive, nothing changing other than a bios setting.</DIV=
></BODY></HTML>
--____IHULEHMBQPPTCCFBNCEP____--

--____RUEFXQQNDBCYYCNYQFJH____--
