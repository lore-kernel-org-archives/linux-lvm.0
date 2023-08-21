Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63931EE49A6
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Aug 2023 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692634698;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1mbYdjUfh6N2d+nqBbDwTPogsOrVG8cRNXTqeind0pc=;
	b=Aiz7VVRuEXVBCYURJMi3OzfXO9Cx1O108ErTpT+ndj5FVdGPrZTeXsQFGNAKSXHK0rOgkk
	Z9/c/q9Ca1B5OD2SlZFRm56M+RLEmpKbwOAPtaJe8XLox0Z11PPwCuGYcJdpO4uvuKOh32
	DmQ84uf+nKNSzCP/UtUhdHABFbIddL4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-HzoPuSvEPzS9HYCvRHFqYQ-1; Mon, 21 Aug 2023 12:18:14 -0400
X-MC-Unique: HzoPuSvEPzS9HYCvRHFqYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5EEF38210AE;
	Mon, 21 Aug 2023 16:18:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EAD440D2844;
	Mon, 21 Aug 2023 16:18:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E445A1946588;
	Mon, 21 Aug 2023 16:17:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1F2761946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 21 Aug 2023 16:17:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E53F40C2079; Mon, 21 Aug 2023 16:17:22 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D071740C206F;
 Mon, 21 Aug 2023 16:17:21 +0000 (UTC)
Date: Mon, 21 Aug 2023 11:17:19 -0500
From: David Teigland <teigland@redhat.com>
To: Roland <devzero@web.de>
Message-ID: <20230821161719.GA4913@redhat.com>
References: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
 <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
MIME-Version: 1.0
In-Reply-To: <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [linux-lvm] indistinguishable column names ( BA Start Start
 Start Start )
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
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 19, 2023 at 06:05:58PM +0200, Roland wrote:
> furthermore, it's a little bit weird that some columns being printed by
> default when using -o, is there an easier way to remove those besides
> explictly removing them one by one with several -o options ?
> "-o-opt1,-opt2,..." doesn't work
>=20
> sorry for this noise, i was too dumb for that , "-o+opt1,opt2 -o-opt3,opt=
4"
> works as desired (as documented in manpage)

Usually if you're interested in exact fields, you'd avoid the default
options and just use "-o opt1,opt2,..." without +/-.

> # pvs --units s -o+pv_ba_start,seg_start,seg_start_pe,pvseg_start
> =A0 PV=A0=A0=A0=A0=A0=A0=A0=A0 VG=A0=A0=A0=A0=A0=A0=A0 Fmt=A0 Attr PSize=
=A0=A0=A0=A0=A0=A0=A0 PFree pv_ba_start
>  seg_start seg_start_pe pvseg_start

It does sound better than some of the strange header abbreviations.
It could also use the key words that appear with --nameprefixes.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

