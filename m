Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4UKR0YP030974
	for <linux-lvm@redhat.com>; Sat, 30 May 2009 16:27:00 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [78.111.66.105])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4UKQhLY017408
	for <linux-lvm@redhat.com>; Sat, 30 May 2009 16:26:43 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.83])
	by mx03.syneticon.net (Postfix) with ESMTP id 71FD435E29
	for <linux-lvm@redhat.com>; Sat, 30 May 2009 22:26:42 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.84])
	by localhost (mx03.syneticon.net [192.168.113.83]) (amavisd-new,
	port 10025) with ESMTP id eIEyReV02DAC for <linux-lvm@redhat.com>;
	Sat, 30 May 2009 22:26:40 +0200 (CEST)
Received: from [192.168.10.145] (koln-4db48787.pool.einsundeins.de
	[77.180.135.135]) by mx03.syneticon.net (Postfix) with ESMTPSA
	for <linux-lvm@redhat.com>; Sat, 30 May 2009 22:26:40 +0200 (CEST)
Message-ID: <4A21969B.2040109@wpkg.org>
Date: Sat, 30 May 2009 22:27:07 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] does making a snapshot freeze XFS on the origin (with
	2.6.21 kernels)?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

With 2.6.21 kernel, when taking a snapshot of a volume with a XFS 
filesystem, does dm tell XFS to freeze the filesystem for the duration 
of taking a snapshot?


Or should I use:

- xfs_freeze -f ...
- make LVM snapshot
- xfs_freeze -u ...
?

How is it made with recent kernels?


-- 
Tomasz Chmielewski
http://wpkg.org
