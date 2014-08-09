Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s79Di1L6007894
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 09:44:01 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s79Dhweh026202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2014 09:43:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id DA3BE200428
	for <linux-lvm@redhat.com>; Sat,  9 Aug 2014 15:43:56 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id iOz7h-hW0FUM for <linux-lvm@redhat.com>;
	Sat,  9 Aug 2014 15:43:56 +0200 (CEST)
Received: from [192.168.200.131] (host-62-245-233-61.customer.m-online.net
	[62.245.233.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 86C9A2002CB
	for <linux-lvm@redhat.com>; Sat,  9 Aug 2014 15:43:56 +0200 (CEST)
Message-ID: <53E6259B.8090902@mglug.de>
Date: Sat, 09 Aug 2014 15:43:55 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] howto cache a thinpool-device?
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

Im playing around with the new cache options. Ive created a lvm-device
on my cache-disk named lvx-cache (vg is dmivg). Additionally Ive created
a thinpool-device named winthinpool.

Now i wanted to use my cache-device to cache my thinpool-lvm, but this
doesnt work:

~# lvconvert --type cache --cachepool dmivg/lvx_cache dmivg/winthinpool
  Can't cache thin-pool volume dmivg/winthinpool.

isnt is possible to cache a thinpool-device?

Tfh!
Oliver
