Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3PADAlZ003003
	for <linux-lvm@redhat.com>; Fri, 25 Apr 2008 06:13:10 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.187])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3PACwmb012442
	for <linux-lvm@redhat.com>; Fri, 25 Apr 2008 06:12:59 -0400
Received: by ti-out-0910.google.com with SMTP id 11so1425576tim.7
	for <linux-lvm@redhat.com>; Fri, 25 Apr 2008 03:12:56 -0700 (PDT)
Message-ID: <1cafab770804250312y7556ceddu3cff6a4c13a06355@mail.gmail.com>
Date: Fri, 25 Apr 2008 18:12:56 +0800
From: "Xinwei Hu" <hxinwei@gmail.com>
In-Reply-To: <1cafab770804250311n1c530743h30cbd62e725f345f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5970_30501530.1209118376365"
References: <1cafab770804250311n1c530743h30cbd62e725f345f@mail.gmail.com>
Subject: [linux-lvm] Re: Patch to clvmd-openais.c again
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_5970_30501530.1209118376365
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sorry, stupid thing happens ;)

2008/4/25, Xinwei Hu <hxinwei@gmail.com>:
> Hi all,
>
>   The attached patch is a try to make clvmd work correctly on openais stack.
>  It does 2 things.
>
>  1. The cpg_deliver_callback make a compare between target_nodeid and our_nodeid.
>  It turns out openais set target_nodeid to 0 sometimes. for
>  broadcasting ? I change
>  the behavior so that lvm will process_remote also on target_nodeid == 0
>
>  2. The joined_list passed to cpg_confchg_callback doesn't include the
>  already exist
>  nodes in the group, which leads to an incomplete node_hash. I simply
>  add all other
>  nodes in member_list to node_hash also.
>
>   With this patch applied, clvmd works correctly with basic lvm commands now.
>
>   Please kindly review this, and consider it for upstream.
>
>   Thanks.
>

------=_Part_5970_30501530.1209118376365
Content-Type: text/x-patch; name=upstream.diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ffglur22
Content-Disposition: attachment; filename=upstream.diff

LS0tIGNsdm1kLW9wZW5haXMuYy5vcmlnCTIwMDgtMDQtMjUgMTc6NTU6NTYuMDAwMDAwMDAwICsw
ODAwCisrKyBjbHZtZC1vcGVuYWlzLmMubmV3CTIwMDgtMDQtMjUgMTg6MDM6MTAuMDAwMDAwMDAw
ICswODAwCkBAIC0yNDUsMTIgKzI0NSwxMyBAQAogCiAJbWVtY3B5KCZ0YXJnZXRfbm9kZWlkLCBt
c2csIE9QRU5BSVNfQ1NJRF9MRU4pOwogCi0JREVCVUdMT0coIkdvdCBtZXNzYWdlIGZyb20gbm9k
ZWlkICVkIGZvciAlZC4gbGVuICVkXG4iLAotCQkgbm9kZWlkLCB0YXJnZXRfbm9kZWlkLCBtc2df
bGVuLTQpOworCURFQlVHTE9HKCIldSBnb3QgbWVzc2FnZSBmcm9tIG5vZGVpZCAlZCBmb3IgJWQu
IGxlbiAlZFxuIiwKKwkJIG91cl9ub2RlaWQsIG5vZGVpZCwgdGFyZ2V0X25vZGVpZCwgbXNnX2xl
bi00KTsKIAotCWlmICh0YXJnZXRfbm9kZWlkID09IG91cl9ub2RlaWQpCi0JCXByb2Nlc3NfbWVz
c2FnZShjbHVzdGVyX2NsaWVudCwgKGNoYXIgKiltc2crT1BFTkFJU19DU0lEX0xFTiwKLQkJCQlt
c2dfbGVuLU9QRU5BSVNfQ1NJRF9MRU4sIChjaGFyKikmbm9kZWlkKTsKKwlpZiAobm9kZWlkICE9
IG91cl9ub2RlaWQpCisJCWlmICh0YXJnZXRfbm9kZWlkID09IG91cl9ub2RlaWQgfHwgdGFyZ2V0
X25vZGUgPT0gMCkKKwkJCXByb2Nlc3NfbWVzc2FnZShjbHVzdGVyX2NsaWVudCwgKGNoYXIgKilt
c2crT1BFTkFJU19DU0lEX0xFTiwKKwkJCQkJbXNnX2xlbi1PUEVOQUlTX0NTSURfTEVOLCAoY2hh
ciopJm5vZGVpZCk7CiB9CiAKIHN0YXRpYyB2b2lkIGNwZ19jb25mY2hnX2NhbGxiYWNrKGNwZ19o
YW5kbGVfdCBoYW5kbGUsCkBAIC0yOTIsNyArMjkzLDQzIEBACiAJCQluaW5mby0+c3RhdGUgPSBO
T0RFX0RPV047CiAJfQogCisJZm9yIChpPTA7IGk8bWVtYmVyX2xpc3RfZW50cmllczsgaSsrKSB7
CisJCWlmIChtZW1iZXJfbGlzdFtpXS5ub2RlaWQgPT0gMCkgY29udGludWU7CisJCW5pbmZvID0g
ZG1faGFzaF9sb29rdXBfYmluYXJ5KG5vZGVfaGFzaCwKKwkJCQkoY2hhciAqKSZtZW1iZXJfbGlz
dFtpXS5ub2RlaWQsCisJCQkJT1BFTkFJU19DU0lEX0xFTik7CisJCWlmICghbmluZm8pIHsKKwkJ
CW5pbmZvID0gbWFsbG9jKHNpemVvZihzdHJ1Y3Qgbm9kZV9pbmZvKSk7CisJCQlpZiAoIW5pbmZv
KSB7CisJCQkJYnJlYWs7CisJCQl9CisJCQllbHNlIHsKKwkJCQluaW5mby0+bm9kZWlkID0gbWVt
YmVyX2xpc3RbaV0ubm9kZWlkOworCQkJCWRtX2hhc2hfaW5zZXJ0X2JpbmFyeShub2RlX2hhc2gs
CisJCQkJCQkoY2hhciAqKSZuaW5mby0+bm9kZWlkLAorCQkJCQkJT1BFTkFJU19DU0lEX0xFTiwg
bmluZm8pOworCQkJfQorCQl9CisJCW5pbmZvLT5zdGF0ZSA9IE5PREVfQ0xWTUQ7CisJfQorCiAJ
bnVtX25vZGVzID0gam9pbmVkX2xpc3RfZW50cmllczsKKworCS8vVmVyYm9zZSBvbiBub2RlX2hh
c2gsIGhlbHBmdWwgdG8gZGVidWcKKwlzdHJ1Y3QgZG1faGFzaF9ub2RlICpobjsKKwlERUJVR0xP
RygiSXRlcmF0ZSBub2RlX2hhc2hcbiIpOworCWRtX2hhc2hfaXRlcmF0ZShobiwgbm9kZV9oYXNo
KQorCXsKKwkJbmluZm8gPSBkbV9oYXNoX2dldF9kYXRhKG5vZGVfaGFzaCwgaG4pOworCQlpZiAo
bmluZm8tPnN0YXRlID09IE5PREVfQ0xWTUQpIHsKKwkJCURFQlVHTE9HKCIldTolc1xuIiwgbmlu
Zm8tPm5vZGVpZCwgIkNMVk1EIik7CisJCX0KKwkJZWxzZSB7CisJCQlpZiAobmluZm8tPnN0YXRl
ID09IE5PREVfRE9XTikKKwkJCQlERUJVR0xPRygiJXU6JXNcbiIsIG5pbmZvLT5ub2RlaWQsICJE
T1dOIik7CisJCX0KKwl9CisJREVCVUdMT0coIkl0ZXJhdGUgbm9kZV9oYXNoIGRvbmVcbiIpOwog
fQogCiAK
------=_Part_5970_30501530.1209118376365--
