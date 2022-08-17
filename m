Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDEC25B08
	for <linux-lvm@archiver.kernel.org>; Wed, 17 Aug 2022 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660742854;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+FyAOjwyuGNRDx7prSleBvjW+Y9/PXVl3YlRsR+3B3Q=;
	b=fpUVBtY8mRX5OXPvd2D1gBca1ft4O+W4Eoi4Z7DlzMlWtwHf/LgfAuYT3QBcdZccV+hT97
	4tTm+1AGN/tY1LFdx/ev0z4vYSK8G580e3cN6IIcbtztMRkBUVzFE++Nbzs4/JN9iUYXsS
	wv3eyWdAIwBfubDpcawgeHuRwiF64M4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-zCQ6YZyIPlSYnzK_s-CXag-1; Wed, 17 Aug 2022 09:27:33 -0400
X-MC-Unique: zCQ6YZyIPlSYnzK_s-CXag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29242185A7B2;
	Wed, 17 Aug 2022 13:27:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B3B22026609;
	Wed, 17 Aug 2022 13:27:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 69826194E115;
	Wed, 17 Aug 2022 13:27:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DA3E1946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 12:54:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 319251121319; Wed, 17 Aug 2022 12:54:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D5CF1121314
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 12:54:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 111443C00089
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 12:54:53 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-o8V74KTzPPWxJs3dzAUV3A-1; Wed, 17 Aug 2022 08:54:49 -0400
X-MC-Unique: o8V74KTzPPWxJs3dzAUV3A-1
Received: by mail-ej1-f54.google.com with SMTP id qn6so24316736ejc.11;
 Wed, 17 Aug 2022 05:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2z5uplZtZ1M2m2cF1FdYspep8CLQSAa20IQPp2m+KZ4=;
 b=tgK/N7sJKyWvZrw6ri0/4P94vLENxPUhwiNbH15lFAgML+2RL3qSLHD32ZosRVpRHO
 QHCjo3ADi7mBGRFVflL+pCD/jXXabp+8pFgf32KZJz3C/wi+R3gHokCjo+qNnRpcONEe
 QLiQnwoUBX6/uOYLMQc47sBH+cQfNkbLjRnTvbLGsQt00En+I04VLio8d2N/cE8Pkn7h
 kyVrUzfGl7+jmKj+6hPy9bfLpmgzGcdhgosU9PuNOThBJq1B6I4QwEAePbnjs/93Gn97
 Eflbhfsf6gaBJeSPdHOmDDSCAF0A0IA2DhGumQyplnCrQUa/IDy2h4yC/c8NN7XjSzoo
 Linw==
X-Gm-Message-State: ACgBeo2iCtXefqzKHl5LpSMQZoXfqOQtWPRKt+zPRSvoPryZL9uO4kun
 tiVAKdjCZ8zYWOJGDhluxYBiiWsyTflp3g==
X-Google-Smtp-Source: AA6agR5aAZRzGpMVLUs1xgsP6iN/3JivUMScY9W2heuZSB5NKaWP+L5yJ2AWDg/YWVIFtaMqgo6sLw==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr16876828ejc.762.1660740887816; 
 Wed, 17 Aug 2022 05:54:47 -0700 (PDT)
Received: from [192.168.0.99] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 w20-20020aa7da54000000b0043bba5ed21csm10596981eds.15.2022.08.17.05.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 05:54:47 -0700 (PDT)
Message-ID: <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
Date: Wed, 17 Aug 2022 14:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
To: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: "teigland@redhat.com" <teigland@redhat.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE3LiAwOC4gMjIgdiAxNDozOSBNYXJ0aW4gV2lsY2sgbmFwc2FsKGEpOgo+IE9uIFdlZCwg
MjAyMi0wOC0xNyBhdCAxODo0NyArMDgwMCwgSGVtaW5nIFpoYW8gd3JvdGU6Cj4+IE9uIFdlZCwg
QXVnIDE3LCAyMDIyIGF0IDExOjQ2OjE2QU0gKzAyMDAsIFpkZW5layBLYWJlbGFjIHdyb3RlOgo+
Pgo+Pgo+Pj4KPj4+IEFUTSBJJ20gbm90IGV2ZW4gc3VyZSBpZiB5b3UgYXJlIGNvbXBsYWluaW5n
IGFib3V0IGhvdyBDUFUgdXNhZ2Ugb2YKPj4+IGx2bXBvbGxkCj4+PiBvciBqdXN0IGh1Z2UgdWRl
diBydWxlcyBwcm9jZXNzaW5nIG92ZXJoZWFkLgo+Pgo+PiBUaGUgbG9hZCBpcyBnZW5lcmF0ZWQg
YnkgbXVsdGlwYXRoLiBsdm1wb2xsZCBkb2VzIHRoZSBJTl9DTE9TRV9XUklURQo+PiBhY3Rpb24K
Pj4gd2hpY2ggaXMgdGhlIHRyaWdnZXIuCj4gCj4gTGV0J3MgYmUgY2xlYXIgaGVyZTogZXZlcnkg
Y2xvc2UtYWZ0ZXItd3JpdGUgb3BlcmF0aW9uIHRyaWdnZXJzIHVkZXYncwo+ICJ3YXRjaCIgbWVj
aGFuaXNtIGZvciBibG9jayBkZXZpY2VzLCB3aGljaCBjYXVzZXMgdGhlIHVkZXYgcnVsZXMgdG8g
YmUKPiBleGVjdXRlZCBmb3IgdGhlIGRldmljZS4gVGhhdCBpcyBub3QgYSBjaGVhcCBvcGVyYXRp
b24uIEluIHRoZSBjYXNlIGF0Cj4gaGFuZCwgdGhlIGN1c3RvbWVyIHdhcyBvYnNlcnZpbmcgYSBs
b3Qgb2YgIm11bHRpcGF0aCAtVSIgY29tbWFuZHMuIFNvCj4gYXBwYXJlbnRseSBhIHNpZ25pZmlj
YW50IHBhcnQgb2YgdGhlIHVkZXYgcnVsZSBwcm9jZXNzaW5nIHdhcyBzcGVudCBpbgo+ICJtdWx0
aXBhdGggLVUiLiBSdW5uaW5nICJtdWx0aXBhdGggLVUiIGlzIGltcG9ydGFudCwgYmVjYXVzZSB0
aGUgcnVsZQo+IGNvdWxkIGhhdmUgYmVlbiB0cmlnZ2VyZWQgYnkgYSBjaGFuZ2Ugb2YgdGhlIG51
bWJlciBvZiBhdmFpbGFibGUgcGF0aHMKPiBkZXZpY2VzLCBhbmQgbGF0ZXIgY29tbWFuZHMgcnVu
IGZyb20gdWRldiBydWxlcyBtaWdodCBoYW5nIGluZGVmaW5pdGVseQo+IGlmIHRoZSBtdWx0aXBh
dGggZGV2aWNlIGhhZCBubyB1c2FibGUgcGF0aHMgYW55IG1vcmUuICJtdWx0aXBhdGggLVUiIGlz
Cj4gYWxyZWFkeSBxdWl0ZSB3ZWxsIG9wdGltaXplZCwgYnV0IGl0IG5lZWRzIHRvIGRvIHNvbWUg
SS9PIHRvIGNvbXBsZXRlCj4gaXQncyB3b3JrLCB0aHVzIGl0IHRha2VzIGEgZmV3IG1pbGxpc2Vj
b25kcyB0byBydW4uCj4gCj4gSU9XLCBpdCB3b3VsZCBiZSBtaXNsZWFkaW5nIHRvIHBvaW50IGF0
IG11bHRpcGF0aC4gY2xvc2UtYWZ0ZXItd3JpdGUKPiBvcGVyYXRpb25zIG9uIGJsb2NrIGRldmlj
ZXMgc2hvdWxkIGJlIGF2b2lkZWQgaWYgcG9zc2libGUuIEFzIHlvdQo+IHByb2JhYmx5IGtub3cs
IHRoZSBwdXJwb3NlIHVkZXYncyAid2F0Y2giIG9wZXJhdGlvbiBpcyB0byBiZSBhYmxlIHRvCj4g
ZGV0ZXJtaW5lIGNoYW5nZXMgb24gbGF5ZXJlZCBkZXZpY2VzLCBlLmcuIG5ld2x5IGNyZWF0ZWQg
TFZzIG9yIHRoZQo+IGxpa2UuwqAicHZtb3ZlIiBpcyBzcGVjaWFsLCBiZWNhdXNlIGJ5IGRlZmlu
aXRpb24gaXQgd2lsbCB1c3VhbGx5IG5vdAo+IGNhdXNlIGFueSBjaGFuZ2VzIGluIGhpZ2hlciBs
YXllcnMuIFRoZXJlZm9yZSBpdCBtaWdodCBtYWtlIHNlbnNlIHRvCj4gZGlzYWJsZSB0aGUgdWRl
diB3YXRjaCBvbiB0aGUgYWZmZWN0ZWQgUFZzIHdoaWxlIHB2bW92ZSBpcyBydW5uaW5nLCBhbmQK
PiB0cmlnZ2VyIGEgc2luZ2xlIGNoYW5nZSBldmVudCAocmUtZW5hYmxpbmcgdGhlIHdhdGNoKSBh
ZnRlciB0aGUgcHZtb3ZlCj4gaGFzIGZpbmlzaGVkLiBJZiB0aGF0IGlzIGltcG9zc2libGUsIGx2
bXBvbGxkIGFuZCBvdGhlciBsdm0gdG9vbHMgdGhhdAo+IGFyZSBpbnZvbHZlZCBpbiB0aGUgcHZt
b3ZlIG9wZXJhdGlvbiBzaG91bGQgYXZvaWQgY2FsbGluZyBjbG9zZSgpIG9uCj4gdGhlIFBWcywg
SU9XIGtlZXAgdGhlIGZkcyBvcGVuIHVudGlsIHRoZSBvcGVyYXRpb24gaXMgZmluaXNoZWQuCgpI
aQoKTGV0J3MgbWFrZSBjbGVhciB3ZSBhcmUgdmVyeSB3ZWxsIGF3YXJlIG9mIGFsbCB0aGUgY29u
c3RyYWlucyBhc3NvY2lhdGVkIHdpdGggCnVkZXYgcnVsZSBsb2dpYyAgKGFuZCB3ZSB0cmllZCBx
dWl0ZSBoYXJkIHRvIG1pbmltaXplIGltcGFjdCAtIGhvd2V2ZXIgdWRldmQgCmRldmVsb3BlcnMg
a2luZCBvZiAnbWlzdW5kZXJzdG9vZCcgIGhvdyBiYWRseSB0aGV5IHdpbGwgYmUgaW1wYWN0aW5n
IHN5c3RlbSdzIApwZXJmb3JtYW5jZSB3aXRoIHRoZSBleGlzdGluZyB3YXRjaCBydWxlIGxvZ2lj
IC0gYW5kIHRoZSBzdG9yeSBraW5kIG9mIAonY29udGludWVzJyB3aXRoICAnc3lzdGVtZCdzJyAm
IGRCdXMgc2VydmljZXMgdW5mb3J0dW5hdGVsbHkuLi4KCkhvd2V2ZXIgbGV0J3MgZm9jdXMgb24g
J3B2bW92ZScgYXMgaXQgaXMgcG90ZW50aWFsbHkgdmVyeSBsZW5ndGh5IG9wZXJhdGlvbiAtIApz
byBpdCdzIG5vdCBmZWFzaWJsZSB0byBrZWVwIHRoZSAgVkcgbG9ja2VkL2Jsb2NrZWQgIGFjcm9z
cyBhbiBvcGVyYXRpb24gd2hpY2ggCm1pZ2h0IHRha2UgZXZlbiBkYXlzIHdpdGggc2xvd2VyIHN0
b3JhZ2UgYW5kIGJpZyBtb3ZlZCBzaXplcyAod3JpdGUgCmFjY2Vzcy9sb2NrIGRpc2FibGVzIGFs
bCByZWFkZXJzLi4uKQoKU28gdGhlIGx2bTIgZG9lcyB0cnkgdG8gbWluaW1pemUgbG9ja2luZyB0
aW1lLiBXZSB3aWxsIHJlIHZhbGlkYXRlIHdoZXRoZXIgCmp1c3QgbmVjZXNzYXJ5ICAndmcgdXBk
YXRpbmcnIG9wZXJhdGlvbiBhcmUgdXNpbmcgJ3dyaXRlJyBhY2Nlc3MgLSBzaW5jZSAKb2NjYXNp
b25hbGx5IGR1ZSB0byBzb21lIHVucmVsYXRlZCBjb2RlIGNoYW5nZXMgaXQgbWlnaHQgZXZlbnR1
YWxseSByZXN1bHQgCnNvbWV0aW1lcyBpbiB1bndhbnRlZCAnd3JpdGUnIFZHIG9wZW4gLSBidXQg
d2UgY2FuJ3Qga2VlcCB0aGUgb3BlcmF0aW9uIApibG9ja2luZyAgYSB3aG9sZSBWRyBiZWNhdXNl
IG9mIHNsb3cgdWRldiBydWxlIHByb2Nlc3NpbmcuCgpJbiBub3JtYWwgY2lyY3Vtc3RhbmNlcyB1
ZGV2IHJ1bGUgc2hvdWxkIGJlIHByb2Nlc3NlZCB2ZXJ5IGZhc3QgLSB1bmxlc3MgdGhlcmUgCmlz
IHNvbWV0aGluZyBtaXMtZGVzaWduZSBjYXVzaW5nIGEgQ1BVIG92ZXJsb2FkaW5nLgoKQnV0IGFz
IG1lbnRpb25lZCBhbHJlYWR5IGZldyB0aW1lcyAtIHdpdGhvdXQgbW9yZSBrbm93bGVkZ2UgYWJv
dXQgdGhlIGNhc2Ugd2UgCmNvdWxkIGhhcmRseSBndWVzcyBleGFjdCByZWFzb25pbmcuICBCdXQg
d2UgYWxyZWFkeSBwcm92aWRlZCB1c2VmdWwgc3VnZ2VzdGlvbiAKaG93IHRvIHJlZHVjZSBudW1i
ZXIgb2YgJ3Byb2Nlc3NlZCcgZGV2aWNlIGJ5IHVkZXYgYnkgcmVkdWN0aW9uIG9mICdsdm0yIApt
ZXRhZGF0YSBQVnMnICAtIHRoZSBiaWcgcmVhc29uIGZvciBmcmVxdWVudCBtZXRhZGF0YSB1cHNh
dGUgd291bGQgYmUgYSBiaWcgCnNlZ21lbnRhdGlvbiBvZiBMViAtIGJ1dCB0aGlzIHdlIHdpbGwg
bm90IGtub3cgd2l0aG91dCBzZWVpbmcgdXNlcidzIAonbWV0YWRhdGEnIG9mIGEgVkcgaW4gdGhp
cyBjYXNlLi4uCgoKWmRlbmVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQuY29tCmh0
dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZtCnJlYWQg
dGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

