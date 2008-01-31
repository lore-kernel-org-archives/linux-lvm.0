Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0V5gxk9019851
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 00:42:59 -0500
Received: from pd3mo3so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0V5gSlc001489
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2008 00:42:29 -0500
Received: from pd4mr2so.prod.shaw.ca
	(pd4mr2so-qfe3.prod.shaw.ca [10.0.141.213]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JVH006G1UISACD0@l-daemon> for linux-lvm@redhat.com; Wed,
	30 Jan 2008 22:42:28 -0700 (MST)
Received: from pn2ml1so.prod.shaw.ca ([10.0.121.145])
	by pd4mr2so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JVH005AOUIS1E70@pd4mr2so.prod.shaw.ca> for
	linux-lvm@redhat.com; Wed, 30 Jan 2008 22:42:28 -0700 (MST)
Received: from mail.activenetwerx.com ([68.144.68.179])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006))
	with ESMTP id <0JVH00BZVUIRF500@l-daemon> for linux-lvm@redhat.com; Wed,
	30 Jan 2008 22:42:27 -0700 (MST)
Received: from exchange.activenetwerx.com (localhost.localdomain [127.0.0.1])
	by mail.activenetwerx.com (Postfix) with ESMTP id 6184A178056	for
	<linux-lvm@redhat.com>; Wed, 30 Jan 2008 15:44:51 -0700 (MST)
Date: Wed, 30 Jan 2008 22:42:26 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] How to create partitions using  LVM
In-reply-to: <47A1AA0D.E775.009D.0@novell.com>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C9385030AC6855@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <47A1A629.E775.009D.0@novell.com> <47A159DE.4010401@mattgillen.net>
	<47A1AA0D.E775.009D.0@novell.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

>I mean that from (disk) sda if i want to create sda2,sda3 .... In EVMS just like creating Segments.

So you want to carve up three partitions on an LVM disc? --> You want 3 Logical Volumes then, check out that website I gave you...
