Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBFHaFr05838
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 12:36:15 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBFHa4ZC007498
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 12:36:09 -0500
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
Date: Wed, 15 Dec 2004 09:35:56 -0800
Message-Id: <1103132156.31909.99.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How does LVM2 wrap up a filesystem?
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
To: LVM general discussion and development <linux-lvm@redhat.com>


When you have a filesystem in LVM2, are the ext3 blocks within
contiguous sometimes - say, if you haven't rearranged things, by adding,
removing, migrating things?

If it's possible that an ext3 might be a normal ext3 image, beyond some
offset from the beginning of a partition due to LVM2 wrapping (I'm
thinking like how TCP is wrapped up in an ethernet frame), at what
offset does the ext3 filesystem begin within the LVM2 partition?

Thanks!
