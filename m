Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279EAC433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  3 Feb 2022 12:10:21 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-zW5hJr8NPymimJgiCGkwVA-1; Thu, 03 Feb 2022 07:10:18 -0500
X-MC-Unique: zW5hJr8NPymimJgiCGkwVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615EE84B9A6;
	Thu,  3 Feb 2022 12:10:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0812B76108;
	Thu,  3 Feb 2022 12:10:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5CFB1809CB8;
	Thu,  3 Feb 2022 12:10:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 213C9xfk015157 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 3 Feb 2022 07:09:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6753FC080B1; Thu,  3 Feb 2022 12:09:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A1BC080A2
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 12:09:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 455271C05EAA
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2022 12:09:59 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-473-4ni6eYsxOqWMg3HKM7uPeA-1; Thu, 03 Feb 2022 07:09:57 -0500
X-MC-Unique: 4ni6eYsxOqWMg3HKM7uPeA-1
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <gllg-linux-lvm@m.gmane-mx.org>) id 1nFar4-0006Gi-9T
	for linux-lvm@redhat.com; Thu, 03 Feb 2022 13:04:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: linux-lvm@redhat.com
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Date: Thu, 3 Feb 2022 13:04:44 +0100
Message-ID: <50555afd-28f5-45ba-e6a9-6252b356354e@gmail.com>
References: <YfWkwtOTFYxDyYrW@itl-email>
	<6da8a7fc-4ca4-9c1d-c547-dcba827c5c99@gmail.com>
	<YfXcxHenCZw4+EFX@itl-email>
	<4bb347f0-b63b-d6f6-d501-1318053d0e56@gmail.com>
	<YfbApm+9ac6iBbbg@itl-email>
	<849ab633-ec3d-a0a5-38bf-72b87bbba2c5@gmail.com>
	<Yfnn+BcjuukqjfVO@itl-email>
	<3adf6eb1-94ac-dd91-e3e6-f0d44cd36b89@gmail.com>
	<YfsgcwXnOouviZgc@itl-email>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.4.0
In-Reply-To: <YfsgcwXnOouviZgc@itl-email>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM performance vs direct dm-thin
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Message-ID: <20220203120444.SsrelSz84_42Pf2BUSymKnX2kwF5w3pHnvHgsxVn7Jw@z>

Dne 03. 02. 22 v 1:23 Demi Marie Obenour napsal(a):
> On Wed, Feb 02, 2022 at 11:04:37AM +0100, Zdenek Kabelac wrote:
>> Dne 02. 02. 22 v 3:09 Demi Marie Obenour napsal(a):
>>> On Sun, Jan 30, 2022 at 06:43:13PM +0100, Zdenek Kabelac wrote:
>>>> Dne 30. 01. 22 v 17:45 Demi Marie Obenour napsal(a):
>>>>> On Sun, Jan 30, 2022 at 11:52:52AM +0100, Zdenek Kabelac wrote:
>>>>>> Dne 30. 01. 22 v 1:32 Demi Marie Obenour napsal(a):
>>>>>>> On Sat, Jan 29, 2022 at 10:32:52PM +0100, Zdenek Kabelac wrote:
>>>>>>>> Dne 29. 01. 22 v 21:34 Demi Marie Obenour napsal(a):

>> Ensuring all steps in state-machine are always correct is not exactly simple.
>> But since I've not heard about off-by-one problem for a long while -  I
>> believe we've managed to close all the holes and bugs in double-commit
>> system
>> and metadata handling by thin-pool and lvm2.... (for recent lvm2 & kernel)
> 
> How recent are you talking about?  Are there fixes that can be
> cherry-picked?  I somewhat recently triggered this issue on a test
> machine, so I would like to know.

I'd avoid cherry-picking unless you have deep knowledge about all connections 
between patches.
Always use the latest released kernel for your comments whether things are 
slow or fast.

>> Here you are missing the core of problem from kernel POV aka
>> how the memory allocation is working and what are the approximation in
>> kernel with buffer handling and so on.
>> So whoever is using  'loop' devices in production systems in the way
>> described above has never really tested any corner case logic....
> 
> In Qubes OS the loop device is always passed through to a VM or used as
> the base device for an old-style device-mapper snapshot.  It is never
> mounted on the host.  Are there known problems with either of these
> configurations?
> 

Inefficient design - you should prefer to pass devices directly.
AKA you might have some benefits at creation times, but overall performance of 
VM will be lower during its actual usage... pick your poison...

Especially if the backend is made by NVMe - any layer adds tremendous amount 
of latencies (and in fact DM alone is also noticeable)...

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

