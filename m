Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55901EB64DA
	for <linux-lvm@archiver.kernel.org>; Wed, 12 Jul 2023 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689153517;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xfGv4Lg8J8URMv++s7yYYXSv68aLv1YbiXmpgvOeZRw=;
	b=OZJpU01iMjr/vmGJrkI4gj0Mwcy6NLQsk/K6f7kg+GwMsxCnPWRzM+k8+RjQTHElHcFz3H
	pKFLsQWU7oL6XaBp1O21ztbcGVtzcDtrToBNWOv5NCqLHs8XaiTYNIf0Mkp5vVOY1/q4eF
	1rMMV+wq2GIIAvcp59fF6EMA2bsJHYA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-Gd7_TgnpNjS_BH8iCaXUuQ-1; Wed, 12 Jul 2023 05:18:29 -0400
X-MC-Unique: Gd7_TgnpNjS_BH8iCaXUuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 268251C29AF5;
	Wed, 12 Jul 2023 09:18:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90692C09A09;
	Wed, 12 Jul 2023 09:18:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B2EF19465BB;
	Wed, 12 Jul 2023 09:18:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 405B019465B6
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Jul 2023 09:18:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1BD1A492CAC; Wed, 12 Jul 2023 09:18:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12EE8492B01
 for <linux-lvm@redhat.com>; Wed, 12 Jul 2023 09:18:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AA45848191
 for <linux-lvm@redhat.com>; Wed, 12 Jul 2023 09:18:11 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com
 [45.249.212.189]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-4lI7Pa_eO9KLMUOr5wU8mQ-1; Wed, 12 Jul 2023 05:18:00 -0400
X-MC-Unique: 4lI7Pa_eO9KLMUOr5wU8mQ-1
Received: from dggpemm500015.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4R1Bsl2QKpzPkFx;
 Wed, 12 Jul 2023 17:15:23 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500015.china.huawei.com (7.185.36.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 17:17:43 +0800
Received: from dggpemm500014.china.huawei.com ([7.185.36.153]) by
 dggpemm500014.china.huawei.com ([7.185.36.153]) with mapi id 15.01.2507.027;
 Wed, 12 Jul 2023 17:17:43 +0800
From: "wangzhiqiang (Q)" <wangzhiqiang95@huawei.com>
To: David Teigland <teigland@redhat.com>
Thread-Topic: [linux-lvm] The logical volume cannot be activated
Thread-Index: AQHZs1CX3ntrb0BGDEygRQALXWc34K+13FyA
Date: Wed, 12 Jul 2023 09:17:43 +0000
Message-ID: <21fb8bc72e8d4f3c9f2130b309c776df@huawei.com>
References: <23f736c2-a264-f366-e217-6cbec424f9ed@huawei.com>
 <20230710170403.GB3668@redhat.com>
In-Reply-To: <20230710170403.GB3668@redhat.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.78]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [linux-lvm] =?gb2312?b?tPC4tDogIFRoZSBsb2dpY2FsIHZvbHVtZSBjYW5u?=
 =?gb2312?b?b3QgYmUgYWN0aXZhdGVk?=
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
Cc: linfeilong <linfeilong@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>,
 wuguanghao <wuguanghao3@huawei.com>, Louhongxiang <louhongxiang@huawei.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huawei.com
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LCB0aGlzIGNvbW1pdCBpcyBuaWNlLg0KDQotLS0tLdPK
vP7Urbz+LS0tLS0NCreivP7IyzogRGF2aWQgVGVpZ2xhbmQgPHRlaWdsYW5kQHJlZGhhdC5jb20+
IA0Kt6LLzcqxvOQ6IDIwMjPE6jfUwjExyNUgMTowNA0KytW8/sjLOiB3YW5nemhpcWlhbmcgKFEp
IDx3YW5nemhpcWlhbmc5NUBodWF3ZWkuY29tPg0Ks63LzTogbGludXgtbHZtQHJlZGhhdC5jb207
IGxpbmZlaWxvbmcgPGxpbmZlaWxvbmdAaHVhd2VpLmNvbT47IGxpeGlhb2tlbmcgPGxpeGlhb2tl
bmdAaHVhd2VpLmNvbT47IExvdWhvbmd4aWFuZyA8bG91aG9uZ3hpYW5nQGh1YXdlaS5jb20+OyB3
dWd1YW5naGFvIDx3dWd1YW5naGFvM0BodWF3ZWkuY29tPg0K1vfM4jogUmU6IFtsaW51eC1sdm1d
IFRoZSBsb2dpY2FsIHZvbHVtZSBjYW5ub3QgYmUgYWN0aXZhdGVkDQoNCk9uIE1vbiwgSnVsIDEw
LCAyMDIzIGF0IDAyOjQ3OjA3UE0gKzA4MDAsIHdhbmd6aGlxaWFuZyAoUSkgd3JvdGU6DQo+IERl
YXIgYWxsDQo+IA0KPiBJIGhhdmUgYSBlbnZpcm9ubWVudCB0aGF0IGRpc2sgb25saW5lIGFmdGVy
IHN3aXRjaCByb290LCBsaW5rIGluIA0KPiAvZGV2L2Rpc2svYnktaWQgaXMgbm90IGdlbmVyYXRl
ZCB3aGVuIDY5LWRtLWx2bS5ydWxlcyBpcyBleGVjdXRlZCwgYnV0IA0KPiBpIHNldCBsaW5rIHRv
IGZpbHRlciBpbiBsdm0uY29uZiwgc28gdGhhdCBwdnNjYW4gZmFpbGVkIHRvIHNjYW4gcGh5c2lj
YWwgdm9sdW1lcyBhbmQgc2V0IGVudmlyb25tZW50IHZhcmlhYmxlIExWTV9WR19OQU1FX0NPTVBM
RVRFLCBmaW5hbGx5LCB0aGUgbG9naWNhbCB2b2x1bWUgaXMgbm90IGFjdGl2YXRlZC4NCg0KSGks
IHVzaW5nIC9kZXYvZGlzay8gbGlua3MgaW4gdGhlIGZpbHRlciB3YXMgZml4ZWQgaGVyZToNCmh0
dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWx2bTIuZ2l0O2E9Y29tbWl0O2g9MTdhMzU4NWNi
YjU1ZDlhMTVjZWQ5Nzc1YTE4YjUwYzUzYTUwZWU4ZQ0KDQpEYXZlDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QK
bGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcv
SE9XVE8vTFZNLUhPV1RPLwo=

