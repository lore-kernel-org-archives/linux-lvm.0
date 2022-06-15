Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7D4CCA47F
	for <linux-lvm@archiver.kernel.org>; Thu, 16 Jun 2022 07:33:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-mTv4L6VfNteixscWJN81Kw-1; Thu, 16 Jun 2022 03:33:26 -0400
X-MC-Unique: mTv4L6VfNteixscWJN81Kw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DC47811E7A;
	Thu, 16 Jun 2022 07:33:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4291C40334D;
	Thu, 16 Jun 2022 07:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8BA621947067;
	Thu, 16 Jun 2022 07:33:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E65351947B83
 for <linux-lvm@listman.corp.redhat.com>; Wed, 15 Jun 2022 07:42:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3EF84010E4D; Wed, 15 Jun 2022 07:42:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB9B5404E4C6
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 07:42:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A358B85A583
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 07:42:25 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-R17f3SNtNoaCD7dAzigDEg-1; Wed, 15 Jun 2022 03:42:23 -0400
X-MC-Unique: R17f3SNtNoaCD7dAzigDEg-1
Received: by mail-pg1-f171.google.com with SMTP id f65so10649722pgc.7
 for <linux-lvm@redhat.com>; Wed, 15 Jun 2022 00:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R2d5g//52rCQuiR6uk/e9HeGYc2fv8ss79sri5aBGaQ=;
 b=koj3/OuXjug8v7K9+WQ/q6Ptb7bLAbb4o+mJ+i4rc5AmhEJ5ClyKYdVNVqyRRcTtMe
 264XtVNQt2eaAxReyAzDn4TVFPJYEHYMUhTaR02EHEYDs8XbFoiLXquq+QV+rE1oLvfc
 ioX3z9Hs452k/rVS4zdaVzVnlv1hhrF3LWdjzQMORpXiupHx61kiT4QLUWYnBw1W15sn
 PYVD6d75BlVFcOTQhCHz7ceRsRFqxQe8X7wyEle+0m7UPi2nJK6TWF6gDMZNk/3ZMz7b
 Y97rWO7eFqys9t8nb9HX4dg/j5xQaiqVAdA37qrfwLo+EEcviAwa2UeoD8fkvm41AMHW
 c3jA==
X-Gm-Message-State: AOAM5330qOUGR6sWFDE1yxG4yMJfGRBpVwaSMRmnQyRh8JCZQWCkYEcv
 jcN86JeFgAz7arYGkZRNFctIfDXjIq2V5A==
X-Google-Smtp-Source: ABdhPJzi3Fw6ZSKbqBaLfGeX85gR258SfRr/QRsDIiSzZrDq/RNyXVG27zsw5D2FvaYED8yqwTiE3A==
X-Received: by 2002:a63:54f:0:b0:3fd:9bbe:a2c3 with SMTP id
 76-20020a63054f000000b003fd9bbea2c3mr7859246pgf.5.1655278942003; 
 Wed, 15 Jun 2022 00:42:22 -0700 (PDT)
Received: from [10.87.58.194] ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 ik22-20020a170902ab1600b001635b86a790sm8519444plb.44.2022.06.15.00.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 00:42:21 -0700 (PDT)
Message-ID: <d354dfb0-c37e-8a85-6cf6-d4b3a7e9257d@bytedance.com>
Date: Wed, 15 Jun 2022 15:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
To: Gionatan Danti <g.danti@assyoma.it>
References: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
 <e779f9dc7139963adfa64b03eca170f3@assyoma.it>
 <8baee796-9bfb-47a8-1661-7e94437826c9@bytedance.com>
 <daaa5fa473c1ce56f9d9d4e149047fe6@assyoma.it>
 <5970db8d-462f-0e35-741c-fa0fdc188fa2@bytedance.com>
 <d927c03eef10c508161ad52daa7e908e@assyoma.it>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <d927c03eef10c508161ad52daa7e908e@assyoma.it>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Thu, 16 Jun 2022 07:33:19 +0000
Subject: Re: [linux-lvm] Why is the performance of my lvmthin snapshot so
 poor
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgrlnKggNi8xNC8yMiAxMDo1NCBQTSwgR2lvbmF0YW4gRGFudGkg5YaZ6YGTOgo+IElsIDIwMjIt
MDYtMTQgMTU6MjkgWmhpeW9uZyBZZSBoYSBzY3JpdHRvOgo+PiBUaGUgcmVhc29uIGZvciB0aGlz
IG1heSBiZSB0aGF0IHdoZW4gdGhlIHZvbHVtZSBjcmVhdGVzIGEgc25hcHNob3QsCj4+IGVhY2gg
d3JpdGUgdG8gYW4gZXhpc3RpbmcgYmxvY2sgd2lsbCBjYXVzZSBhIENPVyAoQ29weS1vbi13cml0
ZSksIGFuZAo+PiB0aGUgQ09XIGlzIGEgY29weSBvZiB0aGUgZW50aXJlIGRhdGEgYmxvY2sgaW4g
Y2h1bmtzaXplLCBmb3IgZXhhbXBsZSwKPj4gd2hlbiB0aGUgY2h1bmtzaXplIGlzIDY0aywgZXZl
biBpZiBvbmx5IDRrIG9mIGRhdGEgaXMgd3JpdHRlbiwgdGhlCj4+IGVudGlyZSA2NGsgZGF0YSBi
bG9jayB3aWxsIGJlIGNvcGllZC4gSSdtIG5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZAo+PiB0aGlz
IGNvcnJlY3RseS4KPiAKPiBZZXMsIGluIHlvdXIgY2FzZSwgdGhlIGFkZGVkIGNvcGllcyBhcmUg
bG93ZXJpbmcgdG90YWwgYXZhaWxhYmxlIElPUHMuIAo+IEJ1dCBub3RlIGhvdyB0aGUgZGVjcmVh
c2UgaXMgc3ViLWxpbmVhciAoZnJvbSA2NEsgdG8gMU0geW91IGhhdmUgYSAxNnggCj4gaW5jcmVh
c2UgaW4gY2h1bmsgc2l6ZSBidXQgIm9ubHkiIGEgMTB4IGhpdCBpbiBJT1BzKTogdGhpcyBpcyBk
dWUgdG8gdGhlIAo+IGxvd2VyZWQgbWV0YWRhdGEgb3ZlcmhlYWQuCgpJdCBzZWVtcyB0aGF0IHRo
ZSBjb25zdW1wdGlvbiBvZiBDT1cgY29waWVzIHdoZW4gc2VuZGluZyA0ayByZXF1ZXN0cyBpcyAK
bXVjaCBncmVhdGVyIHRoYW4gdGhlIGxvc3MgZnJvbSBtZXRhZGF0YS4KCj4gQSBsYXN0IHRyeTog
aWYgeW91IGNhbiwgcGxlYXNlIHJlZ2VuZXJhdGUgeW91ciB0aGluIHZvbHVtZSB3aXRoIDY0SyAK
PiBjaHVua3MgYW5kIHNldCBmaW8gdG8gZXhlY3V0ZSA2NEsgcmVxdWVzdHMuIExldHMgc2VlIGlm
IExWTSBpcyBhdCBsZWFzdCAKPiBzbWFydCBlbm91Z2ggdG8gYXZvaWQgY29waW5nIGEgdG8tYmUt
Y29tcGxldGVseS1vdmVyd3JpdHRlbiBjaHVua3MuCgpJIHJlZ2VuZXJhdGVkIHRoZSB0aGluIHZv
bHVtZSB3aXRoIHRoZSBjaHVua3NpemUgb2YgNjRLIGFuZCB0aGUgcmFuZG9tIAp3cml0ZSBwZXJm
b3JtYW5jZSBkYXRhIHRlc3RlZCB3aXRoIGZpbyA2NGsgcmVxdWVzdHMgaXMgYXMgZm9sbG93czoK
Y2FzZSAgICAgICAgICAgICAgICAgICAgaW9wcwp0aGluIGx2ICAgICAgICAgICAgICAgICA5Mzgx
CnNuYXBzaG90dGVkIHRoaW4gbHYgICAgIDgzMDcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJl
ZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhP
V1RPLwo=

