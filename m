Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2FMuLU3006033
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 18:56:21 -0400
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mx1.redhat.com (Postfix) with ESMTPS id 6C71F711C4
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 22:56:20 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l124so28562751wmf.1
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 15:56:20 -0700 (PDT)
Received: from [192.168.192.99] (ip-94-113-160-102.net.upcbroadband.cz.
	[94.113.160.102])
	by smtp.gmail.com with ESMTPSA id i5sm319557wjx.15.2016.03.15.15.56.17
	for <linux-lvm@redhat.com> (version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2016 15:56:17 -0700 (PDT)
References: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56E89311.1030408@gmail.com>
Date: Tue, 15 Mar 2016 23:56:17 +0100
MIME-Version: 1.0
In-Reply-To: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] disabling udev_sync and udev_rules
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
To: linux-lvm@redhat.com

Dne 15.3.2016 v 23:31 Serguei Bezverkhi (sbezverk) napsal(a):
> Hello folks,
>
> While trying to make lvm work within a docker container I came across an issue when all lvcreate/lvremove got stuck indefinetly or until control-c. When I checked process I noticed lvm was waiting on one semaphore, I found that other folks hit similar issue and they fixed it by setting  udev_sync and udev_rules to 0. It also helped my case too.
>
> I would greatly appreciate if you could share your thought if this change in future can potentially have any negative impact.
>
> Thank you

Hi


To 'unblock' stuck processes waiting on udev cookie - you could run:

'dmsetup udevcomplete_all'


However the key question is - how you could get stuck.
That may need further debugging.

You would need to expose your OS  version and also version of lvm2 in use.

Non working cookies are bad - and disabling udev sync is even more bad idea...

Regards

Zdenek
