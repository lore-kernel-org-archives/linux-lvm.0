Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3183212
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaRtKz3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700147451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bXK+m5OFW6prynMEHk+oe2ZUgDu2zHUurOILYmK6dhU=;
	b=YaRtKz3brRw3XduYpGiPPnrzwUihVjRbPc2xVGU7wcquaT7i4vi2w00WUVeNIu6aqw3/Gp
	ETXEbqD2BA9WxUNJTe1F5dnW7sx+IKIwamuf/Ef7Ehc3pO6ebiScGM1VIIlj1MClwCvMx6
	C3XdAQTNR1i+JeDZ3pN727r/GP2daMQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-39fTQnjXNvCpTw5PW4wwLA-1; Thu,
 16 Nov 2023 10:10:48 -0500
X-MC-Unique: 39fTQnjXNvCpTw5PW4wwLA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEF461C113E4;
	Thu, 16 Nov 2023 15:10:47 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4758D492BE0;
	Thu, 16 Nov 2023 15:10:47 +0000 (UTC)
Date: Thu, 16 Nov 2023 09:10:45 -0600
From: David Teigland <teigland@redhat.com>
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Heming Zhao <heming.zhao@suse.com>, Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVYw9eNTj7Ir6V31@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 16, 2023 at 02:37:13PM +0100, Zdenek Kabelac wrote:
> > and restore define DEFAULT_USE_DEVICES_FILE 1.
> 
> There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
> 'configure --with-default-use-devices-file= 0/1' and thus no need to change
> anything here.
> 
> Current upstream has set this default value as 0  (in configure.ac)

I didn't realize you'd changed the default, please set it back to 1.
(Even better put back DEFAULT_USE_DEVICES_FILE; configured settings
are a pain to deal with, and the complexity causes real problems.)

> The major problem with turning this  to 1 is the distribution must be
> 'ready' with such relatively invasive change as it changes also requirements
> on how the boot image is created  (devicesfile must be copied to ramdisk).

While a distribution does want to be aware of the change (discussed
earlier in the thread), what you're saying specifically is not true.
RHEL, which has this enabled, doesn't even have system.devices in the
ramdisk.  It simply means that it's not used for activating the root LV.

Dave

