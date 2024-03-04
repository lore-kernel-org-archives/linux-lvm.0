Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BB364CB
	for <linux-lvm@lists.linux.dev>; Mon,  4 Mar 2024 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709548667; cv=none; b=MoH0GNZN1OzZhHt/PERz4oP1+zT95NgcStKgAb9X4diteEqMJicD0K16/Aqq47311Dbi04NQWTF1AJz+dtMb3mox332t2fCZx0qUHA7XZxhrgbK0oNcYGHCSDH5vsJldveTExclLAAfE/vT4MF4SQVamJsbeN3U/TDLuJMQsqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709548667; c=relaxed/simple;
	bh=BmoPfstdfer41KiTutAfwcAgRY/APq7kxrfDmfmvK2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxeB4QiPY8dEJyXh6c2+0KSYKg1vyIrmLx9yHxWC1hhevPxD6naj8GAOLwo6FnDBo//z+4lEjRl1oJPk7u+iRJ9USShURXlHMcwwRXtwGu2xVEAHvl+2LWIIfYQYjvRkGejiKxdmScTiclfLHbbTKz4Y97/IEsy1fnWoxYVE5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XtlD8TSL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XtlD8TSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709548664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PWaJIR7zP8MNHpeZwLeMMOO0hOo/kagxoZ9mccSSbv0=;
	b=XtlD8TSLI834oq8QpGX0TZD9/PuBQMTfCIbq7kXHUTafW+PLsNWGAtq9TxayDvFNI4WR/f
	BlghKFjFqwrrSjtBAvjvwGRmHn8kHlGPPnA8UBO1LDFWv7kTdubMxjXh4M29at6KEJW0SR
	jDwOnwEzGBx53fIZg/+EqHYQTytlmuk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-YP3RPOVPM269cZhNnC0H8Q-1; Mon, 04 Mar 2024 05:37:41 -0500
X-MC-Unique: YP3RPOVPM269cZhNnC0H8Q-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51321a5bfadso3244891e87.2
        for <linux-lvm@lists.linux.dev>; Mon, 04 Mar 2024 02:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709548659; x=1710153459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWaJIR7zP8MNHpeZwLeMMOO0hOo/kagxoZ9mccSSbv0=;
        b=YG4eEA6wKsS+xmZowxOFRwlv8v3l/GcI5Ga1tqanWQk/Pje1UysYN37YV7c4J1gVpE
         Fe2YCPCagejNnQ2VR7/Y4cJirqUWBNHGg+hskpf61XmPagD6/CZFwJeO0g/7VS3VuU5i
         jNTgZKEIV1UQTuSZP8zy3UorqbtgrE30amAVvD1TPfllHnb4H11GgT4KYSfaGM1Cztrd
         1qUlhX8sL2SKhJUoXSiuiDquJAmmLLxvg0GKJ71wRcrOPDAKN70RoGoYxzXZfa0/4soj
         G41oXLwsvJ37tQutW7OEDC3dDuwDxLmIQV3RwilzCSVtVNnlwoYO3NpjU1JvrMcWmEj5
         R/xQ==
X-Gm-Message-State: AOJu0YwpQnkSIYq4IzW9HzqTusawjD3dMc6C0Bc562TfAyA+uspJN0nS
	kqlWWi88x1lXSvEr6X7zNcXwAXFB/Bvd2h1qDYj2ia0KH8yFm4ncr7KNH4QXQgFB2lEYAFBarTf
	3k/AEpyWWSFU12S1CyQj650cQT8G8dTXlRy918I0TuMdr7Awnoys9cKpWxA==
X-Received: by 2002:a05:6512:716:b0:513:1385:c943 with SMTP id b22-20020a056512071600b005131385c943mr5227341lfs.40.1709548659667;
        Mon, 04 Mar 2024 02:37:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4URscpT4sDRGcAzKIteGbYa/hP3Z6y8djyt5sluy0hByZTqKG8L8Nh2sQnNe9sJo/peJV0Q==
X-Received: by 2002:a05:6512:716:b0:513:1385:c943 with SMTP id b22-20020a056512071600b005131385c943mr5227330lfs.40.1709548659274;
        Mon, 04 Mar 2024 02:37:39 -0800 (PST)
Received: from [10.43.17.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c128f00b0041290cd9483sm16740581wmd.28.2024.03.04.02.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 02:37:38 -0800 (PST)
Message-ID: <f82c786b-4b8e-4e5a-a049-bd4cfba668bd@redhat.com>
Date: Mon, 4 Mar 2024 11:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] 13-dm-disk.rules: import ID_FS_TYPE
To: Martin Wilck <martin.wilck@suse.com>, Zdenek Kabelac
 <zkabelac@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Teigland <teigland@redhat.com>
Cc: linux-lvm@lists.linux.dev, dm-devel@lists.linux.dev,
 Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.de>
References: <20240301224011.11117-1-mwilck@suse.com>
 <20240301224011.11117-2-mwilck@suse.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Autocrypt: addr=prajnoha@redhat.com; keydata=
 xjMEY7QY9hYJKwYBBAHaRw8BAQdADIHZn5yeZYFV18ewwf4iudpl1ARfj4rnxX5xiSoJ15vN
 I1BldGVyIFJham5vaGEgPHByYWpub2hhQHJlZGhhdC5jb20+wpYEExYKAD4CGwMFCwkIBwIC
 IgIGFQoJCAsCBBYCAwECHgcCF4AWIQQhe3cZL8e9dSzFIwXndmZANt+EqwUCY7QZ9wIZAQAK
 CRDndmZANt+EqzosAQDXhWudIjLSGoWGPKgluEWw5B5LtAX+kW2OG7loCDzI2AD/fp3Xec8K
 JY7HrSqO98YMPbT98+YRjiopJSk75TcAogzOOARjtBj2EgorBgEEAZdVAQUBAQdALfG8fuls
 uqLPtrJ5tYb36UtqNlu6Bw9ME/Ou+FRGG1cDAQgHwngEGBYKACAWIQQhe3cZL8e9dSzFIwXn
 dmZANt+EqwUCY7QY9gIbDAAKCRDndmZANt+Eq22lAQDXlKMGQxkD0FZes94uihIZlhFwGjrX
 dVfZsxfwEvuJfAD/XLGDegnKVERbF6YTfdsbVngSlOX/Tu/fxAFTg0JfdQU=
In-Reply-To: <20240301224011.11117-2-mwilck@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 23:40, Martin Wilck wrote:
> ID_FS_TYPE is the most important udev property for most follow-up
> rules. It must be imported from the udev db if blkid can't be run.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  udev/13-dm-disk.rules.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/udev/13-dm-disk.rules.in b/udev/13-dm-disk.rules.in
> index dca00bc..eaad972 100644
> --- a/udev/13-dm-disk.rules.in
> +++ b/udev/13-dm-disk.rules.in
> @@ -26,6 +26,7 @@ ENV{DM_NOSCAN}=="1", GOTO="dm_watch"
>  GOTO="dm_link"
>  
>  LABEL="dm_import"
> +IMPORT{db}="ID_FS_TYPE"
>  IMPORT{db}="ID_FS_USAGE"
>  IMPORT{db}="ID_FS_UUID_ENC"
>  IMPORT{db}="ID_FS_LABEL_ENC"

I think this one was left out deliberately. The original intention was
to import only the minimal set of "blkid" variables needed to properly
keep the symlinks based on these values in place (patch 94f77a4). And
the "ID_FS_TYPE" is not actually needed for this.

Though, importing even the "ID_FS_TYPE" together with other blkid
variables should not be an issue because this "import from previous
state" happens only if we have DM_SUSPENDED or DM_NOSCAN set for current
event, in which case any other rules should be also disabled with
DM_UDEV_DISABLE_OTHER_RULES_FLAG="1".

So even if some other rule fires based on ID_FS_TYPE value, the
DM_UDEV_DISABLE_OTHER_RULES_FLAG should stop it anyway.

Then, the question is whether we really need to 'IMPORT{db}="ID_FS_TYPE'?

-- 
Peter

