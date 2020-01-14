Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 359257D4FF
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 08:21:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B270C85A30D
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 08:21:53 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr013msb.fastweb.it (5.8.208)
	id 5E19B49F00323437 for linux-lvm@redhat.com;
	Tue, 14 Jan 2020 09:21:46 +0100
Received: from gdanti-lenovo.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 815842646DB
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 09:21:46 +0100 (CET)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <4dd562cd-36ee-9960-58cf-8f504d4085ef@assyoma.it>
Date: Tue, 14 Jan 2020 09:21:46 +0100
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvmcache on non-lvm source?
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

Hi all,
I have a question: can lvmcache be used to cache non-lvm source (ie: a 
raw block device)?

 From the lvmcache man page I would say no; however, a direct 
confirmation will be helpful.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
