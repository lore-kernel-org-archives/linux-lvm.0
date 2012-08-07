Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q77C0fJm017443
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2012 08:00:41 -0400
Received: from mx1.internecto.net (polaris.internecto.net [176.9.245.29])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q77C0cKa025762
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2012 08:00:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by mx1.internecto.net (Postfix) with ESMTP id 30F75A03FE
	for <linux-lvm@redhat.com>; Tue,  7 Aug 2012 12:00:37 +0000 (UTC)
Received: from mx1.internecto.net ([127.0.0.1])
	by localhost (mail.polaris.internecto.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id kXCGJwp5c3-E for <linux-lvm@redhat.com>;
	Tue,  7 Aug 2012 12:00:36 +0000 (UTC)
Received: from internecto.net (5ED4FDEB.cm-7-5d.dynamic.ziggo.nl
	[94.212.253.235])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	(Authenticated sender: lists@internecto.net)
	by mx1.internecto.net (Postfix) with ESMTPSA id 45AF7A03FA
	for <linux-lvm@redhat.com>; Tue,  7 Aug 2012 12:00:36 +0000 (UTC)
Date: Tue, 7 Aug 2012 14:00:34 +0200
From: Mark van Dijk <lists+linux-lvm@internecto.net>
Message-ID: <20120807140034.51bcd7af@internecto.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Getting 'incorrect semaphore state' on self configured
 server kernel
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

Hello,

When I run lvcreate and lvremove I get the errors you can see at the
bottom of this email. I have been seeing this on kernels I configured
from scratch, right now this is version 3.5 on an x64 running ArchLinux.

I must have made a mistake with the kernel's options or I am
overlooking something. It's clearly a configuration option because I
don't get these errors with ArchLinux's distribution kernel. So what am
I doing wrong?

Note, LVM does work fine apart from these issues.

After many compiling iterations I'm all out of ideas and while I'm
aware that one can work around the errors LV's with the -Zn options,
I'd rather get this stuff fixed :)

This is my kernel config: http://pastebin.com/isVsziSe

The error:

# lvcreate -L100M -n foobar -v array 
/dev/array/foobar: not found: device not cleared
Aborting. Failed to wipe start of new LV.
semid 983040: semop failed for cookie 0xd4d19ee: incorrect semaphore
state Failed to set a proper state for notification semaphore
identified by cookie value 223156718 (0xd4d19ee) to initialize waiting
for incoming notifications.

I appreciate all help I can get.

-- 
Kind regards,
Mark van Dijk.                  ,-----------------------------------
-------------------------------'           Tue Aug 07 12:00 UTC 2012
Today is Prickle-Prickle, the 73rd day of Confusion in the YOLD 3178
