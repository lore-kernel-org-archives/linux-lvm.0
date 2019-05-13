Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4AE5D706
	for <linux-lvm@redhat.com>; Mon, 13 May 2019 17:25:03 +0000 (UTC)
Received: from mr012msb.fastweb.it (mr012msb.fastweb.it [85.18.95.109])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9189C306E171
	for <linux-lvm@redhat.com>; Mon, 13 May 2019 17:25:00 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 13 May 2019 19:24:50 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <7e07a7b4-c4c3-bb43-6305-3949c1d1a849@redhat.com>
References: <1117624956.13982625.1557612463407.JavaMail.zimbra@karlsbakk.net>
	<7e07a7b4-c4c3-bb43-6305-3949c1d1a849@redhat.com>
Message-ID: <5343bab31e1d4ec5162cd73342388596@assyoma.it>
Subject: Re: [linux-lvm] =?utf-8?q?LVM_and_HSM=3F?=
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
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>

Il 13-05-2019 10:26 Zdenek Kabelac ha scritto:
> Hi
> 
> There is no technical problem to enable caching of cached volume (aka
> convert cache_cdata LV into another 'cached' volume.
> And as long as there are not errors anywhere - it works.
> Difficulty comes with solving error cases - and that's the main reason
> it's not enable so far.
> So I don't see big issue with enabling usage on 'user's own risk'.

Hi, how "cache of cached volume" is tiered/hierarchical storage?
In such a case, total available space is the sum of all storage 
hierarchy. For example, using 1 TB SSD + 8 TB HDD would result in 9 TB 
total in a tiered/hierarchical case, while "only" 8 TB on a cached 
setup.

Am I missing something here?

The interesting thing is that LVM already supports something similar to 
tiered storage, as pvmove can be used to migrate hot physical extent to 
faster devices. The hard/manual thing is to determine *which* extent to 
move/migrate.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
