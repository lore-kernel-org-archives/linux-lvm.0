Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 845BC1797C
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 11:41:45 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26]) by mx1.redhat.com (Postfix) with ESMTP id D4F0580484
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 11:41:42 +0000 (UTC)
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Received: from osl1cloudm2.nextgentel.net ([80.202.10.59])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OY400C1IDQ6XA10@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Fri, 20 Oct 2017 13:41:41 +0200 (CEST)
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<e1f18d05e7670e9d63075854195a2c70@xenhideout.nl>
	<62efc412-fd2b-5412-9de5-015dd8136bf2@member.fsf.org>
	<133a1f046bbd53375d8c1230b2c1660f@xenhideout.nl>
From: Oleg Cherkasov <o1e9@member.fsf.org>
Message-id: <4c3d3a94-fc7e-af59-b97b-cccf840708e3@member.fsf.org>
Date: Fri, 20 Oct 2017 13:41:41 +0200
In-reply-to: <133a1f046bbd53375d8c1230b2c1660f@xenhideout.nl>
Content-language: en-US
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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

On 20. okt. 2017 12:38, Xen wrote:
> Oleg Cherkasov schreef op 20-10-2017 10:21:
>> On 19. okt. 2017 20:13, Xen wrote:
>>
>> Could it be TRIMing issue because those are from 2012?
> 
> You mean that the SATA version is too low to interleave TRIMs with data 
> access?

I think SSDs from different vendors handle trimming differently 
regardless SAS or SATA.  It is just my hypothesis if trimming is a cause 
of the problem of course.
