Return-Path: <SRS0=tbfx=PG=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3991EC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 21:41:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 895316112D
	for <linux-lvm@archiver.kernel.org>; Mon, 18 Oct 2021 21:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 895316112D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634593281;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2/+dJRVS/3K/639ADBJyzHVrxD06H7IJp2QFxd1gp6E=;
	b=QzB6axExtOdx/yz8dhK+G78aFwxcTWDUmdpmJ5lEEl3VI1RbZ4WoxMeNAFhWda5F7C2/0h
	Qz7o1xOuz+g1Ljhefur4U72XLluILtQ0Pn1AG0OeeaQhubm1X+0IfDWmtXhsXeIImQkGTW
	MKBYNMv15wLVZbbMOj/jseDY6vRWbqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-zTEKKtYoPXaxWy0IUNMQSQ-1; Mon, 18 Oct 2021 17:41:17 -0400
X-MC-Unique: zTEKKtYoPXaxWy0IUNMQSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ECDA81424B;
	Mon, 18 Oct 2021 21:41:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96E7710023B8;
	Mon, 18 Oct 2021 21:41:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 116DD1803B30;
	Mon, 18 Oct 2021 21:40:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19ILekpY001681 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 17:40:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD56A5D6D5; Mon, 18 Oct 2021 21:40:46 +0000 (UTC)
Received: from [10.40.194.161] (unknown [10.40.194.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F3F062A41;
	Mon, 18 Oct 2021 21:40:40 +0000 (UTC)
Message-ID: <b39f6785-9740-8116-3b5e-91211869ab7e@redhat.com>
Date: Mon, 18 Oct 2021 23:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.1.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Brian McCullough <bdmc@bdmcc-us.com>
References: <20211018180853.GF28058@bdmcc-us.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <20211018180853.GF28058@bdmcc-us.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Help restoring a corrupted PV partition ( 18th )
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

Dne 18. 10. 21 v 20:08 Brian McCullough napsal(a):
> 
> I have had a disk go bad on me, causing me to lose one PV.
> 
> If I am not providing sufficient, or the proper, information, feel free
> to ask for more.
> 
> 
> I seem to have retrieved the partition using ddrescue and put it on to
> a new drive, but it seems to be missing some label information, because
> pvscan doesn't recognize it as a PV partition.
> 
> Using hexdump, I see the string " LVM2 " at 0x1004, but nothing before
> that.  The whole 16 bytes is:
> 
> 0x01000  16 d6 8e db 20 4c 56 4d  32 20 78 5b 35 41 25 72
>                          L  V  M  2
> 
> 
> 
> I find what appears to be an LVM2 vgconfig block starting at 0x01200,
> extracted that to a file and was able to read the UUID that this PV
> should have.  It is one of about a dozen that make up this VG.
> 
> 
> On another machine, I dumped a PV partition, and find "LABLEONE" at
> 0x200, with the same " LVM2 " at 0x01000.
> 
> I was concerned that my dump was offset, but the comparison to the
> "good" one suggests that that isn't the problem, but just the missing
> "LABLEONE" and related information at 0x0200.
> 
> 
> How to fix?
> 
> If I do a "pvcreate --uuid xxxx" would this fix that recovered partition
> so that pvscan and friends can work properly, and I can finally boot
> that machine?

Hi

It's quite important to be aware how the disk corruption happened.
Was this plain disk hw error -  or some crash of raid setup ?

Normally you could restore PV with this:

pvcreate --uuid  XXXX --restorefile  file_with_vg_backup  /dev/ddddd
vgcfgrestore --restorefile   file_with_vg_backup   vgname


But if the content of device was scramble by some 'raid' bug - you might have 
problem to retrieve any usable data afterward.


Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

