Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n7E0DrEw002496
	for <linux-lvm@redhat.com>; Thu, 13 Aug 2009 20:13:53 -0400
Received: from mail-gx0-f206.google.com (mail-gx0-f206.google.com
	[209.85.217.206])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n7E0DeXY010641
	for <linux-lvm@redhat.com>; Thu, 13 Aug 2009 20:13:40 -0400
Received: by gxk2 with SMTP id 2so1542962gxk.7
	for <linux-lvm@redhat.com>; Thu, 13 Aug 2009 17:13:40 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 13 Aug 2009 20:13:39 -0400
Message-ID: <7fcd249b0908131713x6aeddd5bm8975df94d3c3a39a@mail.gmail.com>
From: =?ISO-8859-1?Q?Eric_B=E9langer?= <snowmaniscool@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Clarifications wanted about locking process
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

Hi,

Since I updated from lvm2 2.02.48 to 2.02.51, I'm getting this message
on boot-up:

Write locks are prohibited with --ignorelockingfailure.
Unable to obtain global lock.

I found that it comes from the: "/sbin/lvm vgscan
--ignorelockingfailure --mknodes" command in /etc/rc.sysinit.  I was
getting the same message from "/sbin/lvm vgchange
--ignorelockingfailure -a y" when using the 2.02.49 (or 2.02.50?)
versions.

Is this just an harmless informational message?  I don't understand
why it would want a write lock when scanning or activating volume
groups. Wouldn't a read lock be sufficient?  Also, shouldn't the use
of the --ignorelockingfailure option disable all locking-related
warnings?  Any clarifications would be appreciated.

Thanks,
Eric
