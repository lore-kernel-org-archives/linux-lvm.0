Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9NKrGV30062
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 16:53:16 -0400
Received: from simmts8-srv.bellnexxia.net (simmts8.bellnexxia.net
	[206.47.199.166])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9NKr9gb005632
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 16:53:10 -0400
Received: from cruncher ([67.70.86.131]) by simmts8-srv.bellnexxia.net
	(InterMail vM.5.01.06.10 201-253-122-130-110-20040306) with ESMTP
	id <20051023205304.YIEI28065.simmts8-srv.bellnexxia.net@cruncher>
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 16:53:04 -0400
Message-ID: <004601c5d814$71a4d2e0$1b00a8c0@cruncher>
From: "Mike Kirk" <mike.kirk@sympatico.ca>
Date: Sun, 23 Oct 2005 16:57:56 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: 2TB partition size limit in LVM2? Or ReiserFS?
Reply-To: Mike Kirk <mike.kirk@sympatico.ca>,
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
To: linux-lvm@redhat.com

Oops, I'm a moron:

I hadn't exceeded 2TB before,  I had to enabled Large Block Device support
under device drivers --> block devices in menuconfig.

After a quick reboot, resize_reiserfs happily made me a larger filesystem,
which mounted without errors.

Sorry to clutter your group! :)

Mike
