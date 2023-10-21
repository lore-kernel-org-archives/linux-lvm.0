Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF11A5AF
	for <linux-lvm@lists.linux.dev>; Sat, 21 Oct 2023 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ptog4rMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697905955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fEXmS9ZQGRoDF1NAlAy6xgQSJzBenDp0on+mVxAArgQ=;
	b=Ptog4rMhnm8HHhcNAQkf1cD/JzzS6A/NeSWbPs923xG4WeaduV4Gmwwywosx/WAfLWFhdU
	HIuQKmzE4EdFTtN4hVBViUTeBePyV+PvLaGy514qUv9whxGCwntqt0elf0XdwHnbG5NtoI
	dcPEz4OjMByrInvvcS7N0E2PEh14WPg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-pJ-FN0_fOfGM3h0urfZPtQ-1; Sat, 21 Oct 2023 12:32:33 -0400
X-MC-Unique: pJ-FN0_fOfGM3h0urfZPtQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41e172143c3so1540861cf.1
        for <linux-lvm@lists.linux.dev>; Sat, 21 Oct 2023 09:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697905952; x=1698510752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEXmS9ZQGRoDF1NAlAy6xgQSJzBenDp0on+mVxAArgQ=;
        b=ISfLmgr7VduuTVK+ebZtJwcCeMulASDX83Mnwy3UVzk6KyTcSKlBveYjZjMYHhX3xg
         PtOG5mx/mtMztbAU3SXUmIuyjeWox7Vr09+NZjS9NF61FtgCiF6KDo0b4iMC32k9v3W9
         WVbqiReC2MHTi5+NlbXwb8pIMrNBMk5xDtfTR5HkdkV8FSibQi+UBh3jS1aqbQiqoFkw
         EY0MYHRz7XVIpNNrGluGHekUWVjkP+crM3Ha0UL8uYqJJ9yslO5GQelRH2gn7m0Xu2N8
         Bovz0YILYqfFTIG9ncXllaItF4X+bhKCCZLvgLJplpB+QupdEQI6tbMYzbcaP/EgBGLi
         07Nw==
X-Gm-Message-State: AOJu0Yy8Qf1rHKri6Ce+deO2Y3P5At/ZpAmNIv+6W95mey7PeGOuCMjg
	Jf/OMSk7zx/nELAZS4qXeeTK4nF/vnBWiY9GdZ+oY0HWaldoJaQfwhPTHffadYq2dLBwoNipARd
	mnxAKfio4OkzIqstly7YiMWp+4bYK0Fk6OO6GdBzLy78v6SI55z8TPisTA+OBj6Pxs+ZiswDGqV
	42XAE=
X-Received: by 2002:a05:622a:1447:b0:417:fe21:b254 with SMTP id v7-20020a05622a144700b00417fe21b254mr9858470qtx.18.1697905952477;
        Sat, 21 Oct 2023 09:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepoVYDtWD20m4vP09UJBvhynH56n8EdxJrTTdLk2TKLGqNF0Sau1HeDxtEfNNlhfb56DGrw==
X-Received: by 2002:a05:622a:1447:b0:417:fe21:b254 with SMTP id v7-20020a05622a144700b00417fe21b254mr9858451qtx.18.1697905952089;
        Sat, 21 Oct 2023 09:32:32 -0700 (PDT)
Received: from localhost ([45.88.222.210])
        by smtp.gmail.com with ESMTPSA id i21-20020ac860d5000000b0041b3deef647sm1459314qtm.8.2023.10.21.09.32.31
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 09:32:31 -0700 (PDT)
Date: Sat, 21 Oct 2023 12:32:28 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: linux-lvm@lists.linux.dev
Subject: list unsubscribe confusion [was: You have been unsubscribed from the
 linux-lvm mailing list]
Message-ID: <ZTP9HNezNcl0IhSx@redhat.com>
References: <mailman.0.1697887231.3730022.linux-lvm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <mailman.0.1697887231.3730022.linux-lvm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


You haven't been unsubscribed.

The list is now managed by lists.linux.dev

I think someone saw the auto-mail when i subscribed the new list
(linux-lvm@lists.linux.dev) to the old list (linux-lvm@redhat.com),
they were bad actors and decided to spoof the new list and unsubscribe
it from the old list (because confirmation was sent to the new list
they were able to successfully unsubscribe the new list from the old
mailman list).

I've since locked down unsubscribe requests from the old list.  But
you should only receive mail from this list in terms of
lists.linux.dev moving forward.

The temporary forward from the old list to the new is just a stop-gap
tp catch people who still send to the old list.  It will be
discontinued in ~2 weeks.

If you'd like to be extra sure you're still subscribed (to the new
list) please send mail to: linux-lvm+subscribe@lists.linux.dev

Sorry for any confusion.

Thanks,
Mike

