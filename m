Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A22DF73
	for <linux-lvm@lists.linux.dev>; Thu,  4 Jan 2024 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gdhe+KDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704405614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VrN/h+Wh3TkHHYsnoOMt0Y/2DpsH8Aw84IxTOG9hjI=;
	b=Gdhe+KDjAM8K1JVCP1xuqL/rxtRw8Eghug/7Y+SBNIbd4LWLaSjaIxJldHnmySlFUIJx9o
	yRR9s/enyfNgsW3CawboenM0zNmqiypUq8rqZVFBZdpOSO0U29hUV0J8a6iyv0eQxrudRf
	udVzwiWIceUVRkNrElDNgvj+fLpgxRw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-x1GiVsivMTOWL7cNtgepVA-1; Thu,
 04 Jan 2024 17:00:10 -0500
X-MC-Unique: x1GiVsivMTOWL7cNtgepVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1525E3C23FCE;
	Thu,  4 Jan 2024 22:00:10 +0000 (UTC)
Received: from redhat.com (unknown [10.22.18.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7B5E2026D66;
	Thu,  4 Jan 2024 22:00:09 +0000 (UTC)
Date: Thu, 4 Jan 2024 16:00:08 -0600
From: David Teigland <teigland@redhat.com>
To: =?iso-8859-1?Q?Fran=E7ois-Xavier?= Payet <fx@payet.io>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Unable to resize a logical volume due to wrong reported asked
 size
Message-ID: <ZZcqaDWKFyUQ_7qh@redhat.com>
References: <C69E0F8D-AE0A-47DA-BD37-00289EECB867@payet.io>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <C69E0F8D-AE0A-47DA-BD37-00289EECB867@payet.io>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 04, 2024 at 10:01:04PM +0100, François-Xavier Payet wrote:
> Hello!
> 
> I’ve got issues resizing a LVM volume.

Hi, I suspect you're missing this fix:
https://gitlab.com/lvmteam/lvm2/-/commit/fa496513010976aac21584b5081529b76462f9a9

To work around the problem, you can disable the fs checking in lvresize
with '--fs ignore', which tells lvresize that you have already properly
resized the fs.

Dave

> I’ve allready resized the filesystem on top of it without issues : 
> btrfs fi resize 62T /mnt/user
> Resize device id 1 (/dev/mapper/vg_raid-datas) from 80.04TiB to 62.00TiB
> 
> But when trying to resize the underlying volume, I’ve got the following error : 
> lvresize -L63T /dev/vg_raid/datas
>   File system btrfs found on vg_raid/datas.
>   File system size (62,00 TiB) is larger than the requested size (1,00 TiB).
>   File system reduce is required and not supported (btrfs).
> 
> Which makes (to me) no sense as 1. the FS is less than 63T, 2. The 1.00 TB is not what I’ve requested. And If I try another size, it tells me that I’ve asked for a null size : 
> lvresize -L64T /dev/vg_raid/datas
>   File system btrfs found on vg_raid/datas.
>   File system size (62,00 TiB) is larger than the requested size (0   ).
>   File system reduce is required and not supported (btrfs).
> 
> So I really don’t get what’s going on here. Anyone has pointer on what might be the problem?
> 
> Thanks!

