Return-Path: <SRS0=CtEK=OZ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB48C433EF
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 15:52:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE99161166
	for <linux-lvm@archiver.kernel.org>; Tue,  5 Oct 2021 15:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE99161166
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633449148;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i92wg/aHf5VsTLj8SiBBAi0dVYTdXqgspDXxBRzV8So=;
	b=cRm4a/I1bCxR14iIQFmkwvyDK/TCCR3S5fD5vGlNLQhNnRB4zZt3RdvkXFSN0yOoFbLyWZ
	MUSnDIcFIS9lghYTKye30OBX9RaZLJq0DUkarC7z9K61VIKDV2OZ19dC8mC4LN4Lxid2JO
	7lDMpxJf4kGSzXyBHPHsEMnBO5vpGIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-G9OLuRJ0NqKF4nc5ST4Vbw-1; Tue, 05 Oct 2021 11:52:26 -0400
X-MC-Unique: G9OLuRJ0NqKF4nc5ST4Vbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D61578015C7;
	Tue,  5 Oct 2021 15:52:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7330C5F4EB;
	Tue,  5 Oct 2021 15:52:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D1D24EA30;
	Tue,  5 Oct 2021 15:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195FpOVk019549 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 11:51:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D82BE9AA20; Tue,  5 Oct 2021 15:51:24 +0000 (UTC)
Received: from [10.40.195.36] (unknown [10.40.195.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CB4F5C1CF;
	Tue,  5 Oct 2021 15:51:24 +0000 (UTC)
Message-ID: <b9e10482-e508-63fa-5518-94cccc007e81@redhat.com>
Date: Tue, 5 Oct 2021 17:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.1.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Krzysztof Chojnowski <frirajder@gmail.com>
References: <CAPWGHt1MCzPbEHrF-5SRDavHqOfhMSqhkfAUQDMYT=HJ7TRfuQ@mail.gmail.com>
	<CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <CAPWGHt3bB4QiM6RZkC_58X8jev+mVwpkuCY==45Gr4j5jOYHBA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM cachepool inconsistency after power event
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 05. 10. 21 v 13:34 Krzysztof Chojnowski napsal(a):
> On Tue, Oct 5, 2021 at 06:35 AM Ming-Hung Tsai <mingnus@gmail.com> wrote:
>> Could you help run cache_check independently, to see the error messages? Thanks.
>>
>> # sudo lvchange -ay -f vg0/wdata_cachepool_cpool_cmeta
>> # sudo cache_check /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
>> # sudo lvchange -an -f vg0/wdata_cachepool_cpool_cmeta
> 
> Thanks for your help, this is what I get:
> $ sudo lvchange -ay -f vg0/wdata_cachepool_cpool_cmeta
> Do you want to activate component LV in read-only mode? [y/n]: y
>    Allowing activation of component LV.
> $ sudo cache_check /dev/mapper/vg0-wdata_cachepool_cpool_cmeta
> examining superblock
> examining mapping array
>    missing mappings [1, 0]:
>      missing blocks
> examining hint array
>    missing mappings [1, 0]:
>      missing blocks
> examining discard bitset
> $ echo $?
> 1
> $ sudo lvchange -an -f vg0/wdata_cachepool_cpool_cmeta
> $ sudo lvchange -ay   vg0/tpg1-wdata
>    Check of pool vg0/wdata_cachepool_cpool failed (status:1). Manual
> repair required!

Hello Krzystof

You need to repair your cache-pool metadata.

But before continuing with advices - what is the version of kernel lvm2 & your
device-mapper-persistent-data package (aka  'cache_check -V)

Component activation allows activation of your _cmeta LV - but only in 
read-only mode - so repair must go into a new LV.

Since cache_check reported  '1' exist code (as an error) - your metadata do 
require a fix.

lvconvert --repair should be able to handle this case - although likely 
without 'smart' placement' of fixed metadata (pvmove needed after metadata fix)

You can allocated your new metadata and easily cache_repair them.


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

