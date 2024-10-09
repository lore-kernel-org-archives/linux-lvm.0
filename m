Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C651A2564
	for <linux-lvm@lists.linux.dev>; Wed,  9 Oct 2024 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485578; cv=none; b=dG5iXS+GkxS4+TqJhl6p6N+76xElXGiI/4pfiXU9TXEy3Az06snHb1I47ejLytVr9aXC96FYDjxnXHYYzaIWpcMdaVhaI81cZWIaZGe1flj9WLroVxsfW0M/f4PwfDb9ciWlRSvIIdjwRuQ8LtBih67BMrnOq8sH419GwtArXRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485578; c=relaxed/simple;
	bh=n9XkTvGGEUg3gDRoCrgeme0yALKEqlLlz097rO8u/gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Pu3yH+yBkVxwBgaoOJGEePKTrq8/YnRMtEwQHr8mvdar+DD9ralkofUWUlnb5NKZad814L0v3BeRBTQrM8wALnOjlQg3deE/324cSldvcNA0ZYDzIUNZN/EVxK7HO2ib2bk1+CR5Oeiselx6jtya0lO3EXaoOUtHnnMji/zwbjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f3OMtJYq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f3OMtJYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728485575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EacNNFPCc5Qa8Jl6Z115HDJ0JAKIRWP3ARMaHzNYH0Y=;
	b=f3OMtJYqxuC/KimdoxpHsi4OJROrmxANp+d3BWu9a3XPvo9IuAEtKhzS74SAhUXRNYipCO
	tPaUC5TStM9j7QGYPfTMHy/imMfZjwc2VMEWTcLpeveF9U0osXQ/PsFg0FDC9kw5TkzPXo
	u4toJO+rDqloqcMuoP3Q8cdQI23EAnY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-5bzgXDBnNiyj8amEqLE83g-1; Wed,
 09 Oct 2024 10:52:52 -0400
X-MC-Unique: 5bzgXDBnNiyj8amEqLE83g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A7E5197730A;
	Wed,  9 Oct 2024 14:52:49 +0000 (UTC)
Received: from redhat.com (unknown [10.22.9.98])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45AF919560A2;
	Wed,  9 Oct 2024 14:52:48 +0000 (UTC)
Date: Wed, 9 Oct 2024 09:52:45 -0500
From: David Teigland <teigland@redhat.com>
To: Fabricio Winter <admin@notfab.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Help diagnosing lvm ioctl log spam
Message-ID: <ZwaYvaL3Vh0YCZlL@redhat.com>
References: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKP6pzFDt42gCDjwg7m_o5YRh7MGCSfxrXkNt=nPV_B=-pRAQw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2024 at 06:28:26AM -0300, Fabricio Winter wrote:
> Hello people, we have been experiencing an issue with lvm2-thin on
> _some_ of our production servers where out of nowhere
> lvm2/device-mapper starts spamming error logs and I can't really seem
> to trace down the root cause.
> 
> This is what the logs look like;
> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: device-mapper: waitevent ioctl on
> LVM-CP5Gw8QrWLqwhBcJL87R1mc9Q9KTBtQQmOowipTAFuM7hqzHz6pRVvUaNO9FGzeq-tpool
> failed: Inappropriate ioctl for device
> Oct  9 06:25:02 U5bW8JT7 lvm[8020]: waitevent: dm_task_run failed:
> Inappropriate ioctl for device

It appears related to dmeventd monitoring the thin pools, and the kernel
returning ENOTTY when dmeventd does the DM_DEV_WAIT ioctl.  Maybe there's
a fast retry loop in dmeventd on that error case rather than quitting.
I wonder if there's a way you could kill dmeventd when this happens.

Dave

