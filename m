Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m56C5ZZY004813
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 08:05:35 -0400
Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[10.10.36.72])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m56C5ZMo011350
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 08:05:35 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	m56C5ZDE028330
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 08:05:35 -0400
From: Jim Meyering <jim@meyering.net>
Date: Fri, 06 Jun 2008 14:05:35 +0200
Message-ID: <87r6barcog.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] lvm-utils.sh (init_root_dir_): Correct a
	diagnostic.
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Here's a tiny correction for a test-related script.
Noticed in another context (GNU Parted) that the "$"
must be escaped: that variable is obviously not defined, there.
