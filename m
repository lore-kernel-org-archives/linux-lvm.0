Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7O8gfcm004345
	for <linux-lvm@redhat.com>; Sat, 24 Aug 2013 04:42:41 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7O8gd9i021559
	for <linux-lvm@redhat.com>; Sat, 24 Aug 2013 04:42:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 17D2D2003F2
	for <linux-lvm@redhat.com>; Sat, 24 Aug 2013 10:42:38 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id pzLbBToaKsXa for <linux-lvm@redhat.com>;
	Sat, 24 Aug 2013 10:42:37 +0200 (CEST)
Received: from [192.168.7.142] (46.128.33.1.dynamic.cablesurf.de [46.128.33.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id D83042003F0
	for <linux-lvm@redhat.com>; Sat, 24 Aug 2013 10:42:37 +0200 (CEST)
Message-ID: <521871FD.8000700@mglug.de>
Date: Sat, 24 Aug 2013 10:42:37 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] howto speed-up thinpool-devices?
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

Im using thinpool-devices (and snapshots, too). I know, thinpool-devices
arent the fastest one, but maybe there could make more use of read (and
maybe write) caching. In my test-system are 32GB of ram, but there is a
max use of cache about <1GB, not more, by heavily use of these devices.

Is it possible to speed up the reading with growing up the cache use?
The /sys/block/dm-X/.. directories have lots of parameters, but Im not
experienced for that. Maybe Im looking@the wrong place and modifying
kernel parameters (scheduler etc.) are the better way?

Tfh!
Oliver
