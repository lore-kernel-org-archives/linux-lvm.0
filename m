Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8OD1e5w023036
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 09:01:40 -0400
Received: from smtpauth.rollernet.us (smtpauth.rollernet.us [208.79.240.5])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m8OD1UjR026082
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 09:01:30 -0400
Received: from smtpauth.rollernet.us (localhost.localdomain [127.0.0.1])
	by smtpauth.rollernet.us (Postfix) with ESMTP id D90E1594004
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 06:01:28 -0700 (PDT)
Received: from webmail.rollernet.us (webmail.rollernet.us [208.79.241.67])
	(Authenticated sender: francois@saidi-oliver.com) 	by
	smtpauth.rollernet.us (Postfix) with ESMTP 	for <linux-lvm@redhat.com>; 
	Wed, 24 Sep 2008 06:01:28 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 24 Sep 2008 06:08:41 -0700
From: <francois@saidi-oliver.com>
Message-ID: <67b9580f6a9725a6355067fc1a29dd75@localhost>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Moving a lvm volume to a new computer
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

I am little bit new to lvm concept but i've set up a lvm volume on a raid1
as follow :
i have two physical disks sda and sdb. They have both 2 partitions which
makes the md0 and md1 of the raid. I've set up the /boot on the md0 and an
lvm (called RaidLvm) on md1 (with 4 partitions /, /usr, /home and /var).
Everything works fine. The problem began when i added a bunch of two disks
(hda and hdb) with no raid but a large lvm partition over the two of them
(called data) (this lvm comes from a previous computer).
When i try to boot, the kernel finds the data lvm but cannot find the
RaidLvm
and just stops booting...
I've tried to export the data lvm, but that doens't help...

Any idea?

Thanks,
Franky
