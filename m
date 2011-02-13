Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1DLeGcC020318
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2011 16:40:16 -0500
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1DLe3SG016950
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2011 16:40:04 -0500
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	p1DLdmfR020524
	for <linux-lvm@redhat.com>; Sun, 13 Feb 2011 13:39:50 -0800
Message-ID: <4D584FA4.3030007@tlinx.org>
Date: Sun, 13 Feb 2011 13:39:48 -0800
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] new exit message on all commands?: Wiping internal VG
	cache
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Not sure when this started, but AFAIK, I haven't upgraded any of my
lvm commands, unless some included/linked lib was updated, though I don't
recall much of that lately either.

But now whenever an 'lvm' command (lvs, pvs, 'lvcreate --help', etc...) 
runs,
the last line of output is 'wiping internal VG cache'...

Any idea(s) why?

This is in Suse 11.2-x64, with lvm2-2.02.45 (running from the 11.3 
source, trying unsuccessfully to get around a bug squirly nested bug in 
the snapshot
library, running w/a 2.6.35.7 kernel.  (I.e.

I upgraded my kernel -- but that broke 'lvm's snapshot ability.  I tried
to upgrade lvm but my suse seems to package part of it in their boot-disk
package along with other unrelated stuff making it very difficult to
upgrade 1 part.
