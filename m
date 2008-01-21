Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0LE31xk012879
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 09:03:01 -0500
Received: from slartibartfast.qult.net (Debian-exim@qult.net [82.238.217.46])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0LE2elB032458
	for <linux-lvm@redhat.com>; Mon, 21 Jan 2008 09:02:41 -0500
Received: from zenon.in.qult.net ([192.168.0.1])
	by slartibartfast.qult.net with esmtp (Exim 4.67)
	(envelope-from <lvm@qult.net>) id 1JGxEV-0006CH-RF
	for linux-lvm@redhat.com; Mon, 21 Jan 2008 15:02:39 +0100
Received: from ig by zenon.in.qult.net with local (Exim 4.67)
	(envelope-from <lvm@qult.net>) id 1JGxEV-0004cF-P6
	for linux-lvm@redhat.com; Mon, 21 Jan 2008 15:02:39 +0100
Date: Mon, 21 Jan 2008 15:02:39 +0100
From: Ignacy Gawedzki <lvm@qult.net>
Message-ID: <20080121140239.GA16686@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] How to hide a "Linux LVM" partition away from Windows?
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

Hi everyone,

I've been looking for the answer for some time now and it is apparently
nowhere to be found, so I resolved to ask it here.

Somehow unexpectedly, Windows "sees" LVM partitions (partition type 8e) and
shows them in the explorer and in other places.  Of course it doesn't
understand the format and I don't have access to their contents from there,
but nevertheless it happens to offer a "format..." entry in the contextual
menu (brrrr... quite frightening!).  Obviously, LVM just doesn't care that
much about the partition type when it scans for PVs, so I could probably just
put something else here (e.g. Linux, 82).

I was just wondering whether anybody here could provide with some insight
about this (why doesn't Windows simply ignore these partitions or whether
there are better tricks to hide them from it).  I find it pretty useful to be
able to identify LVM PVs when using fdisk for example (curiously enough,
gparted doesn't understand the 8e type).

-- 
Save the whales. Feed the hungry. Free the mallocs. 
