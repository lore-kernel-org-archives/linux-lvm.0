Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIJe6PC010665
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 14:40:11 -0500
Received: from pd4mo2so.prod.shaw.ca (idcmail-mo1so.shaw.ca [24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIJda4x015447
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 14:39:36 -0500
Received: from pd3mr4so.prod.shaw.ca
	(pd3mr4so-qfe3.prod.shaw.ca [10.0.141.180]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0JT90023JFUV9X40@l-daemon> for linux-lvm@redhat.com; Tue,
	18 Dec 2007 12:37:43 -0700 (MST)
Received: from pn2ml2so.prod.shaw.ca ([10.0.121.146])
	by pd3mr4so.prod.shaw.ca (Sun Java System Messaging Server 6.2-7.05
	(built Sep
	5 2006)) with ESMTP id <0JT9004NZFUV9XE0@pd3mr4so.prod.shaw.ca> for
	linux-lvm@redhat.com; Tue, 18 Dec 2007 12:37:43 -0700 (MST)
Received: from an-ex.ActiveNetwerx.int ([68.144.68.179])
	by l-daemon (Sun Java System Messaging Server 6.2-7.05 (built Sep 5
	2006))
	with ESMTP id <0JT90082BFUTZF40@l-daemon> for linux-lvm@redhat.com; Tue,
	18 Dec 2007 12:37:42 -0700 (MST)
Date: Tue, 18 Dec 2007 12:37:40 -0700
From: "Joseph L. Casale" <jcasale@ActiveNetwerx.com>
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
In-reply-to: <67500E55-99D2-4F59-9942-F014BEC4C8F2@networkingnewsletter.org.uk>
Message-id: <1C8CF1EA1A5B5940B81B0710B2A4C93823E21AC9CE@an-ex.ActiveNetwerx.int>
MIME-version: 1.0
Content-language: en-US
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823E21AC9CD@an-ex.ActiveNetwerx.int>
	<67500E55-99D2-4F59-9942-F014BEC4C8F2@networkingnewsletter.org.uk>
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

>i've not had problems with Linux dual booting it's the LVM itself
>that seems a problem for WinXP installation.
>I'm really hoping it is possible to dual boot Linux/LVM and WinXP!!!

I am triple booting winxp, vista and Fedora Core 8, it works just fine. LVM doesn't have anything to do with it (Even though I am also using LVM). It is more likely there is some specific hiccup with your computer that WinXP setup gets tangled up on (I have encountered enough of my own...).

Regardless, IMHO it's easier to take out your Linux HD and make the WinXP HD the only one in your system then install winxp, that's less work afaik.

Ymmv,
jlc
