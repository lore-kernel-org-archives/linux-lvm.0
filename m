Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD82107
	for <linux-lvm@lists.linux.dev>; Sat, 10 Feb 2024 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707529116; cv=none; b=oXFr20Ud0Ly4fDwuuIv/F7PJLbsidk74e2rHCdjPf6uBHAt23BlgVyFYY3Hxbxf/tc/zFRJwXHfcjYRJeofNW3C9aJSe+SiY+zxpVDa3YsiChh0P94X+6YCLzQIJ0iralXLacaZC1YrrlFBgcmpGHCMzGF/9P2FDpU3bqeINhDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707529116; c=relaxed/simple;
	bh=z1qEhsTYctlek62gOvc4mqGG1JwPBUDQhjWjIlCqfaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LgNAU2NOntQ8iTs2y0DhUBTxo/Y2l0Ry/l0dfy4rKUf0AX+kmg4TIEjvlmRWP5fcaRqez7P4954Y1SjIiTV4XJDXXt8dooMAiGAVSyHER0LcVeVLOJxvjtcIKODlpK+XNgXPf0ndfDHVlogIGHLGY7G96klfMWxRiQwqwnnqzE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/0arf3r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/0arf3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707529113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FipqGNPI2jhye6boWHZQO27XPmOCbhPNtBGNn7krYfw=;
	b=S/0arf3rSGrg0ylU5uUGNDU7O5y5nBcMSf/o4YjXNfZfueMa8tWITEHKYLoCEdkTeCh+QG
	jpHFUrjD4iV1Zwjgn2iHBLyIb1NosNRjaAGEAjmOeREWbsmVO1cRVwSCUfxHPOf+P+shHh
	nbOYHABdAG7ZJ3C1T0ZKtP8OLirnS18=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-4bwsxKe9MWSk-KFaNHGK1g-1; Fri, 09 Feb 2024 20:38:27 -0500
X-MC-Unique: 4bwsxKe9MWSk-KFaNHGK1g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ECAF185A781;
	Sat, 10 Feb 2024 01:38:27 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F77492BE3;
	Sat, 10 Feb 2024 01:38:26 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.17.1/8.17.1) with ESMTPS id 41A1cQxh351999
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 20:38:26 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.17.1/8.17.1/Submit) id 41A1cQUG351998;
	Fri, 9 Feb 2024 20:38:26 -0500
Date: Fri, 9 Feb 2024 20:38:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>,
        dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev,
        Zdenek Kabelac <zkabelac@redhat.com>,
        Peter Rajnoha <prajnoha@redhat.com>
Subject: Re: [PATCH v2 2/7] 11-dm-mpath.rules: don't import
 DM_UDEV_DISABLE_OTHER_RULES_FLAG
Message-ID: <ZcbTknkTT6j3VjTy@bmarzins-01.fast.eng.rdu2.dc.redhat.com>
References: <20240209232735.9791-1-mwilck@suse.com>
 <20240209232735.9791-3-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240209232735.9791-3-mwilck@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 10, 2024 at 12:27:30AM +0100, Martin Wilck wrote:
> DM_UDEV_DISABLE_OTHER_RULES_FLAG is handled by 10-dm.rules, which imports
> it from db if necessary. There is no need to do this again here.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipath/11-dm-mpath.rules.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/multipath/11-dm-mpath.rules.in b/multipath/11-dm-mpath.rules.in
> index e7be12d..fd8d202 100644
> --- a/multipath/11-dm-mpath.rules.in
> +++ b/multipath/11-dm-mpath.rules.in
> @@ -7,7 +7,7 @@ IMPORT{db}="MPATH_DEVICE_READY"
>  
>  # If this uevent didn't come from dm, don't try to update the
>  # device state
> -ENV{DM_COOKIE}!="?*", ENV{DM_ACTION}!="PATH_*", IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG", IMPORT{db}="DM_NOSCAN", GOTO="scan_import"
> +ENV{DM_COOKIE}!="?*", ENV{DM_ACTION}!="PATH_*", IMPORT{db}="DM_NOSCAN", GOTO="scan_import"
>  
>  ENV{.MPATH_DEVICE_READY_OLD}="$env{MPATH_DEVICE_READY}"
>  
> -- 
> 2.43.0

