Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6P9dHV13130
	for <linux-lvm@redhat.com>; Mon, 25 Jul 2005 05:39:17 -0400
Received: from hathor.necrofish.org.uk (no-reverse.bsve.net [213.253.141.5]
	(may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6P9d5HI030585
	for <linux-lvm@redhat.com>; Mon, 25 Jul 2005 05:39:09 -0400
Message-ID: <42E4B322.6070600@dsvr.co.uk>
Date: Mon, 25 Jul 2005 10:38:42 +0100
From: Ceri Storey <ceri.storey@dsvr.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Linux LVM snmp MIB.
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
To: linux-lvm@redhat.com
Cc: russell@coker.com.au

Eyup.

My company is looking at doing per logical volume I/O statistics 
gathering via SNMP for our hosting platform, and was wondering if there 
was any pre-defined MIB for this purpose?

I've found 
https://www.redhat.com/archives/linux-lvm/2001-November/msg00140.html 
which references 
http://people.debian.org/~wakkerma/iana/oid.html#asgn-debian.project , 
but that doesn't detail how the sub-tree is laid out. Has anyone defined 
an "official" MIB for this, or are people just using ad-hoc structures 
for this?

Cheers.
-- 
ceri.storey@dsvr.co.uk (Ceri Storey)
Systems Administrator
