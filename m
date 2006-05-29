Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4TEtSw2022414
	for <linux-lvm@redhat.com>; Mon, 29 May 2006 10:55:28 -0400
Received: from mail-cn.han.nl (mail-cn.han.nl [145.74.66.11])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4TEtRjV022489
	for <linux-lvm@redhat.com>; Mon, 29 May 2006 10:55:27 -0400
Received: from vscan-cn.han.nl (venus.han.nl [145.74.65.6])
	by mail-cn.han.nl (Postfix) with ESMTP id 9291482EC
	for <linux-lvm@redhat.com>; Mon, 29 May 2006 16:55:21 +0200 (CEST)
Received: from mail-cn.han.nl ([145.74.66.11])
	by vscan-cn.han.nl (venus.han.nl [145.74.65.6]) (amavisd-new,
	port 10024) with ESMTP id 22820-07 for <linux-lvm@redhat.com>;
	Mon, 29 May 2006 16:55:20 +0200 (CEST)
Received: from mail1.han.nl (mail1.han.nl [145.74.103.11])
	by mail-cn.han.nl (Postfix) with ESMTP id C9F678380
	for <linux-lvm@redhat.com>; Mon, 29 May 2006 16:55:20 +0200 (CEST)
Received: from earth.han.nl (earth.han.nl [145.74.129.124])
	by mail1.han.nl (Postfix) with ESMTP id AF3EFC046
	for <linux-lvm@redhat.com>; Mon, 29 May 2006 16:55:20 +0200 (CEST)
From: Patrick Honing <Patrick.Honing@han.nl>
Date: Mon, 29 May 2006 16:55:20 +0200
Message-Id: <1148914520.6979.12.camel@earth.han.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Trouble creating snapshot device
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

Hello,

We are in trouble creating snapshot devices on fedora-core 4... Kernel
version: 2.6.16-1.2111_FC4smp. We have created new RPM's using the
development SRPMS (device-mapper-1.02.07-1.0 & lvm2-2.02.06-1.2.1). The
same trouble occurs with stock device-mapper & lvm2 RPM's!

Sometimes the snapshot device is created succesfully but most times is
fails... The script:

ophelia.han.nl:~# lvs
  LV      VG   Attr   LSize   Origin Snap%  Move Log Copy%
  cache   vg   -wi-ao   1.00G
  home    vg   -wi-ao 500.00M
  log     vg   -wi-ao 500.00M
  postfix vg   -wi-ao  10.00G
  tmp     vg   -wi-ao 100.00M
  usr     vg   -wi-ao 800.00M
  var     vg   -wi-ao 200.00M
ophelia.han.nl:~# lvcreate -s -n test -L 100M /dev/vg/postfix
  LV vg/test in use: not deactivating
  Couldn't deactivate new snapshot.
ophelia.han.nl:~# lvs
  LV      VG   Attr   LSize   Origin Snap%  Move Log Copy%
  cache   vg   -wi-ao   1.00G
  home    vg   -wi-ao 500.00M
  log     vg   -wi-ao 500.00M
  postfix vg   -wi-ao  10.00G
  test    vg   -wi-a- 100.00M
  tmp     vg   -wi-ao 100.00M
  usr     vg   -wi-ao 800.00M
  var     vg   -wi-ao 200.00M
ophelia.han.nl:~# mount /dev/vg/test /1
mount: you must specify the filesystem type
ophelia.han.nl:~# lvremove /dev/vg/test
Do you really want to remove active logical volume "test"? [y/n]: y
  Logical volume "test" successfully removed
ophelia.han.nl:~# lvcreate -s -n test -L 100M /dev/vg/postfix
  Logical volume "test" created
ophelia.han.nl:~# mount /dev/vg/test /1
ophelia.han.nl:~# ls /1
active  bounce  corrupt  defer  deferred  flush  hold  incoming  lost
+found  maildrop  pid  private  public  saved  trace
ophelia.han.nl:~# umount /1
ophelia.han.nl:~# lvremove /dev/vg/test
Do you really want to remove active logical volume "test"? [y/n]: y
  Logical volume "test" successfully removed
ophelia.han.nl:~# lvcreate -s -n test -L 100M /dev/vg/postfix
  LV vg/test in use: not deactivating
  Couldn't deactivate new snapshot.
ophelia.han.nl:~# mount /dev/vg/test /1
mount: you must specify the filesystem type
ophelia.han.nl:~# lvremove /dev/vg/test
Do you really want to remove active logical volume "test"? [y/n]: y
  Logical volume "test" successfully removed
ophelia.han.nl:~# lvcreate -s -n test -L 100M /dev/vg/postfix
  LV vg/test in use: not deactivating
  Couldn't deactivate new snapshot.
ophelia.han.nl:~# lvremove /dev/vg/test
Do you really want to remove active logical volume "test"? [y/n]: y
  Logical volume "test" successfully removed

Anyone any idea?


Kind regards,

Patrick

----------------------------------------------------------------------
| Patrick Honing (Patrick.Honing@han.nl)
| ICT Developer
| Intelligent Network & Middleware Services (INMS)
| Service Bedrijf SU ICT
| Hogeschool van Arnhem en Nijmegen (http://www.han.nl)
| Tel.: +31-26-3691522 Fax: +31-26-3691510
