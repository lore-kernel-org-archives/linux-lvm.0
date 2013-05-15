Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4FJmeAa013366
	for <linux-lvm@redhat.com>; Wed, 15 May 2013 15:48:40 -0400
Received: from smtp2.macqel.be (smtp2.macqel.be [194.78.208.39])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4FJma5f028548
	for <linux-lvm@redhat.com>; Wed, 15 May 2013 15:48:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp2.macqel.be (Postfix) with ESMTP id EE142130D5F
	for <linux-lvm@redhat.com>; Wed, 15 May 2013 21:48:34 +0200 (CEST)
Received: from smtp2.macqel.be ([127.0.0.1])
	by localhost (mail.macqel.be [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kOtMJFOa1IK for <linux-lvm@redhat.com>;
	Wed, 15 May 2013 21:48:33 +0200 (CEST)
Received: from frolo.macqel.be (frolo.macqel [10.1.40.73])
	by smtp2.macqel.be (Postfix) with ESMTP id 57D56130D4B
	for <linux-lvm@redhat.com>; Wed, 15 May 2013 21:48:33 +0200 (CEST)
Date: Wed, 15 May 2013 21:48:33 +0200
From: Philippe De Muyter <phdm@macq.eu>
Message-ID: <20130515194833.GA28447@frolo.macqel>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [maybe off-topic] which software project for a aix disk
	partition	scanner for linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

After having looked after a AIX LVM logical volume discovery tool and a
AIX JFS file system driver for linux, I have written both myself (for
read-only access only). I plan to submit the jfs driver (which I currently
have called jfsv3) to lkml, but the partition scanner does not fit well
in block/partitions, which supports only contiguous partitions. Similarly
kpartx (part of multipath-tools) does seem to have the same limitations.

I am currently able to produce a table for input of dmsetup, but dmsetup
is a generic tool that does not support any particular partition layout.

I would like to get some suggestions of existing software projects where
my code would fit well.

Thanks in advance

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
