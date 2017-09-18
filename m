Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B8E5CC05
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 17:52:10 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 283388553E
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 17:52:08 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.05) id 59A9E6BA00B778F5 for linux-lvm@redhat.com;
	Mon, 18 Sep 2017 19:52:06 +0200
Received: from gdanti-lenovo.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 89E4428E2F1
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 19:52:06 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
Date: Mon, 18 Sep 2017 19:52:01 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
being an heavy snapshot user, I wonder if (and how) to silence such a 
warning:

"WARNING: Sum of all thin volume sizes (2.00 GiB) exceeds the size of 
thin pool cl_gdanti-lenovo/thinpool (1.00 GiB)!"

I fully understand the reasoning for this warning, but snapshots are 
almost guaranteed to raise it. I found that by setting the 
thin_pool_autoextend_threshold the warning disappears, but on some pool 
I would rather like to left autoextend disabled.

So, any changes to disable the warning at least when taking snapshots?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
