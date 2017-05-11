Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B457C773
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 07:02:03 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 095FA2D9FC5
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 07:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 2B287416
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 09:01:58 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id sg75RyD7Djrs for <linux-lvm@redhat.com>;
	Thu, 11 May 2017 09:01:58 +0200 (CEST)
Received: from [192.168.178.33] (p4FC4A0ED.dip0.t-ipconnect.de
	[79.196.160.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id E2DEE413
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 09:01:57 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <23c510c6-8a15-7f7c-bcf5-1f72b5dca994@mglug.de>
Date: Thu, 11 May 2017 09:01:57 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] configure fail with option --enable-notivy-dbus
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

configuring lvm2 failed with --enable-notify-dbus option, but
unfortunatly without no konkrete error-message:

$ ./configure --enable-lvmetad --enable-lvmpolld --enable-udev_sync
--enable-udev_rules --enable-applib --enable-cmdlib
--enable-dbus-service --enable-dmfilemapd --enable-python3_bindings
--enable-notify-dbus

[..]
checking whether to install fsadm... yes
checking whether to install blkdeactivate... yes
checking whether to use dmeventd...
checking for getline in -lc... no
checking for canonicalize_file_name in -lc... no
checking for dlopen in -ldl... no
checking for log10 in -lm... no
configure: error: bailing out


Without the last option, configure runs fine. The git-codebase is from
today, all neede libs shoud be installed, the System is Ubuntu-16.04.

What must I do?

Tfh!
Oliver
