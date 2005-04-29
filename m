Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3T99oO21198
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 05:09:50 -0400
Received: from dot.freshdot.net
	(IDENT:c1088e4542c9128e49e16962c789a2ad@dot.freshdot.net
	[80.69.73.239])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3T99nRU030946
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 05:09:50 -0400
Received: from ssmeenk by dot.freshdot.net with local (Exim 4.50)
	id 1DRRVM-0000Yo-VE
	for linux-lvm@redhat.com; Fri, 29 Apr 2005 11:09:48 +0200
Date: Fri, 29 Apr 2005 11:09:48 +0200
From: Sander Smeenk <ssmeenk@freshdot.net>
Message-ID: <20050429090948.GE28591@freshdot.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM 'Incorrect metadata header'
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

Hello!

Recently i tried to setup a new server with LVM, but the Debian
installer couldn't do for me what I wanted it to do, so I had to do it
myself after installing the base system.
No problem, because I think I know LVM, and now it works...

But the installer somehow wrote LVM metadata to /dev/sda1 (which is now
my plain ext3 root partition) during my struggles with the Debian installer.

Now every time when I run any lvm tool like vgscan, or lvdisplay,
the tools blurt out:
    'Incorrect metadata area header checksum'.

Running with -v -v shows that it happens when the tool scans /dev/sda1.
But /dev/sda1 is just a Linux partition with ext3 fs on it.

Is there any way I can remove the LVM metadata area header so that the
tools just ignore that partition instead of warning me every time? ;)

Let me know :)

Regards,
Sander.
-- 
| It was a business doing pleasure with you!
| 1024D/08CEC94D - 34B3 3314 B146 E13C 70C8  9BDB D463 7E41 08CE C94D
