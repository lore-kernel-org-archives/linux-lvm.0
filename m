Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3P7mKBj006221
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 03:48:20 -0400
Received: from emailgate1.cpvie.co.at (smtp.cargo-partner.com [195.234.151.28])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3P7mIPa004473
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 03:48:18 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by emailgate1.cpvie.co.at (Postfix) with ESMTP id 2EBFA40C9A
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 09:48:12 +0200 (CEST)
Received: from cp.com (mail.cargo-partner.com [10.10.201.21])
	by emailgate1.cpvie.co.at (Postfix) with ESMTP id F2E2640C9B
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 09:48:10 +0200 (CEST)
Received: from [81.5.238.201] (account eisenkoe@cargo-partner.com HELO
	[81.5.238.201]) by cp.com (CommuniGate Pro SMTP 5.1.8)
	with ESMTPA id 23233428 for linux-lvm@redhat.com;
	Wed, 25 Apr 2007 09:48:10 +0200
Message-ID: <462F07B8.9060205@cargo-partner.com>
Date: Wed, 25 Apr 2007 09:48:08 +0200
From: =?ISO-8859-15?Q?Michael_Eisenk=F6lbl?= <eisenkoe@cargo-partner.com>
MIME-Version: 1.0
References: <462332EF.5090505@cargo-partner.com>
	<462E65D2.5070008@cargo-partner.com>
In-Reply-To: <462E65D2.5070008@cargo-partner.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] clusteredVG+mirroredLV
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,

i want to create a two node cluster with three iSCSI devices.
the iSCSI devices should be mirrored (2mirror+1log) to be more secure.
I am going to configure 3 PVs and after a clustered volume group, so 
this is no problem.
but when I am trying to create the mirrored logical volume (on this 
clusteredVG), I got the following error message:

lvcreate command failed.
Command attempted: "/usr/sbin/lvcreate -n mirrorLV -l 6 -m1 mirrorVG 
/dev/sde1 /dev/sdb1 /dev/sdc1" - System Error Message:   Error locking 
on node server4: Internal lvm error, check syslog
Aborting. Failed to activate mirror log. Remove new LVs and retry.
Failed to create mirror log.

I deleted everything and retried it, but everytime the same error.
cluster is working good. clvmd is also started with locking mode 2.
if I try to create a normal VG with a mirrored LV everythings fine.
if I try to create a clustered VG with a normal LV everythings fine.
but not a clustered VG with a mirrored LV...... why?

maybe somebody can help me with this situation.

kind regards
Michael
