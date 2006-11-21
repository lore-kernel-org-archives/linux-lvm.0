Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAL5NNgO012756
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 00:23:23 -0500
Received: from smtp2.berklee.edu (smtp.berklee.edu [192.136.22.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAL5NL07020568
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 00:23:21 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp2.berklee.edu (Postfix) with ESMTP id 228DB2C0069
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 00:23:16 -0500 (EST)
Received: from smtp2.berklee.edu ([127.0.0.1])
	by localhost (smtp2.berklee.edu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XqJV6RMyFlGy for <linux-lvm@redhat.com>;
	Tue, 21 Nov 2006 00:23:15 -0500 (EST)
Received: from [192.168.1.202]
	(216-15-121-70.c3-0.frm-ubr3.sbo-frm.ma.static.cable.rcn.com
	[216.15.121.70])
	by smtp2.berklee.edu (Postfix) with ESMTP id C50CB2C0061
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 00:23:15 -0500 (EST)
Message-ID: <45628D40.9040609@berklee.edu>
Date: Tue, 21 Nov 2006 00:23:12 -0500
From: Louis Guillaume <lguillaume@berklee.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re-striping (reorgvg)
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

Hi!

I'm relatively new to LVM on Linux, but have a lot of experience with
AIX's LVM.

Everything makes sense, except I have not found any information on how
to do the following:

1. Add a PV to a volume group. (this is easy)

2. Reorganize the volume group to spread the
   Physical Extents evenly across all PVs in
   the volume group.

I've looked at setting up a striped configuration to spread the PE's
between the PVs. And that's all well and good. But what happens when I
add another PV to the VG? Looks like I'll end up with a mess.

On AIX I would...

. extendvg
. reorgvg

... and now my new PV is nicely added to the VG with the Physical
partitions nicely spread evenly between all the PVs.

How can I do this on Linux?

Louis
