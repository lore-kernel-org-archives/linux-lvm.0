Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7065E7490C
	for <linux-lvm@archiver.kernel.org>; Mon,  2 Oct 2023 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696272689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YavdH6TvkwOXlGzKra/3e9k6Kzdm1YHSVDOnrPTLn0E=;
	b=SAR1ubkleZHtpTDgFa/9DfGK0ztNg6yt5Egz+V0i1+HJ1oerAdqm6MVutLo9bz++Jw6AlD
	Bqg6ApTJcJVm8+Go6+oHpKJ28lB3BZ1ZZhYY97LoVOOKnfPUMNk5pD+4AuAnWC5kFXEPkv
	4KkEu9A4GnDIL5FxuO9q3v6vKFb7gtA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-IudanRVhMdujk1o48SJxSg-1; Mon, 02 Oct 2023 14:51:26 -0400
X-MC-Unique: IudanRVhMdujk1o48SJxSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA8F91C08964;
	Mon,  2 Oct 2023 18:51:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23618493113;
	Mon,  2 Oct 2023 18:51:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D417919465A2;
	Mon,  2 Oct 2023 18:51:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 82CFF1946595
 for <linux-lvm@listman.corp.redhat.com>; Mon,  2 Oct 2023 18:51:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4724940103C; Mon,  2 Oct 2023 18:50:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5F7493113
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 18:50:52 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 497C31DD35F8
 for <linux-lvm@redhat.com>; Mon,  2 Oct 2023 18:50:47 +0000 (UTC)
Received: from vps.thesusis.net (vps.thesusis.net [34.202.238.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-CYQVgEvgMT268wvqO14uLg-1; Mon,
 02 Oct 2023 14:50:43 -0400
X-MC-Unique: CYQVgEvgMT268wvqO14uLg-1
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 72A3813C8D4; Mon,  2 Oct 2023 14:50:43 -0400 (EDT)
References: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
User-agent: mu4e 1.7.12; emacs 27.1
From: Phillip Susi <phill@thesusis.net>
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Mon, 02 Oct 2023 14:49:14 -0400
In-reply-to: <d667deb919722b147b4f78b3e00a6ce22a575f44.camel@interlinx.bc.ca>
Message-ID: <87pm1wn9j0.fsf@vps.thesusis.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: linux-lvm@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: thesusis.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


"Brian J. Murrell" <brian@interlinx.bc.ca> writes:

> I can shrink this array down to 3,906,886,464 without impacting the PV
> (and it's contents) correct?

Looks that way.  That would be how much space is left in the array that
is not quite enough for another 4 MiB PE.

> From my calculations there is 4,022,272 bytes of unused space after the
> PV to the end of the array so shrinking it by 1,073,152 shouldn't have
> any impact, correct?

It shouldn't, but why bother?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

