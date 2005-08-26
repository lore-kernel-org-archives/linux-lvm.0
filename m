Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7QK7OV05213
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 16:07:24 -0400
Received: from bob.fastenal.com (bob.fastenal.com [205.243.112.24])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7QK7HwZ003976
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 16:07:18 -0400
Message-ID: <430F7668.6060500@fastenal.com>
Date: Fri, 26 Aug 2005 15:07:04 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mirror Capabilities on LVM2
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


I saw in the archives a post about LVM2 version 2.01.12 having some mirror
capabilities.  Reading through the changelog it doesn't really explain what
those capabilities are. I've downloaded 2.01.14 and installed it but alas the
man pages don't have anything about the -m option either.  So, can someone
quickly explain (or point me to documentation) what mirror options/capabilites
are currently available and what options are planned?  I'm most curious about
whether the ability to attach one lv to another and form a mirror and then split
the mirrored lv into two distinct lvs that are both mountable (similar to a
snapshot only a completely separate lv).  We use this capability within veritas
all the time when moving disk around online and its really the only thing
holding us back from scrapping veritas in favor of lvm.
