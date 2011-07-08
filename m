Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p685N4kV030267
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 01:23:04 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p685N3xT019110
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 01:23:04 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p685MrQ5021490
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2011 22:22:55 -0700
Message-ID: <4E16942E.9070204@tlinx.org>
Date: Thu, 07 Jul 2011 22:22:54 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what use is virtualsize -- or how is it to be used?
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

I just saw it in the man page, and first thing I tried was creating a 
logical volume
by just giving a --virtualsize, arg -- thinking it would 'auto-extend 
it' as needed.

Nep.

Next was looking on the net and seeing an example that gave it some 
small size (-L 1G),
with a virtual size of 2G.   So what is that supposed to do?

I just now thought to copy a bunch of files ( that differed from 
yesterday to today) to a tmp
partition) but had it fail miserably when it REALLY failed upon reaching 
the physical
limit -- not the virtual limit!)....


I was trying to use rsync to copy from a snap from yesturday of /home 
that was mounted on
/ohome to 'home.diff' (the partition that I used 'virtual size' with, 
... I gave it a real
size of 1G, and a virtual size of 1T.

Using rsync, I had --compare-dest=/ohome (where I mount yesturday's 
snap) and copied
from /home to /home.diff (the virtual partition)....   Well the diffs 
were > 1G, so had
hoped /home.diff would expand to it's virtual size...  Anyway, got I/O 
errors, after I
ran out of space.  Ok, so *that*'s not what virtual size is for...either! 

Anyway, I unmounted the now 'corrupt' /home.diff, and tried to remove it...
Got all sorts of i/o errors using lvremove Home.diff. (-f didn't work 
either).

Got it to remove with lvremove -f /dev/PV/Home.diff
That gave I/O errors too, but successfully completed...

So what's virtual size good for, anyway?
