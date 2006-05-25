Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PCjMZN023579
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 08:45:22 -0400
Received: from orbit.amstsd.com (cosmas.supportdept.com [216.109.197.115])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PCjL4g004370
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 08:45:22 -0400
Received: from 192.168.1.12 ([192.168.1.12])
	by orbit.amstsd.com (Kerio MailServer 6.1.3)
	for linux-lvm@redhat.com; Thu, 25 May 2006 08:45:14 -0400
Date: Thu, 25 May 2006 08:45:13 -0400
From: Dustin Schuemann <schuemann@supportdept.com>
Message-ID: <C09B1F19.3972%schuemann@supportdept.com>
Mime-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] Xraids and lvm
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

I have two xraid's that are on /dev/sda1 and /dev/sdb1. The device on
/dev/sda1 is formatted ext3. What I would like to do is format /dev/sdb1 as
ext3 and then create a volume out of the two that doesn't lose the data on
/dev/sda1. Is this possible without reformatting and then creating the
volume and copying back.

Thanks

-------------------------------------
Dustin Schuemann
AMS The Support Department
549 Ottawa Ave NW #103
Grand Rapids, MI 49503
(616) 235-0725
schuemann@supportdept.com
