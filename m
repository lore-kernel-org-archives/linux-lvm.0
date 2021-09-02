Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C9EC432BE
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 14:30:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47C2610A4
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 14:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B47C2610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-fUDq7NjiNCK0UK9OudnoIQ-1; Thu, 02 Sep 2021 10:30:18 -0400
X-MC-Unique: fUDq7NjiNCK0UK9OudnoIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7339CFC83;
	Thu,  2 Sep 2021 14:30:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B41926608B;
	Thu,  2 Sep 2021 14:30:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 906A618087F1;
	Thu,  2 Sep 2021 14:30:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182ENgPN006808 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 10:23:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86B4110D16B9; Thu,  2 Sep 2021 14:23:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8229410D16AF
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 14:23:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A44811E7A
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 14:23:39 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-306-XncnYwTlNSOMBODslYlcgw-1; Thu, 02 Sep 2021 10:23:38 -0400
X-MC-Unique: XncnYwTlNSOMBODslYlcgw-1
Received: by mail-ed1-f48.google.com with SMTP id eb14so3162575edb.8
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2021 07:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WAhj90erRe7bnAQrcYzUCFQBD75Dgx98y0D24jpw4fk=;
	b=pn9zZpPpxDN3XJtJeYrZVNPoVfgF3KROTAzjs/ypKqDcKdjgXWczhRvx+uORJe/nLa
	gV3jHdzgZI2kHhYX8P8ef89ESh4FniAxfSuB7qhTnR61aI9gPtlXTpMzh1P2cO0ajLmb
	QmPIzj60FvzUR5rkRASHMmLGw1ZhxbiNxM4VzQE/9R2XObljajnzxZlPtjXcdjBqqV3L
	Y77UcWKuLVBoaCy7nMh/DLKjuaqi51f30GdqQTFgKTJSuWTpcElkYwHPW8asTkMMoK4S
	jHiHgrewNTIrW1EHMi8kUb4gdBUZdP3bbc0vDEqmfsEqaLTJGPPdkKDRXmkxUdbxuske
	6iZg==
X-Gm-Message-State: AOAM531fmZhAhlrjrcliMukeEUPjdjbyo98pkDrJqBI59JDS8iGI1Nm3
	Chss3LkqD5NAAcAt0g8P0YgalMv9p+U=
X-Google-Smtp-Source: ABdhPJxb7Wdu86YLn34Gf5wVEKDHdpmER0uhk+sgROgGRb7UG9zYPOT8qaxay+8lNQMpePesdGPVfQ==
X-Received: by 2002:a50:8d50:: with SMTP id t16mr3723942edt.118.1630592616681; 
	Thu, 02 Sep 2021 07:23:36 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	b12sm1305315edy.36.2021.09.02.07.23.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 02 Sep 2021 07:23:36 -0700 (PDT)
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Gionatan Danti <g.danti@assyoma.it>
References: <PH0PR11MB501412E2C1081FA98208E545F1CE9@PH0PR11MB5014.namprd11.prod.outlook.com>
	<ba1b736723487985ec076d499d89313b@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <d44125d6-710c-af10-dc99-dabff7378300@gmail.com>
Date: Thu, 2 Sep 2021 16:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ba1b736723487985ec076d499d89313b@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Cc: "Yu, Mingli" <Mingli.Yu@windriver.com>
Subject: Re: [linux-lvm] The size specified by "lvcreate -L" is not accurate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"

Dne 02. 09. 21 v 15:24 Gionatan Danti napsal(a):
> Il 2021-09-02 05:26 Yu, Mingli ha scritto:
>> Per
>> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v=
1.46.4.txt=20
>>
>> [1], after e2fsprogs upgrades to 1.46.4, the defaults for mke2fs now
>> call for 256 byte inodes for all file systems (with the exception of
>> file systems for the GNU Hurd, which only supports 128 byte inodes)
>> and use "lvcreate -L 50 -n lv_test1 vg_test && mke2fs
>> /dev/vg_test/lv_test1" and then continue to check the partiontion as
>> below.(use lvm2 2.03.11 for the test)
>> =A0# df -h | grep dev/mapper/vg_test-lv_test1
>>
>> =A0/dev/mapper/vg_test-lv_test1=A0=A0 48M=A0=A0 14K=A0=A0 46M=A0=A0 1% /=
mnt/lv-test
>>
>> =A0Though claim 50M as above, but it turns out to be only 48M.
>=20
> I think that allocation are done in multiple of physical extent size whic=
h, by=20
> default, is at 4 MB.
> 50 is not a multiple of 4 while 48 is, so "lvcreate" probably rounded dow=
n the=20
> required size.
> Using one or more "-v" should bring progressively more details.
>=20


Hi

As correctly pointed out by Gionatan - lvm2 allocates LVs in 'extent_size'=
=20
allocation units.

So with default 4M - you could have either 48M or 52M.

In your case - you likely get 52M (as that's how lvm2 behaves - you get at=
=20
least specified amount of space rounded up to nearest extent -  see output =
of=20
'lvs' command.

However your formatted extX volume also does have some internal 'filesystem=
'=20
metadata - so  LV of size 52M gives  reduced ext4 space to 48M in your case
as most likely 'ext4' header size 'cuts' away possibly 4M alignment
used by ext4.


Anyway - you if you care about max usage of every single byte on your stora=
ge=20
- you could further tune/lower lvm2 metadata size + alignment + extent_size=
=20
and also same you could tuning you could try with ext4 settings.

This way you could take back some wasted space on alignments - which normal=
ly=20
is negligible amount of disk space on modern  high capacity sized drives.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

