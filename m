Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8120BC6FD1D
	for <linux-lvm@archiver.kernel.org>; Thu, 30 Mar 2023 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680192115;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tWXEfTPKxub1X1cup5Jnv5WBFpsRZkg75o4pYL1lH58=;
	b=I6bjgA64t57jhUQCEFq84vatZCWnadC9LF2PoeGT9Ae16mrv3l8R1hPd655DYV0fKfnA+f
	9mC7eBmP+hBNXdr5x3M8H187qrrAjgQs1i8yl4cefhAVLJ9YswFKCYs/GMmnDSQjGEhMtB
	tMOmRn05RKULyu10wEWd/Ym0SG1IGYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-Fw3-76_MOriXPQRLZTywlg-1; Thu, 30 Mar 2023 12:01:53 -0400
X-MC-Unique: Fw3-76_MOriXPQRLZTywlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14454100DEAD;
	Thu, 30 Mar 2023 16:01:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 607132166B33;
	Thu, 30 Mar 2023 16:01:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F15D1946597;
	Thu, 30 Mar 2023 16:01:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0141C1946587
 for <linux-lvm@listman.corp.redhat.com>; Thu, 30 Mar 2023 16:01:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E8412400F279; Thu, 30 Mar 2023 16:01:43 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0C8F400F27C
 for <linux-lvm@redhat.com>; Thu, 30 Mar 2023 16:01:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2EF4185A78B
 for <linux-lvm@redhat.com>; Thu, 30 Mar 2023 16:01:43 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-BjThBxbGM0yfU9WZwtCIAg-1; Thu, 30 Mar 2023 12:01:41 -0400
X-MC-Unique: BjThBxbGM0yfU9WZwtCIAg-1
Received: by mail-ed1-f41.google.com with SMTP id r11so78437010edd.5
 for <linux-lvm@redhat.com>; Thu, 30 Mar 2023 09:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680192099;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLfyrijsSDXE8BF3YFP1Cdp+WNJQ9kRFBYD+34lME3A=;
 b=l3/55hiuqZCGo1RwWoJT3QnJTtq5NhYQavcUlaqpI0W4tOcTKxFALrd/BBoWkzQJPY
 U5XK2XKYpA20/EGvdMz16Y5o9k6ZMu7Wm3sFHN2x65ADWgaIiqEBbWT2y8+Wwt508XMl
 sO3+vEmC9jHY++CzdlTy4kahQclU/43YHwkDE/h8BUWxahE+AebrFVTW3AVOueqRxML0
 tRq2vniFSO1R13eqTIA8+sKHvAd0Dn10lWHPr6mBK0hihBInEuK5uyxpynQdfdpY7dly
 jrQGekboaj3bXFSCZndYqfiVJFxOJ/j3ZU37PaUdKjO5G4PdEa+TZWsthVYuSk0drZRN
 hEsA==
X-Gm-Message-State: AAQBX9coF1S5lMKkwGfQV7XVuitedb1UpjVxRZ5T7aChXSAu631hTKVZ
 gQ2IS3x2np6Wr67CGQ2IMNTTvF5rQP+ykUX0
X-Google-Smtp-Source: AKy350Yx44yKf5SV5DDHmf1yIVI1MFP1HW7xBaq3WneZH+7dUmwqVSmVKFtTJajxG9mUqIEnagQbTw==
X-Received: by 2002:a17:906:7051:b0:935:20d8:c5f with SMTP id
 r17-20020a170906705100b0093520d80c5fmr24237835ejj.58.1680192099052; 
 Thu, 30 Mar 2023 09:01:39 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906941200b009316783c92csm1467ejx.12.2023.03.30.09.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 09:01:38 -0700 (PDT)
Message-ID: <21bc041a-f8c3-68ec-5023-11c56ef29624@gmail.com>
Date: Thu, 30 Mar 2023 18:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Delarians <alexsifm@gmail.com>
References: <CANbQTxuYo6gR0-bOSQWTpUgo6_0O34PqWkAw7GTzbs6MBsvGng@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CANbQTxuYo6gR0-bOSQWTpUgo6_0O34PqWkAw7GTzbs6MBsvGng@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [linux-lvm] bad checksum in superblock, wanted
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 30. 03. 23 v 5:34 Delarians napsal(a):
> Good afternoon, I'm asking for help in recovering damaged metadata after a 
> 220V drop on the server, when the power was restored and the server booted up, 
> I got an error in the Proxmox panel
> 
> Check of pool pve/data failed (status:1). Manual repair required!
> 
> then booted from LiveCD debian mounted corrupted metadata and tried to repair
>

Hi

You could try  'lvconvert --repair  vg/data'

However it depends how new version of 'thin_repair' tool is present on your 
system. The newer the tool - the more error cases it's able to recover.

i.e. I'd highly recommend to use version 0.9 or better.

In case the repair will NOT be successful (aka you cannot activate your thin 
volumes)  - you will have 'original' bad metadata in the device   data_meta0 
- you could compress and upload the content of this metadata device for futher 
analysis.

Regads

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

