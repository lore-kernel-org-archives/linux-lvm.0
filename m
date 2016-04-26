Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QGd4pO021884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 12:39:05 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E34D80B22
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 16:39:03 +0000 (UTC)
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	u3QGd0X7003833
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2016 09:39:02 -0700
Message-ID: <571F99A3.9040305@tlinx.org>
Date: Tue, 26 Apr 2016 09:38:59 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <B6589C63-B7F2-4E7C-A725-7499F0FDBB97@repostor.com>
In-Reply-To: <B6589C63-B7F2-4E7C-A725-7499F0FDBB97@repostor.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvremove does not remove /dev/mapper/...-cow...
	and	...-real...
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





Tomas Dalebjork wrote:
> Hi.
>
> I have noticed that if a thick snapshot device is created
> # /sbin/lvcreate --size size --snapshot --name snap /dev/system/lvname
> And later removed
> # /sbin/lvremove system/lvname
----
It's been known to me, and I mentioned it a few-several years
back.

I use dmsetup to remove those extra partitions after ensuring they
are no longer active.
