Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667ED3A8D6
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLeFHm+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700075539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ka00R5MDYIM8tBvV1kRihgg9EgGCWhSRhsS/wQAomZk=;
	b=PLeFHm+wTYUEQYXg/29ynplbZo6/8XuTemx6j5xFMeEw0Lh/akgC8ZeBzJBqOmSSKdtBUW
	OWnbpsLzUqcC37KvkXa/EFkJiZWiaQmlhmoRDCKOLtVOgP4FWdhB7gY3GNlDaSbgbB5iB7
	AQ7UL0F/Ui10m5GUyvys7NuGRSe7KnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-A34jeTLxP5KUhXd158gAvA-1; Wed, 15 Nov 2023 14:12:15 -0500
X-MC-Unique: A34jeTLxP5KUhXd158gAvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC991102F20B;
	Wed, 15 Nov 2023 19:12:02 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 680BF2026D4C;
	Wed, 15 Nov 2023 19:12:02 +0000 (UTC)
Date: Wed, 15 Nov 2023 13:12:00 -0600
From: David Teigland <teigland@redhat.com>
To: Heming Zhao <heming.zhao@suse.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVUYAJyEe5fNh4SN@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 07:36:57PM +0800, Heming Zhao wrote:
> From the lvm2 code, above description is wrong. By default, system/devices is
> disabled status. Because lvm.conf option "use_devicesfile = 0" by default.
> under "use_devicesfile = 0", any pvcreate/vgcreate/lvmdevices/vgimportdevices
> won't generate/create system/devices file.
> If my watching is correct, part discussion of this thread may invalid.

The lvm default is use_devicesfile=1, as shown in this commit:

commit 6c22392a3f903d6c086f7cc94978bdf8b072da6e
Author: David Teigland <teigland@redhat.com>
Date:   Tue Mar 16 09:52:13 2021 -0500

    config: change default use_devicesfile to 1

diff --git a/lib/config/defaults.h b/lib/config/defaults.h
index 66eece53aa33..a7a2a06df654 100644
--- a/lib/config/defaults.h
+++ b/lib/config/defaults.h
@@ -322,7 +322,7 @@
 
 #define DEFAULT_MD_COMPONENT_CHECKS "auto"
 
-#define DEFAULT_USE_DEVICES_FILE 0
+#define DEFAULT_USE_DEVICES_FILE 1
 #define DEFAULT_DEVICES_FILE "system.devices"


Later commits that removed DEFAULT_USE_DEVICES_FILE, and tried to replace
it with a configure option, was a failed attempt at building that lvm
source for RHEL8.  It's caused no end of problems and I plan to revert it
and restore define DEFAULT_USE_DEVICES_FILE 1.

Dave

