Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C12AF1A
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="glO43gHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699979422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84TeRqze8GT/6VdL9IcA8aoeWiJZkeyiDaYk/h6IRzU=;
	b=glO43gHOAKCdfn7Y4j/HOKrrrcBDBqc7ufFc4RpgxCoHNKka8Is/Yth5KCkLofRMYVc2xf
	Yi+R+TycLk2Rm1w0EzTP0uGDAD2RwAevbJZtKbGjjtbQCISYy1XtQ/hQOibnT1ZdcKNdM5
	MEnWM954C/CBbaUyV1+n3PgnVqPlgQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-Z32JHnVJO-SxdZ4o8nof6A-1; Tue, 14 Nov 2023 11:30:18 -0500
X-MC-Unique: Z32JHnVJO-SxdZ4o8nof6A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C15D185A7A6;
	Tue, 14 Nov 2023 16:30:18 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D104A492BE8;
	Tue, 14 Nov 2023 16:30:17 +0000 (UTC)
Date: Tue, 14 Nov 2023 10:30:16 -0600
From: David Teigland <teigland@redhat.com>
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Martin Wilck <martin.wilck@suse.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVOgmGx-EIpMF54F@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 08:55:39AM +0100, Peter Rajnoha wrote:
> On 11/13/23 19:38, David Teigland wrote:
> > - In general, it's old versions of lvm that we're discussing here.
> > Current lvm uses system.devices by default, where none of this is
> > relevant.  We can just turn off a number of filters when system.devices is
> > in use, including filter-mpath and filter-md.  It may still be interesting
> > to look at improvements, but the context for that is older stable,
> > released versions.
> 
> Hmm, but to generate or update the system.devices file and to add a new
> entry there, we still need to check first whether it's a suitable device
> or not, right? Like not being a multipath component...

If they know what they're doing, a user won't add a multipath/md component
to system.devices (or other unusable devices.)  However, it makes sense to
apply these checks when a device is added to system.devices to catch user
mistakes.  Also for vgimportdevices -a where a specific device is not
named.  The checks become a one-time thing, done when adding the device.
The checks are not needed by ordinary lvm commands, and are not being run
at tricky times like boot or for event handling.

Dave

