Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6QN7KV16425
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:07:20 -0400
Received: from imf22aec.mail.bellsouth.net (imf22aec.mail.bellsouth.net
	[205.152.59.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6QN7IoT019802
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:07:18 -0400
Received: from ibm67aec.bellsouth.net ([68.215.136.62])
	by imf22aec.mail.bellsouth.net with ESMTP id
	<20050726230713.PDRH3198.imf22aec.mail.bellsouth.net@ibm67aec.bellsouth.net>
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:07:13 -0400
Received: from bellsouth.net ([68.215.136.62]) by ibm67aec.bellsouth.net
	with ESMTP
	id <20050726230712.FYHM11059.ibm67aec.bellsouth.net@bellsouth.net>
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:07:12 -0400
Message-ID: <42E6C0B9.D04CE196@bellsouth.net>
Date: Tue, 26 Jul 2005 19:01:13 -0400
From: Philip Wright <pvwrght@bellsouth.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Reduce physical volume size?
Reply-To: pvwrght@bellsouth.net,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I have a 114 Gb physical volume that has one 40 Gb logical volume on it
and I would like to reduce the physical volume size and return the free
74 Gb to freespace for use by another operating system. Is there an
LVM method to do this?

Thanks,
Philip
