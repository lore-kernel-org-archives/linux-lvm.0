Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3UB8KrN031788
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 07:08:22 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3UB8EJR014554
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 07:08:15 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HiSk7-0005VI-1F
	for linux-lvm@redhat.com; Mon, 30 Apr 2007 12:04:27 +0200
Received: from bas1-montreal42-1178046835.dsl.bell.ca ([70.55.145.115])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 12:04:27 +0200
Received: from monnier by bas1-montreal42-1178046835.dsl.bell.ca with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 30 Apr 2007 12:04:27 +0200
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Mon, 30 Apr 2007 06:04:11 -0400
Message-ID: <jwvirbetccs.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Several volume groups on a single physical volume?
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
To: linux-lvm@redhat.com


I recently tried to setup a second volume group on my drive and discovered
that it can't be done.  Is there some recommended practice for how to
"emulate" such a feature?

Basically all I want to do is to partition my set of partitions into one set
that relates to, say, the OS, and the other that relates to, say, the users,
and finally a third one that relates to, say, random data (like a music and
video database).

I currently just put all those partitions into the same volume group, but
I find it intellectually unsatisfactory.

I guess if I were sufficiently motivated I could layer LVM on top of itself:
have one pv holding one vg which holds 3 partitions (OS, User, Data), and
then have each one of those partitions be LVM physical volumes, ...

What is the "best practice" way to use volume groups and logical volumes and
to handle situations such as the one above?


        Stefan
