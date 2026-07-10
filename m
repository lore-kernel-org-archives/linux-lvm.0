Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F53148DD
	for <linux-lvm@lists.linux.dev>; Fri, 10 Jul 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712619; cv=none; b=uI19RbptHsHy2gAn+UUpERlXo8/3XDIXmKZi0JjXVJFNzsfPpGnl6EikFjsOU7/PQ/v9u1Cv5XLovUikb/q+35opQ1aeEGMBYjQMak1JymsmJ65flzp/X/lh46aouL/ffamwFCSF3z1Vdci8ipLw05Z1u1lLlemi5ixShbO0UIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712619; c=relaxed/simple;
	bh=9vAcbQRqkc/XHOeqwdlNUUX0EuqcBdgsfUGBmkDW/gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AYTXKyMXwGWDZwhLpaXmivKKbwu+PT+e9yxKeEPu9nLhhkltgzD44uM40FpfcmECcTS2jw3IY/VNuxyX4vVLDR7u6ioUhRgJu8QGWYPuliWzKWN5IIm97C9XurkS0QeDnbWt6tdDSLx6c0cq2WympxsU2FTQx4MMFu2OLwGFmj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3eNgmp8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3eNgmp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783712615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7MASokZKUNMAc94cMJmrGlbz1h9x8uleI/J9kjG0shQ=;
	b=W3eNgmp8AQlCn2qu/cFGPLAeuu0iQNIZpj+GS5dH3hC9WB5xDU9qTkvnF0ylsT/KoqZ5su
	y3xbfsgQH1BZEMU4OwDKSKVlve66Q24PyLGLVp41W3ucF50Iy2+97VvJsuSwYWvMbrjyAV
	+fiilpRlgX9Cc3WNTnTGKZ9UgCMCk7Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-gM7E2JKGPuirT865Xe20Aw-1; Fri, 10 Jul 2026 15:43:34 -0400
X-MC-Unique: gM7E2JKGPuirT865Xe20Aw-1
X-Mimecast-MFC-AGG-ID: gM7E2JKGPuirT865Xe20Aw_1783712613
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a767b782so11412945e9.2
        for <linux-lvm@lists.linux.dev>; Fri, 10 Jul 2026 12:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712613; x=1784317413;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MASokZKUNMAc94cMJmrGlbz1h9x8uleI/J9kjG0shQ=;
        b=WSBccgWXXmD9ZgP2KWlrjLyiwl8yoWmjHIY6c00u3gJbocGjybzsuQjDowOHmJrn2K
         eV6Y7VsopfMMhgxpwNkhu1OwOTMTuEVG7YyBwx3bKj2BKvGVjsVjJCsyC5RPSzKfqiHK
         wocl7ZI8k/hlFL0J04AqqMSqMSySDHEVGq5ar+UduAHx4FTGktodXk2Y00OaEG1l3MDl
         uW8YR/VAa2qAJ0R6ZpyHIXRWL5PX3QBMPPBVYS5fgvLA9TH7odFDVNvuwdw/Eufev03R
         HmZ1eVdtfBg5J2uy8wFs98VYnnwf7gxWf9Y9+NtGh9RMhbTG3ePsWyg61xlMq/HYXoJC
         qtwQ==
X-Forwarded-Encrypted: i=1; AHgh+RohQygqk54bmFK+WluMxNk0Kl8n4sGl75cAa/OpTgfayIrba/ns7IRDpFQuCC8S1kRGKstFEFx3WVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqJNDaGFNOA7OdjEUztsQaUeub3AqCmax0JaLuIJ7XJQGRrPR0
	o4+55WlKfMorYGNfqKJRwFMXG/ldVBTTVtIUJz2/WrsxGwvGHYcKqK4AUxeeCT/Ks8f0AxZuUlD
	Zv6eprWpGf3WxfpUwJQDRO1zP/+6FsSiLvWoaczpD0EuhWdrqjdcGV/6rOjNdgpeSziEbPg==
X-Gm-Gg: AfdE7ckGwyL6SYYPuna+7zXKgCYt71fG23CqQPsyHRzMqBma4R/rmKMyEnFNcXQvEqO
	XG762Bwi4yByH+x+n5+IBhULwT3FFuZ2jnnVTGoGyMpB/QjFGi+iQau4H1sikypwLUFC8qb6W4W
	IXSN3MKkb/nheOqAs++egAedfFMFrQ4V/6MJxO5Zh7eVlSLuDsrq+qPI+/Sz+yECva/k5JJBEOn
	qi2ljT++FNza5I9+dAG/0ZMXBH46Bw5w06iqXnSBJcLd38OORyFaQ7KbBWQ6tOpofKevldtXAXq
	P3NYxma2hoGB165/iesxZgqqxdNBCibBQz9y5d3Zaj/dmiKZbc3HK/4Y3U/RRF99e5W9Ux/lxWw
	vl5O+2NTNg5R6Hw==
X-Received: by 2002:a05:600c:4e48:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-493f881ddedmr1905515e9.21.1783712613173;
        Fri, 10 Jul 2026 12:43:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4e48:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-493f881ddedmr1905395e9.21.1783712612640;
        Fri, 10 Jul 2026 12:43:32 -0700 (PDT)
Received: from [192.168.0.99] ([212.20.115.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm66166250f8f.1.2026.07.10.12.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 12:43:32 -0700 (PDT)
Message-ID: <cbfb7935-9163-44ef-b844-b9b50eb602a1@redhat.com>
Date: Fri, 10 Jul 2026 21:43:30 +0200
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thin pool: safe pattern for disposable per-session snapshots over
 a shared read-only base?
To: Mohamed Eltamawey <tammwy22@gmail.com>, linux-lvm@lists.linux.dev
References: <CAC7Ui73Mmbriuhb=9mz0kJi-nzE5o=K9prAMg72J-Sab2F6fTw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: RedHat
In-Reply-To: <CAC7Ui73Mmbriuhb=9mz0kJi-nzE5o=K9prAMg72J-Sab2F6fTw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -PmX31TQMGUK9NZl5BbcTX6xGJ7B4-EaObIsMv0pFKw_1783712613
X-Mimecast-Originator: redhat.com
Content-Language: en-US, cs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 10. 07. 26 v 21:14 Mohamed Eltamawey napsal(a):
> Hi,
> 
> I'm designing a storage layout for a virtualization framework and want to
> sanity-check the approach against a real thin-pool user before I commit to it.
> 
> Setup:
> - One VG, one thin pool
> - A small number of read-only "base image" thin LVs inside the pool
>    (set with lvchange -pr)
> - Per-session thin snapshots of those base images ("writeback" disks) —
>    each session writes only into its own snapshot, and gets lvremove'd
>    when the session ends
> 
> Questions:
> 
> 1. Is there any way to mark a thin LV as "low value / freely disposable"
>     so that pool-level health/monitoring treats a failure on that LV
>     differently from a failure on the read-only base LV? As far as I can
>     tell there's no such attribute and tags are the only practical way to
>     distinguish them for my own tooling — is that right, or is there a
>     built-in mechanism I'm missing?

Hi

ATM lvm2 supports i.e. 'tags' - so user can 'tag' LVs with some extra info,
and then he can setup 'callback' script that can be called by dmeventd when
thin-pool passes threshold values i.e. 65% 70%...95% 100%  (by default 
dmevetnd just invokes lvextend - but it can be anything generic...)

Whatever user does at this point is then up to the logic implemneted - user 
may i.e. fstrim, then he can try to remove some LVs according to some rules.

Just keep in mind - using thin-pool when it's full - should be avoid - it's 
not a 'regular workflow'.

> 
> 2. If a single snapshot LV is reported as partial/failed by dmeventd,
>     is it always safe to lvremove -f just that LV without affecting the
>     pool's metadata health, as long as the pool itself isn't reporting
>     failed? Or are there edge cases where a single bad snapshot can
>     still corrupt shared pool metadata?

'single snapshot failed' would mean you would be using 'thick/old' non-thinly 
provisioned snapshot  - these snapshot are then unrelated to thin-pool - but 
using these old snapshot is discouraged - it's  efficient compared to thinly 
provisioned snapshot.

Thin snapshot however share the very same thin-pool -  thin snapshot is just 
'thin volume' which is 'prepopulated' by some othen thinLV.

What might be worth for you to investigated is the use of 'external' origins.

You can have 'thin-pool' with 'origin' images and then create 'thins' in 
individual thin-pools there thin starts with 'external' origin from other 
thin-pool.

This way you can achieve much greater granularity in terms how you distribute 
your VG disk space - but it mostly depends on type of workload - so just take 
a look if this might be having some added value.

Regards

Zdenek

