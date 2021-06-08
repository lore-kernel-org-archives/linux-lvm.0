Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE11CC47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 14:23:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8905C61360
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 14:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8905C61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623162226;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HCsJJtVf64PS/eimXMLPE3jlE9h4zpYFsWDWGawTAi0=;
	b=IJA4WF+ulTP7Z6lOb6+yavOuquRrl4zT6RBW6saaf3p8wEKF92ZgEZ15rkwqp1joq9bD9X
	mLRAgoZcHhu1uIULkTFrdTQTLNgciMIt+XZ2IwThH06MeM2eR7+Oi3pnRrkjDEt8cr+QZV
	tzLauSMCMLFZXVVNZklVSZg2ZF2ONj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-n8iTpIJ-Ot-mAPfQ_LRbtA-1; Tue, 08 Jun 2021 10:23:45 -0400
X-MC-Unique: n8iTpIJ-Ot-mAPfQ_LRbtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16B39107ACE8;
	Tue,  8 Jun 2021 14:23:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B94862A0E;
	Tue,  8 Jun 2021 14:23:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3C7344A5C;
	Tue,  8 Jun 2021 14:23:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158ENRel007796 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 10:23:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 833FF5D6DC; Tue,  8 Jun 2021 14:23:27 +0000 (UTC)
Received: from [10.40.194.232] (unknown [10.40.194.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE2195D6D3;
	Tue,  8 Jun 2021 14:23:22 +0000 (UTC)
To: Peter Rajnoha <prajnoha@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
	<fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
	<20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0322710f-fbfe-73ff-b24d-af08aae178fd@redhat.com>
Date: Tue, 8 Jun 2021 16:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, teigland@redhat.com,
	Heming Zhao <heming.zhao@suse.com>, Martin Wilck <martin.wilck@suse.com>
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
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"

Dne 08. 06. 21 v 15:56 Peter Rajnoha napsal(a):
> On Tue 08 Jun 2021 15:46, Zdenek Kabelac wrote:
>> Dne 08. 06. 21 v 15:41 Peter Rajnoha napsal(a):
>>> On Tue 08 Jun 2021 13:23, Martin Wilck wrote:
>>>> On Di, 2021-06-08 at 14:29 +0200, Peter Rajnoha wrote:
>>>>> On Mon 07 Jun 2021 16:48, David Teigland wrote:
>>>>>> If there are say 1000 PVs already present on the system, there
>>>>>> could be
>>>>>> real savings in having one lvm command process all 1000, and then
>>>>>> switch
>>>>>> over to processing uevents for any further devices afterward.=A0 The
>>>>>> switch
>>>>>> over would be delicate because of the obvious races involved with
>>>>>> new devs
>>>>>> appearing, but probably feasible.
>>>>> Maybe to avoid the race, we could possibly write the proposed
>>>>> "/run/lvm2/boot-finished" right before we initiate scanning in
>>>>> "vgchange
>>>>> -aay" that is a part of the lvm2-activation-net.service (the last
>>>>> service to do the direct activation).
>>>>>
>>>>> A few event-based pvscans could fire during the window between
>>>>> "scan initiated phase" in lvm2-activation-net.service's
>>>>> "ExecStart=3Dvgchange -aay..."
>>>>> and the originally proposed "ExecStartPost=3D/bin/touch /run/lvm2/boo=
t-
>>>>> finished",
>>>>> but I think still better than missing important uevents completely in
>>>>> this window.
>>>> That sounds reasonable. I was thinking along similar lines. Note that
>>>> in the case where we had problems lately, all actual activation (and
>>>> slowness) happened in lvm2-activation-early.service.
>>>>
>>> Yes, I think most of the activations are covered with the first service
>>> where most of the devices are already present, then the rest is covered
>>> by the other two services.
>>>
>>> Anyway, I'd still like to know why exactly
>>> obtain_device_list_from_udev=3D1 is so slow. The only thing that it doe=
s
>>> is that it calls libudev's enumeration for "block" subsystem devs. We
>>> don't even check if the device is intialized in udev in this case if I
>>> remember correctly, so if there's any udev processing in parallel hapen=
ning,
>>> it shouldn't be slowing down. BUT we're waiting for udev records to
>>> get initialized for filtering reasons, like mpath and MD component dete=
ction.
>>> We should probably inspect this in detail and see where the time is rea=
lly
>>> taken underneath before we do any futher changes...
>>
>> This remains me - did we already fix the anoying problem of 'repeated' s=
leep
>> for every 'unfinished' udev intialization?
>>
>> I believe there should be exactly one sleep try to wait for udev and if =
it
>> doesn't work - go with out.
>>
>> But I've seen some trace where the sleep was repeatedly for each device =
were
>> udev was 'uninitiated'.
>>
>> Clearly this doesn't fix the problem of 'unitialized udev' but at least
>> avoid extremely lengthy sleeping lvm command.
> The sleep + iteration is still there!
>
> The issue is that we're relying now on udev db records that contain
> info about mpath and MD components - without this, the detection (and
> hence filtering) could fail in certain cases. So if go without checking
> udev db, that'll be a step back. As an alternative, we'd need to call
> out mpath and MD directly from LVM2 if we really wanted to avoid
> checking udev db (but then, we're checking the same thing that is
> already checked by udev means).


Few things here: I've already seen traces where we've been waiting for udev=
=20
basically 'endlessly' - like if sleep actually does not help at all.

So either our command holds some lock - preventing 'udev' rule to finish -=
=A0 or=20
some other trouble is blocking it.

My point why we should wait 'just once' is - that if the 1st. sleep didn't=
=20
help - likely all other next sleep for other devices won't help either.

So we may like report some 'garbage' if we don't have all the info from ude=
v=20
we need to - but at least it won't take so many minutes, and in some cases =
the=20
device isn't actually needed for successful command completiion.

But of course we should figure out why udev isn't initialized in-time.


Zdenek


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

