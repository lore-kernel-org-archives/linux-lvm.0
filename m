Return-Path: <SRS0=xM+Q=LB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C8AC47082
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 16:31:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6628660FF0
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 16:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6628660FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623083496;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tCnYkzeQFKsfo4CoSNZMj1YM+mWdRfsv6AilCXyCZGI=;
	b=VYsrtWNmamI0V3Pw5+3Db4yOSUtNKIFcH+XVxwwnv2YLi1ytza0aB5K6FocqA01ayL5diL
	NceqYbMY+8JC6A78P0JZD1qqTnxmlIJdqruZb5MJPYAhecupXWEK7WpTNtJqwdROUWQg0H
	cfWLzp/GPQAs5H/UAAQnIX2KqXxF9ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-pUd_4axROGyp3R2neTF1mA-1; Mon, 07 Jun 2021 12:31:34 -0400
X-MC-Unique: pUd_4axROGyp3R2neTF1mA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAAD3C73AA;
	Mon,  7 Jun 2021 16:31:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1956A10013C1;
	Mon,  7 Jun 2021 16:31:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E508B1801266;
	Mon,  7 Jun 2021 16:31:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157GVEaZ019238 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 12:31:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB2DB369A; Mon,  7 Jun 2021 16:31:14 +0000 (UTC)
Received: from [10.40.195.144] (unknown [10.40.195.144])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEF1620DE;
	Mon,  7 Jun 2021 16:31:13 +0000 (UTC)
To: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>, 
	"teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a905dd6e-0b74-615c-5f21-c9d84f633c61@redhat.com>
Date: Mon, 7 Jun 2021 18:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-lvm@redhat.com
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
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

Dne 07. 06. 21 v 17:48 Martin Wilck napsal(a):
> On So, 2021-06-06 at 14:15 +0800, heming.zhao@suse.com wrote:
>> 1. During boot phase, lvm2 automatically swithes to direct activation
>> mode
>> ("event_activation =3D 0"). After booted, switch back to the event
>> activation mode.
>>
>> Booting phase is a speical stage. *During boot*, we could "pretend"
>> that direct
>> activation (event_activation=3D0) is set, and rely on lvm2-activation-
>> *.service
>> for PV detection. Once lvm2-activation-net.service has finished, we
>> could
>> "switch on" event activation.
> I like this idea. Alternatively, we could discuss disabling event
> activation only in the "coldplug" phase after switching root (i.e.
> between start of systemd-udev-trigger.service and lvm2-
> activation.service), because that's the critical time span during which
> 1000s of events can happen simultaneously.


Hello


In lvm2 we never actually suggested to use 'autoactivation' during the boot=
 -=20
this case doesn't make much sense - as it's already know ahead of time whic=
h=20
device ID is needed to be activated. So whoever started to use autoactivati=
on=20
during boot - did it his own distro way.=A0=A0 Fedora=A0 nor RHEL uses this=
.=A0 On=20
second note=A0 David is currently trying to optimize and rework Dracut's bo=
oting=20
as it didn't aged quite well and there are several weak points to be fixed.



Regards


Zdenek


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

