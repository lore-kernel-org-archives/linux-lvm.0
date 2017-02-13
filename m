Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C48B015866
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 14:33:58 +0000 (UTC)
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58E4FA89D
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 14:33:57 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id le4so233844wjb.0
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2017 06:33:56 -0800 (PST)
References: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
	<7252715d-7ef5-a105-becf-03c028b3e1cc@gmail.com>
	<CAPWV3hunUyuPY2UMPQS_2OSenEMt4Ygb2Kn1+q00_+e5BOyR4Q@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <a7ce046a-ec7f-f2fd-0ce4-8b76da0b2d95@gmail.com>
Date: Mon, 13 Feb 2017 15:33:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAPWV3hunUyuPY2UMPQS_2OSenEMt4Ygb2Kn1+q00_+e5BOyR4Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Caching policy in machine learning context
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
To: Jonas.Degrave@ugent.be
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.2.2017 v 15:19 Jonas Degrave napsal(a):
> I am on kernel version 4.4.0-62-generic. I cannot upgrade to kernel 4.9, as it
> did not play nice with
> CUDA-drivers: https://devtalk.nvidia.com/default/topic/974733/nvidia-linux-driver-367-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-higher/
> <https://devtalk.nvidia.com/default/topic/974733/nvidia-linux-driver-367-57-and-up-do-not-install-on-kernel-4-9-0-rc2-and-higher/>
>
> Yes, I understand the cache needs repeated usage of blocks, but my question is
> basically how many? And if I can lower that number?
>
> In our use case, you basically read a certain group of 100GB of data
> completely about 100 times. Then another user logs in, and reads a different
> group of data about 100 times. But after a couple of such users, I observe
> that only 20GB in total has been promoted to the cache. Even though the cache
> is 450GB big, and could easily fit all the data one user would need.
>
> So, I come to the conclusion that I need a more aggressive policy.
>
> I now have a reported hit rate of 19.0%, when there is so few data on the
> volume that 73% of the data would fit in the cache. I could probably solve
> this issue by making the caching policy more aggressive. I am looking for a
> way to do that.

There are 2 'knobs' - one is 'sequential_threshold' where cache tries
to avoid promoting 'long' continuous reads into cache  - so if
you do 100G reads then these likely meet the criteria and are avoided from
being promoted (and I think this one is not configurable for smq.

Other is 'migration_threshold' which limit bandwidth load on cache device.

You can try to change its value:

lvchange --cachesettings migration_threshold=10000000  vg/cachedlv

(check with dmsetup status)

Not sure thought how are there things configurable with smq cache policy.

Regards

Zdenek
