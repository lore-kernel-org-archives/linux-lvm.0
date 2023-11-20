Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C712B89
	for <linux-lvm@lists.linux.dev>; Mon, 20 Nov 2023 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TcEgyeYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700475188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZvfWkfDpi3Z/KadczFu+hVYit3GXNJ/QCSGlJKJiq4=;
	b=TcEgyeYAhAR/4oWxlStcxmmXITS9mJC244Xqk9vPbaw97qVv7NRNxMSXywAQyUwxl2IINV
	nQn17G9/lQRLPy4fYKsLUpnvkxgZ04xbfBNoLauVfWLM6vARsq33uUb16jieF6w4oXFwuH
	Srqyh6elkzFJJyHx0DR4Vl2m9lDUCco=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-C5bo9k4wOlWDZySZaepjTg-1; Mon,
 20 Nov 2023 05:13:04 -0500
X-MC-Unique: C5bo9k4wOlWDZySZaepjTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AA99381BE8D;
	Mon, 20 Nov 2023 10:13:04 +0000 (UTC)
Received: from [10.43.17.34] (unknown [10.43.17.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFDFB2026D66;
	Mon, 20 Nov 2023 10:13:02 +0000 (UTC)
Message-ID: <247e1290-78b7-46fe-b10a-80a571bdec09@redhat.com>
Date: Mon, 20 Nov 2023 11:13:01 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: Martin Wilck <martin.wilck@suse.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "teigland@redhat.com" <teigland@redhat.com>
Cc: Heming Zhao <heming.zhao@suse.com>, Glass Su <glass.su@suse.com>,
 "bmarzins@redhat.com" <bmarzins@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "prajnoha@redhat.com" <prajnoha@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com> <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <ZVbGObxAvSsYqvvo@itl-email> <ZVeF_vUYxaRLLJbv@redhat.com>
 <ZVfGLbjio7PEWG/L@itl-email> <ZVfKMHFtaG8UyvwG@redhat.com>
 <ZVfVE4IYDiePcHDo@itl-email>
 <2e718cd763c6a69162be0d6d7e5211f73bf84a19.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <2e718cd763c6a69162be0d6d7e5211f73bf84a19.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 17. 11. 23 v 22:05 Martin Wilck napsal(a):
> On Fri, 2023-11-17 at 16:03 -0500, Demi Marie Obenour wrote:
>> On Fri, Nov 17, 2023 at 02:16:48PM -0600, David Teigland wrote:
>>> On Fri, Nov 17, 2023 at 02:57:35PM -0500, Demi Marie Obenour wrote:
>>>>> Yes, the devices file is intended to be a default feature of
>>>>> lvm since the
>>>>> commit above.
>>>> Could LVM issue a deprecation warning if DEFAULT_USE_DEVICES_FILE
>>>> is set
>>>> to 0 or system.devices is not set at runtime?
>>> No, deprecated implies we're planning to remove it, which we
>>> probably
>>> never will.
>> Still, distros need to know that they should make the change.
> I think David and Zdenek did not say distros _should_ make the change.
> They can, but it requires substantial adaptations and testing.


There is quite 'noticeable' difference in behavior of lvm2 with this change.

So having users without support behind their backs facing the sudden change 
where lvm2 does no longer sees all devices as it used to is somewhat 
problematic - we are adding changes and messages to the tool to improve this 
as we meet the real life situation. Once there will be enough coverage - the 
change will likely happen.

But as mentioned earlier, there are situation where the original filtering is 
simply easier to deal with. So both variants will stay in place.


Zdenek



