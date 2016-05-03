Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43AAn3C026823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 06:10:49 -0400
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id E8B433B71C
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 10:10:47 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr003msb.fastweb.it
	(8.5.140.04) id 57173F4D00B8E3FD for linux-lvm@redhat.com;
	Tue, 3 May 2016 12:05:33 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id BDB5B268E38
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 12:05:32 +0200 (CEST)
References: <5714EE58.8080400@assyoma.it>
	<dede65b769d68f0988811f89fb10fdcb@assyoma.it>
	<571A2F6C.6050006@redhat.com> <571B350F.9050708@assyoma.it>
	<c01a4d679e96185c56352648cb6159fc@assyoma.it>
	<571DE943.40204@redhat.com> <571F14B9.8020706@assyoma.it>
	<57209E44.7080705@assyoma.it>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <572877E7.2010701@assyoma.it>
Date: Tue, 3 May 2016 12:05:27 +0200
MIME-Version: 1.0
In-Reply-To: <57209E44.7080705@assyoma.it>
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

On 27/04/2016 13:11, Gionatan Danti wrote:
>>
>> I absolutely agree with you that in no case metadata exhaustion can be
>> considered part of a "regular work-flow". At the same time, I often do
>> "stress test" specifically crafted to put the software/hardware in the
>> worst possible condition. In this manner, should an exceptionally bad
>> situation occour, I know how to deal with it.
>>
>> I have another question: does this bug only happen when metadata space
>> is exausted? I am asking this because searching for other peoples with
>> the same error message, I read this bug report:
>> http://www.redhat.com/archives/dm-devel/2014-March/msg00021.html
>>
>> The bug described in the message above does not necessarily happen at
>> metadata exaustion time, as confirmed here:
>> https://bugzilla.kernel.org/show_bug.cgi?id=68801
>>
>> I understand that these are old (2014) bugs and that were fixed in Linux
>> 3.14 but, using thin LVM volumes in production systems (albeit with RH 7
>> only), I want to be reasonably sure that no show-stopper bug can hit me.
>> Are current RH OSes (6.7 and 7.2) immune from this bug (metadata
>> corruption even if tmeta is not full)?
>>
>> Thanks.

Hi all,
sorry for the bump, but I would really like to have a more precise 
understanding of the quoted bug, specifically:

- if it presents itself on metadata-exhausted volumes only;
- if it can bite on non-full tmeta, are RH 6.7 and 7.2 vulnerable to it?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
