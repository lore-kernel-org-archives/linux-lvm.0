Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA40136A
	for <linux-lvm@lists.linux.dev>; Fri,  9 Feb 2024 00:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707438977; cv=none; b=PM9Y0as6j/KZQaW7Ib5SX8DMYrZ3iJ58rlhrKnpsMIzLW4eVbHrhOd6r51oRnjvTNH7vwWpXY2DU3MrYvXNTV84mNEkY8mdDEjG4F6KxzS9IPd+XV+ssuhcduggbQOhU/Jc0SCpClVdW1VsyWDCpleuM2od3pNXREm+L62nOaew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707438977; c=relaxed/simple;
	bh=go8btp7pp+V50VsvKyDFUUyVuTN32v50qL6r2NDRSFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Bk6iJp+HwaZ2BKH2hclwVpzQocpd089HCWDyB3rybBkh+mllGkIh26oxGikeWEqAbqKjS6oygi7/58FLbmI2Ms9AonticjbvSkN9wdhiQyuUrObdg/l3sKcb3WvVxCjKIpFxc288wTFrqJbyNIPd+FvjJMffHJgd5WZbcXNIAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sdh3Js/q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sdh3Js/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707438975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WIGOseNC8sdLoKSXojduDLmh5MhRqfHrwaFBkQxGTdI=;
	b=Sdh3Js/qAx2VQFxO6XJUnWXQFrwS/Pwd0uub+rTw5W62dp0FiwaYjDBbb2SpFWcs9ki45q
	H7Ik8SMmxEaUSTuyX/vD054WI3jdMP3LTOr5ZfyCtc5iDFXv0lGsZ8tYnwcsndd4cXeiXt
	O7izcRpf3881OxVFYtBPVJbFPQTwUdI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-bgCTHxokPeisTdzEtonHUw-1; Thu, 08 Feb 2024 19:36:10 -0500
X-MC-Unique: bgCTHxokPeisTdzEtonHUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81B5F85A58B;
	Fri,  9 Feb 2024 00:36:10 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 788751C14B04;
	Fri,  9 Feb 2024 00:36:10 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.17.1/8.17.1) with ESMTPS id 4190aAC0338395
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 19:36:10 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.17.1/8.17.1/Submit) id 4190aA2I338394;
	Thu, 8 Feb 2024 19:36:10 -0500
Date: Thu, 8 Feb 2024 19:36:10 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>,
        dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev,
        Zdenek Kabelac <zkabelac@redhat.com>,
        Peter Rajnoha <prajnoha@redhat.com>
Subject: Re: [PATCH 3/6] 11-dm-mpath.rules: use import logic like
 13-dm-disk.rules
Message-ID: <ZcVzet-hfVMpgDA4@bmarzins-01.fast.eng.rdu2.dc.redhat.com>
References: <20240205124638.17877-1-mwilck@suse.com>
 <20240205124638.17877-4-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240205124638.17877-4-mwilck@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 05, 2024 at 01:46:35PM +0100, Martin Wilck wrote:
> We have to import the properties if either DM_NOSCAN or
> DM_DISABLE_OTHER_RULES_FLAG is set, because blkid will be skipped
> in both cases. Also, if DM_UDEV_PRIMARY_SOURCE_FLAG is not set,
> it makes no sense to try and import the properties.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipath/11-dm-mpath.rules | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
> index 43d227c..8fc4a6f 100644
> --- a/multipath/11-dm-mpath.rules
> +++ b/multipath/11-dm-mpath.rules
> @@ -89,7 +89,8 @@ ENV{MPATH_DEVICE_READY}!="0", ENV{.MPATH_DEVICE_READY_OLD}=="0", \
>  # not. If symlinks get lost, systemd may auto-unmount file systems.
>  
>  LABEL="scan_import"
> -ENV{DM_NOSCAN}!="1", GOTO="import_end"
> +ENV{DM_NOSCAN}!="1", ENV{DM_DISABLE_OTHER_RULES_FLAG}!="1", \
> +	ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}=="1", GOTO="import_end"
>  IMPORT{db}="ID_FS_TYPE"
>  IMPORT{db}="ID_FS_USAGE"
>  IMPORT{db}="ID_FS_UUID_ENC"
> -- 
> 2.43.0

Doesn't this mean that we will always import the properties if
ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1"

I think you mean

ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", GOTO="import_end"
ENV{DM_NOSCAN}!="1", ENV{DM_DISABLE_OTHER_RULES_FLAG}!="1", GOTO="import_end"

right?

-Ben

