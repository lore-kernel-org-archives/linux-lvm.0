Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E445C636CC
	for <linux-lvm@archiver.kernel.org>; Mon, 13 Feb 2023 11:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676286212;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lnea9NIiVMjSvDvA25JLtVO70QLQxFH9ffvC+bNeEN4=;
	b=fNKKmPTF5fqCz8r0hI2x0d4di8xpM9iDgAXY2Q8LbX75SbduFSSgLmEC5Ftnu1wHTAS3w0
	wF7kG3OEDv20dec+mlI5zaD1KW2FAbtlKGSocj20OkMP9jzk33sPBwktJCzhisN+3YtkSd
	Eom1xIljthOa5ssZu6J5Np5TqQ3ekYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-xt8N00sEN8mDQ3_FqfUFjQ-1; Mon, 13 Feb 2023 06:03:29 -0500
X-MC-Unique: xt8N00sEN8mDQ3_FqfUFjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D71B01800077;
	Mon, 13 Feb 2023 11:03:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F04412026D4B;
	Mon, 13 Feb 2023 11:03:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE7B1194658C;
	Mon, 13 Feb 2023 11:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7AA361946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 13 Feb 2023 11:03:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8287C16024; Mon, 13 Feb 2023 11:03:11 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FDCC16022
 for <linux-lvm@redhat.com>; Mon, 13 Feb 2023 11:03:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4E09100F901
 for <linux-lvm@redhat.com>; Mon, 13 Feb 2023 11:03:11 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-261-SsCWjm1fMGOsSQ-HzGuOkQ-1; Mon,
 13 Feb 2023 06:03:08 -0500
X-MC-Unique: SsCWjm1fMGOsSQ-HzGuOkQ-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.90] ([87.79.233.97]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgibY-1ovkXo462e-00h3Jp for
 <linux-lvm@redhat.com>; Mon, 13 Feb 2023 11:58:05 +0100
Message-ID: <420c1da3-0c4a-ebc1-5890-253bc5075ca9@web.de>
Date: Mon, 13 Feb 2023 11:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: LVM general discussion and development <linux-lvm@redhat.com>
From: Roland <devzero@web.de>
X-Provags-ID: V03:K1:O6mxCt3JiZP/OdYmwy5tN3VXYLkL165KOp/z/ykqDPQfRpVFQUg
 289/sxlTj3Ibw5KtTaqSJ5+2USqXlPu5YgW8eU8/RraKOQGeiMeXR4dZED5aJOT9adYM9EE
 hnH3pHTWWEx9S/DF2yDJiWD0xFkJCRncJmEauj0VEK4Ra1sS5k934Bp+0UXQZaWQAyZbrIX
 9Ko4HGTsmdcyOdNb3pZWA==
UI-OutboundReport: notjunk:1;M01:P0:wsWeSz5GONY=;JYvf6qqvaA7o249YDR47JvNHrni
 iWdM1yZMSG9f7PgcMoaUv/2mlysXU5Wb10tV8pEdaXWkrLXJ5fWd8j5ej/OAFm/Nd5gU5DHnr
 y8BCVfr988ICECe77cbL77wm8aSlSLhMQN9U27YPhDhImDNj3hgBBk1CS4eWlPiF9onrDqVkn
 HDcG10Gn8+/kIk3dGY/r60U0aBehcHlUTnDMIkuoiViFLOcmACYubkMCR7YzT8ZSdaL6GoMah
 SR5UxplC9rivO490Qzb6QGMU1Y7LQk3hdi1oSuXoYS8bI00Uy3V29c7Hi5pTb61VVMu5WxrTi
 boNOKq4kx1yC18Bk0qndtE2Y9xSFR/u7TqaAsbQM5a/JgqkvgPHm+XgYwGRoxImYZFWWiXnui
 ekwwUHD9ZmS2zs0OJQjO2z9bD1qh7C39qqkKr53h9aZ34b5xwq4I1TCvao3ESdpK4ZuXVFynq
 Ev6sbsrZcakn5lBED7a6RlLFzJ6Yb3kzFZVr2XcijW7iRcYm77RQqygl1ghIrmgqpiNar6xKj
 ooow52C0qaLddZGZyZ0d1PGidWecSpDmYgXJfvkJCWUtKjiSVi7XIObPrq1IyfGvoXfKvsC+C
 sjKj5sNCweh0h0fMh/5KfXnt/GFnbLm557veUTIHdH4TW5vQ4wWvSsf/lxrZBf0k2Zw4l43rU
 ToCCCqg/XlcRS/F8w4lvo1BGOsnzIGd+oGsqiphVz4HaYWwr46fI0fcnY2DEUabQ/NISOBaxw
 Za72aB6SPU5UJqaiOm8yo7Ja3XeEgF+iNxiGPf7wJfvsv6fZpQ1S8EA6enMXuffpcmG4fOiqZ
 JWK0gERksfPpatl6FXUpN//+2r7tqCCHqS7I6TT+IUTHlAJLBxEsIWbOHBhwqKumbyWmqwUnH
 9/fTOd4CYjTuYLCpAU66z+qmGgWBd3Y6TDEaqR+WkSSjauKsZhdXSV+hFqs+OfzaVFjx6zzWW
 Fduts8yPxxZ0Ajg+hVfCagfW3AI38v6U8pIMOm3Cy4KwVnUW+Z/wmIXJTvqhs9I8vIeOCEYx1
 NznjzfA+tkMKDpR7skPe5fchitrLNrM/fMmknXA
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [linux-lvm] pvshrink - defrag pv / move extents to the beginning
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

hello,

i wanted to resize/shrink a virtual machines disk to a smaller size and
found this tool very helpful:

https://github.com/mythic-beasts/pvshrink

there is a python3 enable version at

https://github.com/sensimple-contrib/pvshrink


is there something similar in lvm2 tools in the meantime , or could this
utility get integrated into the lvm2 tools suite ?

regards
roland


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

