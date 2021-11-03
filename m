Return-Path: <SRS0=MvFQ=PW=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24297C433F5
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 18:22:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6194604DC
	for <linux-lvm@archiver.kernel.org>; Wed,  3 Nov 2021 18:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6194604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-tndK6i1BOF6E_AdsNUKW7w-1; Wed, 03 Nov 2021 14:22:07 -0400
X-MC-Unique: tndK6i1BOF6E_AdsNUKW7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05EB110055BC;
	Wed,  3 Nov 2021 18:22:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFD741002D71;
	Wed,  3 Nov 2021 18:21:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A09DB1803B30;
	Wed,  3 Nov 2021 18:21:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A3ILkYR030694 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 3 Nov 2021 14:21:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 821931121315; Wed,  3 Nov 2021 18:21:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E1761121314
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 18:21:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15CD018A01A0
	for <linux-lvm@redhat.com>; Wed,  3 Nov 2021 18:21:42 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-Wpcoa3QnPnWyv9ST_UiM3A-1; Wed, 03 Nov 2021 14:21:40 -0400
X-MC-Unique: Wpcoa3QnPnWyv9ST_UiM3A-1
Received: by mail-qt1-f172.google.com with SMTP id h4so1778658qth.5
	for <linux-lvm@redhat.com>; Wed, 03 Nov 2021 11:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=c2U0RF2Z/E/gqFYMY8avUbADQfiQdAJ3x9xJJmsaOPo=;
	b=FW05lAV2b/ORVG2R21rHSJh22gLOXlaqq1c7AaYPK4a5cn04nl++bJ/lxbSaRBZ+c9
	9qWcGeNj9GWIoVKchjyzfdaHhDIXQIr6TcDQ4AEmod5Y7tyKz8k6jqWD2EE/Ig66b1Fv
	JCR8mtkP9f/B/xwsXPFgCckhGwCK+oUbGgbNaK+b5AGLgE78fHXwiLuT3I5ZnFrxJav5
	Lq2kLAz3ZHvmOOjonlN4lvDyPv5UwY4EassQsuBSNqk0+ZyFvpb3/ZbxCIO3UvYLLPiS
	HjRFZeCFO1/VzI4cOdFNLGk7c2+T6zt3CjfOOrpxIJoKAvqPbcArgXBkEfKwR1dsdTkm
	JUfA==
X-Gm-Message-State: AOAM5323m2UhbX+lW/HbHfnMZWU8s9TkU96z6OM7xAadLIKeX/MOQVrz
	sL1nf05/md9OE2ETPz4LjgBNJ21AM/NMf1Wp42aYl7UI
X-Google-Smtp-Source: ABdhPJxh65l4VGa1n7kK8888wfr7DfoFf+K/ePoL7V0YSO2HkWCD98EPGYmLaGBYsEV3Z/BPi+dlPy2CsnQLgSjF45k=
X-Received: by 2002:ac8:7d92:: with SMTP id c18mr18043785qtd.324.1635963699792;
	Wed, 03 Nov 2021 11:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJCQCtRCEtGmsVQt0ug4c6PxGXkwhHjtrppNPSxa0StYs08mQA@mail.gmail.com>
In-Reply-To: <CAJCQCtRCEtGmsVQt0ug4c6PxGXkwhHjtrppNPSxa0StYs08mQA@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 3 Nov 2021 13:21:27 -0500
Message-ID: <CAAMCDed2KFtOawdC-kZ6NUsryurYbN6ZHSmXAMEr9bymP9TpZw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] logical volume usage type code,
 equivalent to GPT partition type GUID
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

You have some basic problems.

#1 with shared lvm you would need a way to tell where it should go, so
you would have to have a mount_hostname type data in logical_volumes
sections.

#2 you would also need a mount_point entry, and a mount_opts entry.

And then at the end you are basically moving fstab into the
logicial_volume headers and that is not that useful overall because it
does not simplify anything for the most part, and probably actually
complicates things as the hostname change would get tricky, and/or
mountpoint changes would require lvm commands (harder than editing
fstab).

So long as the lv's are named reasonably then someone who knows they
are doing can mount up/recreate fstab with the lv in the right place
(say var_log_abrt would mount on /var/log/abrt).

I am not sure this simplifies anything nor improves anything except in
the case of a lost fstab, but naming the lv's verbosely at least makes
that easier.

On Wed, Nov 3, 2021 at 12:45 PM Chris Murphy <lists@colorremedies.com> wrote:
>
> Hi,
>
> I'm wondering to what degree the current LVM metadata format(s) can
> support additional or even arbitrary metadata.
>
> The UEFI spec defines the GPT, and GPT defines a "partition type GUID"
> for each partition to define it's usage/purpose, in rather open ended
> fashion. I'm wondering about an equivalent for this with LVM, whether
> it's useful and how difficult it would be to implement. This is all
> very hypothetical right now, so a high level discussion is preferred.
>
> The starting point is the Discoverable Partitions Spec:
> http://systemd.io/DISCOVERABLE_PARTITIONS/
>
> Where GPT partition type codes are used to discover file systems, and
> their intended use without having to explicitly place them into
> /etc/fstab for startup time discovery and mounting. But LVM doesn't
> have an equivalent for exposing such a capability, because it implies
> many volumes within the larger pool and also the pool might comprise
> many devices.
>
> The same problem exists for Btrfs subvolumes, and ZFS datasets.
>
> What might be possible and what is definitely not possible, is what
> I'm interested in understanding for now.
>
> Thanks,
>
> --
> Chris Murphy
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

