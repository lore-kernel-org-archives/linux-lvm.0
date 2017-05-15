Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383B078DCF
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 13:25:17 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85A01C04B939
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 13:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id AF6A3407
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 15:25:12 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id PUvSw-C6N70v for <linux-lvm@redhat.com>;
	Mon, 15 May 2017 15:25:12 +0200 (CEST)
Received: from [192.168.178.40] (p4FC4A345.dip0.t-ipconnect.de [79.196.163.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 43118412
	for <linux-lvm@redhat.com>; Mon, 15 May 2017 15:25:12 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <61de26b1-0849-e71f-133c-a8357b773ee9@mglug.de>
Date: Mon, 15 May 2017 15:25:11 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Howto change cachepolicy on cached thinpool devices?
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

caching the _tdata part of a thinpool works fine now. Unfortunatly with
lvchange it is not possible to change the policy (vg:dmivg,
cachepool:dmipool,thinpool:winthinpool):

# lvchange --cachepolicy cleaner dmivg/dmicache
  Operation not permitted on hidden LV dmivg/dmicache.

# lvchange --cachepolicy cleaner /dev/mapper/dmivg-winthinpool_tdata
  Operation not permitted on hidden LV dmivg/winthinpool_tdata.

# lvchange --cachepolicy cleaner dmivg/winthinpool
  Command on LV dmivg/winthinpool does not accept LV type thinpool.
Required LV types are cache cachepool .
  Command not permitted on LV dmivg/winthinpool.

The only possibility at the moment seems to change it via lowlewel
dmsetup command.

# dmsetup status dmivg-winthinpool_tdata
0 7730954240 cache 8 1458/9216 128 720896/720896 4608761 7143953 1177059
5866353 40700 761596 2993 2 metadata2 writeback 2 migration_threshold
2048 smq 0 rw -

...

How can this be done with lv*?

Tfh!
Oliver
