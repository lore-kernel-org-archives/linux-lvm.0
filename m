Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9KK4ovU012942
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2010 16:04:51 -0400
Received: from EXHUB016-1.exch016.msoutlookonline.net
	(exhub016-1.exch016.msoutlookonline.net [207.5.72.163])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9KK4apS021323
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2010 16:04:36 -0400
Message-ID: <4CBF4B79.9080008@cfl.rr.com>
Date: Wed, 20 Oct 2010 16:05:13 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot merge in the background?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Last night I tested out the new snapshot merge feature by taking a
snapshot, running a dist-upgrade, then lvconvert --merge.  After
rebooting, it merged the snapshot back into the origin, but it waited
for the merge to complete before finishing the boot.  Can't the merge be
completed in the background while the volume is mounted and the boot
continues?
