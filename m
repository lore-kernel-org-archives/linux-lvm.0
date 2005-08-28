Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SAHiV29783
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 06:17:44 -0400
Received: from gw.osk.ch (80-218-242-213.dclient.hispeed.ch [80.218.242.213])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j7SAxERv016125
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 06:59:15 -0400
Received: from gutek.osk.ch (gutek.osk.ch [192.168.10.2])
	by gw.osk.ch (8.11.6/8.11.6) with ESMTP id j7SAHKK20237
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 12:17:20 +0200
Received: from gutek.osk.ch (localhost [127.0.0.1])
	by gutek.osk.ch (8.13.4/8.13.4) with ESMTP id j7SAHMbW015934
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 12:17:22 +0200
Received: (from osk@localhost)
	by gutek.osk.ch (8.13.4/8.13.3/Submit) id j7SAHLVn015930
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 12:17:21 +0200
Date: Sun, 28 Aug 2005 12:17:21 +0200
From: Chris Osicki <lvm@osk.ch>
Message-ID: <20050828101721.GB26065@gutek>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgscan & CDROM
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
To: linux-lvm@redhat.com

Hi 

I seam not to be able to convince vgscan to let my cdroms alone.
In the file /etc/lvm/lvm.conf I have this filter:

[ "r|/dev/cdrom.*" ]

when I run vgscan -v -v I see the following:


      /dev/cdrom1: size is 31244 sectors
  /dev/cdrom1: read failed after 0 of 2048 at 0: Input/output error
      /dev/cdrom1: size is 31244 sectors
      /dev/cdrom1: No label detected


I tried other variants of this filter without luck.
On the laptop I'm writing this message on it took several minutes for
vgscan to finish. On another PC it doesn't take that long but is
annoying. How do I convince vgscan not to scan those devices?
I tried also such a filter as test:

[ "r|/dev/pty.*" ]

it didn't work either.

I'm using 

  LVM version:     2.01.09 (2005-04-04)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.4.0

I would be very thankful for any help.

Regards,
Chris
