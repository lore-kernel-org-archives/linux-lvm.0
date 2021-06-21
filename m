Return-Path: <SRS0=0Xx+=LP=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975D2C48BE5
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Jun 2021 18:32:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 291246109F
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Jun 2021 18:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 291246109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-_FK4WwY4M0a3IBIT3xeqKQ-1; Mon, 21 Jun 2021 14:32:50 -0400
X-MC-Unique: _FK4WwY4M0a3IBIT3xeqKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0744100CF6E;
	Mon, 21 Jun 2021 18:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA3B65C1D1;
	Mon, 21 Jun 2021 18:32:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E7054E9F4;
	Mon, 21 Jun 2021 18:32:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LIWKAX013102 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 14:32:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A517F43697; Mon, 21 Jun 2021 18:32:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A090B568F3
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2021 18:32:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E28589B848
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2021 18:32:18 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-522-nsES9WfyP723CNNwxC5zbg-1; Mon, 21 Jun 2021 14:32:15 -0400
X-MC-Unique: nsES9WfyP723CNNwxC5zbg-1
Received: by mail-pg1-f177.google.com with SMTP id e20so14900005pgg.0
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2021 11:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=u9yF47b4zf6gu1ub234x73tySha+P2F/aZsys1B7X54=;
	b=X0illxxDwqA/h1mWCdeIER25XaFQSJUpxzZhsRq5GvfAkYNhqhh9I8tGWBdqjsdGBo
	o/QzFGUNTBo17hm2+OtgPQ0kaWb4Ha3XoHgEwcfU/b75ah9pIm6fiZC+f6nsrZko2Xkl
	Axaz1dxmtSzK+zBhrRxtxGImEPcwmMqvrUHxKHB/gzr948g0OwOMNxm4X7U+ILy+0MIh
	NUNDGNUeopcazAhDEjr4zwKQbHVI8+0RpOyiN4WXPNjTCnOFiDioVenGt6hah5CPng33
	G3GILm1alvHFbv5aNLwHC8WCtKB4PYOAt1cHGfc6x+id1MQzAKbwNyr1EbVNS/Xgdf8M
	bpYw==
X-Gm-Message-State: AOAM533PN+DTizIzhz9RHUtFBwfYCE50lddjl91oi50WIdT7EpFkRPDK
	fs2CuFyDA5CG3fUGrXUyehPGhVteLY0MdQ==
X-Google-Smtp-Source: ABdhPJxTxdumt4s0WQzQ+8MP5uVY5rJT2ULnA51hqAjxZfv75ua8ow9WXM3wKsaHi4BM4Uk8q4RW8Q==
X-Received: by 2002:a63:2011:: with SMTP id g17mr25139344pgg.195.1624300334421;
	Mon, 21 Jun 2021 11:32:14 -0700 (PDT)
Received: from ?IPv6:2600:8801:8d00:9d6:20eb:d5a3:ccde:82b?
	([2600:8801:8d00:9d6:20eb:d5a3:ccde:82b])
	by smtp.gmail.com with ESMTPSA id
	135sm14134628pgf.20.2021.06.21.11.32.13 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 21 Jun 2021 11:32:13 -0700 (PDT)
To: linux-lvm@redhat.com
From: N <dundir@gmail.com>
Message-ID: <917d8044-4e7b-e54e-fe69-f60c6703a00f@gmail.com>
Date: Mon, 21 Jun 2021 11:32:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Possible Bug vgrename
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello, I'm hoping someone has an idea on how to go about working around 
this better.

I've run into issues working with lvm2, vgrename several times now in 
the past. I've got a bit more time now so I thought I'd reach out to see 
if there was another way of doing this.

Sometimes its necessary to access a volume group that has a naming 
conflict on the system being used, its usually during a temporary 
procedure and attaching the drive creates a temporary naming conflict, 
the volumes are listed as inactive and you need to access the data 
(often to create an emergency backup). You can easily change the name 
with vgrename and rescan to access the volumes, but to undo those 
changes it is problematic.

To revert the change usually requires additional time, and then the 
vgrename changes after rebooting into a recovery environment to undo the 
rename.
Even with the volumes deactivated, as long as the volume group conflict 
remains, vgrename will not set the name to a conflicting name even with 
the force flag set (i.e. when referencing the volume using UUID).

The issue has been common enough that when I set up systems that use 
lvm2 I usually just randomize the volume group names with output from 
uuidgen but this does not help me much when the system isn't set up by 
me initially.

vgrename fails to change the groupname for a set of volumes referenced 
by UUID to a name that it knows is in conflict with any of the existing 
previously scanned volume group names.

Systems using encryption at-rest often will fail to boot if the volume 
group name has been changed, and this can all add up to quite a bit of 
additional time needed when resolving any issues. Even more time when a 
disk subsystem needs to go through a set startup sequence after each 
shutdown/restart (~10-15m).

Is there a way to temporarily rename (without actually renaming) the 
volume groups (i.e. like setting a mask for the volume group names), or 
is there a way to force vgrename to actually make the change even if 
there is an existing conflict (preferably without a reboot)?

The force flag in the documentation fails to make any changes, I ran a 
test to confirm just recently and confirmed this is still an issue. In 
most cases, the conflict, is with a root volume on the system being used 
so its often either not possible, or expedient to rename that volume 
group to resolve the naming conflict.

Appreciate any help you all can provide.

Best Regards,

Nathan Singer

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

