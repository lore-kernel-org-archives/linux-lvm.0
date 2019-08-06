Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C14D6092D
	for <linux-lvm@redhat.com>; Tue,  6 Aug 2019 23:36:35 +0000 (UTC)
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85E27C028323
	for <linux-lvm@redhat.com>; Tue,  6 Aug 2019 23:36:34 +0000 (UTC)
Received: from [IPv6:2001:4dd3:77a9:0:f0fa:beef:be27:425c]
	(2001-4dd3-77a9-0-f0fa-beef-be27-425c.ipv6dyn.netcologne.de
	[IPv6:2001:4dd3:77a9:0:f0fa:beef:be27:425c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: whissi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F34B4349A27
	for <linux-lvm@redhat.com>; Tue,  6 Aug 2019 23:36:32 +0000 (UTC)
From: Thomas Deutschmann <whissi@gentoo.org>
Message-ID: <d21ca2aa-5d34-2938-2f8a-622f7aa5403d@gentoo.org>
Date: Wed, 7 Aug 2019 01:36:27 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
  Configuration:   ./configure --prefix=/usr --build=x86_64-pc-linux-gnu --host=x86_64-pc-linux-gnu
    --mandir=/usr/share/man --infodir=/usr/share/info --datadir=/usr/share --sysconfdir=/etc
    --localstatedir=/var/lib --disable-dependency-tracking --docdir=/usr/share/doc/lvm-2.02.185
    --htmldir=/usr/share/doc/lvm-2.02.185/html --enable-static_link --enable-pkgconfig --enable-dmeventd
    --enable-cmdlib --disable-lvmetad --with-clvmd=none --with-cluster=none --disable-readline
    --disable-selinux --with-mirrors=internal --with-snapshots=internal --with-thin=internal
    --with-cache=internal --disable-udev-systemd-background-jobs --disable-udev_sync
    --disable-udev_rules


-- 
Regards,
Thomas Deutschmann / Gentoo Linux Developer
C4DD 695F A713 8F24 2AA1 5638 5849 7EE5 1D5D 74A5
