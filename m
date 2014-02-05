Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s15NANEw021062
	for <linux-lvm@redhat.com>; Wed, 5 Feb 2014 18:10:24 -0500
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s15NALqT028921
	for <linux-lvm@redhat.com>; Wed, 5 Feb 2014 18:10:22 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 5AAAF20040E
	for <linux-lvm@redhat.com>; Thu,  6 Feb 2014 00:10:20 +0100 (CET)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 4sjcz5oN5aWU for <linux-lvm@redhat.com>;
	Thu,  6 Feb 2014 00:10:20 +0100 (CET)
Received: from [192.168.0.11] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id AD16D20040B
	for <linux-lvm@redhat.com>; Thu,  6 Feb 2014 00:10:19 +0100 (CET)
Message-ID: <52F2C4DB.1070808@mglug.de>
Date: Thu, 06 Feb 2014 00:10:19 +0100
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] does grub(2) recognize lvm-raid-partitions?
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
To: linux-lvm@redhat.com

Hi list,

I know, that lvm2 has its own raid-managment. If I want to put i.e. an
"/" (including /boot) to an lvm-raid6-device, is grub(2) able to
recognize this device and boot from it, if i include grub-lvm-module?

Regards,
Oliver
