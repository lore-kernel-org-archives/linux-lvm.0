Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81C22090
	for <linux-lvm@lists.linux.dev>; Tue, 21 Nov 2023 18:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aTOGmgP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700591156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jfFsxdckffH5pSHJBcIHyMXMX05C1Z4i1HiKE7Jobi4=;
	b=aTOGmgP15Cs8m6+Mhcc82X4/Qxygw+ULmDyfS0RV073G/t5WJdzqUCvslIlM1i+LMTQZxX
	RAKgHBavJWAwL9mBZ/DuAI6IQSOOkQERDFUfXtj9IVx2bUrggtetDkI8MYoX2xv2lPojuT
	yL2btttsKGAozNiqAq+w1c51sLMXSzA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-BTCNMTkeMtaw_6xoytS1aQ-1; Tue, 21 Nov 2023 13:25:53 -0500
X-MC-Unique: BTCNMTkeMtaw_6xoytS1aQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5819185A780;
	Tue, 21 Nov 2023 18:25:52 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DFA51121306;
	Tue, 21 Nov 2023 18:25:52 +0000 (UTC)
Date: Tue, 21 Nov 2023 12:25:50 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Glass Su <glass.su@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"hare@suse.de" <hare@suse.de>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVz2LgBbiWrzLSgZ@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <5a9061d0f7e287993b127641cc11d7a15d442803.camel@suse.com>
 <ZVzvUR-_zSTC4sOk@redhat.com>
 <b5629e054b0fa5f124f93def8d0b878eeb96869a.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b5629e054b0fa5f124f93def8d0b878eeb96869a.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 21, 2023 at 06:10:12PM +0000, Martin Wilck wrote:
> But I wonder if this is required. You could create a script that
> calls pvscan, and then systemd-run / vgchange with the output of the
> pvscan command, and execute this script in RUN. That was roughly my
> idea. That way you wouldn't loose any DEVLINKS added after 69-dm-
> lvm.rules.

I don't see any immediate problem with that idea, although using a script
doesn't sound nice if it can be avoided.  It seems academic since I'm not
seeing a problem with the current method.

Dave

