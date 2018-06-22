Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F6C5D755
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 18:10:37 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id E9F453086242
	for <linux-lvm@redhat.com>; Fri, 22 Jun 2018 18:10:35 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr013msb.fastweb.it
	(5.8.050.04) id 5B2C502D000FAACE for linux-lvm@redhat.com;
	Fri, 22 Jun 2018 20:10:35 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 22 Jun 2018 20:10:34 +0200
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <f158d4decb9c99fec72c600553ef519b@assyoma.it>
Subject: [linux-lvm] =?utf-8?q?Thin_metadata_volume_bigger_than_16GB_=3F?=
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

Hi list,
I wonder if a method exists to have a >16 GB thin metadata volume.

When using a 64 KB chunksize, a maximum of ~16 TB can be addressed in a 
single thin pool. The obvious solution is to increase the chunk size, as 
128 KB chunks are good for over 30 TB, and so on. However, increasing 
chunksize is detrimental for efficiency/performance when heavily using 
snapshot.

Another simple and very effective solution is to have multiple thin 
pools, ie: 2x 16 GB metadata volumes with 64 KB chunksize is good, 
again, for over 30 TB thin pool space.

That said, the naive but straightforward would be to increase maximum 
thin pool size. So I have some questions:

- is the 16 GB limit an hard one?
- there are practical consideration to avoid that (eg: slow thin_check 
for very bug metadata volumes)?
- if so, why I can not find any similar limit (in the docs) for cache 
metadata volumes?
- what is the right thing to do when a 16 GB metadata volume fill-up, if 
it can not be expanded?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
