Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB4JBDrk030934
	for <linux-lvm@redhat.com>; Mon, 4 Dec 2006 14:11:13 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB4JBBHT008914
	for <linux-lvm@redhat.com>; Mon, 4 Dec 2006 14:11:11 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GrJCe-00011O-GO
	for linux-lvm@redhat.com; Mon, 04 Dec 2006 20:10:12 +0100
Received: from cpe-76-185-192-237.tx.res.rr.com ([76.185.192.237])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 04 Dec 2006 20:10:12 +0100
Received: from i.pilcher by cpe-76-185-192-237.tx.res.rr.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 04 Dec 2006 20:10:12 +0100
From: Ian Pilcher <i.pilcher@comcast.net>
Date: Mon, 04 Dec 2006 13:09:55 -0600
Message-ID: <el1rq3$fcf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Later extents allocated
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
To: linux-lvm@redhat.com

Trying to reduce the size of a physical volume with pvresize, and being
told "cannot resize to 1022 extents as later ones are allocated".

Any way to "reorganize" the PV, or am I stuck?

Thanks!

-- 
========================================================================
Ian Pilcher                                        i.pilcher@comcast.net
========================================================================
