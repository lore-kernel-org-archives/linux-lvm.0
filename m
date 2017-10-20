Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B10600C0
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 21:06:35 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 26DB3C13DA3E
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 21:06:32 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Oct 2017 23:06:30 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <378f8596-dfae-2557-a53f-b614940bba22@strike.wu.ac.at>
References: <59E60975.2000001@strike.wu.ac.at>
	<378f8596-dfae-2557-a53f-b614940bba22@strike.wu.ac.at>
Message-ID: <0f68ed1ad140673541aa8a896b78de6e@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?unable_to_recover_from_degraded_raid1_with_?=
	=?utf-8?q?thin__pool_=28was=3A_activation_mode=3Ddegraded_doesn=27?=
	=?utf-8?q?t_work_with_thin_pool=29?=
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
Cc: Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>

Il 19-10-2017 13:45 Alexander 'Leo' Bergolth ha scritto:
> On 10/17/2017 03:45 PM, Alexander 'Leo' Bergolth wrote:
>> I just tested lv activation with a degraded raid1 thin pool.
>> Unfortunately it looks like activation mode=degraded only works for
>> plain raid1 lvs. If you add a thin pool, lvm won't activate it in
>> degraded mode. (Unless you specify --activationmode partial, which is
>> IMHO rather dangerous.)
> 
> Unfortunately I cannot even replace a faulty PV if a thin pool is 
> present.

 From you command history, I can see you are trying to remove the failed 
device (to re-add a good device later).
Instead, can you try with lvconvert --repair or lvconvert --replace? Do 
they works?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
