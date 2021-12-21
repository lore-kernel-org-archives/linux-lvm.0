Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAF8C433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 21 Dec 2021 13:47:23 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-vdOynH-bP0qttpwj6CNZIg-1; Tue, 21 Dec 2021 08:47:21 -0500
X-MC-Unique: vdOynH-bP0qttpwj6CNZIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11D63E744;
	Tue, 21 Dec 2021 13:47:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B114610D0;
	Tue, 21 Dec 2021 13:47:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C66D64BB7C;
	Tue, 21 Dec 2021 13:46:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BLDklvY032170 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 21 Dec 2021 08:46:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 707C41121330; Tue, 21 Dec 2021 13:46:47 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C06D112132E
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 13:46:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DA488001E9
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 13:46:44 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-84-PgYIr792OFucCQsqfF_czg-1; Tue, 21 Dec 2021 08:46:42 -0500
X-MC-Unique: PgYIr792OFucCQsqfF_czg-1
Received: by mail-ed1-f42.google.com with SMTP id z29so52138800edl.7
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 05:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=b684w7R3kfQRuCdgeXPP4kQ7GABtHKy17RAithRGURU=;
	b=PlN6tmFOJCJNWjJVn7x96fsfzC4QOn1CvzS+o+WRDR1xyn7GFJsOF9bwS9uAROy/UT
	sQnxcEiARca6VOgVpVfXWkdEwnWr8haEXy0x1W3GvEwLhdaI0CO0VnuN0a+GTEFCmFqZ
	9hFdP3efom2848Jzh+NP27pIvMgjeySglDRwE3iImUzqQ7ghstED0LWbvGhyOcC1/VR7
	z0UdK6mP4Eggr11Via8oTaUT4P/hKBtQ/tRFLgt9OtJKykHslwfiaYkUVcCb4mGwKTMn
	GvMnkgEPfztpbtbCwgoVZn6ZgHur3Washs3spe7frNcfNh46Q7F+4EBbkpca4B5tYlGD
	5XKA==
X-Gm-Message-State: AOAM531QB/7fqyrJh+x+7rw0SM0wGH808VnAl6TPWIcupdeMwzVU7tA9
	RHdbAubDlQtEELPo52ZnBAzfBSMzUQHipg==
X-Google-Smtp-Source: ABdhPJzwvl4J8LMBoLCvtI6BiKKGmZKoy++wTzQYkWMFK2Cz8YHtJV6337RmR1S+vepCP2IDRQh9Vg==
X-Received: by 2002:a50:bae2:: with SMTP id x89mr3284308ede.337.1640094401288; 
	Tue, 21 Dec 2021 05:46:41 -0800 (PST)
Received: from [192.168.0.99] ([83.148.32.207])
	by smtp.gmail.com with ESMTPSA id
	oz31sm6540958ejc.35.2021.12.21.05.46.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 21 Dec 2021 05:46:40 -0800 (PST)
Message-ID: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
Date: Tue, 21 Dec 2021 14:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.3.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
	=?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
References: <CACrcyf+2uz_ngeVdq48WjSg6ZaarRpVXs8TZwzpQ4hnW7D7xGg@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CACrcyf+2uz_ngeVdq48WjSg6ZaarRpVXs8TZwzpQ4hnW7D7xGg@mail.gmail.com>
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
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
	snapshot lv?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE5LiAxMi4gMjEgdiAxNzo0MyBUb21hcyBEYWxlYmrDtnJrIG5hcHNhbChhKToKPiBIaSwK
PiAKPiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIGhvdyB0byBjb252ZXJ0IGEgZGlzayBjb250
YWluaW5nIHNuYXBzaG90IGRhdGEuCj4gVGhpcyBpcyBob3cgSSB0ZXN0ZWQgdGhpczoKPiAxLiBs
b2NhdGUgdGhlIHNuYXBzaG90IHRlc3Rsdi4yMTEyMTguMjMyMjU1Cj4gcm9vdEBkZWJpYW4xMDov
ZGV2L21hcHBlciMgbHZzCj4gIMKgIExWIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFZHIMKg
IMKgIMKgIMKgIMKgQXR0ciDCoCDCoCDCoCBMU2l6ZSDCoCBQb29sIE9yaWdpbiBEYXRhJSAKPiAg
wqBNZXRhJSDCoE1vdmUgTG9nIENweSVTeW5jIENvbnZlcnQKPiAgwqAgaG9tZSDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBkZWJpYW4xMC12ZyAtd2ktYW8tLS0tIMKgIDEuMDBnCj4gIMKgIHJvb3Qg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGViaWFuMTAtdmcgLXdpLWFvLS0tLSDCoDwzLjgxZwo+
ICDCoCBzd2FwXzEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGViaWFuMTAtdmcgLXdpLWFvLS0tLSA5
NzYuMDBtCj4gIMKgIHRlc3RsdiDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkZWJpYW4xMC12ZyBvd2kt
YW9zLS0tIDEwMC4wMG0KPiB0ZXN0bHYuMjExMjE4LjIzMjI1NSBkZWJpYW4xMC12ZyBzd2ktYS1z
LS0tIDEwNC4wMG0gwqAgwqAgwqB0ZXN0bHYgMS40NAo+IHJvb3RAZGViaWFuMTA6L2Rldi9tYXBw
ZXIjCj4gCgpIaQoKSXQgbG9va3MgbGlrZSB0aGVyZSBpcyBzb21lIHNvcnQgb2YgbWlzdW5kZXJz
dGFuZGluZyBIT1cgdGhlc2Ugc25hcHNob3RzIHdpdGggCmx2bTIgZG8gd29yay4KClRoZSBzbmFw
c2hvdCBMViBkb2VzIE5PVCBjb250YWluIHdob2xlIGNvcHkgb2YgdGhlIG9yaWdpbiBMViAodGhl
IG9uZSB5b3UndmUgCnRha2UgaXRzIHNuYXBzaG90KQoKU28gd2hpbGUgJ2x2cycgaXMgcHJlc2Vu
dGluZyB5b3UgdGhlIHNpemUgb2Ygc25hcHNob3QgLSBpdCdzIG5vdCBhICdyZWd1bGFyJyAKdm9s
dW1lIGJlaGluZCB0aGUgc2NlbmUuIEluc3RlYWQgaXQncyBhIHNldCBvZiBkaWZmZXJlbnRpYXRp
bmcgYmxvY2tzIGZyb20gCnlvdXIgb3JpZ2luIHN0b3JlZCBpbiBhIHdheSB0aGUgY2FtZSBpbiB1
c2UuCgpTbyB3aGlsZSB5b3VyIHNuYXBzaG90IGxvb2tzIGl0IGhhcyBzaXplIDEwNE1pYiBhbmQg
b3JpZ2luIDEwME1pQiAtIGl0IG1lYW5zCnRoZXJlIGlzIGp1c3QgYWxsb2NhdGVkIG1heCBwb3Nz
aWJsZSBzaXplIG9mIHNuYXBzaG90IHRvIHN0b3JlIGFsbCBkaWZmZXJlbnQgCmNodW5rICsgc29t
ZSBleHRyYSBtZXRhZGF0YS4gIEJ1dCBBVE0gb25seSAxLjQ0JSBvZiB0aGlzIHNwYWNlIGlzIGFj
dHVhbGx5IAp1c2VkIHRvIGhvbGQgYWxsIHRoZXNlIGJsb2NrIChBS0EgfjEuNU1pQiBvciByZWFs
IHN0b3JhZ2Ugd2FzIHVzZWQgc28gZmFyKQoKVGhlcmUgaXMgYmFzaWNhbGx5IE5PIFdBWSB0byB1
c2UgdGhpcyAnQ09XJyBzdG9yYWdlIGFyZWEgd2l0aG91dCBpdHMgb3JpZ2luYWwgCnZvbHVtZS4K
CklmIHlvdSB3YW50IHRvIHVzZSBzdWNoICdzbmFwc2hvdCcgZWxzZXdoZXJlIHlvdSBzaW1wbHkg
bmVlZCB0byAqZGQqIHN1Y2ggTFYgLSAKd2hpY2ggaXMgcHJlc2VudGVkICh2aWEgbWFnaWMgd29y
bGQgb2YgRE0gdGFyZ2V0cykgdG8gdXNlci1zcGFjZSB0byBhcHBlYXIgCmxpa2UgeW91ciBvcmln
aW5hbCBMViBpbiB0aGUgbW9tZW50IG9mIHNuYXBzaG90LgoKQnV0IHRoZSBhY3R1YWwgJ3Jhdycg
Y29udGVudCBzdG9yZWQgaW4gZGlzayBpcyBpbiAnaW50ZXJuYWwnIGZvcm0gLSBub3QgcmVhbGx5
IAp1c2FibGUgb3V0c2lkZSAoYWx0aG91Z2ggdGhlIGZvcm1hdCBpcyBub3QgcmVhbGx5IGEgY29t
cGxpY2F0ZWQgb25lKQoKTm90ZSAtIHRoZXNlIHNvIGNhbGxlZCAndGhpY2snIHNuYXBzaG90IG9y
ICdvbGQnIHNuYXBzaG90IGFyZSBub3cgYmV0dGVyIApoYW5kbGVkIHZpYSB0aGluLXByb3Zpc2lv
bmluZyAtIGdpdmluZyBtdWNoIGJldHRlciBwZXJmb3JtYW5jZSAtIGVzcGVjaWFsbHkgaWYgCnlv
dSBwbGFuIHRvIGtlZXAgc25hcHNob3QgZm9yIGxvbmcgdGVybSBvciBoYXZlIGl0IGluIGJpZ2dl
ciBzaXplLgoKSG9wZWZ1bGx5IGl0IG5vdyBtYWtlcyBpdCB3YXkgbW9yZSBjbGVhci4KClJlZ2Fy
ZHMKClpkZW5lawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xp
c3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0g
SE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

