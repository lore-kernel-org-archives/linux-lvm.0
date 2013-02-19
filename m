Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1JDbAFw011565
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2013 08:37:10 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1JDb8E1003953
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2013 08:37:08 -0500
Received: from [192.168.0.8] by pse.dyndns.org with esmtp (Exim 4.72)
	(envelope-from <pgadmin@pse-consulting.de>) id 1U7nJv-00042O-Od
	for linux-lvm@redhat.com; Tue, 19 Feb 2013 14:33:19 +0100
Message-ID: <51238003.3050709@pse-consulting.de>
Date: Tue, 19 Feb 2013 14:37:07 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] resize and snapshots with clvm
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I'm using clvm over corosync, sharing iscsi hosted PVs. I'm generally 
using Debian squeeze/wheezy, lvm2 2.2.95.

What I'm missing is the possibility to resize a LV or taking a snapshot 
of it while a volume is used on one node. I'd expect this to work on the 
active node, if the volume is inactive on all other nodes. But when I 
try that, I get
cluster request failed: Invalid argument
   Failed to suspend <logvol>

I've seen the message 
https://www.redhat.com/archives/linux-lvm/2013-January/msg00006.html ,
Compiled 2.2.98 with the patch applied 
(--with-clvmd=cman,corosync,openais --with-cluster=internal), no further 
success.
What can I do?

Regards,
Andreas
