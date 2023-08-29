Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B3AC83F17
	for <linux-lvm@archiver.kernel.org>; Tue, 29 Aug 2023 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693345381;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m92M3BmOzwtt4ZqtiJbHX66Nfr/lXcm/hpu8LVr/aVo=;
	b=ZwwByu53Q12YaIr2v6+IcpI/v3vsORfr9EU0aKpOPMbNqM+hqgx+uF5wNJbJtHjwe4OUKr
	Dc+/w5emtAe/r4Uvx1qOQ506SUnwVYi2xaDDJuXqCo/mtfoehAulrzZce+OyS6aB5KXm1c
	HSDHYrJs018bhfTl2eGSyaIWOwRSkR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-g3hRNgGeNemvmu2aLOSxeg-1; Tue, 29 Aug 2023 17:41:54 -0400
X-MC-Unique: g3hRNgGeNemvmu2aLOSxeg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24F5780027F;
	Tue, 29 Aug 2023 21:41:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3583C492C13;
	Tue, 29 Aug 2023 21:41:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D065D19465B6;
	Tue, 29 Aug 2023 21:41:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71ABE1946594
 for <linux-lvm@listman.corp.redhat.com>; Tue, 29 Aug 2023 21:41:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 333DB2166B25; Tue, 29 Aug 2023 21:41:46 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B574C2166B26;
 Tue, 29 Aug 2023 21:41:45 +0000 (UTC)
Date: Tue, 29 Aug 2023 16:41:43 -0500
From: David Teigland <teigland@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Message-ID: <20230829214143.GC18158@redhat.com>
References: <0b5edc8d-6ba6-0c8a-3d5c-84f9f7bc4d13@huawei.com>
 <8fa261fb-cc28-1e3a-d533-88e0bd52f87a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <8fa261fb-cc28-1e3a-d533-88e0bd52f87a@huawei.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] vgchange acquire an exclusive VG lock for refresh
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
Cc: lixiaokeng@huawei.com, louhongxiang@huawei.com
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 29, 2023 at 02:36:53PM +0800, wangzhiqiang (Q) wrote:
> diff --git a/tools/vgchange.c b/tools/vgchange.c
> index f07b245bd..f35ff4c0e 100644
> --- a/tools/vgchange.c
> +++ b/tools/vgchange.c
> @@ -1003,7 +1003,7 @@ int vgchange(struct cmd_context *cmd, int argc, char **argv)
>                 init_external_device_info_source(DEV_EXT_NONE);
>         }
> 
> -       if (update)
> +       if (update || arg_is_set(cmd, refresh_ARG))
>                 flags |= READ_FOR_UPDATE;
>         else if (arg_is_set(cmd, activate_ARG))
>                 flags |= READ_FOR_ACTIVATE;

Shouldn't it be:

          else if (arg_is_set(cmd, activate_ARG) ||
                   arg_is_set(cmd, refresh_ARG))
                flags |= READ_FOR_ACTIVATE;

READ_FOR_ACTIVATE should translate to an ex lock like READ_FOR_UPDATE.
Note the same fix for lvchange refresh in commit 47bcb446b83f9aa4fca74301fda109a8bf670fbb

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

