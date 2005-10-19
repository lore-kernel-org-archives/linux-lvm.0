Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9JGskV17630
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 12:54:46 -0400
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9JGseK1006829
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 12:54:40 -0400
Received: from steiner.cc.vt.edu (IDENT:mirapoint@evil-steiner.cc.vt.edu
	[10.1.1.14])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id j9JGsSQG012788
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 12:54:30 -0400
From: Bill Ranck <ranck@vt.edu>
Date: Wed, 19 Oct 2005 12:53:21 -0400
Message-Id: <1129740801.29185.90.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] creating a snapshot
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
To: LVM discussion list <linux-lvm@redhat.com>

Hello folks,
   I have been trying to create a snapshot of a filesystem on a RHEL AS4
system.  Here is the command line and the error message:

# lvcreate --size 100m --snapshot --name snap01 /dev/HDVL/db01
  snapshot: Required device-mapper target(s) not detected in your kernel

I copied the example right out of the man page.  I'm not sure what it
means that the device-mapper target is not detected in the kernel.  Can
anyone point me in the right direction here?

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
