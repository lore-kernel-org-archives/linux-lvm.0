Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0564310016E8
	for <linux-lvm@redhat.com>; Wed,  7 Aug 2019 18:32:43 +0000 (UTC)
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC24330BD1D0
	for <linux-lvm@redhat.com>; Wed,  7 Aug 2019 18:32:41 +0000 (UTC)
Received: from [IPv6:2001:4dd7:a0a7:0:4a9:e573:283a:5db9]
	(2001-4dd7-a0a7-0-4a9-e573-283a-5db9.ipv6dyn.netcologne.de
	[IPv6:2001:4dd7:a0a7:0:4a9:e573:283a:5db9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: whissi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC3CD3494F5
	for <linux-lvm@redhat.com>; Wed,  7 Aug 2019 18:32:40 +0000 (UTC)
From: Thomas Deutschmann <whissi@gentoo.org>
Message-ID: <f393674e-bb67-45bd-9300-4b24fc0b1fe8@gentoo.org>
Date: Wed, 7 Aug 2019 20:32:35 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM complains about /etc/lvm/cache/.cache it created
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

Hi,

while reworking how we activate LVM in Gentoo's genkernel initramfs init
script, I tested some commands at boot in the following order:

# /sbin/lvm vgscan
# /sbin/lvm vgchange -ay --sysinit
# /sbin/lvm vgmknodes --ignorelockingfailure --verbose

The last command (vgmknodes) will output

>     Failed to load existing device cache from /etc/lvm/cache/.cache

I can delete this file (/etc/lvm/cache/.cache), re-run the command twice
and on the second call, after cache file was recreated by LVM, the error
is back.

So this looks like LVM is creating a cache it cannot use by itself?!


# lvm version
  LVM version:     2.02.185(2) (2019-05-13)
  Library version: 1.02.158 (2019-05-13)
  Driver version:  4.35.0
  Configuration:   ./configure --prefix=/usr --build=x86_64-pc-linux-gnu
--host=x86_64-pc-linux-gnu
    --mandir=/usr/share/man --infodir=/usr/share/info
--datadir=/usr/share --sysconfdir=/etc
    --localstatedir=/var/lib --disable-dependency-tracking
--docdir=/usr/share/doc/lvm-2.02.185
    --htmldir=/usr/share/doc/lvm-2.02.185/html --enable-static_link
--enable-pkgconfig --enable-dmeventd
    --enable-cmdlib --disable-lvmetad --with-clvmd=none
--with-cluster=none --disable-readline
    --disable-selinux --with-mirrors=internal --with-snapshots=internal
--with-thin=internal
    --with-cache=internal --disable-udev-systemd-background-jobs
--disable-udev_sync
    --disable-udev_rules


-- 
Regards,
Thomas Deutschmann / Gentoo Linux Developer
C4DD 695F A713 8F24 2AA1 5638 5849 7EE5 1D5D 74A5
