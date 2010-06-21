Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5LAE2Wx014261
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2010 06:14:02 -0400
Received: from mailgw4.noos.com (outrun.ncnumericable.com [195.132.2.195])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5LADnR2025374
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2010 06:13:50 -0400
Received: from PRDEXC01.upcnoos.int (PAL1LB [10.0.180.157])
	by mailgw4.noos.com (Microsoft Exchange) with SMTP id 9E3F12F018
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2010 12:27:15 +0200 (CEST)
From: PENNEREE JEAN-LOUIS <jlpenneree@ncnumericable.com>
Content-Type: multipart/alternative; boundary="=-Q+XJVXQMBRWPse3JTHfy"
Date: Mon, 21 Jun 2010 12:13:48 +0200
Message-Id: <1277115228.30102.2.camel@CHP-92AF47.upcnoos.int>
Mime-Version: 1.0
Subject: [linux-lvm] upgrade lvm2
Reply-To: jlpenneree@ncnumericable.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-Q+XJVXQMBRWPse3JTHfy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I would like to upgrade lvm2 version on a RHEL5 machine.


How to proceed?

 #rpm -Uvh device-mapper-1.02.39-1.el5.x86_64.rpm

le fichier /usr/include/libdevmapper-event.h de l'installation de
device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du
paquetage device-mapper-1.02.20-1.el5
        le fichier /usr/include/libdevmapper.h de l'installation de
device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du
paquetage device-mapper-1.02.20-1.el5
        le fichier /usr/share/man/man8/dmsetup.8.gz de l'installation de
device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du
paquetage device-mapper-1.02.20-1.el5


Best regards



--=-Q+XJVXQMBRWPse3JTHfy
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.16.3">
</HEAD>
<BODY>
Hi,<BR>
<BR>
I would like to upgrade lvm2 version on a RHEL5 machine.<BR>
<BR>
<BR>
How to proceed?<BR>
<BR>
 #rpm -Uvh device-mapper-1.02.39-1.el5.x86_64.rpm<BR>
<BR>
le fichier /usr/include/libdevmapper-event.h de l'installation de device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du paquetage device-mapper-1.02.20-1.el5<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le fichier /usr/include/libdevmapper.h de l'installation de device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du paquetage device-mapper-1.02.20-1.el5<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; le fichier /usr/share/man/man8/dmsetup.8.gz de l'installation de device-mapper-1.02.39-1.el5 entre en conflit avec le fichier du paquetage device-mapper-1.02.20-1.el5<BR>
<BR>
<BR>
Best regards<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-Q+XJVXQMBRWPse3JTHfy--
