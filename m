Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA7ED18671
	for <linux-lvm@redhat.com>; Wed, 24 Oct 2018 17:34:41 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B1573002725
	for <linux-lvm@redhat.com>; Wed, 24 Oct 2018 17:34:40 +0000 (UTC)
Received: from [192.168.0.5] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id D107E7803AE
	for <linux-lvm@redhat.com>; Wed, 24 Oct 2018 17:34:36 +0000 (UTC)
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <30755b1a-1e39-bd9b-560f-b4cc34c1bc5a@free.fr>
Date: Wed, 24 Oct 2018 19:34:36 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: [linux-lvm] Question about speed of boot with mirror and lvm
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I've a PC with Ubuntu 18.04.1 LTS.

It uses a raid 1 mirror array to make one of the PV of my LVM setup. MD 
metadata is version 0.9 so at the end of the two devices.

The LVM is :

# lvs --version
 � LVM version:���� 2.02.176(2) (2017-11-03)
 � Library version: 1.02.145 (2017-11-03)
 � Driver version:� 4.37.0
 � Configuration:�� ./configure --build=x86_64-linux-gnu --prefix=/usr 
--includedir=${prefix}/include --mandir=${prefix}/share/man 
--infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var 
--disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu 
--libexecdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run 
--disable-maintainer-mode --disable-dependency-tracking --exec-prefix= 
--bindir=/bin --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin 
--with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2 
--with-cache=internal --with-clvmd=corosync --with-cluster=internal 
--with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 
--with-default-pid-dir=/run --with-default-run-dir=/run/lvm 
--with-default-locking-dir=/run/lock/lvm --with-thin=internal 
--with-thin-check=/usr/sbin/thin_check 
--with-thin-dump=/usr/sbin/thin_dump 
--with-thin-repair=/usr/sbin/thin_repair --enable-applib 
--enable-blkid_wiping --enable-cmdlib --enable-cmirrord 
--enable-dmeventd --enable-dbus-service --enable-lvmetad 
--enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld 
--enable-notify-dbus --enable-pkgconfig --enable-readline 
--enable-udev_rules --enable-udev_sync

#

Which is the standard Ubuntu LVM.

Since the upgrade to 18.04 booting is very slow as the kernel/boot has 
to scan for all the devices.

I've followed the previous discussion about LVM and MD, did not 
understand everything of it so I have a question : How could I speed up 
the boot process ? Is masking one of the two disks in lvm.conf with a 
filter is a good idea ? Or am I dumb ?

Many thanks in advance for your help and advice.

-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
