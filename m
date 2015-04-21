Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3L90Kbi021219
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2015 05:00:21 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3L90IBe001194
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2015 05:00:19 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1YkU2F-0002dV-BB
	for linux-lvm@redhat.com; Tue, 21 Apr 2015 11:00:14 +0200
Received: from 121.244.87.116.static-Pune.vsnl.net.in
	([121.244.87.116.static-Pune.vsnl.net.in])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2015 11:00:03 +0200
Received: from nkshirsagar by 121.244.87.116.static-Pune.vsnl.net.in with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2015 11:00:03 +0200
From: nikhil <nkshirsagar@gmail.com>
Date: Tue, 21 Apr 2015 08:58:37 +0000 (UTC)
Message-ID: <loom.20150421T105704-216@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] persistent value of tunables for dmsetup --target=cache
	?
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
To: linux-lvm@redhat.com

Hello,

how do I ensure that the tunable (for eg. dmsetup message vg02-jetcache_lv 0
write_promote_adjustment 0) will remain the same value even after reboot?

Seems like the tunables values reset to earlier values upon reboot of the
machine.

Help! :)
