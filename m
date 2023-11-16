Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18128E09
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D0LiVhcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700143470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3mXF8wzQBt/3WG7I3iHQICd4sjsHAnGbxQx6cJ7YqM=;
	b=D0LiVhcNFQtMyIAuuwg3lfqkmJTJ+alIyPlTuLgIpP85ss2w2qRMGyE05XxF++O/dpc24P
	P5klxBnoUotF4XNO8dO34nwKTRpQnbRPBLSnhKrhDxK5zqgp3AKF05qMTxsUPMSYoXnEtP
	0lHxAbIDyKembV9xak4KZrZGmTC48q4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-PWskO_fOPJSY5ZcCXKz_Ug-1; Thu, 16 Nov 2023 09:04:23 -0500
X-MC-Unique: PWskO_fOPJSY5ZcCXKz_Ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3FBA185A7A5;
	Thu, 16 Nov 2023 14:03:58 +0000 (UTC)
Received: from [10.45.225.191] (unknown [10.45.225.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBDF71C060AE;
	Thu, 16 Nov 2023 14:03:56 +0000 (UTC)
Message-ID: <c1b148d3-d27e-4d94-aeff-a6bc13996005@redhat.com>
Date: Thu, 16 Nov 2023 15:03:54 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>,
 "teigland@redhat.com" <teigland@redhat.com>
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>, Glass Su
 <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>,
 "prajnoha@redhat.com" <prajnoha@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com> <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <12b4acebc76db5a3d85a2a9c9c275255a848f922.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <12b4acebc76db5a3d85a2a9c9c275255a848f922.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 16. 11. 23 v 14:46 Martin Wilck napsal(a):
> On Thu, 2023-11-16 at 14:37 +0100, Zdenek Kabelac wrote:
>> Current upstream has set this default value as 0  (in configure.ac)
>>
>> RHEL builds use this setting as 1.  (Possibly even Fedora nowadays).
>>
>> The major problem with turning this  to 1 is the distribution must be
>> 'ready'
>> with such relatively invasive change as it changes also requirements
>> on how
>> the boot image is created  (devicesfile must be copied to ramdisk).
>>
>> So Suse  may try to set this setting  to 1  and see what all breaks.
> ... and the man page may need fixing?


Yep - quite likely it would deserve some chapter in 'lvm' man page.

Worth to be noted - existing filters are not going anywhere out -  devicesfile 
is jiust another mechanism how to limit device set.

For some cases  devicesfile present a more simple way - for some others - 
filters are clearly a better mechanism which doesn't require updating files in 
the filesystem.

Both filtering systems should be equivalent and work equally well - there is 
no plan to phase out existing filter logic.


Zdenek

