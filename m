Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATMbdJR009706
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 17:37:39 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATMbQWm006549
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 17:37:27 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oATMbQkS003061
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 17:37:26 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oATMbQlI003060
	for linux-lvm@redhat.com; Mon, 29 Nov 2010 17:37:26 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Mon, 29 Nov 2010 22:37:26 +0000 (UTC)
Message-ID: <id19v6$rpv$2@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Tool for defragmentation of extends?
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

I'm doing some manual pvmove-ing to reduce the amount of metadata stored 
for a VG.  But it occurs to me: Finding a good final layout, and a plan 
to get there, is the sort of thing at which computers are pretty good.

Is there a tool that will do this?

I did some searching, and all I found were suggestions to use pvmove.

	- Andrew
