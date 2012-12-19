Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBJMfoZv025578
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2012 17:41:51 -0500
Received: from ebox.rath.org (ebox.rath.org [173.255.235.238])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBJMfmic024064
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2012 17:41:49 -0500
Received: from wsip-68-225-19-102.oc.oc.cox.net ([68.225.19.102]
	helo=[10.11.13.57])
	by ebox.rath.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Nikolaus@rath.org>) id 1TlSKh-0006TQ-Pn
	for linux-lvm@redhat.com; Wed, 19 Dec 2012 22:41:47 +0000
Message-ID: <50D242B2.8080108@rath.org>
Date: Wed, 19 Dec 2012 14:41:54 -0800
From: Nikolaus Rath <Nikolaus@rath.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Changing owner of lv device with udev
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

I'm having some trouble changing the owner of a logical device. I added
the following udev rule to both my initramfs and the real root:

SUBSYSTEM=="block",
ENV{DM_UUID}=="LVM-yYuoI8k05GWxZnz9BeEIwPUGGeojzF3dZZmXTYRqC051Tllj76OHdDlzYhKZUu7u",
OWNER="1000"

If I disable and re-enable this logical volume with lvchange, it gets
created with the correct owner.

However, when I boot the computer, the device always ends up being owned
by root:disk instead.

On the other hand, if I look at the permissions right before initramfs
executes the real init, the permissions are actually correct.

So, at some point between execution of the real init and completed
startup, something overwrites the owner of by device, but both before
and afterward the rule gets applied correctly.

I first blamed this on udev
(http://article.gmane.org/gmane.comp.sysutils.systemd.devel/7605), but I
was told that the problem might be with the special way that LVM uses
udev rules.

Does anyone have an idea what's happening here? How can I get this to work?

Thanks,
-Nikolaus
