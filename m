Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4E30D04
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KK2Q6Px7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700141838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RX+zA/ZwVBV95GPKbcMw8FtEaM2qiGpeBQOp9qxXU6k=;
	b=KK2Q6Px7y0Cff9YSXe1FwLnOWDmYVYh52SJfRdDeix+QS4Xvknno6SLivinyoz4q7nGZez
	iDJbAShj9FTTUf4sFh60CZASlQs0MGuqQ0Qt2U0Fi4R7Xjpcg8ksC48RbBbc4/XBKrbsD8
	qRYuOE6STxPDWjpzrBAlmZaxbyFx6jY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-486-1_nHJVPNOw-Nw4dkt9OPcg-1; Thu,
 16 Nov 2023 08:37:15 -0500
X-MC-Unique: 1_nHJVPNOw-Nw4dkt9OPcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E7FC28AC1E6;
	Thu, 16 Nov 2023 13:37:15 +0000 (UTC)
Received: from [10.45.225.191] (unknown [10.45.225.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11E6810EA1;
	Thu, 16 Nov 2023 13:37:13 +0000 (UTC)
Message-ID: <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
Date: Thu, 16 Nov 2023 14:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: David Teigland <teigland@redhat.com>, Heming Zhao <heming.zhao@suse.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>, Martin Wilck
 <martin.wilck@suse.com>, "bmarzins@redhat.com" <bmarzins@redhat.com>,
 "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
 Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com> <ZVUYAJyEe5fNh4SN@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <ZVUYAJyEe5fNh4SN@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 15. 11. 23 v 20:12 David Teigland napsal(a):
> On Wed, Nov 15, 2023 at 07:36:57PM +0800, Heming Zhao wrote:
>>  From the lvm2 code, above description is wrong. By default, system/devices is
>> disabled status. Because lvm.conf option "use_devicesfile = 0" by default.
>> under "use_devicesfile = 0", any pvcreate/vgcreate/lvmdevices/vgimportdevices
>> won't generate/create system/devices file.
>> If my watching is correct, part discussion of this thread may invalid.
> The lvm default is use_devicesfile=1, as shown in this commit:
>
> commit 6c22392a3f903d6c086f7cc94978bdf8b072da6e
> Author: David Teigland <teigland@redhat.com>
> Date:   Tue Mar 16 09:52:13 2021 -0500
>
>      config: change default use_devicesfile to 1
>
> diff --git a/lib/config/defaults.h b/lib/config/defaults.h
> index 66eece53aa33..a7a2a06df654 100644
> --- a/lib/config/defaults.h
> +++ b/lib/config/defaults.h
> @@ -322,7 +322,7 @@
>   
>   #define DEFAULT_MD_COMPONENT_CHECKS "auto"
>   
> -#define DEFAULT_USE_DEVICES_FILE 0
> +#define DEFAULT_USE_DEVICES_FILE 1
>   #define DEFAULT_DEVICES_FILE "system.devices"
>
>
> Later commits that removed DEFAULT_USE_DEVICES_FILE, and tried to replace
> it with a configure option, was a failed attempt at building that lvm
> source for RHEL8.  It's caused no end of problems and I plan to revert it
> and restore define DEFAULT_USE_DEVICES_FILE 1.


There is no problem with configuring DEFAULT_USE_DEVICES_FILE with 'configure 
--with-default-use-devices-file= 0/1' and thus no need to change anything here.

Current upstream has set this default value as 0  (in configure.ac)

RHEL builds use this setting as 1.  (Possibly even Fedora nowadays).

The major problem with turning this  to 1 is the distribution must be 'ready' 
with such relatively invasive change as it changes also requirements on how 
the boot image is created  (devicesfile must be copied to ramdisk).

So Suse  may try to set this setting  to 1  and see what all breaks.


Zdenek

