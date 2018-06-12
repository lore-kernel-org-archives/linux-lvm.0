Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A754510694CD
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2018 11:08:44 +0000 (UTC)
Received: from smtp1-3.goneo.de (smtp1-3.goneo.de [85.220.129.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 614E330C1116
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2018 11:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.goneo.de (Postfix) with ESMTP id A130B23F62C
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2018 13:08:39 +0200 (CEST)
Received: from smtp1.goneo.de ([127.0.0.1])
	by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1UkCg6TwpvJ for <linux-lvm@redhat.com>;
	Tue, 12 Jun 2018 13:08:38 +0200 (CEST)
Received: from [192.168.42.20] (p54ACDD15.dip0.t-ipconnect.de [84.172.221.21])
	by smtp1.goneo.de (Postfix) with ESMTPSA id D715D23F606
	for <linux-lvm@redhat.com>; Tue, 12 Jun 2018 13:08:38 +0200 (CEST)
From: Oliver Rath <oliver@greenunit.de>
Message-ID: <fe22cc78-b2ad-535e-7e4b-2e0e308e726f@greenunit.de>
Date: Tue, 12 Jun 2018 13:08:38 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Strange behaviour with thinpool and stripes
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi List,

Im creating some Thinpool here, but

# lvcreate -i 2 -I 1024 -c 4096 --type thin --thinpool dmivg/winthinpool
dmivg -V 3500G /dev/sde1 /dev/sdf1
  Command does not accept option: --stripes 2.
  Command does not accept option: --stripesize 1024.

doesnt work, but

# lvcreate -i 2 -I 1024 -c 4096 -L10G -T dmivg/pool -V 3500G --name
winthinpool
  WARNING: Sum of all thin volume sizes (3,42 TiB) exceeds the size of
thin pool dmivg/pool (10,00 GiB)!
  For thin pool auto extension activation/thin_pool_autoextend_threshold
should be below 100.
  Logical volume "winthinpool" created.

does. Whats the difference between them?

My actual build:

# lvcreate --version
  LVM version:     2.02.172(2)-git (2017-05-03)
  Library version: 1.02.141-git (2017-05-03)
  Driver version:  4.35.0
  Configuration:   ./configure --enable-lvmetad --enable-lvmpolld
--enable-udev_sync --enable-udev_rules --enable-applib --enable-cmdlib
--enable-python2_bindings

Tfh!

Oliver
