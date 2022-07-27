Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82701C04A68
	for <linux-lvm@archiver.kernel.org>; Wed, 27 Jul 2022 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658918994;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ukJPjlj9QcpmYAPPi6p5e0ROw7eDiTqB1wlTTjqMPQI=;
	b=FBaL7Z0eygZUThu03ya53ViVPHdLOUU/qhx2tKUUotJsJ6EtT46t8Hv5GotVfINPDqTWAx
	XMwnAGzgZbuoZDT2c0IYMZvhb9BIX6IPB6L7eQbPlSImffKSaYaQvQEK/1DdkDZcZJQ79n
	gkn7VivJrzgZh/jq8YsziapMnJhhstA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Oa8uLcjNMOKGiCa_8jXp6w-1; Wed, 27 Jul 2022 06:49:51 -0400
X-MC-Unique: Oa8uLcjNMOKGiCa_8jXp6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F181738149AF;
	Wed, 27 Jul 2022 10:49:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3A821121314;
	Wed, 27 Jul 2022 10:49:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DE691945D9A;
	Wed, 27 Jul 2022 10:49:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B8CB1945D94
 for <linux-lvm@listman.corp.redhat.com>; Wed, 27 Jul 2022 10:49:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2AE3340357BA; Wed, 27 Jul 2022 10:49:39 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 270CA40C1288
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 10:49:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D0773C0D18A
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 10:49:39 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-Y-5ZwyagPZyZ_9r4jvrP8Q-1; Wed, 27 Jul 2022 06:49:37 -0400
X-MC-Unique: Y-5ZwyagPZyZ_9r4jvrP8Q-1
Received: by mail-qt1-f176.google.com with SMTP id l14so12321214qtv.4
 for <linux-lvm@redhat.com>; Wed, 27 Jul 2022 03:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=SfsDepuPl7gWzX49kZbuucYGYkOTKT5o+lVzuzfgL3I=;
 b=YJoTupt3adAOUhhx/+of/y9SfSTrPntPKa1DyRXnB14rvhCcovx7QxQojZxnrd+4xv
 76DQLU0cPSZTlHFajuWgrsbsBCEBeX6RGofXqsm+YIPWz+YTIhclUEFoEt/epYNyqxk5
 3h/lEz/iZPASpU94daRkZDjKCebF9YIC+jz6VVHxTTNo7ArJ31UFuauREcDIP4wGSsIn
 MogQJK5wJTI7i6WjbsRcZvEHnTW88LsK0ZVJCIfvzsEnRDeM6nvIEudYGIdFD4XhCVmZ
 J8yi/dUFD7izugSvLfXJoPF8iuKLU0OQKhFgiUrxpbkIi1DPBbybzKMraQk6+aXHv7qa
 yvHQ==
X-Gm-Message-State: AJIora+l8Ei7BCUT0txSrk2hOetufvzGGsqMKbX+wHIeOsyoLBK1tvoV
 ddxTk+rTcl7FlREtZmbvQI1giRdPOFcar4PsbtLVxnpE
X-Google-Smtp-Source: AGRyM1tsVBCfCAYd143ZFF1L7mTCtLrXi0xAQA8jMLiOdwCr1ihdR1qmoTSwZJ6ZghMD7rwoZZAqKCYhKYmZZhFnv8Y=
X-Received: by 2002:ac8:5a84:0:b0:31e:f60e:3449 with SMTP id
 c4-20020ac85a84000000b0031ef60e3449mr17827356qtc.57.1658918976317; Wed, 27
 Jul 2022 03:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAH5g025eDd60jvU+_d7DLaPdsmK0TsNjB-jkewKg5FSNJMEmJw@mail.gmail.com>
 <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
In-Reply-To: <18239b39270.27a5.d4b3b9aee17a85f6bc878c68b3925db6@beardandsandals.co.uk>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 27 Jul 2022 05:49:25 -0500
Message-ID: <CAAMCDecDyj_JLQvnxhsECng_t-x=Lxeta5WgrCLUGGqxHQvuiQ@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [linux-lvm] Problem with partially activate logical volume
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I don't believe that is going to work.

His issue is that the filesystem is refusing to work because of the
missing data.

man debugfs

It will let you manually look at the metadata and structures of the
ext2/3/4 fs.  You will likely need to use the "-c" option.

It will be very manual and you should probably read up on the fs
structure a bit.

A data recovery company could get most of the data back, but they
charge 5k-10k per TB, so likely close to 100k US$.

And the issues will be that 1/3 of the metadata was on the missing
disk, and some of the data was on the missing disk.

I was able to do debugfs /dev/sda2  (my /boot) and do an ls and list
out the files and then do a dump <filename> /tmp/junk.out and copy out
that file.

So the issue will be writing up a script to do lses and find all of
the files and dump all of the files to someplace else.

On Wed, Jul 27, 2022 at 2:39 AM Roger James <roger@beardandsandals.co.uk> wrote:
>
> Try https://www.linuxsysadmins.com/recover-a-deleted-physical-volume/?amp
>
> On 26 July 2022 09:16:32 Ken Bass <daytooner@gmail.com> wrote:
>>
>> (fwiw: I am new to this list, so please bear with me.)
>>
>> Background: I have a very large (20TB) logical volume consisting of 3 drives. One of those drives unexpectedloy died (isn't that always the case :-)). The drive that failed happened to be the last PV. So I am assuming that there is still 2/3 of the data still intact and, to some extent, recoverable. Although, apparently the ext4 fs is not recognised.
>>
>> I activated the LV partially (via -P). But running any utility on that (eg: dumpe2fs, e2fsck, ...) I get many of these  in dmesg:
>>
>> "Buffer I/O error on dev dm-0, logical block xxxxxxx, async page read."  The thing is, the xxxxxxx block is on the missing drive/pv.
>>
>> I have also tried some recovery software, but eventually get these same messages, and the data recovered is not really useful.
>>
>> Please help! How can I get passed that dmesg error, and move on. 14TB recovered is better than 0.
>>
>> TIA
>> ken
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

