Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i37HcLj13986
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 13:38:21 -0400
Received: from smtp01.mrf.mail.rcn.net (smtp01.mrf.mail.rcn.net [207.172.4.60])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i37HcJWB016780
	for <linux-lvm@redhat.com>; Wed, 7 Apr 2004 13:38:19 -0400
Received: from 209-6-22-202.c3-0.smr-ubr1.sbo-smr.ma.cable.rcn.com
	([209.6.22.202] helo=oddbit.com)
	by smtp01.mrf.mail.rcn.net with esmtp (Exim 3.35 #7)
	id 1BBH0F-0007NC-00
	for linux-lvm@redhat.com; Wed, 07 Apr 2004 13:38:19 -0400
Message-ID: <40743C87.4080805@oddbit.com>
Date: Wed, 07 Apr 2004 13:38:15 -0400
From: Lars Kellogg-Stedman <lars@oddbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshots failing w/ kernel 2.6.4
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Howdy all,

I'm running Fedora Core 2 test 1 + updates, which means:

	kernel-2.6.4-1.305
	lvm2-2.00.08-5
	device-mapper-1.00.07-3.1

When I try to create a snapshot of a 50g LV named 'home':

	# lvm lvcreate -s -L 5g -n home.snap0 /dev/vg0/home

I receive the following error:

	device-mapper ioctl cmd 9 failed: Invalid argument
	Couldn't load device 'vg0-home.snap0'.
	Problem reactivating origin home

This also results in some bogus entries in both the list of LVs and the 
device-mapper.  Manually removing the dm entry (dmsetup remove ...) and 
then removing the LV seems to work.

Is this a known problem?

Thanks,

-- Lars
