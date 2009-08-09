Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n79NW6J8009134
	for <linux-lvm@redhat.com>; Sun, 9 Aug 2009 19:32:06 -0400
Received: from karif.server-speed.net (karif.server-speed.net [188.40.51.140])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n79NVnDQ013937
	for <linux-lvm@redhat.com>; Sun, 9 Aug 2009 19:31:50 -0400
Received: from [192.168.4.247] (h081217049118.dyn.cm.kabsi.at [81.217.49.118])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by karif.server-speed.net (Postfix) with ESMTPSA id 149D3138044
	for <linux-lvm@redhat.com>; Mon, 10 Aug 2009 01:31:41 +0200 (CEST)
Message-ID: <4A7F5C5C.3020601@server-speed.net>
Date: Mon, 10 Aug 2009 01:31:40 +0200
From: Florian Pritz <bluewind@server-speed.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] can't remove snapshots
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I want to use snapshots for my backup script, but I have a strange problem:

# lvremove -f /dev/VG0/homesnap
Can't remove open logical volume "homesnap"

lsof/fuser don't show anything and it's not mounted. This happens if
roughly 50% of the cases and after that the creation of snapshots
sometimes also fails. If you have any idea what could be wrong please
tell me. Thanks.

Distro: Archlinux
Kernel:          2.6.30.4
LVM version:     2.02.48 (2009-06-30)
Library version: 1.02.33 (2009-06-30)
Driver version:  4.14.0

- --
Thanks
Florian Pritz -- {flo,bluewind}@server-speed.net
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQIcBAEBAgAGBQJKf1xcAAoJEG0WVcFM4cE+BHwP/0s6vj2p87AuUxkWbgbGfowX
a6pa5Z+0DdU+cqjDJ9wIDfRadtIdBZi0MKfslPxci8dopSOTEiEsrRMNQGyaUdk3
np5NSBDAmI7/tzUVJ5d+eA4hk4f3VMFgMv/l4vx5xsVrZxdGAB8ACcFJ4n4tikVz
e557ajALBxrQDoVu9xotTqSGB/iI4zpY0iFM/dvamqPn8eJLp40NIK5JjGBAMCxA
99U+xBPx9zgSNrhQTEOo/yWovx1TCn5JmDRJwhErKzQoqCuuKoe1ZnFmmLf+vWeP
zVX6GOYG/eF8KG+v32UHknMkcQjBMhytT8LmePpZ2LekBziNZMhVjZLfgegUEl1v
9Xst5Fm1IZn6gTPza27hdcQJhqxLfVB5LJtZjromlFFKux8J6YyQoUW+b0BJZ+A+
Hvi096tmcM5TjjMdz0yAgBk+ZE6LxLHOKzLyFb7jyQ4Zl5cmK3TJw+poMgp3T+pw
pvb4hoakoidLGVNO6tR9Ukes82fctp7fNNtRNpMdOdruU9+KllBYm1ZRubAZZyLV
tPckfEFGaNPUJltxqu/xSJZnZfUnb8yppmNi5EvL+fY26WHrUgDdZ3+lJS0ec5jh
HLPLTYeGPkRDyKogJgamP2Sk+pXfGjYcZYwLjDC44Zbjsj2mmwfFqvX9fu5WiWCX
/AQK29m5OC6P0FFRRyvw
=OxPD
-----END PGP SIGNATURE-----
