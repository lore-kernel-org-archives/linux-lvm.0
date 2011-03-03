Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p230DwiX030919
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 19:13:58 -0500
Received: from eastrmfepo101.cox.net (eastrmfepo101.cox.net [68.230.241.213])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p230DmBC006376
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 19:13:48 -0500
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo101.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP
	id <20110303001348.DDIA3772.eastrmfepo101.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 19:13:48 -0500
Message-ID: <4D6EDD66.3070901@cox.net>
Date: Wed, 02 Mar 2011 19:14:30 -0500
From: "Clyde E. Kunkel" <clydekunkel7734@cox.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2-monitor slow shutdown
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
To: lvm-list <linux-lvm@redhat.com>

On Rawhide and Fedora 15 systems with one lv snapshot, shutdown/reboot 
hangs for about a minute waiting for lvm2-monitor to shutdown.  I see 
msgs that lvm2-monitor.service process exited, code=exited status=1, and 
msgs that the there are still devices being monitored and a msg that lvm 
is "Refusing to exit."

I can disable the service with systemd and shutdown/reboot proceeds in a 
more expected rapid manner.

Is this normal?


-- 
Regards,
OldFart
