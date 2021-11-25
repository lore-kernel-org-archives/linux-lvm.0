Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597DEC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 25 Nov 2021 09:16:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-1fx5AERgP7yROUaNjiLPUw-1; Thu, 25 Nov 2021 04:16:25 -0500
X-MC-Unique: 1fx5AERgP7yROUaNjiLPUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE6618C89C4;
	Thu, 25 Nov 2021 09:16:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 543D61010426;
	Thu, 25 Nov 2021 09:16:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58D754CA9B;
	Thu, 25 Nov 2021 09:16:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AP9Ftts011344 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 25 Nov 2021 04:15:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43D6F2166B3F; Thu, 25 Nov 2021 09:15:55 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3802166B2F
	for <linux-lvm@redhat.com>; Thu, 25 Nov 2021 09:15:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 152E8185A7BA
	for <linux-lvm@redhat.com>; Thu, 25 Nov 2021 09:15:52 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-8-kEuSsgm3Pk6KnJBNPuHMMw-1; Thu, 25 Nov 2021 04:15:50 -0500
X-MC-Unique: kEuSsgm3Pk6KnJBNPuHMMw-1
Received: by mail-pg1-f172.google.com with SMTP id q16so4677019pgq.10
	for <linux-lvm@redhat.com>; Thu, 25 Nov 2021 01:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Q/ZGr5rssDGMhvAfiA8puzGxAI5PZ+hM8g3IEzS/mJ0=;
	b=SbyIZaRkCWvQ0G3FTSQM8EwseSSJZA8WXEVV8gZfeYYm98QSC1wuU5WsJ7Tf5JcHa7
	jMCI46SREEhfCBWPnP1IE3y+FgfKtwuRhmbFHkDPMqxi2U3LD1wVNjyOiU0pIQXVg/MJ
	jaokHXSpK6z61sDnrhqhHngaT3ZWQvXhhGYnj2pOcDsaQSvTcPlers4tHZ40vCfNBLen
	JaTaQLVmo6NYzA3dQv3C3XJF9hnckLmsw7vdm1X0Am2xP4/VHUXZLLoA+aJpm1hGlxAk
	V5w3Eh4YY3sCYYszKGBcza4uPyFlcWklt68uaR6Rk1RBOGqG8BNh0TH+3Z569h8mDLkJ
	R5Hw==
X-Gm-Message-State: AOAM531NOT+h7paapkboQ0VGD9lium3eAcG5AKP/+HW9f/0KpqnoVQxq
	+yQd0M5Fc/HUR9OaUuu6bcLSG8xqQQuVBiFyStNV9ZHIF2U=
X-Google-Smtp-Source: ABdhPJzfPkDVPJ2/NuaZZKU+0byD+9+imWYisbW5asn7GXtg2+ztp+Lj6IHtXtW66O977ZjtykOO48V17I3rawO4bXk=
X-Received: by 2002:a63:7c2:: with SMTP id 185mr14781831pgh.406.1637831748918; 
	Thu, 25 Nov 2021 01:15:48 -0800 (PST)
MIME-Version: 1.0
References: <CAA_4Ct05hULieFePu0fAEddODEN52w8MBC4nZ3UvRVBWQv-4kQ@mail.gmail.com>
In-Reply-To: <CAA_4Ct05hULieFePu0fAEddODEN52w8MBC4nZ3UvRVBWQv-4kQ@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Thu, 25 Nov 2021 17:15:12 +0800
Message-ID: <CAAYit8QuXNZ0Gfd++hxm8gGoFDSiyGwoyPQ=tNPdvGzc2Cm3JQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM Thin - bad checksum in superblock - cannot
 perform operations on metadata
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Could you try using thin_repair v0.9.0 please? The metadata could be
repaired if only the superblock was affected.

1. Check the pool configurations (transaction id, chunk size, pool size, etc.)

# lvs -o lv_name,transaction_id,chunk_size,size --units k

Taking the following output as an example, the tid is 13, and there
are 519936 data blocks (33275904/64).
```
  LV           TransId Chunk  LSize
  tp1               13 64.00k 33275904.00k
```

2. Create a blank LV for restoration. Here I use 16192 MB to keep
backward compatibility.

# lvcreate data1 --size 16192m --name tmeta_bak

3. Activate the metadata in read-only mode

# lvchange data1/thin_tmeta -ay -y

4. Repair the metadata, in which the tid, bs, and nr_blocks are values
from the first step.

# thin_repair -i /dev/mapper/data1-thin_meta -o
/dev/mapper/data1-tmeta_bak --transaction-id <tid> --data-block-size
<bs> --nr-data-blocks <nr_blocks>

5. Verify the repaired metadata

# thin_dump /dev/mapper/data1-tmeta_bak --skip-mappings
(10 devices should be listed if thin_repair runs successfully)

6. Swap the pool metadata with the repaired one

# lvchange -an data1/thin_meta
# lvconvert data1/thin --swapmetadata --poolmetadata data1/tmeta_bak

Step 2-6 above could be substituted by a single lvconvert command
below, but I would prefer doing these step-by-step.

# lvconvert --repair data1/thin --config
'global/thin_repair_options=["--transaction_id", "<tid>",
"--data-block-size", "<bs>", "--nr-data-blocks", "<nr_blocks>"]'


Ming-Hung Tsai

On Tue, Nov 23, 2021 at 3:33 PM pavel olenev <pavel.olenev@gmail.com> wrote:
>
> Hello.
> I am looking for advice on how to act in such a situation. Perhaps anyone has gone through something similar?
> We used lvm thin provisioning on one of our arrays. But after raid controller failure we got problem with activation of all thin volumes:
>
> # lvchange -a y data/thin
>   Check of pool data/thin failed (status:1). Manual repair required!
>
> I tried to use lvconvert --repair data/thin, but have this:
>
> # lvconvert --repair data/thin
> truncating metadata device to 4161600 4k blocks
> bad checksum in superblock, wanted 1494954599
>   Repair of thin metadata volume of thin pool data/thin failed (status:1). Manual repair required!

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

