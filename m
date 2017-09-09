Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 769ED5C552
	for <linux-lvm@redhat.com>; Sat,  9 Sep 2017 22:04:39 +0000 (UTC)
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id C129F356CC
	for <linux-lvm@redhat.com>; Sat,  9 Sep 2017 22:04:36 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr001msb.fastweb.it
	(8.5.140.05) id 59A06223009E42C7 for linux-lvm@redhat.com;
	Sun, 10 Sep 2017 00:04:35 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 10 Sep 2017 00:04:35 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
Message-ID: <0c6c96790329aec2e75505eaf544bade@assyoma.it>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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

Il 08-09-2017 12:35 Gionatan Danti ha scritto:
> Hi list,
> as by the subject: is it possible to reserve space for specific thin
> logical volumes?
> 
> This can be useful to "protect" critical volumes from having their
> space "eaten" by other, potentially misconfigured, thin volumes.
> 
> Another, somewhat more convoluted, use case is to prevent snapshot
> creation when thin pool space is too low, causing the pool to fill up
> completely (with all the associated dramas for the other thin
> volumes).
> 
> Thanks.

Hi all,
anyone with some informations?

Any comment would be very appreciated :)
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
