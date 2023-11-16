Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F55364B5
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIrM/hJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700149693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5lkOAlGy8hOMqbk5uDlzOag1HBAbgZM7TNfcCCnRGVw=;
	b=bIrM/hJvoAo7ux+4oEiTe30aGLmIsTNC35BrSTaejr/Rqyfjk/ApYZ0+8FVJSjiGklcFC7
	XImC0zYhkHmZCRJAVpdhcZEteL7E56jgG3LZeS1errjWEXEWfDkTsvBfB9tJnztcCbnVt5
	SJ7zO+DdtSdiGAwAKFzmxFnsksUm5x4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-B_avTwLCNUGy-r6zDzesVg-1; Thu, 16 Nov 2023 10:48:09 -0500
X-MC-Unique: B_avTwLCNUGy-r6zDzesVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E43A185A781;
	Thu, 16 Nov 2023 15:48:08 +0000 (UTC)
Received: from [10.45.225.191] (unknown [10.45.225.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C992492BE0;
	Thu, 16 Nov 2023 15:48:06 +0000 (UTC)
Message-ID: <7c71b1f8-bf51-43f9-a824-39c1ed70e8b9@redhat.com>
Date: Thu, 16 Nov 2023 16:48:06 +0100
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
 "teigland@redhat.com" <teigland@redhat.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
 "bmarzins@redhat.com" <bmarzins@redhat.com>, Glass Su <glass.su@suse.com>,
 "hare@suse.de" <hare@suse.de>, "prajnoha@redhat.com" <prajnoha@redhat.com>,
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
 <ZVYw9eNTj7Ir6V31@redhat.com>
 <4da245517088a3bb7d8f850c0903d2d100e14b14.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <4da245517088a3bb7d8f850c0903d2d100e14b14.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 16. 11. 23 v 16:40 Martin Wilck napsal(a):
> On Thu, 2023-11-16 at 09:10 -0600, David Teigland wrote:
>> On Thu, Nov 16, 2023 at 02:37:13PM +0100, Zdenek Kabelac wrote:
>>>> and restore define DEFAULT_USE_DEVICES_FILE 1.
>>> There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
>>> 'configure --with-default-use-devices-file= 0/1' and thus no need
>>> to change
>>> anything here.
>>>
>>> Current upstream has set this default value as 0  (in configure.ac)
>> I didn't realize you'd changed the default, please set it back to 1.
>> (Even better put back DEFAULT_USE_DEVICES_FILE; configured settings
>> are a pain to deal with, and the complexity causes real problems.)
> The problem I see with using system.devices by default is that it
> requires installer support, as discussed previously. pvcreate will
> create the file if it doesn't find existing VGs or PVs, which means
> that the way LVM behaves depends on the system's history:
>
> - If it was updated from an earlier LVM version, VGs are likely to
> exist, and system.devices will not be created.
> - If VGs were created by the installer without copying system.devices
> into the installed system, system.device won't be created, either.
> - If the users installs without LVM and uses pvcreate later on, LVM
> will create system.devices, and switch to system.devices mode
> - Not sure what happens if the system is running in "legacy" filtering
> / multipath component detection mode and something goes wrong during
> boot, causing the PVs and VGs not to show up. If pvcreate is run in a
> situation like that, would it also create system.devices and switch
> modes?
>
> Distributions can of of course flip the default, but unless I'm
> mistaken RHEL9 (and possibly Fedora) are the only distros that fully
> support system.devices mode just yet. Thus I vote for leaving it off by
> default just now.


Yep - it needs to be fully understood and supported by distro - so changing 
default may cause significant troubles - and took us quite some time to figure 
out various details in RHEL - and I think we still have few opened issues to 
solve. So even if we would flip default - configure process should be giving 
some major message notification about such change and how to easily 'switch' 
to previous 'fillter' logic.   So 'dstro' maintainer then just adds  configure 
option and keeps it in older state until distro gets ready for such changes.

Note - it's  somewhat easier to have the change present in the installation 
compared with  'upgrading' path with already existing  lvm.conf...

Zdenek


