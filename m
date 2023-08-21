Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156F2EE49A0
	for <linux-lvm@archiver.kernel.org>; Mon, 21 Aug 2023 23:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692662313;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U1awCMUhXHdv/RHda9PqsNdJ722BfAXQbRvfx8dHOHA=;
	b=JPbMgcV81XtU5jU2VJ4nPbKT3zMkkJO1jwwjc0wFii6hjrMEJFXOvIdw5D+edgzcwNrM58
	kJmFGqUw/1oGaTAhS+pq7jYZtguZIPGTbVGsGKjgNSasq4jgsanXMIEpEGe608AarvnjUk
	A1cfA0aqEwPfroHaO5W65NvCBanxnic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-696-UB2rACBCPZuDfIIJM4ppeQ-1; Mon, 21 Aug 2023 19:58:30 -0400
X-MC-Unique: UB2rACBCPZuDfIIJM4ppeQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 413AC101A528;
	Mon, 21 Aug 2023 23:58:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0BF0492C13;
	Mon, 21 Aug 2023 23:58:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3AEA01946588;
	Mon, 21 Aug 2023 23:58:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 001B51946586
 for <linux-lvm@listman.corp.redhat.com>; Mon, 21 Aug 2023 23:58:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC90E4021B9; Mon, 21 Aug 2023 23:58:21 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4D7A492C13
 for <linux-lvm@redhat.com>; Mon, 21 Aug 2023 23:58:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88ECA8011AD
 for <linux-lvm@redhat.com>; Mon, 21 Aug 2023 23:58:21 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-od22ZIr5MUa9memkZvisnQ-1; Mon,
 21 Aug 2023 19:58:19 -0400
X-MC-Unique: od22ZIr5MUa9memkZvisnQ-1
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.179.90] ([89.0.44.99]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3Ez1-1qbGKO0ZIb-003VZ0; Tue, 22
 Aug 2023 01:45:41 +0200
Message-ID: <068dff42-9960-7059-6ecf-9699192dc605@web.de>
Date: Tue, 22 Aug 2023 01:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.1
To: LVM general discussion and development <linux-lvm@redhat.com>,
 David Teigland <teigland@redhat.com>
References: <fa206f6a-2675-95c9-d6fe-7ef8466a0dd5@web.de>
 <5f40e362-e6b9-d66e-312b-6999e40ba951@web.de>
 <20230821161719.GA4913@redhat.com>
From: Roland <devzero@web.de>
In-Reply-To: <20230821161719.GA4913@redhat.com>
X-Provags-ID: V03:K1:0lV0UIG/gf/UFgQjFSqZ/xWUDRPG7e1P9RNQ9L7LE1rp8hrXTRX
 ZSjoRo/wbrVKa2pADyLo+En66PX2vvemKuFoLkC6HLLQQTCr/q39l3pXo54jy0Dk0jR2BjM
 u5160mw7VoaIiz2cfdCr+QKAr+fWvakmeoQug15j/3I18Ug53dujzOhe9Dlvu+33gDMPUQt
 WBpLiWn/a1ifn80E2LJkg==
UI-OutboundReport: notjunk:1;M01:P0:mCMOU4GUEVQ=;q6JrBb993P82VUugTW8LmIsFrlU
 Zf2icpswoifMn49GDjteKrf4O9+ZmZdHSSy2CPm7D9p19kAeu+qdNW+yEqFjlHBzr822jaRjg
 7b8qlRybqoBhk95AUUIpV33qjEbxHgxG9pF+Ys2xzJzgRKWlzAm/LTdcHAO7hw9q+euJFBMi8
 gMtJXrYONOfJLZco87/kK87R5Tt2yg1dhTPDb5JJqYXRTBb4zmQ82hAk4NzsqtKCqKJtyPWDL
 tpHB5JLy/6C7m2cKW5T6Aj3M688D+gMJEReIcDEdABXqAeVun5oNIJWpoFDKotIS1l2bTVnqP
 vUvw1fe3fstNyl8ozM5THMfr3wjwUekhdnUvW9GAxtosLSMBgoq6IjPyb0sKtWOfkADvmOpdk
 Qjmq/SblCKE5ihRQNttqYUJWfQusivIq48RHKrym+KiTdFPjTDzjimnpaUGq/3KYPqwhHqzse
 HLzFF79TV31G6KftAs2K/s9g9uKkKVeOBOXRnbRrCeZtF9wh6zNspN6Ecdbm9D9cX/hGM5Xoy
 4AeOr1CJX2/3SI4i1a3PRu1LUGKjtBaSuwtX8mf+F3eBKMjzR9igxmk3Qniq6gg7F4ZDRyTzD
 fOAULZ+V2aURPiUj6Mazp0xcDZRDydwApOzMcuOp4MsVssXGAJ6i/qOIsnEDYTczRn27GSIJv
 2Mt19Lup8H2cZtULpg7uAWvYQAx7mJjXfkb3+jzIqBTJTSSuYbGxEbGvl2mnugtJB2D97P+SV
 RybeOEAgJYiLAg7RJfTGLK03MyZzEFlEXDyen/Kad8q4F68Koro56PWfGbHJyZ6vRqpGhyuE+
 izwxrtkifOStjyHwTSUbtYWwIn8uMLWabqwDmPmm8aVlx90adpGkpyCAfHQYkPJzUbg4TBVPX
 QZp9HmmwJvo83ZYpSkNZKN8jtSV8g77JQ1/rl+na3gddTUekfgUNT8+ZZbRBIAb3WsHokGSJD
 UkT3Eg==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [linux-lvm] indistinguishable column names ( BA Start Start
 Start Start )
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: web.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

QW0gMjEuMDguMjMgdW0gMTg6MTcgc2NocmllYiBEYXZpZCBUZWlnbGFuZDoKCj4gT24gU2F0LCBB
dWcgMTksIDIwMjMgYXQgMDY6MDU6NThQTSArMDIwMCwgUm9sYW5kIHdyb3RlOgo+PiBmdXJ0aGVy
bW9yZSwgaXQncyBhIGxpdHRsZSBiaXQgd2VpcmQgdGhhdCBzb21lIGNvbHVtbnMgYmVpbmcgcHJp
bnRlZCBieQo+PiBkZWZhdWx0IHdoZW4gdXNpbmcgLW8sIGlzIHRoZXJlIGFuIGVhc2llciB3YXkg
dG8gcmVtb3ZlIHRob3NlIGJlc2lkZXMKPj4gZXhwbGljdGx5IHJlbW92aW5nIHRoZW0gb25lIGJ5
IG9uZSB3aXRoIHNldmVyYWwgLW8gb3B0aW9ucyA/Cj4+ICItby1vcHQxLC1vcHQyLC4uLiIgZG9l
c24ndCB3b3JrCj4+Cj4+IHNvcnJ5IGZvciB0aGlzIG5vaXNlLCBpIHdhcyB0b28gZHVtYiBmb3Ig
dGhhdCAsICItbytvcHQxLG9wdDIgLW8tb3B0MyxvcHQ0Igo+PiB3b3JrcyBhcyBkZXNpcmVkIChh
cyBkb2N1bWVudGVkIGluIG1hbnBhZ2UpCj4gVXN1YWxseSBpZiB5b3UncmUgaW50ZXJlc3RlZCBp
biBleGFjdCBmaWVsZHMsIHlvdSdkIGF2b2lkIHRoZSBkZWZhdWx0Cj4gb3B0aW9ucyBhbmQganVz
dCB1c2UgIi1vIG9wdDEsb3B0MiwuLi4iIHdpdGhvdXQgKy8tLgoKeWVzLCB0aGF0IG1ha2VzIHRv
dGFsbHkgc2Vuc2XCoCAtIHRoZXJlIGFyZSBkZWZhdWx0IG9wdGlvbnMsICIrIiBhZGRzCnNvbWUg
b3B0aW9ucywKIi0gcmVtb3ZlcyBzb21lICwgYW5kIC1vIHdpdGhvdXQgIisvLSIganVzdCBtYWtl
cyBpdCBwcmludCBleGFjdGx5IHdoYXQKd2Ugd2FudC4KCnRvdGFsbHkgc3RyYWlnaHRmb3J3YXJk
IGlmIHVuZGVyc3Rvb2QsIGkgd2FzIGp1c3QgdG9vIGxhenksIHNvcnJ5LgoKPj4gIyBwdnMgLS11
bml0cyBzIC1vK3B2X2JhX3N0YXJ0LHNlZ19zdGFydCxzZWdfc3RhcnRfcGUscHZzZWdfc3RhcnQK
Pj4gIMKgIFBWwqDCoMKgwqDCoMKgwqDCoCBWR8KgwqDCoMKgwqDCoMKgIEZtdMKgIEF0dHIgUFNp
emXCoMKgwqDCoMKgwqDCoCBQRnJlZSBwdl9iYV9zdGFydAo+PiAgIHNlZ19zdGFydCBzZWdfc3Rh
cnRfcGUgcHZzZWdfc3RhcnQKPiBJdCBkb2VzIHNvdW5kIGJldHRlciB0aGFuIHNvbWUgb2YgdGhl
IHN0cmFuZ2UgaGVhZGVyIGFiYnJldmlhdGlvbnMuCj4gSXQgY291bGQgYWxzbyB1c2UgdGhlIGtl
eSB3b3JkcyB0aGF0IGFwcGVhciB3aXRoIC0tbmFtZXByZWZpeGVzLgoKaSBoYXZlIGZvdW5kIHRo
ZSBwbGFjZSB3aGVyZSB0byBhZGQgYW4gUkZFIGFuZCBkaWQgdGhhdCA6CgpodHRwczovL2J1Z3pp
bGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIyMzMzMzYKCnRoYW5rIHlvdQoKcm9sYW5k
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
bHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0
IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCg==

