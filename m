Return-Path: <SRS0=HjLT=OM=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E1FC433EF
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Sep 2021 07:19:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2C561168
	for <linux-lvm@archiver.kernel.org>; Wed, 22 Sep 2021 07:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB2C561168
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=maven.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-x9F7QlHzPXuei49ooyY5Fg-1; Wed, 22 Sep 2021 03:19:51 -0400
X-MC-Unique: x9F7QlHzPXuei49ooyY5Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB9D10168C7;
	Wed, 22 Sep 2021 07:19:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC7F15F707;
	Wed, 22 Sep 2021 07:19:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 080581800FE4;
	Wed, 22 Sep 2021 07:19:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18M7JE2n019007 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 22 Sep 2021 03:19:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FE35EAFB7; Wed, 22 Sep 2021 07:19:14 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26DA8EAFAE
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 07:19:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24FCF18A01A0
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 07:19:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-585-DpkIWCDbMW-ZecPi3lcVWg-1; Wed, 22 Sep 2021 03:19:06 -0400
X-MC-Unique: DpkIWCDbMW-ZecPi3lcVWg-1
Received: by mail-lf1-f50.google.com with SMTP id g41so8264839lfv.1
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2021 00:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent
	:content-language:to:from:subject:content-transfer-encoding;
	bh=EM/K1cZ2u849k7Rjnk6tjI5PNFo6TmMyDBIbCgCFp4E=;
	b=VXuh/AOGs3IJ83wOMrnYA7uYn4Hflg5vPwZvcZJd0I9ivG368rZ+1k7Chqkd73C3nx
	1cTM8KyPltAwkJzB6PILB8ALKvylfwKqO5uKPh8/24rQLgCKCPc0WAFzIlR/PQhYXd8p
	C6fDak+TU2zXILjLCG5hDRtKMZzVCKNjsFKJOty9w3dCTwqrJwdtT112QGVzLnwbujoX
	7Z+t1lRPpS5bgreVuhpP3bTqjPD/RUvpXWPA8wo1wk0G92JabO9BAOm3Ow3rC9CHnk8b
	9fOQb3LxNq+Zgg8f1aIH8isalBnXPPIOxcOUc+W9gkvATc+0IO6+EkbF6ol3ljFldGGO
	hIlw==
X-Gm-Message-State: AOAM532NSbgOv69ClY4u63QTegUQU43kLuRuCim6da49tQqDlsnQmCYO
	uyYartjxPmzd0TQ9wX0LGMAC5RhCIRAD+Q==
X-Google-Smtp-Source: ABdhPJzgF62Im8qrUfCgNGnbLMT4kOEKNZK0hy6Rxy26SSO3w7qUOyPzXGooXO3p/9DQ0zaVJbeIDA==
X-Received: by 2002:a05:6512:32c8:: with SMTP id
	f8mr27708600lfg.683.1632295144692; 
	Wed, 22 Sep 2021 00:19:04 -0700 (PDT)
Received: from [192.168.68.193] (user-5-173-156-29.play-internet.pl.
	[5.173.156.29])
	by smtp.gmail.com with ESMTPSA id 11sm104912lft.266.2021.09.22.00.19.03
	for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Sep 2021 00:19:04 -0700 (PDT)
Message-ID: <fd7cf93d-4f51-28a9-d7a8-dd61fd59268b@maven.pl>
Date: Wed, 22 Sep 2021 09:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.1.1
To: linux-lvm@redhat.com
From: =?UTF-8?Q?Arkadiusz_Mi=c5=9bkiewicz?= <arekm@maven.pl>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] vgchange -a n --sysinit hangs without udevd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: pl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CkhlbGxvLgoKTGludXggNS4xMC42NywgZ2xpYmMgMi4zNCwgbHZtIDIuMDMuMTMsIHVkZXZkIDI0
Niwgc2ltcGxlIGluaXQgc2NyaXB0CnJ1biBvbiBzaHV0ZG93biB3aGljaCBkb2VzCgp2Z2NoYW5n
ZSAtYSBuIC0tc3lzaW5pdAoKbm8gb3RoZXIgcHJvY2Vzc2VzIGFyZSBydW5uaW5nIChqdXN0IGlu
aXQsIG15IHNjcmlwdCBhbmQgdmdjaGFuZ2UpLAp2Z3N0b3JhZ2UgaXMgdmcgb24gbWQgcmFpZCAx
MCBvbiA0IGhkZCBkaXNrcy4KCml0IGhhbmdzIHdpdGgKCisgL3NiaW4vdmdjaGFuZ2UgLWEgbiAt
LXN5c2luaXQgLS12ZXJib3NlIC0tZGVidWcKICBGYWlsZWQgdG8gZmluZCBzeXNmcyBtb3VudCBw
b2ludAogIE5vIHByb2MgZmlsZXN5c3RlbSBmb3VuZDogc2tpcHBpbmcgc3lzZnMgZmlsdGVyCiAg
Tm8gcHJvYyBmaWxlc3lzdGVtIGZvdW5kOiBza2lwcGluZyBtdWx0aXBhdGggZmlsdGVyCiAgRmls
ZSBsb2NraW5nIGluaXRpYWxpc2F0aW9uIGZhaWxlZC4KICBEZWFjdGl2YXRpbmcgbG9naWNhbCB2
b2x1bWUgdmdzdG9yYWdlL2x2aG9tZS4KICBSZW1vdmluZyB2Z3N0b3JhZ2UtbHZob21lICgyNTM6
MCkKICBEZWFjdGl2YXRlZCAxIGxvZ2ljYWwgdm9sdW1lcyBpbiB2b2x1bWUgZ3JvdXAgdmdzdG9y
YWdlLgoKTm90ZSB0aGF0IHJ1bm5pbmcKdmdjaGFuZ2UgLWEgbiAtLXN5c2luaXQgLS12ZXJib3Nl
IC0tZGVidWcKb24gZnVsbHkgcnVubmluZyBzeXN0ZW0ganVzdCB3b3JrcyBmaW5lOgoKIyB2Z2No
YW5nZSAtYSBuIC0tc3lzaW5pdCAtLXZlcmJvc2UgLS1kZWJ1ZwogIERlYWN0aXZhdGluZyBsb2dp
Y2FsIHZvbHVtZSB2Z3N0b3JhZ2UvbHZob21lLgogIFJlbW92aW5nIHZnc3RvcmFnZS1sdmhvbWUg
KDI1MzowKQogIERlYWN0aXZhdGVkIDEgbG9naWNhbCB2b2x1bWVzIGluIHZvbHVtZSBncm91cCB2
Z3N0b3JhZ2UuCiAgMCBsb2dpY2FsIHZvbHVtZShzKSBpbiB2b2x1bWUgZ3JvdXAgInZnc3RvcmFn
ZSIgbm93IGFjdGl2ZQojCgoKc28gSSd2ZSByZXN0YXJ0ZWQgdWRldmQganVzdCBiZWZvcmUgdmdj
aGFuZ2UgY2FsbCBpbiBteSBzY3JpcHQgYW5kIGl0CndvcmtzLgoKT3RoZXIgdGVzdDoKCmZ1bGx5
IHJ1bm5pbmcgc3lzdGVtCiMgdWRldmQgLS12ZXJzaW9uCjI0NgojIGtpbGxhbGwgdWRldmQKIyB2
Z2NoYW5nZSAtYSBuIC0tc3lzaW5pdCAtLXZlcmJvc2UgLS1kZWJ1ZwogIERlYWN0aXZhdGluZyBs
b2dpY2FsIHZvbHVtZSB2Z3N0b3JhZ2UvbHZob21lLgogIFJlbW92aW5nIHZnc3RvcmFnZS1sdmhv
bWUgKDI1MzowKQogIERlYWN0aXZhdGVkIDEgbG9naWNhbCB2b2x1bWVzIGluIHZvbHVtZSBncm91
cCB2Z3N0b3JhZ2UuCmFuZCBoYW5ncwoKCldoeSBpcyB1ZGV2ZCBuZWVkZWQgZm9yIHZnY2hhbmdl
IHRoZXJlPyBJdCB3YXNuJ3QgbmVlZGVkIHRvIGRlYWN0aXZhdGUKdmcgYmVmb3JlIEFGQUlLLgoK
CnN0cmFjZQoKCj4gaW9jdGwoMywgRE1fREVWX1NUQVRVUywge3ZlcnNpb249WzQsIDAsIDBdLCBk
YXRhX3NpemU9MjA0OCwgdXVpZD0iTFZNLVJIc29zRHlObFl6aVliZzM3d3pKY1NjVVJCV1RnSXNM
S0tMVFdSZGV4VXYxeG9UdWRhTXZrZVhjTnlnNUpRaUMtcmVhbCIsIGZsYWdzPURNX0VYSVNUU19G
TEFHfSA9PiB7dmVyc2lvbj1bNCwgNDMsIDBdLCBkYXRhX3NpemU9MjA0OCwgdXVpZD0iTFZNLVJI
c29zRHlObFl6aVliZzM3d3pKY1NjVVJCV1RnSXNMS0tMVFdSZGV4VXYxeG9UdWRhTXZrZVhjTnln
NUpRaUMtcmVhbCIsIGZsYWdzPURNX0VYSVNUU19GTEFHfSkgPSAtMSBFTlhJTyAoTm8gc3VjaCBk
ZXZpY2Ugb3IgYWRkcmVzcykKPiBpb2N0bCgzLCBETV9ERVZfU1RBVFVTLCB7dmVyc2lvbj1bNCwg
MCwgMF0sIGRhdGFfc2l6ZT0yMDQ4LCB1dWlkPSJMVk0tUkhzb3NEeU5sWXppWWJnMzd3ekpjU2NV
UkJXVGdJc0xLS0xUV1JkZXhVdjF4b1R1ZGFNdmtlWGNOeWc1SlFpQy1jb3ciLCBmbGFncz1ETV9F
WElTVFNfRkxBR30gPT4ge3ZlcnNpb249WzQsIDQzLCAwXSwgZGF0YV9zaXplPTIwNDgsIHV1aWQ9
IkxWTS1SSHNvc0R5TmxZemlZYmczN3d6SmNTY1VSQldUZ0lzTEtLTFRXUmRleFV2MXhvVHVkYU12
a2VYY055ZzVKUWlDLWNvdyIsIGZsYWdzPURNX0VYSVNUU19GTEFHfSkgPSAtMSBFTlhJTyAoTm8g
c3VjaCBkZXZpY2Ugb3IgYWRkcmVzcykKPiBpb2N0bCgzLCBETV9ERVZfU1RBVFVTLCB7dmVyc2lv
bj1bNCwgMCwgMF0sIGRhdGFfc2l6ZT0yMDQ4LCBkZXY9bWFrZWRldigweGZkLCAwKSwgZmxhZ3M9
RE1fRVhJU1RTX0ZMQUd8RE1fUEVSU0lTVEVOVF9ERVZfRkxBR30gPT4ge3ZlcnNpb249WzQsIDQz
LCAwXSwgZGF0YV9zaXplPTMwNSwgZGV2PW1ha2VkZXYoMHhmZCwgMCksIG5hbWU9InZnc3RvcmFn
ZS1sdmhvbWUiLCB1dWlkPSJMVk0tUkhzb3NEeU5sWXppWWJnMzd3ekpjU2NVUkJXVGdJc0xLS0xU
V1JkZXhVdjF4b1R1ZGFNdmtlWGNOeWc1SlFpQyIsIHRhcmdldF9jb3VudD0xLCBvcGVuX2NvdW50
PTAsIGV2ZW50X25yPTAsIGZsYWdzPURNX0VYSVNUU19GTEFHfERNX1BFUlNJU1RFTlRfREVWX0ZM
QUd8RE1fQUNUSVZFX1BSRVNFTlRfRkxBR30pID0gMAo+IHdyaXRlKDIsICIgICIsIDIgICkgICAg
ICAgICAgICAgICAgICAgICAgID0gMgo+IHdyaXRlKDIsICJSZW1vdmluZyB2Z3N0b3JhZ2UtbHZo
b21lICgyNTM6MCkiLCAzM1JlbW92aW5nIHZnc3RvcmFnZS1sdmhvbWUgKDI1MzowKSkgPSAzMwo+
IHdyaXRlKDIsICJcbiIsIDEKPiApICAgICAgICAgICAgICAgICAgICAgICA9IDEKPiBvcGVuYXQo
QVRfRkRDV0QsICIvZGV2L3VyYW5kb20iLCBPX1JET05MWSkgPSA0Cj4gcmVhZCg0LCAiTVwyNzci
LCAyKSAgICAgICAgICAgICAgICAgICAgID0gMgo+IHNlbWdldCgweGQ0ZGJmNGQsIDEsIElQQ19D
UkVBVHxJUENfRVhDTHwwNjAwKSA9IDEKPiBzZW1jdGwoMSwgMCwgU0VUVkFMLCAweDEpICAgICAg
ICAgICAgICAgPSAwCj4gc2VtY3RsKDEsIDAsIEdFVFZBTCwgTlVMTCkgICAgICAgICAgICAgID0g
MQo+IGNsb3NlKDQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDAKPiBzZW10aW1l
ZG9wKDEsIFt7c2VtX251bT0wLCBzZW1fb3A9MSwgc2VtX2ZsZz0wfV0sIDEsIE5VTEwpID0gMAo+
IHNlbWN0bCgxLCAwLCBHRVRWQUwsIE5VTEwpICAgICAgICAgICAgICA9IDIKPiBpb2N0bCgzLCBE
TV9ERVZfUkVNT1ZFLCB7dmVyc2lvbj1bNCwgMCwgMF0sIGRhdGFfc2l6ZT0yMDQ4LCBkZXY9bWFr
ZWRldigweGZkLCAwKSwgZXZlbnRfbnI9NjM0MDQyOSwgZmxhZ3M9RE1fRVhJU1RTX0ZMQUd8RE1f
UEVSU0lTVEVOVF9ERVZfRkxBR3xETV9TS0lQX0JER0VUX0ZMQUd9ID0+IHt2ZXJzaW9uPVs0LCA0
MywgMF0sIGRhdGFfc2l6ZT0zMDUsIGRldj1tYWtlZGV2KDB4ZmQsIDApLCBuYW1lPSJ2Z3N0b3Jh
Z2UtbHZob21lIiwgdXVpZD0iTFZNLVJIc29zRHlObFl6aVliZzM3d3pKY1NjVVJCV1RnSXNMS0tM
VFdSZGV4VXYxeG9UdWRhTXZrZVhjTnlnNUpRaUMiLCBmbGFncz1ETV9FWElTVFNfRkxBR3xETV9Q
RVJTSVNURU5UX0RFVl9GTEFHfERNX1NLSVBfQkRHRVRfRkxBR3xETV9VRVZFTlRfR0VORVJBVEVE
X0ZMQUd9KSA9IDAKPiBicmsoMHg1NWEzZjljOTAwMDApICAgICAgICAgICAgICAgICAgICAgPSAw
eDU1YTNmOWM5MDAwMAo+IGJyaygweDU1YTNmOWM4ODAwMCkgICAgICAgICAgICAgICAgICAgICA9
IDB4NTVhM2Y5Yzg4MDAwCj4gaW9jdGwoMywgRE1fREVWX1NUQVRVUywge3ZlcnNpb249WzQsIDAs
IDBdLCBkYXRhX3NpemU9MjA0OCwgdXVpZD0iTFZNLVJIc29zRHlObFl6aVliZzM3d3pKY1NjVVJC
V1RnSXNMS0tMVFdSZGV4VXYxeG9UdWRhTXZrZVhjTnlnNUpRaUMiLCBmbGFncz1ETV9FWElTVFNf
RkxBR3xETV9TS0lQX0JER0VUX0ZMQUd9ID0+IHt2ZXJzaW9uPVs0LCA0MywgMF0sIGRhdGFfc2l6
ZT0yMDQ4LCB1dWlkPSJMVk0tUkhzb3NEeU5sWXppWWJnMzd3ekpjU2NVUkJXVGdJc0xLS0xUV1Jk
ZXhVdjF4b1R1ZGFNdmtlWGNOeWc1SlFpQyIsIGZsYWdzPURNX0VYSVNUU19GTEFHfERNX1NLSVBf
QkRHRVRfRkxBR30pID0gLTEgRU5YSU8gKE5vIHN1Y2ggZGV2aWNlIG9yIGFkZHJlc3MpCj4gcnRf
c2lncHJvY21hc2soU0lHX0JMT0NLLCBOVUxMLCBbXSwgOCkgID0gMAo+IHJ0X3NpZ2FjdGlvbihT
SUdJTlQsIHtzYV9oYW5kbGVyPVNJR19ERkwsIHNhX21hc2s9W10sIHNhX2ZsYWdzPVNBX1JFU1RP
UkVSLCBzYV9yZXN0b3Jlcj0weDdmMDBmZWQyYjQ4MH0sIE5VTEwsIDgpID0gMAo+IHJ0X3NpZ2Fj
dGlvbihTSUdURVJNLCB7c2FfaGFuZGxlcj1TSUdfREZMLCBzYV9tYXNrPVtdLCBzYV9mbGFncz1T
QV9SRVNUT1JFUiwgc2FfcmVzdG9yZXI9MHg3ZjAwZmVkMmI0ODB9LCBOVUxMLCA4KSA9IDAKPiB3
cml0ZSgyLCAiICAiLCAyICApICAgICAgICAgICAgICAgICAgICAgICA9IDIKPiB3cml0ZSgyLCAi
RGVhY3RpdmF0ZWQgMSBsb2dpY2FsIHZvbHVtZXMgaW4gdm9sdW1lIGdyb3VwIHZnc3RvcmFnZS4i
LCA1NkRlYWN0aXZhdGVkIDEgbG9naWNhbCB2b2x1bWVzIGluIHZvbHVtZSBncm91cCB2Z3N0b3Jh
Z2UuKSA9IDU2Cj4gd3JpdGUoMiwgIlxuIiwgMQo+ICkgICAgICAgICAgICAgICAgICAgICAgID0g
MQo+IHNldHByaW9yaXR5KFBSSU9fUFJPQ0VTUywgMCwgMCkgICAgICAgICA9IDAKPiBzZW1nZXQo
MHhkNGRiZjRkLCAxLCAwMDApICAgICAgICAgICAgICAgPSAxCj4gc2VtY3RsKDEsIDAsIEdFVFZB
TCwgTlVMTCkgICAgICAgICAgICAgID0gMgo+IHNlbXRpbWVkb3AoMSwgW3tzZW1fbnVtPTAsIHNl
bV9vcD0tMSwgc2VtX2ZsZz1JUENfTk9XQUlUfV0sIDEsIE5VTEwpID0gMAo+IHNlbXRpbWVkb3Ao
MSwgW3tzZW1fbnVtPTAsIHNlbV9vcD0wLCBzZW1fZmxnPTB9XSwgMSwgTlVMTAoKCgotLSAKQXJr
YWRpdXN6IE1pxZtraWV3aWN6LCBhcmVrbSAvICggbWF2ZW4ucGwgfCBwbGQtbGludXgub3JnICkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2
bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCBo
dHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLw==

