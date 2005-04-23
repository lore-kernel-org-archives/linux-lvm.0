Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3NFthO16681
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 11:55:43 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3NFtgGu002246
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 11:55:42 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DPMu0-0004yv-3x
	for linux-lvm@redhat.com; Sat, 23 Apr 2005 17:50:40 +0200
Received: from mdsnwi13-vlan446-68.dsl.tds.net ([66.222.35.68])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 17:50:40 +0200
Received: from usenet by mdsnwi13-vlan446-68.dsl.tds.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 17:50:40 +0200
From: Erik Meitner <usenet@kwax.hn.org>
Date: Sat, 23 Apr 2005 10:44:02 -0500
Message-ID: <d4dq72$an3$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] How to resize a PV partition
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

Hello,
I have a disk partition(type 0x8e) that is the single PV for the VG
where my other partitions reside. I would like to recover the unused PEs
from this PV and use them to create a non-LVM regular parition at the
end of the disk. How do I:
B) move used PEs from the 'end' of the PV so that it can be resized?
A) resize the PV (previous messages suggest vgcfgbackup, edit backup
file, vgcfgrestore)
C) resize the type 0x8e partition?(parted won't do it)

Thanks.
