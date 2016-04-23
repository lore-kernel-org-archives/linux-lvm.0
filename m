Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3N8f0XC007349
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 04:41:00 -0400
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 5E96F81F03
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 08:40:57 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr003msb.fastweb.it
	(8.5.140.04) id 57173F4D0030BDC1 for linux-lvm@redhat.com;
	Sat, 23 Apr 2016 10:40:55 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 6E4CA2C03E2
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 10:40:55 +0200 (CEST)
References: <5714EE58.8080400@assyoma.it>
	<dede65b769d68f0988811f89fb10fdcb@assyoma.it>
	<571A2F6C.6050006@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <571B350F.9050708@assyoma.it>
Date: Sat, 23 Apr 2016 10:40:47 +0200
MIME-Version: 1.0
In-Reply-To: <571A2F6C.6050006@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing ThinLVM metadata exhaustion
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

On 22/04/2016 16:04, Zdenek Kabelac wrote:
>
>
> I assume you miss newer kernel.
> There was originally this bug.
>
> Regards
>
> Zdenek

Hi Zdenek,
I am running CentOS 6.7 fully patched, kernel version 
2.6.32-573.22.1.el6.x86_64

Should I open a BZ report for it is RH aware of the problem on RH/CentOS 
6.7?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
