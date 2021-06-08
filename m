Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13440C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 13:47:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D4261285
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 13:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D4261285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623160022;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UQtS4Ff56yw2WQ7QWm55AOgz3UimGU/tz1latW/kZlo=;
	b=IpWYMV6nYjWZf9TIfHxZHpGxQnnDJNZ6BpMBQfa8qwbqUl1Ag9t215I3K51yaosUDi/Yr7
	wulkdvso6MNq/BCieSORzx9oOBtko7trR0GfdUWScuTNiOCwsjP/8YKgTQSDYkUM4H6PL+
	sC1kQxE/tWtZp6VZlr+bRY3qv03PCpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-Ap1OB4GDOaqrJ3XXfhzYag-1; Tue, 08 Jun 2021 09:47:01 -0400
X-MC-Unique: Ap1OB4GDOaqrJ3XXfhzYag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 558B210074BF;
	Tue,  8 Jun 2021 13:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C471037E97;
	Tue,  8 Jun 2021 13:46:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0933344A59;
	Tue,  8 Jun 2021 13:46:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158DkpQS005074 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 09:46:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8D555D9C6; Tue,  8 Jun 2021 13:46:51 +0000 (UTC)
Received: from [10.40.194.232] (unknown [10.40.194.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89DE65D9DE;
	Tue,  8 Jun 2021 13:46:47 +0000 (UTC)
To: Peter Rajnoha <prajnoha@redhat.com>, Martin Wilck <martin.wilck@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
Date: Tue, 8 Jun 2021 15:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-lvm@redhat.com
Cc: Heming Zhao <heming.zhao@suse.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"

Dne 08. 06. 21 v 15:41 Peter Rajnoha napsal(a):
> On Tue 08 Jun 2021 13:23, Martin Wilck wrote:
>> On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
>>> On Mon 07 Jun 2021 16:48, David Teigland wrote:
>>>> If there are say 1000 PVs already present on the system, there
>>>> could be
>>>> real savings in having one lvm command process all 1000, and then
>>>> switch
>>>> over to processing uevents for any further devices afterward.=A0 The
>>>> switch
>>>> over would be delicate because of the obvious races involved with
>>>> new devs
>>>> appearing, but probably feasible.
>>> Maybe to avoid the race, we could possibly write the proposed
>>> "/run/lvm2/boot-finished" right before we initiate scanning in
>>> "vgchange
>>> -aay" that is a part of the lvm2-activation-net.service (the last
>>> service to do the direct activation).
>>>
>>> A few event-based pvscans could fire during the window between
>>> "scan initiated phase" in lvm2-activation-net.service's
>>> "ExecStart=3Dvgchange -aay..."
>>> and the originally proposed "ExecStartPost=3D/bin/touch /run/lvm2/boot-
>>> finished",
>>> but I think still better than missing important uevents completely in
>>> this window.
>> That sounds reasonable. I was thinking along similar lines. Note that
>> in the case where we had problems lately, all actual activation (and
>> slowness) happened in lvm2-activation-early.service.
>>
> Yes, I think most of the activations are covered with the first service
> where most of the devices are already present, then the rest is covered
> by the other two services.
>
> Anyway, I'd still like to know why exactly
> obtain_device_list_from_udev=3D1 is so slow. The only thing that it does
> is that it calls libudev's enumeration for "block" subsystem devs. We
> don't even check if the device is intialized in udev in this case if I
> remember correctly, so if there's any udev processing in parallel hapenni=
ng,
> it shouldn't be slowing down. BUT we're waiting for udev records to
> get initialized for filtering reasons, like mpath and MD component detect=
ion.
> We should probably inspect this in detail and see where the time is reall=
y
> taken underneath before we do any futher changes...


This remains me - did we already fix the anoying problem of 'repeated' slee=
p=20
for every 'unfinished' udev intialization?

I believe there should be exactly one sleep try to wait for udev and if it=
=20
doesn't work - go with out.

But I've seen some trace where the sleep was repeatedly for each device wer=
e=20
udev was 'uninitiated'.

Clearly this doesn't fix the problem of 'unitialized udev' but at least avo=
id=20
extremely lengthy sleeping lvm command.

Zdene


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

