Return-Path: <SRS0=98TD=LJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAE7C48BDF
	for <linux-lvm@archiver.kernel.org>; Tue, 15 Jun 2021 18:22:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA3A613CC
	for <linux-lvm@archiver.kernel.org>; Tue, 15 Jun 2021 18:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA3A613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623781325;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UCtAj1+Zrz6nrU7klv1sTd/vRa+6nz9UrkdCTzGCG+g=;
	b=B9nQZi/QiS4HFQ9G8+KTe1Pnz7CZ+v4zXgF5/ZngQ+LDHZiOwlHpGYJsXwezm84r20WU/e
	bgtUOivKOdnNzi41rY3OHyGDeRu62/MknfVwkoE8M4arh4QdHw/4pWYo7KmqBbAx6fNOH6
	Hxqk1ODpeQD504y1sYLDrjgnePETM+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-WL4eNithMB6uYkhI0Tk0lg-1; Tue, 15 Jun 2021 14:22:04 -0400
X-MC-Unique: WL4eNithMB6uYkhI0Tk0lg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BA539126F;
	Tue, 15 Jun 2021 18:21:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54B2F100164C;
	Tue, 15 Jun 2021 18:21:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E9261809CAD;
	Tue, 15 Jun 2021 18:21:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15FILc1E005068 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 15 Jun 2021 14:21:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3D7C5D6DC; Tue, 15 Jun 2021 18:21:37 +0000 (UTC)
Received: from [10.40.195.162] (unknown [10.40.195.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73C975D6AD;
	Tue, 15 Jun 2021 18:21:33 +0000 (UTC)
To: LVM general discussion and development <linux-lvm@redhat.com>,
	David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com> <20210615170354.GA357@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <02ea1df9-299d-88f8-fb5d-26f068db0a1a@redhat.com>
Date: Tue, 15 Jun 2021 20:21:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615170354.GA357@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	prajnoha@redhat.com, Heming Zhao <heming.zhao@suse.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 15. 06. 21 v 19:03 David Teigland napsal(a):
> On Tue, Jun 08, 2021 at 10:39:37AM -0500, David Teigland wrote:
>> I think it would be an improvement to:
>>
>> . Make obtain_device_list_from_udev only control how we get the device
>>    list. Then we can easily default to 0 and readdir /dev if it's better.
>>
>> . Use both native md/mpath detection *and* udev info when it's readily
>>    available (don't wait for it), instead of limiting ourselves to one
>>    source of info.  If either source indicates an md/mpath component,
>>    then we consider it true.
>>
>> The second point means we are free to change obtain_device_list_from_udev
>> as we wish, without affecting md/mpath detection.  It may also improve
>> md/mpath detection overall.
> 
> Here are the initial patches I'm testing (libmpathvalid not yet added)
> https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-device-info-1
> 
> devices: rework native and udev device info
> 
> . Make the obtain_device_list_from_udev setting
>    affect only the choice of readdir /dev vs libudev
>    for a device name listing.  The setting no longer
>    controls if udev is used for device type checks.
> 


While in the local testing it may appear devices on laptops are always fast,
in some cases it may actually be more expensive to check physical
device instead on checking content of udev DB.

So for some users this may result in performance regression as
udevDB is in ramdisk - while there are device where it's opening
may take seconds depending on operating status (disk suspend,
disk firmware upgrade....)

(one of lvmetad aspects should have been to avoid waking suspended device)

> . Change obtain_device_list_from_udev default to 0.
>    A list of device names is obtained from readdir /dev
>    by default, which is faster than libudev (especially
>    with many devices.)

So we need at least backward compatible setting for those users
where the performance impact would cause regression.


Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

