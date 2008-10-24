Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9O9Y0qd025357
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2008 05:34:00 -0400
Received: from odzwierny0.comarch.com (inptr-69-8.comarch.com [217.74.69.8])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9O9XBG6011255
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2008 05:33:11 -0400
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.pl
	by odzwierny0.comarch.com with esmtpa (ComArch ESMTP)
	id 1KtJ2c-000I45-EJ
	for linux-lvm@redhat.com; Fri, 24 Oct 2008 11:33:10 +0200
Message-ID: <17984.89.200.148.101.1224840790.squirrel@wmail.comarch.com>
Date: Fri, 24 Oct 2008 11:33:10 +0200 (CEST)
From: marcin.kaluza@comarch.pl
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to monitor and possibly autoextend snapshots
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

Hi

Is there a way to get notified, when the snapshot fills up to a certain
level? i.e.  via dmsetup wait [] ? I looked for event numbers but couldn't
find any doc for them.
The best thing would be to make snapshots autoextensible when given a max
size and resize value (just like oracle tablespaces do), but I suppose
that would require much coding...
Any thoughts?

We're using lvm snapshots for samba shadow copies and database cloning,
but there's a problem with monitoring snapshots % of usage - now we just
have a daemon that polls lvdisplay periodically and extends the lv when
necessary. But this is unreliable - you have to either poll often or keep
enough of free space and still you can end up with a trashed snap.

Martin
