Return-Path: <SRS0=j0V8=OV=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EB0C433EF
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:01:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5B160EBB
	for <linux-lvm@archiver.kernel.org>; Fri,  1 Oct 2021 08:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E5B160EBB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633075293;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m2Izf+nIOFm002dPpKfkFTGgvetOlzUUofX10ZnD9yY=;
	b=VKEbsOTZUiHmd4Kq34E/HTOUwyl+Dc22WBR5RbEE5CtbjV3hti1wk0YuHjukZUWv49mfkf
	kYKFFzjOnfS+UXqK5BkTf6qX7Gsum+ZWAozJd5fQuBAzoPJDzYqBiOmyLck4dsimDZjAfe
	+GLl7adWCJjLyarYR9s/KgMGVU4+DYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-lWz9hThhMx2uG6iKp-Pp8g-1; Fri, 01 Oct 2021 04:01:31 -0400
X-MC-Unique: lWz9hThhMx2uG6iKp-Pp8g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E059800053;
	Fri,  1 Oct 2021 08:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC655D6BA;
	Fri,  1 Oct 2021 08:01:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC40B1803B30;
	Fri,  1 Oct 2021 08:01:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19180wDg013667 for <linux-lvm@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 04:00:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4815101F0C7; Fri,  1 Oct 2021 08:00:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D077310A142D
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 08:00:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EF6418E531C
	for <linux-lvm@redhat.com>; Fri,  1 Oct 2021 08:00:39 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-448-Ixq2pCb-MGq9rqgPef26lg-1; Fri, 01 Oct 2021 04:00:38 -0400
X-MC-Unique: Ixq2pCb-MGq9rqgPef26lg-1
Received: by mail-ed1-f71.google.com with SMTP id
	n19-20020a509353000000b003dad185759bso1596022eda.6
	for <linux-lvm@redhat.com>; Fri, 01 Oct 2021 01:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=mVPhpTF1x0eWY8QShC9gVgj4c68/VcS1m4cA/y/Rl7Q=;
	b=hcS2Q8IkM47H9H63Z3X9PTaMFf7C9rcEU0TspaHpNi3EwawhmSi4/TfV3d218M5bkp
	ERS0Pf4z46xxl/HPI7y4whZHK8F1xkoGwmBmp5ISA4HsOpwJVkRZp50QeGxDQgEKNC9f
	Bw4lO+8mVzejzUoCWQMgcqS3QKMogjNrrKlpXFQnGUkGCCAEZTPKjf4o/JrOeqrZ43IB
	P9M0apvoabYI2CNj9LtLYqasWckIEAYzPF7fCLYJbie07MtV3bsDXINIc1zliHnlTEYp
	2t6RpyuB1KCvHuqzX/PamlrxLzrQ32ROIfBa8a296STWupzsOYuYz0uIgGrSWJZnpe3K
	XdsA==
X-Gm-Message-State: AOAM532hkFpFsNRifLqjT2vI+EtI/IANs4/zHBOfW8kVofZiRxZCQWIF
	YJ+5r+Q0Glx5QJoqEaIWUIyl2XnhRyVmx0WABAdoRoi7sevRBXw6eYJl+z9hHxtAnt5tA508T6A
	1y9IyIgehiLR5l/nY
X-Received: by 2002:a50:d841:: with SMTP id v1mr12576508edj.221.1633075236883; 
	Fri, 01 Oct 2021 01:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWpzGFbWTHIY4hbl7PJCFlfKKZ6ltLY29lQ/8TOlGiF/jTCyoKYI7SX0B6WtqL7LZXzvZR6g==
X-Received: by 2002:a50:d841:: with SMTP id v1mr12576494edj.221.1633075236691; 
	Fri, 01 Oct 2021 01:00:36 -0700 (PDT)
Received: from alatyr-rpi.brq.redhat.com (nat-pool-brq-t.redhat.com.
	[213.175.37.10]) by smtp.gmail.com with ESMTPSA id
	s17sm2699569edd.47.2021.10.01.01.00.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Oct 2021 01:00:36 -0700 (PDT)
Date: Fri, 1 Oct 2021 10:00:32 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
To: David Teigland <teigland@redhat.com>
Message-ID: <20211001080032.nzr6i7wewyc6ssin@alatyr-rpi.brq.redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930155542.GB32174@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: zkabelac@redhat.com, bmarzins@redhat.com, martin.wilck@suse.com,
	heming.zhao@suse.com, linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu 30 Sep 2021 10:55, David Teigland wrote:
> On Wed, Sep 29, 2021 at 11:39:52PM +0200, Peter Rajnoha wrote:
> > Hmm, thinking about this, I've just realized one more important and related
> > thing here I didn't realize before - the LVM regex filters! These may contain
> > symlink names as one can find them in /dev. But for those symlinks, we need
> > to be sure that the rules are already applied. This practically means that:
> 
> At least at RH we're enabling the devices file by default (meaning no
> filter) in the same timeframe that we're looking at these activation
> services.  So, I don't think this is a big factor.
> 

OK, if we don't need access to all the aliases (all the symlink names under /dev),
then that's great. We just need to make sure the devices file is then
always used with pvscan called out of the udev rule.

> >   - For non-event-based activation, we need udev-settle (so we're sure
> >     all the rules are applied for all devices we might be scanning).
> > 
> >   - For event-based activation, we need to be sure that we use "RUN"
> >     rule, not any of "IMPORT{program}" or "PROGRAM" rule. The difference
> >     is that the "RUN" rules are applied after all the other udev rules are
> >     already applied for current uevent, including creation of symlinks. And
> >     currently, we have IMPORT{program}="pvscan..." in our rule,
> >     unfortunately...
> 
> That's pretty subtle, I'm wary about propagating such specific and
> delicate behavior, seems fragile.
> 

Yeah, that was just because I didn't realize we don't actually need those
symlinks and the classic filter is ignored in this case. I thought we
had a bug in our current 69-dm-lvm.rules where we call IMPORT{progra}=pvscan
in which case all the symlinks are not created yet. I'm glad it's not
the case.

> > The nodes are already there, the symlinks could be missing because the
> > udev rules haven't been processed yet.
> > 
> > Non-event-based LVM activation needs to wait for settle for sure (because
> > there's full scan across all devices).
> > 
> > Event-based LVM activation just needs to be sure that:
> > 
> >   - the pvscan only scans the single device (the one for which there's
> >     the uevent currently being processed),
> > 
> >   - the pvscan should be called in a way that we have all the symlinks
> >     in place so the regex filter still works for symlinks (== putting
> >     the pvscan onto a RUN exec queue).
> 
> I think we're looking at a udev-settle dependency (or alternative) for all
> cases, best to just make that explicit and consistent, and isolated in one
> place.  I'm not really seeing a downside to that.  Then, focus efforts on
> refining a replacement.  If the subtle dependencies are spread around then
> it's hard to extract and improve the unwanted parts.

So then we can concentrate on minimizing the set of devices we need to
"settle". Right now, I don't see technical obstacles to implementing this,
but the separation of systemd-udev-settle.service into pieces would be a
first step for this to perform better, I think.

The only problematic part here might be systemd/udev's aversion to
anything having "udev-settle" in mind. But I think if we're able to show
them the difference and advantage of using the settle here by presenting
real numbers and analysis, there might be a chance. The separation of
udev-settle into pieces would surely help too, because we could isolate
the settle to devices we're only interested in.

We can surely discuss that with them. Would be great if we find consensus
here on all sides, I don't want to fight with or completely ignore
systemd/udev guys and their optinions...

-- 
Peter

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

