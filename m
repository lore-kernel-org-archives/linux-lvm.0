Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E68260265
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 10:35:40 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id CD88D3683C
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 10:35:37 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.05) id 59A9E6BA0049E170 for linux-lvm@redhat.com;
	Fri, 8 Sep 2017 12:35:36 +0200
Received: from gdanti-lenovo.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 0F4802CD6EB
	for <linux-lvm@redhat.com>; Fri,  8 Sep 2017 12:35:36 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
Date: Fri, 8 Sep 2017 12:35:30 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Reserve space for specific thin logical volumes
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
as by the subject: is it possible to reserve space for specific thin 
logical volumes?

This can be useful to "protect" critical volumes from having their space 
"eaten" by other, potentially misconfigured, thin volumes.

Another, somewhat more convoluted, use case is to prevent snapshot 
creation when thin pool space is too low, causing the pool to fill up 
completely (with all the associated dramas for the other thin volumes).

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
