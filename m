Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5059339FE2
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2OaJMls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700150389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yqSq2X+tEpSF0C2uRGxZDgOpyaO33YIKuAXA247n1c=;
	b=H2OaJMlsOkiptHCrt1cpAfeC0D90sNN6L0srgBugzqKM3giJrwkPWl0WgCeVe7RdmVDR0p
	4Fz8V+7EqG9plt1yTHtrEgdGGlUOuA1xfV41feWcM6XiviramJHbQce9Htsc0G9ER0y/ae
	3+Y113PyqBsEcIN4ocFOmeQjbngAtig=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-3wpsRHCzPwiQSSIhD8D88g-1; Thu,
 16 Nov 2023 10:59:47 -0500
X-MC-Unique: 3wpsRHCzPwiQSSIhD8D88g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C591380670E
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:59:47 +0000 (UTC)
Received: from [10.45.225.191] (unknown [10.45.225.191])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E71A5C157E5
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:59:46 +0000 (UTC)
Message-ID: <aaa81c84-55a2-4d2e-8368-16571bd3dd7a@redhat.com>
Date: Thu, 16 Nov 2023 16:59:45 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
To: "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
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
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <ZVYw9eNTj7Ir6V31@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 16. 11. 23 v 16:10 David Teigland napsal(a):
> On Thu, Nov 16, 2023 at 02:37:13PM +0100, Zdenek Kabelac wrote:
>>> and restore define DEFAULT_USE_DEVICES_FILE 1.
>> There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
>> 'configure --with-default-use-devices-file= 0/1' and thus no need to change
>> anything here.
>>
>> Current upstream has set this default value as 0  (in configure.ac)
> I didn't realize you'd changed the default, please set it back to 1.
> (Even better put back DEFAULT_USE_DEVICES_FILE; configured settings
> are a pain to deal with, and the complexity causes real problems.)

configure is the right way how to set 'default' parameter for compilation.

And since different distribution needs different defaults - it's way better 
then letting every distro maintain some patch sets separately.

Even i.e. building of RHEL8 and RHEL9 have different defaults.

Once the option become supported properly across wide distribution set  - it's 
very easy to flip default in 'configure.ac'  from 0 to 1.

There is no need to change anything else here.

RHEL & Fedora builds are prepared and use proper configure set and build 
proper packages

>> The major problem with turning this  to 1 is the distribution must be
>> 'ready' with such relatively invasive change as it changes also requirements
>> on how the boot image is created  (devicesfile must be copied to ramdisk).
> While a distribution does want to be aware of the change (discussed
> earlier in the thread), what you're saying specifically is not true.
> RHEL, which has this enabled, doesn't even have system.devices in the
> ramdisk.  It simply means that it's not used for activating the root LV.
>

Since lvm2  without 'devicesfiles' will fallback to filters, which by default 
accept 'every' device, this in most cases  will lead to the situation,  that 
if there are no 'specific' needs to filter something out  usually the right LV 
will be activated.

So in most cases even if the 'devicesfile' is not being copied it will appear 
like it's working.

But there will be situation where the systems where lvm2  will be accessing 
devices it should not access - and this is a problem that should be addressed 
(i.e. duplicate devices present in the system).


Zdenek


