Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0Q4EXnB020081
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 23:14:33 -0500
Received: from mail.myself.gen.nz
	(Debian-exim@203-97-171-123.cable.telstraclear.net [203.97.171.123])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0Q4EWkr002514
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 23:14:33 -0500
Received: from malkuth.lan.myself.gen.nz ([192.168.1.20] helo=[127.0.0.1])
	by mail.myself.gen.nz with esmtp (Exim 4.50) id 1HAIT8-0001Ky-Oa
	for linux-lvm@redhat.com; Fri, 26 Jan 2007 17:13:52 +1300
Message-ID: <45B97FF1.6050008@myself.gen.nz>
Date: Fri, 26 Jan 2007 17:13:37 +1300
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Using existing lvm2 volumes with clvm?
Reply-To: steve@myself.gen.nz,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi there,
I have an existing setup of volume groups which I'd like to share on a 
cluster using iscsi and clvm.

Is this possible?

The volume groups and logical volumes have already been created and the 
physical volumes are Linux software RAID arrays. The LV's are populated 
with filesystems which I'd like to make available across the network 
(for XEN virtualisation and migration).

If I export these physical volumes with iscsi and use them as physical 
volumes in clvm on other machines, can this be expected to work or will 
it exterminate the existing volume groups on those physical volumes?
:)

Thanks!
