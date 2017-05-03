Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 197687D51A
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 12:40:51 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F28F80F7C
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 12:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id B1359413
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 14:40:47 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Ocqp1rH8eW6T for <linux-lvm@redhat.com>;
	Wed,  3 May 2017 14:40:47 +0200 (CEST)
Received: from [192.168.178.39] (unknown [80.128.44.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 759AB412
	for <linux-lvm@redhat.com>; Wed,  3 May 2017 14:40:47 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <41fcd340-48ac-1e21-5092-a5c6a3be549e@mglug.de>
Date: Wed, 3 May 2017 14:40:41 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] different stripesize on thinpool/thinlv
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

Hi List,

using different stripesize for Thinpools result 64kb stripesize for ThinLVs.

---------- snip ------------------

root@w541:/home/oliver# lvcreate  -L 20G --thin-pool levg/mythinpool
levg /dev/sda4 --stripes 1 --stripesize 1024
  WARNING: Sum of all thin volume sizes (7,64 TiB) exceeds the size of
thin pools and the size of whole volume group (901,17 GiB)!
  For thin pool auto extension activation/thin_pool_autoextend_threshold
should be below 100.
  Logical volume "mythinpool" created.
root@w541:/home/oliver# lvcreate --name fixi -V 10G -T levg/mythinpool
  Using default stripesize 64,00 KiB.
  Logical volume "fixi" created.

---------- snap ------------------

Odd thing:

The striping-Options should prepare multiple disk in parallel for the
thinpool. But then the ThinLV says "using 64kb stripe", although 1024MB
is set for thinpool.


My used versions:

root@w541:/home/oliver# lvcreate --version
  LVM version:     2.02.171(2)-git (2017-04-13)
  Library version: 1.02.140-git (2017-04-13)
  Driver version:  4.35.0
  Configuration:   ./configure --enable-lvmetad
root@w541:/home/oliver# thin_check --version
0.7.0-rc6


Whats wrong here?

Tfh!

Regards,
Oliver
