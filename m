Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6QK0xS0012954
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:01:00 -0400
Received: from mail1.wpi.edu (MAIL1.WPI.EDU [130.215.36.91])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6QK0wvY016417
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:00:58 -0400
Received: from mcafee.wpi.edu (MCAFEE.WPI.EDU [130.215.36.86])
	by mail1.wpi.edu (8.14.1/8.14.1) with SMTP id l6QK0v6B023962
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:00:57 -0400
Received: from UTILITY4.WPI.EDU (UTILITY4.WPI.EDU [130.215.36.218])
	by SMTP.WPI.EDU (8.13.8/8.13.8) with ESMTP id l6QK0vBY011147
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:00:57 -0400
	(envelope-from kastein@wpi.edu)
Received: from webmail.wpi.edu (localhost.localdomain [127.0.0.1])
	by UTILITY4.WPI.EDU (8.14.1/8.14.1) with ESMTP id l6QK0vD5023697
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:00:57 -0400
Message-ID: <63576.192.52.57.33.1185480057.squirrel@webmail.wpi.edu>
Date: Thu, 26 Jul 2007 16:00:57 -0400 (EDT)
From: "Ken Stein" <kastein@WPI.EDU>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] libLVM progress?
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

Hi all,
I'm working on putting together an automatic menu/popup-based RAID/volume
management configuration utility, and I'm interested in possibly setting
it up to support LVM systems.  Hopefully, the user will be able to plug in
a new hard drive and the system will prompt them as to what they want to
do with it, including adding it to various arrays or logical volumes,
leaving it as reserve space, etc.  I spent some time googling for
information on how to interface with the LVM system, and the only things I
could find were:
* use system() or exec() style calls to run the command line LVM utilities
as needed.  Works, but not exactly elegant, and definitely not efficient.
* delve deeply into the LVM utilities source code to find the ioctl calls
and/or procfs+sysfs structures being used, then duplicate this in my own
work.
* use a premade LVM interface library.

The last idea came to me when I realized almost everything has a library
these days, so I looked into it, but all I can find is people saying the
current/old liblvm should not be used for new development or as a platform
to base any new liblvm work off of, and people suggesting that a liblvm
project be started to work with the new LVM systems and export a stable,
logical public API.  However, I can't find any mention of actual work
being done on this - if I'm just missing it, a link would be great. 
Otherwise, is there any work I can base a modern liblvm implementation off
of, or anyone I can talk to about joining a liblvm project to help out?

Ken Stein @ kastein@wpi.edu
WPI ECE Class of 2008
