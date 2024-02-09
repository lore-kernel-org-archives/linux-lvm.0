Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9BB82874
	for <linux-lvm@lists.linux.dev>; Fri,  9 Feb 2024 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707501709; cv=none; b=dRjwmjqiAj1qKO0QpKoibzpM+zAX5AGt8ImPM8mHfgeuH5FHQUydUsT0yHQ3ok80tBz6rhLxlHueDR1js94X87DOMZs00dcOkTwde1NCR/gg8nLgBbvecqaFHnfh4W/8QYi8gch2YZN30Ur2DgjFMCUYY6fVzIPcTCMULANdXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707501709; c=relaxed/simple;
	bh=vV5o+sNHqDksrssXQ7kWdOHRUnaIOoi33mVRNyLtvAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FXZh9XAEDNqrFJsxqkxAlji3W6WlwcIcxMqripGBQGnsEEiTMa0Xs6vLe4FDe3bE8xCscP36iiRVvk4zJw5pUyniDecfT507HkJXA8DGANl8ZBxHGSoh0fouP3aQGz1pBcAZ66EYIfzAvMJuJrHkjzgGrl8njSxRcmK3PN3WRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PuuB1jJE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PuuB1jJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707501706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UQOXZQ3BHBwQF6GbU4DNzYNeZv6Id+WDSIwNV5tepao=;
	b=PuuB1jJE+UemAVmHL6IUpATnZxcqmgBaT9Rv/kMGk0V5eJqh9cKIS1Mn0PEXmJ1zVKwsHM
	99NaYFhThqwDMi3/v4NlyfO9k6UXo1Qzo49IBfvoHqFy9Jd2Wuwh5d6oimADHftAk3xI2u
	YZW8bIky7yE/7cpdiOq9Kn1IPdI6kbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-wyM3tiAXO76heKxMseV5RA-1; Fri, 09 Feb 2024 13:01:43 -0500
X-MC-Unique: wyM3tiAXO76heKxMseV5RA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2851785A58A;
	Fri,  9 Feb 2024 18:01:43 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 213114015466;
	Fri,  9 Feb 2024 18:01:43 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.17.1/8.17.1) with ESMTPS id 419I1gvk347445
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 13:01:42 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.17.1/8.17.1/Submit) id 419I1ghR347444;
	Fri, 9 Feb 2024 13:01:42 -0500
Date: Fri, 9 Feb 2024 13:01:42 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>,
        dm-devel@lists.linux.dev, linux-lvm@lists.linux.dev,
        Zdenek Kabelac <zkabelac@redhat.com>,
        Peter Rajnoha <prajnoha@redhat.com>
Subject: Re: [PATCH 2/6] 11-dm-mpath.rules: don't import properties that are
 already set
Message-ID: <ZcZohsUNXd4UHZp0@bmarzins-01.fast.eng.rdu2.dc.redhat.com>
References: <20240209165513.7661-1-mwilck@suse.com>
 <20240209165513.7661-3-mwilck@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240209165513.7661-3-mwilck@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 09, 2024 at 05:55:09PM +0100, Martin Wilck wrote:
> DM_UDEV_DISABLE_OTHER_RULES_FLAG is handled by 10-dm.rules, which imports
> it from db if necessary. There is no need to do this again here.
> 
> DM_NOSCAN may be already set from previous rules, e.g. if the device is
> suspended. Make sure we don't overwrite it.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipath/11-dm-mpath.rules.in | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/multipath/11-dm-mpath.rules.in b/multipath/11-dm-mpath.rules.in
> index e7be12d..05c4294 100644
> --- a/multipath/11-dm-mpath.rules.in
> +++ b/multipath/11-dm-mpath.rules.in
> @@ -7,7 +7,13 @@ IMPORT{db}="MPATH_DEVICE_READY"
>  
>  # If this uevent didn't come from dm, don't try to update the
>  # device state
> -ENV{DM_COOKIE}!="?*", ENV{DM_ACTION}!="PATH_*", IMPORT{db}="DM_UDEV_DISABLE_OTHER_RULES_FLAG", IMPORT{db}="DM_NOSCAN", GOTO="scan_import"
> +ENV{DM_COOKIE}=="?*", GOTO="check_ready"
> +ENV{DM_ACTION}=="PATH_*", GOTO="check_ready"
> +
> +ENV{DM_NOSCAN}!="?*", IMPORT{db}="DM_NOSCAN"
> +GOTO="scan_import"
> +
> +LABEL="check_ready"
>  
>  ENV{.MPATH_DEVICE_READY_OLD}="$env{MPATH_DEVICE_READY}"
>  
> -- 
> 2.43.0

