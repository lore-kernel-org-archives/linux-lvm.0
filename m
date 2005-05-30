Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4UDikO21514
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 09:44:46 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4UDievM017716
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 09:44:40 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DckV9-0006w2-7o
	for linux-lvm@redhat.com; Mon, 30 May 2005 15:40:19 +0200
Received: from ua-83-227-131-3.cust.bredbandsbolaget.se ([83.227.131.3])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 15:40:19 +0200
Received: from joakim by ua-83-227-131-3.cust.bredbandsbolaget.se with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 15:40:19 +0200
From: Joakim Verona <joakim@verona.se>
Date: Mon, 30 May 2005 14:49:01 +0200
Message-ID: <m3ekboyj42.fsf@naru.home>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] timeout problem
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

Hello list,

I have an experimental mediapartition built like this:
-  a reiserfs partition on lvm
-  the lvm resides on 8 ide disks
-  the ide drives are kept in a spun down state using hdparm

When I access a file the required drives spin up. This can take a long
time, since several drives might need to spin up in sequence, so what
happens is I get an I/O error.

the next time I try to access the partition, the drives are spun up,
so theres no problem.

I havent been able to find the relevant timout parameter.

The docs for LVM1 mentions a timout parameter on lvchange, but this
seems gone in LVM2. 

Also I'm not exactly shure if it even is a LVM2 partition.
It was created a long time ago, and migrated to Fedora core 3
recently. It seems like the lvm2 tools are compatible with the lvm1 i
format. 

Sorry for the confusion, any hints deeply apreciated.


-- 
Joakim Verona
www.verona.se
