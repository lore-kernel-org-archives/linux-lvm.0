Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0U8mDO05357
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 03:48:13 -0500
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0U8m7Sx025503
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 03:48:08 -0500
Received: from pd5mr5so.prod.shaw.ca
	(pd5mr5so-qfe3.prod.shaw.ca [10.0.141.181]) by l-daemon
	(Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15 2004))
	with ESMTP id <0IB4004P8GG7HPA0@l-daemon> for linux-lvm@redhat.com; Sun,
	30 Jan 2005 01:48:07 -0700 (MST)
Received: from pn2ml9so.prod.shaw.ca ([10.0.121.7])
	by pd5mr5so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IB400NYYGG74770@pd5mr5so.prod.shaw.ca> for
	linux-lvm@redhat.com; Sun, 30 Jan 2005 01:48:07 -0700 (MST)
Received: from [68.146.228.127]
	(S010600e018f9c2be.cg.shawcable.net [68.146.228.127])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0IB40040NGG73X@l-daemon> for linux-lvm@redhat.com; Sun,
	30 Jan 2005 01:48:07 -0700 (MST)
Date: Sun, 30 Jan 2005 01:48:07 -0700
From: Gerald Schepens <schepens@shaw.ca>
Message-id: <41FC9F47.4030001@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Building lvm2 against 2.6.10...
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

The configure script fails for lvm2 with the following...

checking linux/fs.h usability... no
checking linux/fs.h presence... no
checking for linux/fs.h... no
configure: error: bailing out

There isn't much of use in the config.log.

I can verify that /usr/include/linux/fs.h (that is, 
/usr/src/linux-2.6.10/include/linux/fs.h) does indeed exist.

Detail:  kernel 2.6.10, stock from kernel.org.

lvm2.2.00.33 (lvm2.2.01.02 does the same thing)

I have my kernel source in /usr/src/linux-2.6.10 but I have the correct 
symlink set up for it in /usr/src/; ditto for /usr/include/linux.

Words of wisdom?
