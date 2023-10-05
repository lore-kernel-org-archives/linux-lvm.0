Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A0BE93709
	for <linux-lvm@archiver.kernel.org>; Thu,  5 Oct 2023 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696508234;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XZjrsPiz5X2dIyfUwEP94G1LK31Jji277rcbnxTPKQ4=;
	b=N3E8c6bBi2v8OnL9XkZhPRhs90p9AezN8sx1lHso1M9d7veehMfMersROdFV5fl+8EtTd3
	FRWw2tByjvcbGvp1NJmvM4pgdSrkQICcUNP7PRZBqPa3wtsGYnUrlrgflC1pNTWmhbPw73
	MbTDGHOngRiK3h7KUd3fYu/kDTTPo8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-Fsuq8fjmMGyimJ7ZnFOMYQ-1; Thu, 05 Oct 2023 08:17:08 -0400
X-MC-Unique: Fsuq8fjmMGyimJ7ZnFOMYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76720101A550;
	Thu,  5 Oct 2023 12:17:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA37A492B05;
	Thu,  5 Oct 2023 12:16:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9179619465A3;
	Thu,  5 Oct 2023 12:16:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAEF6194658F
 for <linux-lvm@listman.corp.redhat.com>; Thu,  5 Oct 2023 12:16:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B63162026D68; Thu,  5 Oct 2023 12:16:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF07A2026D4B
 for <linux-lvm@redhat.com>; Thu,  5 Oct 2023 12:16:57 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F9B93C17091
 for <linux-lvm@redhat.com>; Thu,  5 Oct 2023 12:16:57 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-srX8n0iONZWxdqQU9n0BqQ-1; Thu,
 05 Oct 2023 08:16:55 -0400
X-MC-Unique: srX8n0iONZWxdqQU9n0BqQ-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 74BEB13ED27; Thu,  5 Oct 2023 08:16:55 -0400 (EDT)
From: Phillip Susi <phill@thesusis.net>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, linux-lvm@redhat.com
In-Reply-To: <588df601b080ad0f69b36e86fd1d7bcd6380af6e.camel@interlinx.bc.ca>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
 <87v8boviwj.fsf@vps.thesusis.net>
 <800e8363150ab830a3b2514e3133794e088d242f.camel@interlinx.bc.ca>
 <878r8ksihe.fsf@vps.thesusis.net>
 <d6e03767fe9d155812fc1d6f1e13c1c64f0391d7.camel@interlinx.bc.ca>
 <87wmw2le5j.fsf@vps.thesusis.net>
 <588df601b080ad0f69b36e86fd1d7bcd6380af6e.camel@interlinx.bc.ca>
Date: Thu, 05 Oct 2023 08:16:55 -0400
Message-ID: <87v8blclhk.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [linux-lvm] Is MD array (containing a PV) reducible?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"Brian J. Murrell" <brian@interlinx.bc.ca> writes:

> But I did just think of the other benefit of using MD to sync the new
> device and that's having a recovery path.
>
> That is, if I add luks-backup to /dev/md0 and then wait for it to
> finish syncing, I can then shut down the machine, remove /dev/sdc from
> the machine and start it back up and ensure that all of the needed
> initialization bits are in place to make the luks component come up and
> be readable.  If it is, I just remove it from md0 and use it stand-
> alone (as it is itself a RAID-1 recall).  Reboot again to make sure
> it's all still working and good.
>
> If any of the above goes sideways, I still have the sdc disk as an md0
> member and can put it back in the machine to get back to my starting
> position and try again, trying to figure out where I went wrong.
>
> With pvmove, once the move is complete there is no going back to my
> starting position if something is not right and I cannot access my new
> luks device.

Instead of pvmove, you can use lvconvert to have LVM mirror across the
drives, then break the mirror, like you would with mdadm.

> So given that, and given that I have stared my pvmove with --atomic and
> --interval, do I just SIGINT the pvmove?  Or should I do pvmove --abort
> on another terminal?  How can I know when the the abort is complete and
> that I can vgreduce luks-backup out of the backups volume group?

lvs or lvdisplay will show if the move is still in progress.

> Once I have vgreduced, is there anything I should do to
> /dev/mapper/luks-backup before I mdadm --manage /dev/md0 --add
> /dev/mapper/luks-backup just to wipe any remnants of it being a PV
> previously?

pvremove will wipe the pv label.

> I really do appreciate all of the help, advise and patience you have
> given/shown me.

You are welcome.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

