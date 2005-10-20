Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KKhwV30014
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 16:43:58 -0400
Received: from smtpauth04.mail.atl.earthlink.net
	(smtpauth04.mail.atl.earthlink.net [209.86.89.64])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9KKhlPW032656
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 16:43:52 -0400
Received: from [24.199.75.35] (helo=debpaq.beazk.net)
	by smtpauth04.mail.atl.earthlink.net with asmtp (Exim 4.34)
	id 1EShGI-0003E6-Oz
	for linux-lvm@redhat.com; Thu, 20 Oct 2005 16:43:42 -0400
Received: from karline by debpaq.beazk.net with local (Exim 3.35 #1 (Debian))
	id 1EShGH-0005Cr-00
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 16:43:41 -0400
Date: Thu, 20 Oct 2005 16:43:41 -0400
From: Erik Karlin <e_karlin@yahoo.com>
Message-ID: <20051020204341.GZ13606@beazk.net>
Mime-Version: 1.0
Content-Disposition: inline
Sender: Erik Karlin <karline@beazk.net>
Subject: [linux-lvm] LVM1 -> LVM2 with failed disk
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

I've been running debian lvm10 on my machine because 2.4.22 didn't have
dm support and I couldn't figure out how to get the patches working.

I've since upgraded to 2.4.27 but never upgraded to lvm2. I do run in on
two other machines.

Of course, one of my disks died. In the past, I used the -P partial flag
to get the lvm to start so I could copy off my data from the "good" pv,
but under lvm10, I don't see that option.

What are my options. Can I upgrade from lvm10 to lvm2 with a failed
disk. The lvm doesn't start and while I can pvdisplay /dev/hda4 I cannot
vgdisplay or lvdisplay (obviously) since the vg isn't starting.

Can I put in a dummy drive, somehow tell lvm to pvcreate a pv on the new
drive with the same ID and then get the vg to come up?

Any other ideas. I'd like to salvage the data that is physically on the
working drive.


Thanks
