Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0B6pOam019251
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2009 01:51:24 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0B6o24i018950
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2009 01:50:03 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LLu94-0003Pd-Kd
	for linux-lvm@redhat.com; Sun, 11 Jan 2009 06:50:02 +0000
Received: from pool-71-182-236-113.pitbpa.east.verizon.net ([71.182.236.113])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2009 06:50:02 +0000
Received: from ihok by pool-71-182-236-113.pitbpa.east.verizon.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2009 06:50:02 +0000
From: Jack Tanner <ihok@hotmail.com>
Date: Sun, 11 Jan 2009 06:45:11 +0000 (UTC)
Message-ID: <loom.20090111T064058-284@post.gmane.org>
References: <BLU129-W51AB60F7B4AC377D19C556CADB0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: recovery help needed
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

Jack Tanner <ihok <at> hotmail.com> writes:

> Thanks in advance.

Never mind! I figured out vgcfgrestore! Yay me!

One thing that kept tripping me up was that I'd do vgcfgrestore, and then do an
lvscan, and the following lvscan would say say that my vg was inconsistent, and
it would undo the vgcfgrestore. The ticket was to pvremove /dev/md1; that
allowed lvscan to work. It'd be nice if lvscan would explain what exactly it
thinks is inconsistent. (Oh, maybe it does in verbose mode? If so, maybe that
should be part of the default output, not just the verbose.)

P.S. lvm rocks
