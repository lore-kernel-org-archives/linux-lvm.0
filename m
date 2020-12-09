Return-Path: <SRS0=oYOT=FN=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7BBC433FE
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 11:06:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D802336F
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Dec 2020 11:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D802336F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607511959;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uNECX9dCcgiU8yO0K9cTiR9bYmWd1HQw5e+aoxGEHPo=;
	b=aB4oxYO+hnAqaO4wrP0OPGkZ0o2631jYs9AojrwfyUQkx8Z/2MwGwXbV2q2Tc80DcphSVA
	vOe7zFa2K3OHFyD9Gvwrtd5sA4rCPEzAJz+FnypxyQG0738cryWQxaIJxIcf47GsYJW3dt
	KRkivVTPw02HV2+dhVmUZcgcrBBBcVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-bat66z5YMRiAYwJd5SFRrw-1; Wed, 09 Dec 2020 06:05:56 -0500
X-MC-Unique: bat66z5YMRiAYwJd5SFRrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5834B612A7;
	Wed,  9 Dec 2020 11:05:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 777D719C78;
	Wed,  9 Dec 2020 11:05:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 219324A7C6;
	Wed,  9 Dec 2020 11:05:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B9B5Luk007434 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Dec 2020 06:05:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F33B760BFA; Wed,  9 Dec 2020 11:05:20 +0000 (UTC)
Received: from [10.40.195.41] (unknown [10.40.195.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DD1C60BF1;
	Wed,  9 Dec 2020 11:05:13 +0000 (UTC)
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Dennis Schridde <devurandom@gmx.net>
References: <4384449.LvFx2qVVIh@monk>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <a2927a4a-006e-6b5b-3597-d7b592e21ec7@redhat.com>
Date: Wed, 9 Dec 2020 12:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4384449.LvFx2qVVIh@monk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] cache_check --clear-needs-check-flag does not clear
 needs_check flag?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 06. 12. 20 v 22:01 Dennis Schridde napsal(a):
> Hello!
> 
> A cached logical volume of mine cannot be activated anymore:
> 
> $ sudo vgchange -ay
>     device-mapper: reload ioctl on   (253:6) failed: Invalid argument
>     0 logical volume(s) in volume group "vg_ernie" now active
> 
> 
> dmesg logs:
> 
> device-mapper: cache: 253:6: unable to switch cache to write mode until
> repaired.
> device-mapper: cache: 253:6: switching cache to read-only mode
> device-mapper: table: 253:6: cache: Unable to get write access to metadata,
> please check/repair metadata.
> device-mapper: ioctl: error adding target to table
> 
> 
> The code in question seems to be: https://github.com/torvalds/linux/blob/v5.8/
> drivers/md/dm-cache-target.c#L957-L964
> 
> 
> Hence I set out to check the cache and, if it is clean, clear the needs_check
> flag:
> 
> $ sudo lvchange -ay vg_ernie/lv_cache
> Do you want to activate component LV in read-only mode? [y/n]: y
>     Allowing activation of component LV.

As said - by component activation you will get 'read-only' volume
thus you cannot do 'in-place' changes this way.


> 
> A bit puzzling is that the status of the needs_check flag appears to be
> "unknown":
> 
> $ sudo lvs -a -o +lv_check_needed
>     LV                        VG          Attr          LSize    Pool
> Origin                  Data%   Meta%   Move Log Cpy%Sync Convert CheckNeeded
>     [lv_cache]            vg_ernie CRi-a-C--- 232.88g
> unknown
>     lv_system             vg_ernie Cwi---C---   <1.82t [lv_cache]
> [lv_system_corig]
> unknown
>     [lv_system_corig] vg_ernie owi---C---   <1.82t
> unknown
> 
> 
> The live system I am running these commands from is a Fedora 33:
> 
> $ uname -a
> Linux localhost-live 5.8.15-301.fc33.x86_64 #1 SMP Thu Oct 15 16:58:06 UTC
> 2020 x86_64 x86_64 x86_64 GNU/Linux
> 
> $ sudo lvm version
>     LVM version:       2.03.10(2) (2020-08-09)
>     Library version: 1.02.173 (2020-08-09)
>     Driver version:   4.42.0

It seems you are using  'cvol' instead of 'cpool' solution which has been 
evolving and you will need a newer lvm2 version.

If you want to using caching with the version of lvm2 you have - you will
need to use cpools  (which are a bit faster anyway).

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

