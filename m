Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7515CEE7FF2
	for <linux-lvm@archiver.kernel.org>; Fri,  8 Sep 2023 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694180195;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ce7cB3zGoB2rZXWaJXIObkTMdrKvZdoiUvGtblvO9fg=;
	b=dWvt1nb1Co8MBZ0dMLhmd40xTkGS2Nj5wfDcYBjZN5PPw8UiBZz1HeTAaQAUD4Z9K8syuZ
	LBtTM224oLZH7go5wL9p+WGrIj8CHWIVgM8WLKxT/ZOIk96vfeYRkHjUAQVjYS6wrGtITC
	jC3EsGtPjF4/reRzrtekuLwe624RycI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-G120mAGfMHu1dnIlumGvYw-1; Fri, 08 Sep 2023 09:36:31 -0400
X-MC-Unique: G120mAGfMHu1dnIlumGvYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90BD39112E2;
	Fri,  8 Sep 2023 13:36:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C57D1121314;
	Fri,  8 Sep 2023 13:36:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 075201946594;
	Fri,  8 Sep 2023 13:36:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E060194658C
 for <linux-lvm@listman.corp.redhat.com>; Fri,  8 Sep 2023 13:36:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EC0F7C03295; Fri,  8 Sep 2023 13:36:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E48C4D47819
 for <linux-lvm@redhat.com>; Fri,  8 Sep 2023 13:36:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBAAC1825487
 for <linux-lvm@redhat.com>; Fri,  8 Sep 2023 13:36:20 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-G-IjZh28PDeCjvP2Ysz9FQ-1; Fri,
 08 Sep 2023 09:36:18 -0400
X-MC-Unique: G-IjZh28PDeCjvP2Ysz9FQ-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 9C038138214; Fri,  8 Sep 2023 09:36:17 -0400 (EDT)
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
 <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
 <87r0nmiykj.fsf@vps.thesusis.net>
 <cf583b83-22de-4457-a52c-3830ba9dbd9@gathman.org>
User-agent: mu4e 1.7.12; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: Stuart D Gathman <stuart@gathman.org>
Date: Fri, 08 Sep 2023 09:33:25 -0400
In-reply-to: <cf583b83-22de-4457-a52c-3830ba9dbd9@gathman.org>
Message-ID: <87zg1wbxda.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Stuart D Gathman <stuart@gathman.org> writes:

> 1. Unnecessary copying. 2. You lose your free backup of the system on
> the old drive,
>    which should be carefully labeled and kept handy for a year.
>    (After that, SSDs start to run the risk of data retention issues.)

You also have unnecessary copying with dd, but yea, partclone can save
on that.  If you want to keep the free backup with LVM, then instead of
pvmove you can lvconvert the volumes to mirrors, then split the
mirrors.  The nice thing about doing it with LVM is that it can happen
in the background while you still use the computer instead of having to
boot from removable media and wait hours and hours for the copy.

>> Don't forget you'll need to reinstall grub on the new drive for it to
>> boot.
>
> And that is the most important reason.  "Just reinstall grub" is a
> much larger learning curve than "dd" IMO.

Maybe a bit larger, but something that is always good to know and worth
learning.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

