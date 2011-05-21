Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4LMcP4u001271
	for <linux-lvm@redhat.com>; Sat, 21 May 2011 18:38:25 -0400
Received: from out4.smtp.messagingengine.com (out4.smtp.messagingengine.com
	[66.111.4.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4LMcODu028388
	for <linux-lvm@redhat.com>; Sat, 21 May 2011 18:38:24 -0400
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 11F6620AA2
	for <linux-lvm@redhat.com>; Sat, 21 May 2011 18:38:24 -0400 (EDT)
Message-Id: <1306017503.3487.1454529429@webmail.messagingengine.com>
From: "Lee Gold" <leegold@operamail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
Date: Sat, 21 May 2011 15:38:23 -0700
Subject: [linux-lvm] LVM - Combining different hard drives with different
	specs ?
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
To: linux-lvm@redhat.com


Hi,

I have a 100GB IDE HD that will fill up soon. I have a 1TB SATA drive I
want to add. I am using Ubuntu Server 10.04, I installed the existing
100GB drive using LVM, only a single initial HD. I aim to increase my
storage capacity under the server's document root /var/www... Before I
get started hopefully asking intelligent questions and giving the needed
information to help you help me, I wanted to ask this initial question:

These two drives are different, they surely have different performance.
Will this be a problem? If it was RAID I think matching drives are
needed. I just want to add storage capacity with acceptable performance
for a local in-house server.

Thanks,

Lee G.



-- 
http://www.fastmail.fm - Send your email first class
