Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RBB7t0025639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 07:11:07 -0400
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 6223480B56
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 11:11:02 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.04) id 57173DDE005C11CE for linux-lvm@redhat.com;
	Wed, 27 Apr 2016 13:11:01 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 51C2B2A4311
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 13:11:00 +0200 (CEST)
References: <5714EE58.8080400@assyoma.it>
	<dede65b769d68f0988811f89fb10fdcb@assyoma.it>
	<571A2F6C.6050006@redhat.com> <571B350F.9050708@assyoma.it>
	<c01a4d679e96185c56352648cb6159fc@assyoma.it>
	<571DE943.40204@redhat.com> <571F14B9.8020706@assyoma.it>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <57209E44.7080705@assyoma.it>
Date: Wed, 27 Apr 2016 13:11:00 +0200
MIME-Version: 1.0
In-Reply-To: <571F14B9.8020706@assyoma.it>
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

>
> I absolutely agree with you that in no case metadata exhaustion can be
> considered part of a "regular work-flow". At the same time, I often do
> "stress test" specifically crafted to put the software/hardware in the
> worst possible condition. In this manner, should an exceptionally bad
> situation occour, I know how to deal with it.
>
> I have another question: does this bug only happen when metadata space
> is exausted? I am asking this because searching for other peoples with
> the same error message, I read this bug report:
> http://www.redhat.com/archives/dm-devel/2014-March/msg00021.html
>
> The bug described in the message above does not necessarily happen at
> metadata exaustion time, as confirmed here:
> https://bugzilla.kernel.org/show_bug.cgi?id=68801
>
> I understand that these are old (2014) bugs and that were fixed in Linux
> 3.14 but, using thin LVM volumes in production systems (albeit with RH 7
> only), I want to be reasonably sure that no show-stopper bug can hit me.
> Are current RH OSes (6.7 and 7.2) immune from this bug (metadata
> corruption even if tmeta is not full)?
>
> Thanks.
>

Hi all,
any thoughts on that?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
