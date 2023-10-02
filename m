Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB3BE74919
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Oct 2023 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696277395;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8dpeTD+A5qZN6sJftynCGlVXi5Ni87eJ83OrTH3PHfA=;
	b=HcMaHCg4d9OfzOGRsgIBj6hATGpRdvq+g4DpHDtF1h54dxZgVF7KjukeCjnxdLE6qdJfLZ
	Bivmo5BNHxGzdoT6ea+KoO3QX39JkHOtelZYb6xA7hTQ6Ee2XUakiEwejp/9rPtv1eazBo
	9kvtlgA8Hdwgqdk3DiuZyMMNbLmZSng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-XYjeZLHxP9yoRJij-Me4iQ-1; Mon, 02 Oct 2023 16:09:43 -0400
X-MC-Unique: XYjeZLHxP9yoRJij-Me4iQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41513811E7B;
	Mon,  2 Oct 2023 20:09:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE004A9B0C;
	Mon,  2 Oct 2023 20:09:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2BE9319465A2;
	Mon,  2 Oct 2023 20:09:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D86D41946595
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 Oct 2023 20:09:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C986E4026FB; Mon,  2 Oct 2023 20:09:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C22B8400E89
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 20:09:33 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A05158007A4
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 20:09:33 +0000 (UTC)
Received: from smtp161.vfemail.net (smtp161.vfemail.net [146.59.185.161]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-xae1T138MPyzrcmyfAF_aQ-1; Mon,
 02 Oct 2023 16:09:16 -0400
X-MC-Unique: xae1T138MPyzrcmyfAF_aQ-1
Received: (qmail 10980 invoked from network); 2 Oct 2023 20:02:33 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
 by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted);
 2 Oct 2023 20:02:33 +0000
Received: (qmail 57260 invoked from network); 2 Oct 2023 20:02:33 -0000
Received: by simscan 1.4.0 ppid: 57230, pid: 57245, t: 0.3004s scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=)
 (Z29tMzE0QHZmZW1haWwubmV0@MTkyLjE2OC4xLjE5Mg==)
 by nl101.vfemail.net with ESMTPA; 2 Oct 2023 20:02:32 -0000
Date: Mon, 2 Oct 2023 15:02:31 -0500 (CDT)
From: grumpy@manlymail.net
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
Message-ID: <n0377895-8017-1p3s-2p60-n6oo7r918p@znaylznvy.arg>
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
 <87pm1wn9j0.fsf@vps.thesusis.net>
 <f510c5de56008c4c74a7d22f267ab2f8e2f37c96.camel@interlinx.bc.ca>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Mimecast-Originator: manlymail.net
Content-Type: multipart/mixed; BOUNDARY="===============7471731937189402808=="

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--===============7471731937189402808==
Content-Type: text/plain; format=flowed; charset=US-ASCII

> The general idea is to (safely -- as in be able to achieve in specific
> sepearate steps that have a back-out plan) convert a non-encrypted
> raid-1 array into an encrypted raid-1 array.


i have a very similar setup
can you document the steps as you do the conversion
--===============7471731937189402808==
Content-Type: text/plain; CHARSET=us-ascii
Content-ID: <902op027-n399-sr2r-qoo4-599p2o3s6n2@sbb.ovm>
Content-Description: 
Content-Disposition: INLINE

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7471731937189402808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7471731937189402808==--

