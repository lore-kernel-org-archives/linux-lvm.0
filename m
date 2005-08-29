Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7TK6DV19812
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 16:06:13 -0400
Received: from gw.osk.ch (80-218-244-161.dclient.hispeed.ch [80.218.244.161])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7TK5rqt016760
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 16:06:04 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7TK5p006533
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 22:05:52 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7TK5m8V032761
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 22:05:49 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7TK5mC2032757
	for linux-lvm@redhat.com; Mon, 29 Aug 2005 22:05:48 +0200
Date: Mon, 29 Aug 2005 22:05:48 +0200
From: Chris Osicki <lvm@osk.ch>
Subject: Re: [linux-lvm] vgscan & CDROM Solved
Message-ID: <20050829200548.GB11271@gutek.swissptt.ch>
Mime-Version: 1.0
Content-Disposition: inline
Reply-To: lvm@osk.ch,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Hi,

My vgscan filter problem has been solved.
The lvm.conf file as distributed with Gentoo is the example.conf from
the LVM2 distribution.
In this file the accept filter 

   filter = [ "a/.*/" ]

appears earlier in this file as the reject examples.
I was assuming that the last match would be significant. After reading
again the lvm.conf man page I noticed this assumption was wrong.
The first match determines if the device will be accepted or ignored.
As simple as this.

Thanks to you all for your time.

Regards,
Chris
