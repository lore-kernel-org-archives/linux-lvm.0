Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7EEvth0025304
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 10:57:55 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7EEvfc8025798
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 10:57:46 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GCdsW-0002T9-W2
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 16:57:21 +0200
Received: from faina.iro.umontreal.ca ([132.204.26.177])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 16:57:20 +0200
Received: from monnier by faina.iro.umontreal.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 16:57:20 +0200
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Mon, 14 Aug 2006 10:56:38 -0400
Message-ID: <jwv4pwfv08y.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Joining physical volumes
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


For historical reasons, my hard drive has now 3 contiguous physical
partitions, all managed by LVM for the same volume group.

I'd like to get rid of this silliness and turn those 3 partitions into
just 1.  I don't have much/any extra space available and I'd rather not
have to resort to backup/format/restore.

Is there some clever way to do that?  Ideally, I should be able to do the
conversion without moving the actual data at all since the same sectors
will be available.


        Stefan
