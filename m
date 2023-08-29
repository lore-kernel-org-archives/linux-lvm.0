Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14A7C6FA8F
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Aug 2023 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693323935;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ONXRVzyxUlSDgW2sGwoeaH3byxhK8UT8slZMfUKjwG0=;
	b=hVPwGfpdZGH8JtOeUQpYQC46csou4dZga8B0lt7cDh36PTfivXD+nnA2eSSHeDnm4/LvNe
	SxwFyKcyxwzfAeSXcTAkMsQ+Q64qYyx0x+Iwu7gqDgtObPcDA3k3D1tPO8q3m852zkIsGN
	qHOma8eOLGJeAWDsBpP2anuulfDN5fs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-CApFFIijPiiLWAFB29Mt9Q-1; Tue, 29 Aug 2023 11:45:33 -0400
X-MC-Unique: CApFFIijPiiLWAFB29Mt9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F21A11C07551;
	Tue, 29 Aug 2023 15:45:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28E7240C6F4C;
	Tue, 29 Aug 2023 15:45:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D89A81946A4A;
	Tue, 29 Aug 2023 15:45:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14ABA19465B6
 for <linux-lvm@listman.corp.redhat.com>; Tue, 29 Aug 2023 15:45:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F064D492C14; Tue, 29 Aug 2023 15:45:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C0C492C13
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 15:45:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE48C185A78B
 for <linux-lvm@redhat.com>; Tue, 29 Aug 2023 15:45:25 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-ipZccr3PPKK_oa_2cG0w0w-1; Tue, 29 Aug 2023 11:45:23 -0400
X-MC-Unique: ipZccr3PPKK_oa_2cG0w0w-1
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 37TFiPIT007989
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 29 Aug 2023 11:44:25 -0400
Date: Tue, 29 Aug 2023 11:44:25 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: Phillip Susi <phill@thesusis.net>
In-Reply-To: <87r0nmiykj.fsf@vps.thesusis.net>
Message-ID: <cf583b83-22de-4457-a52c-3830ba9dbd9@gathman.org>
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
 <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
 <87r0nmiykj.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [linux-lvm] Swapping LLVM drive
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gathman.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Mon, 28 Aug 2023, Phillip Susi wrote:

> Why would you use dd/partclone instead of just having LVM move
> everything to the new drive on the fly?

> Partition the new drive, use pvcreate to initialize the partition as a
> pv, vgextend to add the pv to the existing vg, pvmove to evacuate the
> logical volumes from the old disk, then vgreduce to remove it from the
> vg.

1. Unnecessary copying. 
2. You lose your free backup of the system on the old drive,
    which should be carefully labeled and kept handy for a year.
    (After that, SSDs start to run the risk of data retention issues.)

> Don't forget you'll need to reinstall grub on the new drive for it to
> boot.

And that is the most important reason.  "Just reinstall grub" is a
much larger learning curve than "dd" IMO.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

