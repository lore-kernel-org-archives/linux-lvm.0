Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F07C433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  5 May 2022 07:13:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-d_iNix4lMdKCeASUeMbJXQ-1; Thu, 05 May 2022 03:13:27 -0400
X-MC-Unique: d_iNix4lMdKCeASUeMbJXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE016802819;
	Thu,  5 May 2022 07:13:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D13F640CFD1F;
	Thu,  5 May 2022 07:13:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C9711947053;
	Thu,  5 May 2022 07:13:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7EF6E1947047
 for <linux-lvm@listman.corp.redhat.com>; Thu,  5 May 2022 06:08:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EF86176C3; Thu,  5 May 2022 06:08:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 495BD175B5
 for <linux-lvm@redhat.com>; Thu,  5 May 2022 06:08:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98F0329ABA33
 for <linux-lvm@redhat.com>; Thu,  5 May 2022 06:08:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-bdu6OHzuMeO9Zdq-rUFDRg-1; Thu, 05 May 2022 02:08:41 -0400
X-MC-Unique: bdu6OHzuMeO9Zdq-rUFDRg-1
Received: by mail-pl1-f175.google.com with SMTP id n18so3487251plg.5
 for <linux-lvm@redhat.com>; Wed, 04 May 2022 23:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:from
 :subject:content-transfer-encoding;
 bh=+GjJeYY14GenVLYUeh5Ubn37m4+9/feNh62Q2UuxAwQ=;
 b=OEIKhYs4NOeOZv4faK5RCUa7EdQOLstq2WWOgagVhIBjhiBJ4rq0GPbRpy3OrMOcKJ
 31fgiDY9BcO1lo5O5Wxdq0oAyxKeqYBG6X+eRXqonrqefPWF+TRIZqBiqvRp1bvzlhOS
 PBhtt39GttPS06vYboCB/ROigCqmEmHR/KkgKmRlvCoLFQ8LKsDiK2gzk/g7nR9UEwUh
 Q/hkbCrova3gCIV33WiMsGrvpIF2zItdKF4Qa3VfKJCW21/gwqiIancXObzDsOdGdomf
 bomHE89NYDsBCz1ipxjRhwi9t/tW+eTS44NB1ytuMlavBxQ7wI05pexFujwRANY5nqZI
 K+5w==
X-Gm-Message-State: AOAM5304QvLGHpJims+SSDGWjamUDqB9U/KtcZ2fT4oj8pt2SGdXTEm0
 scHnIgn1AW19oWbflyD9QpDwFZsXgKGhLw==
X-Google-Smtp-Source: ABdhPJxxxYMNIjZ7oaDchGkh5QhYadpIDR/WuLGy8I7yeaWRus0jwsCGu6/gEe8y4VJxJ1mVgB+GPA==
X-Received: by 2002:a17:90a:e641:b0:1da:43b8:95b7 with SMTP id
 ep1-20020a17090ae64100b001da43b895b7mr4143764pjb.180.1651730920075; 
 Wed, 04 May 2022 23:08:40 -0700 (PDT)
Received: from [10.4.101.70] ([139.177.225.240])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a170902708300b0015e8da1f9e8sm569560plk.77.2022.05.04.23.08.38
 for <linux-lvm@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 23:08:39 -0700 (PDT)
Message-ID: <8d9bb1b4-9f79-d557-e3d9-2b8e5f53e751@bytedance.com>
Date: Thu, 5 May 2022 14:08:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: linux-lvm@redhat.com
From: Zhiyong Ye <yezhiyong@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Thu, 05 May 2022 07:13:15 +0000
Subject: [linux-lvm] vgcreate doesn't work with lvmlockd running
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgYWxsLAoKSSBhbSBuZXcgdG8gbHZtLiBXaGVuIEkgd2FzIHRyeWluZyB0byBjcmVhdGUgYSBz
aGFyZWQgVkcgKHZnY3JlYXRlCi0tc2hhcmVkIDx2Z19uYW1lPiAvZGV2L3NkYjEgL2Rldi9zZGMx
KSBpbiBteSBzeXN0ZW0gYW5kIEkgcmVjZWl2ZWQgdGhlCiJkZXZpY2Ugbm90IGNsZWFyZWQiIGVy
cm9yIHdpdGggc2FubG9jayBhbmQgbHZtbG9ja2QgcnVubmluZy4gSSd2ZQpzZWFyY2hlZCB0aGUg
aW50ZXJuZXQgYnV0IG5vdGhpbmcgaGFzIHNvbHZlZCBteSBwcm9ibGVtLiBTbyBJJ20gaGVyZSB0
bwphc2sgZm9yIHlvdXIgaGVscC4KCnJvb3RAbjE1MS0xNDMtMDM1On4jIGx2bWxvY2tkIC1WCmx2
bWxvY2tkIHZlcnNpb246IDIuMDMuMDIoMikgKDIwMTgtMTItMTgpCnJvb3RAbjE1MS0xNDMtMDM1
On4jIHNhbmxvY2sgLVYKc2FubG9jayAzLjYuMCAoYnVpbHQgSnVsIDExIDIwMTggMTI6NDQ6Mjkp
Cgpyb290QG4xNTEtMTQzLTAzNTp+IyBzeXN0ZW1jdGwgc3RhdHVzIHNhbmxvY2sK4pePIHNhbmxv
Y2suc2VydmljZSAtIFNoYXJlZCBTdG9yYWdlIExlYXNlIE1hbmFnZXIKICAgIExvYWRlZDogbG9h
ZGVkICgvbGliL3N5c3RlbWQvc3lzdGVtL3NhbmxvY2suc2VydmljZTsgZGlzYWJsZWQ7IAp2ZW5k
b3IgcHJlc2V0OiBlbmFibGVkKQogICAgQWN0aXZlOiBhY3RpdmUgKHJ1bm5pbmcpIHNpbmNlIFRo
dSAyMDIyLTA1LTA1IDAwOjMxOjE3IENTVDsgMTFoIGFnbwogICBQcm9jZXNzOiAyNTg0NCBFeGVj
U3RhcnQ9L3Vzci9zYmluL3NhbmxvY2sgZGFlbW9uICRzYW5sb2NrX29wdHMgCihjb2RlPWV4aXRl
ZCwgc3RhdHVzPTAvU1VDQ0VTUykKICBNYWluIFBJRDogMjU4NTAgKHNhbmxvY2spCiAgICAgVGFz
a3M6IDYgKGxpbWl0OiA2MTQzKQogICAgQ0dyb3VwOiAvc3lzdGVtLnNsaWNlL3NhbmxvY2suc2Vy
dmljZQogICAgICAgICAgICDilJzilIAyNTg1MCAvdXNyL3NiaW4vc2FubG9jayBkYWVtb24gLXcg
MAogICAgICAgICAgICDilJTilIAyNTg1MiAvdXNyL3NiaW4vc2FubG9jayBkYWVtb24gLXcgMApN
YXkgMDUgMDA6MzE6MTcgbjE1MS0xNDMtMDM1IHN5c3RlbWRbMV06IFN0YXJ0aW5nIFNoYXJlZCBT
dG9yYWdlIExlYXNlIApNYW5hZ2VyLi4uCk1heSAwNSAwMDozMToxNyBuMTUxLTE0My0wMzUgc3lz
dGVtZFsxXTogU3RhcnRlZCBTaGFyZWQgU3RvcmFnZSBMZWFzZSAKTWFuYWdlci4KCnJvb3RAbjE1
MS0xNDMtMDM1On4jIHN5c3RlbWN0bCBzdGF0dXMgbHZtbG9ja2QK4pePIGx2bWxvY2tkLnNlcnZp
Y2UgLSBMVk0gbG9jayBkYWVtb24KICAgIExvYWRlZDogbG9hZGVkICgvbGliL3N5c3RlbWQvc3lz
dGVtL2x2bWxvY2tkLnNlcnZpY2U7IGVuYWJsZWQ7IAp2ZW5kb3IgcHJlc2V0OiBlbmFibGVkKQog
ICAgQWN0aXZlOiBhY3RpdmUgKHJ1bm5pbmcpIHNpbmNlIFRodSAyMDIyLTA1LTA1IDAwOjMxOjIz
IENTVDsgMTFoIGFnbwogICAgICBEb2NzOiBtYW46bHZtbG9ja2QoOCkKICBNYWluIFBJRDogMjYx
NTIgKGx2bWxvY2tkKQogICAgIFRhc2tzOiAzIChsaW1pdDogNjE0MykKICAgIENHcm91cDogL3N5
c3RlbS5zbGljZS9sdm1sb2NrZC5zZXJ2aWNlCiAgICAgICAgICAgIOKUlOKUgDI2MTUyIC9zYmlu
L2x2bWxvY2tkIC0tZm9yZWdyb3VuZApNYXkgMDUgMDA6MzE6MjMgbjE1MS0xNDMtMDM1IHN5c3Rl
bWRbMV06IFN0YXJ0aW5nIExWTSBsb2NrIGRhZW1vbi4uLgpNYXkgMDUgMDA6MzE6MjMgbjE1MS0x
NDMtMDM1IGx2bWxvY2tkWzI2MTUyXTogW0RdIGNyZWF0aW5nIAovcnVuL2x2bS9sdm1sb2NrZC5z
b2NrZXQKTWF5IDA1IDAwOjMxOjIzIG4xNTEtMTQzLTAzNSBsdm1sb2NrZFsyNjE1Ml06IDE2NTE2
ODE4ODMgbHZtbG9ja2Qgc3RhcnRlZApNYXkgMDUgMDA6MzE6MjMgbjE1MS0xNDMtMDM1IHN5c3Rl
bWRbMV06IFN0YXJ0ZWQgTFZNIGxvY2sgZGFlbW9uLgoKcm9vdEBuMTUxLTE0My0wMzU6fiMgcHZz
CiAgIFNraXBwaW5nIGdsb2JhbCBsb2NrOiBsb2Nrc3BhY2Ugbm90IGZvdW5kIG9yIHN0YXJ0ZWQK
cm9vdEBuMTUxLTE0My0wMzU6fiMgcHZjcmVhdGUgL2Rldi9tYXBwZXIvbXBhdGhhMQogICBHbG9i
YWwgbG9jayBmYWlsZWQ6IGNoZWNrIHRoYXQgZ2xvYmFsIGxvY2tzcGFjZSBpcyBzdGFydGVkCnJv
b3RAbjE1MS0xNDMtMDM1On4jIHB2cwogICBTa2lwcGluZyBnbG9iYWwgbG9jazogbG9ja3NwYWNl
IG5vdCBmb3VuZCBvciBzdGFydGVkCgpJdCBpcyBtZW50aW9uZWQgaW4gdGhlIG1haW4gcGFnZSB1
bmRlciAiY3JlYXRpbmcgdGhlIGZpcnN0IHNhbmxvY2sgVkciCnRoYXQgdGhlIGZpcnN0IFZHIGlz
IGNyZWF0ZWQgdG8gZ2V0IHRoZSBnbG9iYWwgbG9jaywgc28gSSBjcmVhdGUgdGhlIFZHCmRpcmVj
dGx5OgoKcm9vdEBuMTUxLTE0My0wMzU6fiMgdmdjcmVhdGUgLS1sb2NrLXR5cGUgc2FubG9jayAt
LXNoYXJlZCB0ZXN0IAovZGV2L21hcHBlci9tcGF0aGExIC0tdmVyYm9zZQogICBFbmFibGluZyBz
YW5sb2NrIGdsb2JhbCBsb2NrCiAgICAgV2lwaW5nIHNpZ25hdHVyZXMgb24gbmV3IFBWIC9kZXYv
bWFwcGVyL21wYXRoYTEuCiAgICAgU2V0IHVwIHBoeXNpY2FsIHZvbHVtZSBmb3IgIi9kZXYvbWFw
cGVyL21wYXRoYTEiIHdpdGggMjE0NzQ4MzY0OCAKYXZhaWxhYmxlIHNlY3RvcnMuCiAgICAgWmVy
b2luZyBzdGFydCBvZiBkZXZpY2UgL2Rldi9tYXBwZXIvbXBhdGhhMS4KICAgICBXcml0aW5nIHBo
eXNpY2FsIHZvbHVtZSBkYXRhIHRvIGRpc2sgIi9kZXYvbWFwcGVyL21wYXRoYTEiLgogICBQaHlz
aWNhbCB2b2x1bWUgIi9kZXYvbWFwcGVyL21wYXRoYTEiIHN1Y2Nlc3NmdWxseSBjcmVhdGVkLgog
ICAgIEFkZGluZyBwaHlzaWNhbCB2b2x1bWUgJy9kZXYvbWFwcGVyL21wYXRoYTEnIHRvIHZvbHVt
ZSBncm91cCAndGVzdCcKICAgICBBcmNoaXZpbmcgdm9sdW1lIGdyb3VwICJ0ZXN0IiBtZXRhZGF0
YSAoc2Vxbm8gMCkuCiAgICAgQ3JlYXRpbmcgbG9naWNhbCB2b2x1bWUgbHZtbG9jawogICAgIENy
ZWF0aW5nIHZvbHVtZSBncm91cCBiYWNrdXAgIi9ldGMvbHZtL2JhY2t1cC90ZXN0IiAoc2Vxbm8g
MikuCiAgICAgQWN0aXZhdGluZyBsb2dpY2FsIHZvbHVtZSB0ZXN0L2x2bWxvY2suCiAgICAgYWN0
aXZhdGlvbi92b2x1bWVfbGlzdCBjb25maWd1cmF0aW9uIHNldHRpbmcgbm90IGRlZmluZWQ6IENo
ZWNraW5nIApvbmx5IGhvc3QgdGFncyBmb3IgdGVzdC9sdm1sb2NrLgogICAgIENyZWF0aW5nIHRl
c3QtbHZtbG9jawogICAgIExvYWRpbmcgdGFibGUgZm9yIHRlc3QtbHZtbG9jayAoMjU0OjEpLgog
ICAgIFJlc3VtaW5nIHRlc3QtbHZtbG9jayAoMjU0OjEpLgogICAvZGV2L3Rlc3QvbHZtbG9jazog
bm90IGZvdW5kOiBkZXZpY2Ugbm90IGNsZWFyZWQKICAgQWJvcnRpbmcuIEZhaWxlZCB0byB3aXBl
IHN0YXJ0IG9mIG5ldyBMVi4KICAgICBSZW1vdmluZyB0ZXN0LWx2bWxvY2sgKDI1NDoxKQogICAg
IENyZWF0aW5nIHZvbHVtZSBncm91cCBiYWNrdXAgIi9ldGMvbHZtL2JhY2t1cC90ZXN0IiAoc2Vx
bm8gMykuCiAgIEZhaWxlZCB0byBjcmVhdGUgc2FubG9jayBsdiBsdm1sb2NrIGluIHZnIHRlc3QK
ICAgRmFpbGVkIHRvIGNyZWF0ZSBpbnRlcm5hbCBsdi4KICAgRmFpbGVkIHRvIGluaXRpYWxpemUg
bG9jayBhcmdzIGZvciBsb2NrIHR5cGUgc2FubG9jawogICAgIFJlbW92aW5nIHBoeXNpY2FsIHZv
bHVtZSAiL2Rldi9tYXBwZXIvbXBhdGhhMSIgZnJvbSB2b2x1bWUgZ3JvdXAgInRlc3QiCiAgIFZv
bHVtZSBncm91cCAidGVzdCIgc3VjY2Vzc2Z1bGx5IHJlbW92ZWQKcm9vdEBuMTUxLTE0My0wMzU6
fiMgcHZzCiAgIFNraXBwaW5nIGdsb2JhbCBsb2NrOiBsb2Nrc3BhY2Ugbm90IGZvdW5kIG9yIHN0
YXJ0ZWQKICAgUFYgICAgICAgICAgICAgICAgICBWRyBGbXQgIEF0dHIgUFNpemUgUEZyZWUKICAg
L2Rldi9tYXBwZXIvbXBhdGhhMSAgICBsdm0yIC0tLSAgMS4wMHQgMS4wMHQKcm9vdEBuMTUxLTE0
My0wMzU6fiMgdmdzCiAgIFNraXBwaW5nIGdsb2JhbCBsb2NrOiBsb2Nrc3BhY2Ugbm90IGZvdW5k
IG9yIHN0YXJ0ZWQKCkkgc2V0IHVzZV9sdm1sb2NrZCA9IDEgaW4gdGhlIGNvbmZpZ3VyYXRpb24g
ZmlsZSAvZXRjL2x2bS9sdm0uY29uZiBhbmQKZGlkIG5vdCBmaW5kIHVzZWZ1bCBsb2cgaW5mb3Jt
YXRpb24gaW4gL3Zhci9sb2cvc3lzbG9nIGFuZCAvdmFyL2xvZwovc2FubG9jay5sb2cuIEFuZCBJ
IGNhbiBzdWNjZXNzZnVsbHkgdXNlIGFuZCBjcmVhdGUgbHZtIHdoZW4KdXNlX2x2bWxvY2tkID0g
MC4KClJlZ2FyZHMsCgpaaGl5b25nIFllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0CmxpbnV4LWx2bUByZWRoYXQu
Y29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZt
CnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgaHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8K

