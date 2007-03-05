Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25I77lX021104
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 13:07:07 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l25I755B022405
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 13:07:06 -0500
Received: from pavian (pavian.at.ds9 [192.168.0.104])
	by mailer.at.ds9 (Postfix) with ESMTP id 005367576E
	for <linux-lvm@redhat.com>; Mon,  5 Mar 2007 19:00:19 +0100 (CET)
From: "Cisco" <cisco66@gmx.de>
Date: Mon, 5 Mar 2007 19:00:25 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20070305180020.005367576E@mailer.at.ds9>
Subject: [linux-lvm] WARNING: Ignoring duplicate config node: filter
	(seeking filter)
Reply-To: cisco66@gmx.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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

 
 Hi all,
 
 after upgrading (compiling from source)LVM2 and device 
 mapper, i always get the warning message "WARNING: Ignoring 
 duplicate config node: filter (seeking filter)" when doing 
 "lvm version" or any other lvm command.
 
 Does anyone know what's going on and if i should be 
 concerned about this, or even better: What is the meaning of 
 this message and how can i get rid of it.
 
 Thanks in advance and best regards.
 
 Kernel: 2.6.20, Debian unstable
 
 LVM version:     2.02.22 (2007-02-13)
 Library version: 1.02.18 (2007-02-13)
 Driver version:  4.11.0
 
