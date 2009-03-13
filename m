Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2DHl0H2007352
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 13:47:00 -0400
Received: from nazgul.esiway.net (Nazgul.esiway.net [193.194.16.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2DHkZr1005722
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 13:46:35 -0400
Received: from Megathlon.ESI (Ghost.esi.it [193.194.16.225])
	by nazgul.esiway.net (8.13.8/8.13.8) with ESMTPS id n2DHkYcd027914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 18:46:34 +0100
Received: from frodo.esi (Frodo.ESI [10.10.10.13])
	by Megathlon.ESI (8.14.1/8.14.1) with ESMTP id n2DHkXCr023369
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 18:46:33 +0100
Message-ID: <49BA9BF9.3070507@esiway.net>
Date: Fri, 13 Mar 2009 18:46:33 +0100
From: Marco Colombo <linux-lvm@esiway.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] fsync() and LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi, I'm a long time user of both PostgreSQL and LVM. So far I've been quite
happy with both. But a recent thread on the PostgreSQL list made me
unconfortable. What is this thing they're referring to, fsync()'s being
ignored? Makes me feel like I'm running on thin ice, without even
knowing. Before I start phasing out LVM from all my PostgreSQL installations
(as they suggest), I'd like to hear some kind of confirmation.
This is quite scary.

http://archives.postgresql.org/pgsql-general/2009-03/msg00204.php

In my understanding:

fsync():  force data from OS memory to disk (ending up in the disk cache)
write barrier: force data from disk cache to disk platters

If you disable write-back cache on the disks, you no longer need write
barriers. But apparently they claim LVM being unsafe even with disks
caches in write-thru mode, which surprises me a lot.

.TM.
