Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6QNGEV18805
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:16:14 -0400
Received: from imf17aec.mail.bellsouth.net (imf17aec.mail.bellsouth.net
	[205.152.59.65])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6QNGCp6022963
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:16:13 -0400
Received: from ibm57aec.bellsouth.net ([68.215.136.62])
	by imf17aec.mail.bellsouth.net with ESMTP id
	<20050726231603.YIWK11486.imf17aec.mail.bellsouth.net@ibm57aec.bellsouth.net>
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:16:03 -0400
Received: from [127.0.0.1] (really [68.215.136.62])
	by ibm57aec.bellsouth.net with ESMTP
	id <20050726231602.ZKXA4854.ibm57aec.bellsouth.net@[127.0.0.1]>
	for <linux-lvm@redhat.com>; Tue, 26 Jul 2005 19:16:02 -0400
Message-ID: <42E6C431.1010409@bellsouth.net>
Date: Tue, 26 Jul 2005 19:16:01 -0400
From: Lucille Wright <lpwrght@bellsouth.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Reduce physical volume size?
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

I have a 114 Gb physical volume that has one 40 Gb logical volume on it
and I would like to reduce the physical volume size and return the free
74 Gb to freespace for use by another operating system. Is there an
LVM method to do this?



Thanks,
Philip
