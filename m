Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACE0C4743E
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:03:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24EE2610A2
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24EE2610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623168188;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aaida2AcDCDb8D/QeIxSCdcwgRvW8Mcs6dSO9mO5SU4=;
	b=Rgw9iAI67NjUd8pDo+wEArZ46cR875mbLwaddnlhj10eD7U3esxX3OwXL0gbNBCgppTYro
	7DFRJb+IQDqVLq3DCzVjUuvDcxfC18BM4nzIRVQN8/Y+6TisZ33xz/5/ZpcWqw8kM8ZT2l
	ux8WwOlmq1TXlXPP9yVHeLdpWgDLtJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-BcqXtK5SMaGbe-oP2LZtBQ-1; Tue, 08 Jun 2021 12:03:06 -0400
X-MC-Unique: BcqXtK5SMaGbe-oP2LZtBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE4E107ACE4;
	Tue,  8 Jun 2021 16:02:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3CD620DE;
	Tue,  8 Jun 2021 16:02:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3534F44A5A;
	Tue,  8 Jun 2021 16:02:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158G2mNZ018707 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 12:02:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC55B10016F8; Tue,  8 Jun 2021 16:02:48 +0000 (UTC)
Received: from [10.40.194.232] (unknown [10.40.194.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCD5100760F;
	Tue,  8 Jun 2021 16:02:44 +0000 (UTC)
To: Martin Wilck <martin.wilck@suse.com>,
	"teigland@redhat.com" <teigland@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
	<cbca76c688270279a290568918b70b20c03e48c2.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8df4f1b8-8ef2-455f-de81-ed0dda70a6ea@redhat.com>
Date: Tue, 8 Jun 2021 18:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cbca76c688270279a290568918b70b20c03e48c2.camel@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

Dne 08. 06. 21 v 17:47 Martin Wilck napsal(a):
> On Di, 2021-06-08 at 10:39 -0500, David Teigland wrote:
>> . Use both native md/mpath detection *and* udev info when it's
>> readily
>>  =A0 available (don't wait for it), instead of limiting ourselves to one
>>  =A0 source of info.=A0 If either source indicates an md/mpath component=
,
>>  =A0 then we consider it true.
> Hm. You can boot with "multipath=3Doff" which udev would take into
> account. What would you do in that case? Native mpath detection would
> probably not figure it out.
>
> multipath-tools itself follows the "try udev and fall back to native if
> it fails" approach, which isn't always perfect, either.
>
>> A third related improvement that could follow is to add stronger
>> native
>> mpath detection, in which lvm uses uses /etc/multipath/wwids,
>> directly or
>> through a multipath library, to identify mpath components.=A0 This
>> would
>> supplement the existing sysfs and udev sources, and address the
>> difficult
>> case where the mpath device is not yet set up.
>>
> Please don't. Use libmpathvalid if you want to improve in this area.
> That's what it was made for.

Problem is addition of another dependency here.

We may probably think about using=A0 'dlopen' and if library is present use=
 it,=20
but IMHO=A0 libmpathvalid should be integrated into libblkid=A0 in some way=
=A0 -=20
linking another library to many other projects that needs to detect MP devi=
ces=20
really complicates this a lot.=A0 libblkid should be able to decode this an=
d=20
make things much cleaner.

I'd also vote for lvm2 plugin for blkid as forking thousands of process sim=
ply=20
always will take a lot of time (but this would require quite some code=20
shufling withing lvm codebase).

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

