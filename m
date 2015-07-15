Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6FHpONE011226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 13:51:24 -0400
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mx1.redhat.com (Postfix) with ESMTPS id 1770732C42B
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 17:51:23 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so4703834wib.0
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2015 10:51:21 -0700 (PDT)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102])
	by smtp.gmail.com with ESMTPSA id q4sm8985755wju.14.2015.07.15.10.51.20
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jul 2015 10:51:20 -0700 (PDT)
References: <55A6565A.6060307@mglug.de>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <55A69D97.8040308@gmail.com>
Date: Wed, 15 Jul 2015 19:51:19 +0200
MIME-Version: 1.0
In-Reply-To: <55A6565A.6060307@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Howto get real size of thinpool-snap?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.7.2015 v 14:47 Oliver Rath napsal(a):
> Hi list,
>
> if I create a snapshot of a volume in a thinpool, first only metadata
> need space. Later, through copy-on-write, the real needed size grows. Is
> it possible to get this size?
>


When you access thin-pool kernel metadata - you could write your own tool
to parse i.e. thin_dump output and calc all info you want.

There is no 'runtime' info (since it would be quite expensive to maintain such 
info all the time).

Currently lvm2 doesn't support 'life' access to running thin-pool,
but you may eventually use  dmsetup message to take snapshot and access this 
info runtime (since kernel target supports this).

Zdenek
