Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l67JCDPs010882
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 15:12:13 -0400
Received: from mail.futurelabusa.com (c-67-165-227-32.hsd1.co.comcast.net
	[67.165.227.32])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l67JCBa5015835
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 15:12:11 -0400
Received: from i0.futurelabusa.com (i0.fu-lab.com [192.168.0.101])
	by mail.futurelabusa.com (Postfix) with ESMTP id 6FD8D77702
	for <linux-lvm@redhat.com>; Sat,  7 Jul 2007 13:12:11 -0600 (MDT)
Date: Sat, 07 Jul 2007 13:12:16 -0600
From: Jim Schatzman <james.schatzman@futurelabusa.com>
Subject: Re: [linux-lvm] Restore LVM after drive error
In-Reply-To: <20070707134753.181690@gmx.net>
References: <20070707134753.181690@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Message-Id: <20070707191211.6FD8D77702@mail.futurelabusa.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Another note:

Re: Using dd to image a failing hard drive. Ryan Nelson in an earlier posting explained how to get your VG back online:

"vgcfgbackup, edit the backup, edit the ids in the logical_volumes
sections, check your work carefully, and vgcfgrestore?"

This will allow you to substitute the new id for the old and LVM should then be good to go. Presumably, you will have lost some data, so I would recommend mounting the FS readonly and copying files elsewhere. If you don't care what may happen, you could mount RW, run fsck and repair the filesystem.

Jim
