Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o611vh8k020939
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2010 21:57:43 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o611vUqa018329
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2010 21:57:31 -0400
Received: by iwn7 with SMTP id 7so2147910iwn.33
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2010 18:57:30 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Jun 2010 21:57:30 -0400
Message-ID: <AANLkTimqXPM9Ue86ubgdXiT5ujbzk6CX4Ts5uGRoB0q-@mail.gmail.com>
From: =?ISO-8859-1?Q?Eric_B=E9langer?= <snowmaniscool@gmail.com>
Subject: [linux-lvm] dmeventd man page doesn't get installed with proper
	Makefile target
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

Hello,

I'm trying to package device-mapper and lvm2 in their own seperate
packages by using the latest release (LVM2.2.02.69.tgz). However, when
I use the install_device-maper target, both dmeventd and dmsetup
binairies gets installed but only the dmsetup man page gets installed.
 The dmeventd man page gets installed when the install_lvm2 target is
used. Is there any reason behind this behavior or is it just an
oversight?  For me, it would make more sense to have the dmeventd man
page installed along its corresponding binary with the
install_device-maper target.

Thanks,

Eric
