Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D9AC5479D
	for <linux-lvm@archiver.kernel.org>; Fri,  6 Jan 2023 13:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673012559;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1Se81LNeyM3AElyNZL6JROBqnNfiYjvwJ8z2FEBjYXw=;
	b=eZu8TYESnnyS56Cri2PV1fXJkknsFI5QcIJlM2lre5nejDJx8WcW+Swx5CHuDWNmOyQbJG
	yrgH4gLMl6rB3U/vveSRs0Zykhe8ohMzVbPBjkMa2cA8ApnXt10ZbeUh6qV/Q44F9d7vaP
	RgnZw0yCsnD5p2NNuO1Bg2YrICD6zKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-JaZCY6BuMNmvpxy9e3xBvg-1; Fri, 06 Jan 2023 08:42:36 -0500
X-MC-Unique: JaZCY6BuMNmvpxy9e3xBvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D023886063;
	Fri,  6 Jan 2023 13:42:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F01242166B30;
	Fri,  6 Jan 2023 13:42:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B9E7B1947063;
	Fri,  6 Jan 2023 13:42:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D7281946586
 for <linux-lvm@listman.corp.redhat.com>; Fri,  6 Jan 2023 13:42:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C435140EBF6; Fri,  6 Jan 2023 13:42:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44CCB140EBF5
 for <linux-lvm@redhat.com>; Fri,  6 Jan 2023 13:42:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28F6B858F0E
 for <linux-lvm@redhat.com>; Fri,  6 Jan 2023 13:42:27 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-W2-BTehIMpSQC7qOz49PcA-1; Fri, 06 Jan 2023 08:42:25 -0500
X-MC-Unique: W2-BTehIMpSQC7qOz49PcA-1
Received: by mail-ed1-f41.google.com with SMTP id i9so2285937edj.4;
 Fri, 06 Jan 2023 05:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H2gKMvte4+fM+5jkPD0aosvYevWMuOFeRWAjcRK5Nz8=;
 b=iG6399UCuvUtC3BBQpyUF/dVK6E1wZmyzjdEl4YOBlltHTMcdPoAbsBBXo3mJ8To86
 dyefGFuc0uc/i4F/8jXeuHypMYS2gmI3VsC4GN3i+Gdt5ziQvZmDsZPtbNk+XZUyNSU9
 D0yf2F45MigjRep1Wya/+Mh76I7u8hbdlNfi++dMGmnP4FWdn9OHWVvNxbrjRdotkoNS
 VgqxTzc4i/mbKRczdB6L+X8ZcQw3L9QY/+izdaWUZUe2ggyLQNiTTVgKZrb3Kj9mFLOj
 YpsI9klAUi9EYFm+DwrlzvyxAgP7UM9A7UwcYvv31Ep199aO4cCrUJhQc0O188nyrS9A
 7UUw==
X-Gm-Message-State: AFqh2kqepTvh+kt7pNX6FBTwAhGkIzYq4e1O8NzZTLgDfMfg6xquPadH
 fdE5LfCJUXf7kDZ3Ia2fpzJ9UrJfb5I=
X-Google-Smtp-Source: AMrXdXu8T1CXU35fBptvnD1BqRmT3aEwxRD7i4OYuYAK6lrN9drbGBur606hfiV3WfVcNIpRIf/7pg==
X-Received: by 2002:a05:6402:4518:b0:46c:b2a7:1e03 with SMTP id
 ez24-20020a056402451800b0046cb2a71e03mr42736137edb.36.1673012543865; 
 Fri, 06 Jan 2023 05:42:23 -0800 (PST)
Received: from [10.43.17.48] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 cf15-20020a0564020b8f00b0046db7a913f1sm501983edb.81.2023.01.06.05.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 05:42:23 -0800 (PST)
Message-ID: <2b1466c2-f545-d06a-6ce4-d420ed038ad1@gmail.com>
Date: Fri, 6 Jan 2023 14:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Zhiyong Ye <yezhiyong@bytedance.com>, Zdenek Kabelac <zkabelac@redhat.com>
References: <eed877f5-53f5-101b-44ab-a61f1328e62f@bytedance.com>
 <930cea69-8e7a-d0df-a48c-93e7a668be2f@redhat.com>
 <d2c5bef2-a418-049e-1ff8-160375881e90@bytedance.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <d2c5bef2-a418-049e-1ff8-160375881e90@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [linux-lvm] The feasibility of implementing an alternative
 snapshot approach
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 04. 01. 23 v 17:12 Zhiyong Ye napsal(a):
> Hi Zdenek,
> 
> Thank you for your reply.
> 
> Snapshots of thinlv are indeed more efficient compared to standard lv, this is 
> because data blocks can be shared between snapshot and original thinlv. But 
> there is also a performance loss after thinlv creates a snapshot. This is 
> because the first write to the snapshotted thinlv requires not only allocating 
> a new chunk but also copying the old data.
> 
> Here are some performance data and a discussion of the thinlv snapshot:
> 
> https://listman.redhat.com/archives/linux-lvm/2022-June/026200.html
>

Well that's our current  'state-of-the-art' solution.

Make sure you are using latest kernels for your performance testing - there 
have been several improvements around the locking (6+ kernels) - but if this 
still not good enough for your case you might need to seek for some other 
solutions (although would be nice to know who handles this task better).

Definitely the old 'thick-snapshot' is mostly in maintenance phase and it's 
usability (and its design) is limited for some short living temporary 
snapshoting (i.e. you are making backup and after completing your backup of 
the filesystem you remove your temporary snapshot - it's been never designed 
to be used for multi-level multi-GiB snapshots - this will not fly...

When you use thin snapshots - make sure your metadata LV is located on your 
fast device and you use best fitting chunksize.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

