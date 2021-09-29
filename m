Return-Path: <SRS0=Ecxi=OT=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FCCC433F5
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 21:53:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A92561423
	for <linux-lvm@archiver.kernel.org>; Wed, 29 Sep 2021 21:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A92561423
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632952437;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=084+8K2bohj/fdVSPmgSuUBGcCEm3gyR8z6IJt2pS+M=;
	b=E0RJlqpatVAh0iu7U9g/DLfSTO5bLfmIDgaRTI2a9gjAep7YG2ey2n/zlFpkNFyHexLj03
	nlSBplRU5rVWD7Uie5t/JqzIixGesPdgBEFxCrgDeKFtNyUhPNH+sVaegH+r5jCjDBITbG
	86dPelTex2vP1J7YABQ0egrjAghbQf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-hTCXRYLkOyy-h2xW6qnzVg-1; Wed, 29 Sep 2021 17:53:55 -0400
X-MC-Unique: hTCXRYLkOyy-h2xW6qnzVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7F81808319;
	Wed, 29 Sep 2021 21:53:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE32B19C59;
	Wed, 29 Sep 2021 21:53:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A04601800B9C;
	Wed, 29 Sep 2021 21:53:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TLrcSI019692 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 17:53:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 654DBEE84E; Wed, 29 Sep 2021 21:53:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E04AF00CD
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 21:53:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E357801E8D
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 21:53:23 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-taohOFzgPoyBjXsduTAIJA-1; Wed, 29 Sep 2021 17:53:21 -0400
X-MC-Unique: taohOFzgPoyBjXsduTAIJA-1
Received: by mail-ed1-f69.google.com with SMTP id
	c7-20020a05640227c700b003d27f41f1d4so3926151ede.16
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2021 14:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=mnsxvtzjg+zWlgH4xURL9/K/SNk+TWmu+/gGSi0LLcQ=;
	b=jQG5iwd+K5mTGvaGhsQUfJ7mLjOSn29IN1k0Se4EWZfdsjqOEsBS0nw5/UiXfQXTd+
	kPUVTmCqG9/1kH8+ugJ9B3Aqw85piF6zrYUy74JUL8YAss7ALqyMt/o4s7buQAhfi+j3
	HtLNqvw2CFL+d6YXePNnfZk01QPd2JZXrGs7d9Yp4irld4tm76g8I9Sio7C/SdEQ4uvM
	hEgrX9fQItH948pSC5Lywl2P9HUwh9WEayLRLEYH6NnlO/FA77jqMs/AJe+UZeZL65Dx
	Es1gVSedjdTq9u1+OAdgy2EXxgkBxueBarrdSWshU3y457P2DxDPMH5wXZBhZSYKlcri
	F0bg==
X-Gm-Message-State: AOAM531FXMslsBaZ7AxDT7K3F69MVYz6al/syL8f3A0Jabp2bn7NsiJV
	ankf6+0RqI5iemz+r7Fc8K6oKVScRr24TB8+m8dW5J9YwWVrApj7zUlUODolaMwzXJ1raPz3JGR
	8dGdc3mkCKXUaXE7X
X-Received: by 2002:a17:906:d541:: with SMTP id
	cr1mr2673081ejc.81.1632952400594; 
	Wed, 29 Sep 2021 14:53:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHuYl6CvqOcAHAZ85LdLVdq0QqGQXPH5O1oK62/KQotvCNB8RG4Adu6dbg7dt2qmqNL+dE7Q==
X-Received: by 2002:a17:906:d541:: with SMTP id
	cr1mr2672986ejc.81.1632952399462; 
	Wed, 29 Sep 2021 14:53:19 -0700 (PDT)
Received: from alatyr-rpi.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10])
	by smtp.gmail.com with ESMTPSA id g10sm541612ejj.44.2021.09.29.14.53.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Sep 2021 14:53:19 -0700 (PDT)
Date: Wed, 29 Sep 2021 23:53:15 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210929215315.o73j3qiewon63hqi@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <9947152f39a9c5663abdbe3dfee343556e8d53d7.camel@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
 mode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue 28 Sep 2021 06:34, Martin Wilck wrote:
> Hello David and Peter,
>=20
> On Mon, 2021-09-27 at 10:38 -0500, David Teigland wrote:
> > On Mon, Sep 27, 2021 at 12:00:32PM +0200, Peter Rajnoha wrote:
> > > > - We could use the new lvm-activate-* services to replace the
> > > > activation
> > > > generator when lvm.conf event_activation=3D0.=A0 This would be done=
 by
> > > > simply
> > > > not creating the event-activation-on file when event_activation=3D0=
.
> > >=20
> > > ...the issue I see here is around the systemd-udev-settle:
> >=20
> > Thanks, I have a couple questions about the udev-settle to understand
> > that
> > better, although it seems we may not need it.
> >=20
> > > =A0 - the setup where lvm-activate-vgs*.service are always there (not
> > > =A0=A0=A0 generated only on event_activation=3D0 as it was before wit=
h the
> > > =A0=A0=A0 original lvm2-activation-*.service) practically means we al=
ways
> > > =A0=A0=A0 make a dependency on systemd-udev-settle.service, which we
> > > shouldn't
> > > =A0=A0=A0 do in case we have event_activation=3D1.
> >=20
> > Why wouldn't the event_activation=3D1 case want a dependency on udev-
> > settle?
>=20
> You said it should wait for multipathd, which in turn waits for udev
> settle. And indeed it makes some sense. After all: the idea was to
> avoid locking issues or general resource starvation during uevent
> storms, which typically occur in the coldplug phase, and for which the
> completion of "udev settle" is the best available indicator.
>=20

Udevd already limits the number of concurent worker processes
processing the udev rules for each uevent. So even if we trigger all the
uevents, they are not processed all in parallel, there's some queueing.

However, whether this is good or not depends on perspective - you could
have massive paralelism and a risk of resource starvation or, from the
other side, you could have timeouts because something wasn't processed
in time for other parts of the system which are waiting for dependencies.

Also, the situation might differ based on the fact whether during the
uevent processing we're only looking at that concrete single device for
which we've just received an event or whether we also need to look at
other devices.

--=20
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

