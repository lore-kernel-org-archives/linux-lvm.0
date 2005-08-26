Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7QDQXV06136
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 09:26:33 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7QDQRH3026020
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 09:26:32 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j7QDQQoR026483
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 15:26:26 +0200
From: Fredrik Tolf <fredrik@dolda2000.com>
Date: Fri, 26 Aug 2005 15:26:26 +0200
Message-Id: <1125062786.2225.34.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove on broken disk
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

Dear List,

I have an volume group with five PVs (4x120 GB IDE and 1x200GB S-ATA).
Unfortunately, one of the PVs (a 120 GB IDE disk) have started to
display broken sectors every here and there, so I'd very much like to
replace it before soon.

The problem is that since some sectors are broken, I'm assuming that
pvmove won't work. Would it somehow be possible to make pvmove replace
the broken sectors with zeroed sectors instead of failing? I realize
that it sucks, of course, but I somehow think a zeroed sector is better
than a broken sector. ;)

I've got a related question as well, but it's not really LVM-related.
The thing is that there's something strange with either the IDE chipset
(a Promise card) or the corresponding driver that this disk is connected
to, which causes a kernel panic every time a read from a bad sector is
attempted. I figure I can "fix" that by connecting the drives to a
different computer while pvmoving, but I wouldn't prefer to do that, as
it causes downtime. Does someone on the list know of this problem and
how to work around it? I figure that I can attempt to fix the driver
bug, but I wouldn't prefer to experiment with that system...

Thanks for your time!

Fredrik Tolf
