Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DD44600C0
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 23:57:45 +0000 (UTC)
Received: from borma.bytefoundry.com.au (borma.bytefoundry.com.au
	[163.47.20.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF470C057F8F
	for <linux-lvm@redhat.com>; Sun, 15 Jul 2018 23:57:41 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Jul 2018 09:57:36 +1000
From: Dean Hamstead <dean@bytefoundry.com.au>
In-Reply-To: <24ea4a51c91f16d55c56cea1cc622db8@assyoma.it>
References: <6f854f20-3e62-0536-40ea-9ec21e112a6d@bytefoundry.com.au>
	<6c386d31-af38-93e7-dd29-14ebfb9eb0a9@gmail.com>
	<24ea4a51c91f16d55c56cea1cc622db8@assyoma.it>
Message-ID: <c235b3b53c8c67a9718b8cf3a6e1bd01@fragfest.com.au>
Subject: Re: [linux-lvm] Recovering from lvm thin metadata exhaustion
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

I gave up and rebuilt. But thankfully the data was backed up 
sufficiently.

Dean

On 2018-07-16 07:10, Gionatan Danti wrote:
> Il 15-07-2018 21:47 Zdenek Kabelac ha scritto:
> Hi Zdenek,
> 
>> Hi
>> 
>> Try to open BZ like i.e. this one:
>> 
>> https://bugzilla.redhat.com/show_bug.cgi?id=1532071
> 
> this is quite scary, especially considering no updates on the ticket
> in recent months. How did the OP solve the issue?
> 
>> Add all possible details (lvm2 version, kernel version, lvm2 
>> metadata,...)
>> and xz compressed dump  of _meta0  device.
>> There is small hope that some metadata can be possibly restored with
>> 'hand-extension' of thin_repair tool.
> 
> Any insight on what went wrong (yes, I know, metadata space was
> exausted - but it should not result in total volume loss, right)?
> 
> Thanks.
