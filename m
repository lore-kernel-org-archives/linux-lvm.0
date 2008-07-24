Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6OF8ln3019716
	for <linux-lvm@redhat.com>; Thu, 24 Jul 2008 11:08:47 -0400
Received: from devserv.devel.redhat.com (devserv.devel.redhat.com
	[10.10.36.72])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m6OF8lDo032455
	for <linux-lvm@redhat.com>; Thu, 24 Jul 2008 11:08:47 -0400
Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by devserv.devel.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	m6OF8k8p001778
	for <linux-lvm@redhat.com>; Thu, 24 Jul 2008 11:08:47 -0400
From: Jim Meyering <jim@meyering.net>
Date: Thu, 24 Jul 2008 17:08:46 +0200
Message-ID: <87od4ns4jl.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] FYI: fix configure bug wrt readline
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

I've just committed this, along with a separate change
containing just the regenerated configure.

It's easy to reproduce without removing libreadline.
This fails before the patch, and succeeds after:
   ac_cv_lib_readline_readline=no ./configure -C \
       --with-dmdir=$PWD/../device-mapper

As for testing, I've configure with each of these,

    --enable-readline
    --disable-readline

both with the library available and
with it (simulated) absent, and all work properly.

Jim
