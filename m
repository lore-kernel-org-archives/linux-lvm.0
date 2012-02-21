Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1LGTe34017702
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:29:40 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1LGTZg6010506
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:29:35 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id E6E1C21946
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 10:29:32 -0600 (CST)
Date: Tue, 21 Feb 2012 10:29:32 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120221102932.19eb3218@bettercgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mirror_region_size default: 4096 six times faster than
	512?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Moving several terabytes of data, I was again struck by the very 
large difference in performance between copying data in small chunks
for large chunks. After seeing larger block sizes make dd eight times
faster, I tried increasing mirror_region_size in lvm.conf:

pvmove with default mirror_region_size of 512: ~4-6 MB/s
pvmove with increased mirror_region_size of 4096: ~22-32 MB/s

Although this was somewhat unscientific testing, I'm quite curious 
what results others get on their hardware. The effect was most 
pronounced for me on a system with a 9550SX-12. I'll do some testing 
on a 8888ELP next week.

If 4096 is OFTEN several times faster than 512, would it make sense 
to consider canging the default?
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php
