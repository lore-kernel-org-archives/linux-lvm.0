Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lADHDfa1015506
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 12:13:41 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lADHDYZw008973
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 12:13:34 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 390CE3DCA0
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 18:13:27 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id B2F92947E
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 18:13:27 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id FiY-708nNzsY for <linux-lvm@redhat.com>;
	Tue, 13 Nov 2007 18:13:21 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-79-104-215.netcologne.de
	[87.79.104.215]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue, 13 Nov 2007 18:13:21 +0100 (CET)
Message-ID: <4739DB30.9060805@wpkg.org>
Date: Tue, 13 Nov 2007 18:13:20 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] balooning/dynamic snapshots?
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

Right now, one has to specify a snapshot size.

If the snapshot takes more space that one specified with -s (size), that 
snapshot is automatically dropped, and is no longer usable.


Sometimes, it is just not possible to know beforehand how much data will 
change, but on the other hand, specifying 100% snapshot size is not 
possible or hard to estimate.


Is it possible to make a "balooning", or dynamic LVM snapshot? That is, 
if the snapshot reaches its maximum, it will be automatically resized, 
provided we still have space on the medium.

Looking at lvm manuals, I didn't see such a feature, and the only 
possibility seems to be to create a userspace program which would check 
the status of the snapshots periodically, and resize them if needed - 
but this seems crude, and may not work sometimes (very loaded system, 
volumes with a lot of writes etc.).


-- 
Tomasz Chmielewski
http://lists.wpkg.org
