Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C3C433EF
	for <linux-lvm@archiver.kernel.org>; Mon,  3 Jan 2022 16:43:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-qZBLfvkGN2S2htZv5Yc69w-1; Mon, 03 Jan 2022 11:43:50 -0500
X-MC-Unique: qZBLfvkGN2S2htZv5Yc69w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B42FB80BCA8;
	Mon,  3 Jan 2022 16:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EFB982764;
	Mon,  3 Jan 2022 16:43:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C55D14A7C8;
	Mon,  3 Jan 2022 16:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 203GhFMs029301 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 3 Jan 2022 11:43:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CA0D112131E; Mon,  3 Jan 2022 16:43:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 967E1112131B
	for <linux-lvm@redhat.com>; Mon,  3 Jan 2022 16:43:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762481C0DC07
	for <linux-lvm@redhat.com>; Mon,  3 Jan 2022 16:43:12 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-562-hLOBeZOPMzWopnMmO3cqOQ-1; Mon, 03 Jan 2022 11:43:10 -0500
X-MC-Unique: hLOBeZOPMzWopnMmO3cqOQ-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.20.35.92] ([37.24.118.138]) by smtp.web.de (mrweb006
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MBS71-1nFfNB1uQB-00Cv39;
	Mon, 03 Jan 2022 17:43:02 +0100
Message-ID: <e9a7143a-9746-3d01-7543-d55f2df01d9b@web.de>
Date: Mon, 3 Jan 2022 17:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.4.0
From: Roland <devzero@web.de>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Andy Smith <andy@strugglers.net>
References: <97c9434a-d291-dc92-4418-89ab2c7d48e1@web.de>
	<20220102231242.jebpzbtuxgio7l2m@bitfolk.com>
	<a6e37c26-77c4-2a8e-ab81-3a909c477a47@web.de>
In-Reply-To: <a6e37c26-77c4-2a8e-ab81-3a909c477a47@web.de>
X-Provags-ID: V03:K1:k0CIMIDV1OeMgCWV41+lw1k5sG5lkmtNvSdUPX11N6+7D9xhrCB
	7s3XsDsMhLc+uwHGKhgbunGFkLj2TmgTzWArpAiPrPI3NptCEvJpAZcUXdGG2MtH9sqAg/3
	JoeB26DMfDPYtB5DCcz1KMK1dMXI9YPuI3U+WOpUtXOULMEg3sBegTjiBocJE1GaBWOgDGb
	Cink0Ork6H5OykY5t8aHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M0lvMHHYJu0=:AoapfaI3CgVQ2CJ7uj1WtU
	rPDSt+14p8naNeax7Pj2tUEyM/r3r2bQxATMNfLQPnn2k7CPrzMkkYzmtC3bUNZSgzAxP4i0j
	/21fYxEblv5u7/CJClqw2RWiyDGNZNsenTU84bhomonx9ly7uzcp7tA0X0J/eghoHIwEf2h8a
	pZtazC7QV3q/KxE0s6fWjG1G6P/jQsLGHgoqR6YxyQtVmLA0uw3eGw5di5Af+KUu4Uez6uq9+
	EXjQRfcg3F03T6Wil6SvHo7tLnfTYw79ylwZEWbD3qa7ePvPkCGbD86OE9AN45QCEd+PJYX+3
	nVPJpWw2HZiPa6BFm4altxIc3rQdVDZBaTKaU+pmzflVJVIH9VTW7DqjLCAphHsVWLxVO8zp4
	Qd9y8LTrqlpT8njcq+Xkjogj8tdconExPyHPGTancUwFerBylAC2ZmCqtyVv7Ch9p82gSnHlD
	nH3CtBsLZBcBLBwRCb0DFRyPdlUiyYe068Ic2joReflDA6BoBtkwqNRN17ap18JbfsfGlbrX+
	d6fiPXBRlnKqUDt8pWeiNZ3+mkmLLArMwgGuhoXFjq3CqCa++rQFg1fbXblim8Ji+S0BcHDyr
	/qJSPmsaDBlpdd9naQ+h+XyM3epela6EOSWpyrPeBxewFyMP0QfMZY4J+yeSzAJHUgB66SU4A
	SZte9mtNfHhVsAroNbqy9QdVWKE8Tje8H1iWAe6ipUHY9bKbpxujN/DmxNgq11FDdrovnVO7s
	Z0IdD10u78sPNwdYzOlkXkm8WWK1Lo5BSBxn50q5BtQqx1A1bsv8u6l+0++S4KhH7vwraJmuh
	lCqeY9LtAnx/7V1ygGquwUeb/X2b/1rmL8Z+KpSMI76q7IWEVYbQN/3lMHX2vCd8oIUkuR3ZN
	mt1DuECyr23itGPn7orxrsuUD+GwD7b7xj20Jixetu0jPa9zDbmE1x3c7rcHe4L/1MJNlOqVc
	UaEho9svia9bTNdHCle3WMIepCuzZNrRnVM1UXgnMZWSg/uloCbJvM7pzRq1RP2jfpF3XFb1P
	SojJjjFG8t1IXNziSr8y9/bxaG/Xl9TRnXY7XJTibVHjmnBBF4faKOLS5mbcnJ+b+s5Qb9/WD
	Xt0/EsT7Bbl9+0=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 203GhFMs029301
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] convert logical sector -> physical sector + pv/vg
 extent number
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

ID4gYW55IGNoYW5jZSB0byBnZXQgcmV0cmlldmUgdGhpcyBpbmZvcm1hdGlvbiBmb3IgYXV0b21h
dGVkL3NjcmlwdApiYXNlZCBwcm9jZXNzaW5nID8KCmFmdGVyIGxvbmcgdHJpYWwgYW5kIGVycm9y
IGFuZCByZWFkaW5nIG1hbnBhZ2VzLCBpIGdvdCBpdCAoc2VlIGJlbG93KToKCndoYXQgaSdtIHll
dCBtaXNzaW5nIGlzIGhvdyAidHJhbnNsYXRpb24iIG9mIHRoZSBoZWFkaW5ncy9maWVsZHMgaW4K
bm9ybWFsIG91dHB1dCBjYW4gYmUgYXZvaWRlZCAsIGkuZSBwcmludCB0aGUgdGVjaG5pY2FsL2lu
dGVybmFsIGZpZWxkCm5hbWUgaW5zdGVhZCBvZiBhICJodW1hbiByZWFkYWJsZSIgb3IgInRyYW5z
bGF0ZWQiIG9uZS4KCidzZWdfc3RhcnRfcGUnIGFuZCAncHZzZWdfc3RhcnQnIGZvciBleGFtcGxl
IGJvdGggdHJhbnNsYXRlIHRvICJTdGFydCIsCmFuZCB0aGF0IGRvZXMgbm90IG9ubHkgbWFrZSBp
dCBoYXJkIHRvIHJlYWQgKGFuZCBtYWtlcyBubyByZWFsIHNlbnNlIHRvCmhhdmUgZHVwbGljYXRl
IGZpZWxkIG5hbWVzKSAswqAgYnV0IGl0J3MgYWxzbyBkaWZmaWN1bHQgdG8gYnVpbGQgYW4KYXBw
cm9wcmlhdGUgb3V0cHV0IGZpZWxkIGNvbW1hbmQgb3B0aW9uIGZyb20gdGhlIGRlZmF1bHQgb3V0
cHV0LsKgIGkKcmVtZW1iZXIgaSBoYWQgc3VjaCBpc3N1ZSB3aXRoIG90aGVyIHRvb2xzLi4uCgp0
aGluayB0aGlzIGlzIGEgbWlzc2luZyBmZWF0dXJlID8KCnJvbGFuZAoKCiMgcHZzIC0tc2VnbWVu
dHMgLW9sdl9uYW1lLHNlZ19zdGFydF9wZSxzZWdfc2l6ZV9wZSxwdnNlZ19zdGFydCAtUwpsdl9u
YW1lPXVzZWRibG9ja3MgLU8gc2VnX3N0YXJ0CiDCoMKgIExWwqDCoMKgwqDCoMKgwqDCoCBTdGFy
dCBTU2l6ZSBTdGFydAogwqDCoCB1c2VkYmxvY2tzwqDCoMKgwqAgMMKgwqDCoMKgIDHCoMKgIDUx
MgogwqDCoCB1c2VkYmxvY2tzwqDCoMKgwqAgMcKgwqAgMjMzwqDCoMKgwqAgMQogwqDCoCB1c2Vk
YmxvY2tzwqDCoCAyMzTCoMKgwqDCoCAxwqDCoCA1MTMKIMKgwqAgdXNlZGJsb2Nrc8KgwqAgMjM1
wqDCoCAyNzfCoMKgIDIzNQoKIyBwdnMgLS1zZWdtZW50cyAtb2x2X25hbWUsc2VnX3N0YXJ0X3Bl
LHNlZ19zaXplX3BlLHB2c2VnX3N0YXJ0IC1TCmx2X25hbWU9bWFya2VkYmFkIC1PIHNlZ19zdGFy
dAogwqDCoCBMVsKgwqDCoMKgwqDCoMKgIFN0YXJ0IFNTaXplIFN0YXJ0CiDCoMKgIG1hcmtlZGJh
ZMKgwqDCoMKgIDDCoMKgwqDCoCAxwqAgMTAyMgogwqDCoCBtYXJrZWRiYWTCoMKgwqDCoCAxwqDC
oMKgwqAgMcKgwqDCoMKgIDAKIMKgwqAgbWFya2VkYmFkwqDCoMKgwqAgMsKgwqDCoMKgIDHCoMKg
IDIzNAoKIyBwdnMgLS1zZWdtZW50cyAtb2x2X25hbWUsc2VnX3N0YXJ0X3BlLHNlZ19zaXplX3Bl
LHB2c2VnX3N0YXJ0IC1TCmx2X25hbWU9bWFya2VkYmFkIC1PIHNlZ19zdGFydCAtLW5hbWVwcmVm
aXhlcyAtLW5vaGVhZGluZ3MKIMKgwqAgTFZNMl9MVl9OQU1FPSdtYXJrZWRiYWQnIExWTTJfU0VH
X1NUQVJUX1BFPScwJyBMVk0yX1NFR19TSVpFX1BFPScxJwpMVk0yX1BWU0VHX1NUQVJUPScxMDIy
JwogwqDCoCBMVk0yX0xWX05BTUU9J21hcmtlZGJhZCcgTFZNMl9TRUdfU1RBUlRfUEU9JzEnIExW
TTJfU0VHX1NJWkVfUEU9JzEnCkxWTTJfUFZTRUdfU1RBUlQ9JzAnCiDCoMKgIExWTTJfTFZfTkFN
RT0nbWFya2VkYmFkJyBMVk0yX1NFR19TVEFSVF9QRT0nMicgTFZNMl9TRUdfU0laRV9QRT0nMScK
TFZNMl9QVlNFR19TVEFSVD0nMjM0JwoKIyBwdnMgLS1zZWdtZW50cyAtb2x2X25hbWUsc2VnX3N0
YXJ0X3BlLHNlZ19zaXplX3BlLHB2c2VnX3N0YXJ0IC1TCmx2X25hbWU9dXNlZGJsb2NrcyAtTyBz
ZWdfc3RhcnQgLS1uYW1lcHJlZml4ZXMgLS1ub2hlYWRpbmdzCiDCoMKgIExWTTJfTFZfTkFNRT0n
dXNlZGJsb2NrcycgTFZNMl9TRUdfU1RBUlRfUEU9JzAnIExWTTJfU0VHX1NJWkVfUEU9JzEnCkxW
TTJfUFZTRUdfU1RBUlQ9JzUxMicKIMKgwqAgTFZNMl9MVl9OQU1FPSd1c2VkYmxvY2tzJyBMVk0y
X1NFR19TVEFSVF9QRT0nMScKTFZNMl9TRUdfU0laRV9QRT0nMjMzJyBMVk0yX1BWU0VHX1NUQVJU
PScxJwogwqDCoCBMVk0yX0xWX05BTUU9J3VzZWRibG9ja3MnIExWTTJfU0VHX1NUQVJUX1BFPScy
MzQnCkxWTTJfU0VHX1NJWkVfUEU9JzEnIExWTTJfUFZTRUdfU1RBUlQ9JzUxMycKIMKgwqAgTFZN
Ml9MVl9OQU1FPSd1c2VkYmxvY2tzJyBMVk0yX1NFR19TVEFSVF9QRT0nMjM1JwpMVk0yX1NFR19T
SVpFX1BFPScyNzcnIExWTTJfUFZTRUdfU1RBUlQ9JzIzNScKCkFtIDAzLjAxLjIyIHVtIDEyOjEz
IHNjaHJpZWIgUm9sYW5kOgo+IHRoYW5rcyEKPgo+IGFueSBjaGFuY2UgdG8gZ2V0IHJldHJpZXZl
IHRoaXMgaW5mb3JtYXRpb24gZm9yIGF1dG9tYXRlZC9zY3JpcHQgYmFzZWQKPiBwcm9jZXNzaW5n
ID8KPgo+IHJvbGFuZAo+Cj4KPiBBbSAwMy4wMS4yMiB1bSAwMDoxMiBzY2hyaWViIEFuZHkgU21p
dGg6Cj4+IEhpIFJvbGFuZCwKPj4KPj4gT24gU3VuLCBKYW4gMDIsIDIwMjIgYXQgMDg6MDA6MzBQ
TSArMDEwMCwgUm9sYW5kIHdyb3RlOgo+Pj4gaWYgaSBoYXZlIGEgbG9naWNhbCBzZWN0b3IvYmxv
Y2sgIngiIG9uIGEgbHZtIGxvZ2ljYWwgdm9sdW1lICzCoCBpcwo+Pj4gdGhlcmUKPj4+IGEgd2F5
IHRvIGVhc2lseSBjYWxjdWxhdGUvZGV0ZXJtaW5lIChvcHRpbWFsbHkgYnkgc2NyaXB0L2NsaSkg
dGhlCj4+PiBjb3JyZXNwb25kaW5nIHBoeXNpY2FsIHNlY3RvciBvZiB0aGUgcGh5c2ljYWwgZGV2
aWNlIGl0IGJlbG9uZ3MgdG8gYW5kCj4+PiB0aGUgZXh0ZW50IG51bWJlciBvZiB0aGUgYXBwcm9w
aWF0ZSBwdi92ZyB3aGVyZSBpdCByZXNpZGVzID8KPj4gbHZkaXNwbGF5IC0tbWFwcyAvcGF0aC90
by9sdgo+Pgo+PiB0ZWxscyB5b3UgYWxsIHRoZSBtYXBwaW5ncyBvZiBsb2dpY2FsIGV4dGVudHMg
d2l0aGluIHRoZSBMViB0bwo+PiBwaHlzaWNhbCBleHRlbnRzIHdpdGhpbiB0aGUgUFYuCj4+Cj4+
IHB2ZGlzcGxheSAtLXVuaXRzIHMgL2Rldi95b3VycHYgfCBncmVwICdQRSBTaXplJwo+Pgo+PiB0
ZWxscyB5b3UgdGhlIHNpemUgb2YgYSBwaHlzaWNhbCBleHRlbnQgaW4gc2VjdG9ycy4KPj4KPj4g
QmV0d2VlbiB0aG9zZSB5b3UgY2FuIHdvcmsgb3V0IHRoZSBzZWN0b3IgbnVtYmVyIG9uIHRoZSBw
aHlzaWNhbAo+PiBkZXZpY2UgZm9yIGEgc2VjdG9yIG51bWJlciBvbiBhIGxvZ2ljYWwgdm9sdW1l
Lgo+Pgo+PiBDaGVlcnMsCj4+IEFuZHkKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtbHZtIG1haWxpbmcgbGlzdAo+PiBsaW51eC1s
dm1AcmVkaGF0LmNvbQo+PiBodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWx2bQo+PiByZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9I
T1dUTy9MVk0tSE9XVE8vCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1sdm1AcmVkaGF0LmNvbQpo
dHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bQpyZWFk
IHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8v

