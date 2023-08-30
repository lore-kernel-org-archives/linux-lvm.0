Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FBBC83F01
	for <linux-lvm@archiver.kernel.org>; Wed, 30 Aug 2023 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693402462;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BnXw7RJonwhdIg0eRCk9mAiycn5C9qql7MN7pBoNAfs=;
	b=DusNVuSDzO84IwYc0ZWAqQQ+6X7a767xiNkrUyT5gMPLkhjri+NEsDs3MoQMDAb9DOPW21
	3bMe07LOVxOF6FBFTdCDzlrI+YqfhsChn8rLVdyzQpv/cGiJItFPgFdDxyiO62zV/oLJGn
	/yJAHssdMf0vaufia3f6fGakutFTtyk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-684-s_MiwadjOG2Ur8gUJC4h8g-1; Wed, 30 Aug 2023 09:34:19 -0400
X-MC-Unique: s_MiwadjOG2Ur8gUJC4h8g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB703C0FC9C;
	Wed, 30 Aug 2023 13:34:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 634E9401E63;
	Wed, 30 Aug 2023 13:34:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3450419465A3;
	Wed, 30 Aug 2023 13:34:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 881FC1946594
 for <linux-lvm@listman.corp.redhat.com>; Wed, 30 Aug 2023 06:40:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 379F840C2070; Wed, 30 Aug 2023 06:40:32 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F18D40C2063
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 149F3280D58A
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:32 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-0kOu25VePWyRBjBQ2k_RlQ-1; Wed, 30 Aug 2023 02:40:29 -0400
X-MC-Unique: 0kOu25VePWyRBjBQ2k_RlQ-1
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U6VHmt016057
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:28 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st0jpra2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:28 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U4FN2b014103
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:27 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sqwxk1bq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:27 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37U6eRQ727918988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:27 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B90458056
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8995F58052
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:26 +0000 (GMT)
Received: from [9.171.29.212] (unknown [9.171.29.212])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP
 for <linux-lvm@redhat.com>; Wed, 30 Aug 2023 06:40:26 +0000 (GMT)
Message-ID: <fa1ed1e4-9eae-f921-1506-87b46c13ad1f@linux.ibm.com>
Date: Wed, 30 Aug 2023 12:10:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: linux-lvm@redhat.com
From: Vishal Chourasia <vishalc@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W7LeM6zCJeVxeCAyr2B271xbt9wr0maC
X-Proofpoint-ORIG-GUID: W7LeM6zCJeVxeCAyr2B271xbt9wr0maC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300060
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 37U6VHmt016057
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:29:46 +0000
Subject: [linux-lvm] Trouble Booting Custom Kernel with QEMU:
 dracut-initqueue timeout waiting for /dev/sysvg/root
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.ibm.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLAoKSSBob3BlIHRoaXMgZW1haWwgZmluZHMgeW91IHdlbGwuIEkgYW0gY3VycmVudGx5
IGZhY2luZyBhbiBpc3N1ZSB3aXRoCmJvb3RpbmcgYSBWTSB1c2luZyBhIGN1c3RvbS1jb21waWxl
ZCBrZXJuZWwgYW5kIHdvdWxkIGFwcHJlY2lhdGUgeW91cgpleHBlcnRpc2Ugb24gdGhlIG1hdHRl
ci4KCiMjIyBQcm9ibGVtIERlc2NyaXB0aW9uCkkgaGF2ZSBkb3dubG9hZGVkIHRoZSBgRmVkb3Jh
LVNlcnZlci1LVk0tMzgtMS42Lng4Nl82NC5xY293MmAgaW1hZ2UgYW5kCnN1Y2Nlc3NmdWxseSBi
b290ZWQgaXQgdXNpbmcgYHFlbXUtc3lzdGVtLXg4Nl82NGAuIEhvd2V2ZXIsIHdoZW4gSSB0cnkK
dG8gYm9vdCB0aGlzIFZNIHdpdGggYSBjdXN0b20tY29tcGlsZWQga2VybmVsIHVzaW5nIHRoZSBg
LWtlcm5lbGAgZmxhZywKaXQgZmFpbHMgdG8gYm9vdC4gVGhlIHJvb3QgZmlsZXN5c3RlbSBpcyBv
biBMVk0sIGFuZCBpdCBzZWVtcyB0aGUga2VybmVsCm5lZWRzIHRvIGFjdGl2YXRlIHZvbHVtZSBn
cm91cHMgYmVmb3JlIG1vdW50aW5nIHRoZSByb290IGZpbGVzeXN0ZW0uCgojIyMgU3RlcHMgVGFr
ZW4KMS4gQ29waWVkIGAvYm9vdC9jb25maWctKmAgZnJvbSBpbnNpZGUgdGhlIFZNIGFuZCB1c2Vk
IGl0IHRvIGJ1aWxkIHRoZQprZXJuZWwgb24gdGhlIGhvc3QgbWFjaGluZS4KMi4gQWxzbyB0cmll
ZCBgbWFrZSBsb2NhbG1vZGNvbmZpZ2AgYWZ0ZXIgY29weWluZyBgL2Jvb3QvY29uZmlnLSpgLgoz
LiBCdWlsdCBgaW5pdHJkLmltZ2AgdXNpbmcgYGRyYWN1dGAuCgojIyMjIERyYWN1dCBDb21tYW5k
CmBgYGJhc2gKZHJhY3V0IGluaXRyZC5pbWcgLS1rbW9kZGlyICRJTlNUQUxMX01PRF9QQVRIL2xp
Yi9tb2R1bGVzLzYuNC4wKyA2LjQuMCsKYGBgCgojIyMjIFFlbXUgQ29tbWFuZApgYGBiYXNoCnFl
bXUtc3lzdGVtLXg4Nl82NCAtZW5hYmxlLWt2bSAtbm9ncmFwaGljIC12Z2Egbm9uZSAtc21wIDEg
LW0gMkcgXAota2VybmVsIGFyY2gveDg2XzY0L2Jvb3QvYnpJbWFnZSAtaW5pdHJkIGluaXRyZC5p
bWcgLWFwcGVuZAoicm9vdD0vZGV2L3ZkYTMgcm8gY29uc29sZT10dHlTMCIgXAotZGV2aWNlIHZp
cnRpby1ibGstcGNpLGRyaXZlPXJvb3RkaXNrIC1kcml2ZQpmaWxlPUZlZG9yYS1TZXJ2ZXItS1ZN
LTM4LTEuNi54ODZfNjQucWNvdzIsaWY9bm9uZSxjYWNoZT1ub25lLGlkPXJvb3RkaXNrLGZvcm1h
dD1xY293MgpcCi1uZXQgbmljLG1vZGVsPXZpcnRpbyAtbmV0IHVzZXIsaG9zdGZ3ZD10Y3A6OjU1
NTUtOjIyCmBgYAoKIyMjIEVycm9yIE9ic2VydmVkClRoZSBrZXJuZWwgcGFuaWNzIHdpdGggdGhl
IGZvbGxvd2luZyBtZXNzYWdlOgpgYGAKWyAgICAwLjg0MzgxOF0gTGlzdCBvZiBhbGwgcGFydGl0
aW9uczoKWyAgICAwLjg0NDA4NF0gZmQwMCAgICAgICAgIDczNDAwMzIgdmRhClsgICAgMC44NDQw
ODZdICBkcml2ZXI6IHZpcnRpb19ibGsKWyAgICAwLjg0NDU3MV0gICBmZDAxICAgICAgICAgICAg
MTAyNCB2ZGExCmYzMTM3YmY0LTJjZjAtNGVmNi05OGE5LWRkYTMyZTIzZGRjZApbICAgIDAuODQ0
NTczXQpbICAgIDAuODQ1MjY5XSAgIGZkMDIgICAgICAgICAxMDQ4NTc2IHZkYTIKMzAzMGNhM2It
NjYwNi00YThlLWE1ZWUtZWZkYzc4NThmYjY0ClsgICAgMC44NDUyNzBdClsgICAgMC44NDU5NzZd
ICAgZmQwMyAgICAgICAgIDYyODgzODQgdmRhMwo0MTZiMzAwOS01OWQzLTRlZDEtYjEyNi0zY2Iy
MTZhYTAyZjQKWyAgICAwLjg0NTk3Nl0KWyAgICAwLjg0NjU5M10gZmQxMCAgICAgICAgMjA5NzE1
MjAgdmRiClsgICAgMC44NDY1OTRdICBkcml2ZXI6IHZpcnRpb19ibGsKWyAgICAwLjg0NzA5MV0g
MGIwMCAgICAgICAgIDEwNDg1NzUgc3IwClsgICAgMC44NDcwOTJdICBkcml2ZXI6IHNyClsgICAg
MC44NDc1NDVdIE5vIGZpbGVzeXN0ZW0gY291bGQgbW91bnQgcm9vdCwgdHJpZWQ6ClsgICAgMC44
NDc1NDZdICBleHQzClsgICAgMC44NDc5MDZdICBleHQyClsgICAgMC44NDgwNjBdICBleHQ0Clsg
ICAgMC44NDgyMjBdICBmdXNlYmxrClsgICAgMC44NDgzNjJdICB4ZnMKWyAgICAwLjg0ODUzN10g
IGJ0cmZzClsgICAgMC44NDg2NzRdClsgICAgMC44NDg5NTFdIEtlcm5lbCBwYW5pYyAtIG5vdCBz
eW5jaW5nOiBWRlM6IFVuYWJsZSB0byBtb3VudCByb290IGZzCm9uIHVua25vd24tYmxvY2soMjUz
LDMpClsgICAgMC44NDk1NzRdIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWlu
dGVkIDYuNC4wKyAjMwpbICAgIDAuODUwMDEyXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJk
IFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwKQklPUyByZWwtMS4xNi4yLTAtZ2VhMWI3YTA3MzM5
MC1wcmVidWlsdC5xZW11Lm80ClsgICAgMC44NTA4MzddIENhbGwgVHJhY2U6ClsgICAgMC44NTEx
MDldICA8VEFTSz4KWyAgICAwLjg1MTI2MV0gIGR1bXBfc3RhY2tfbHZsKzB4NDcvMHg2MApbICAg
IDAuODUxNTI0XSAgcGFuaWMrMHgxNzgvMHgzMzAKWyAgICAwLjg1MTc0NV0gIG1vdW50X2Jsb2Nr
X3Jvb3QrMHgyNzgvMHgyODAKWyAgICAwLjg1MjAzMF0gID8gX19wZnhfaWdub3JlX3Vua25vd25f
Ym9vdG9wdGlvbisweDEwLzB4MTAKWyAgICAwLjg1MjQwM10gIHByZXBhcmVfbmFtZXNwYWNlKzB4
MTU2LzB4MTgwClsgICAgMC44NTI3MDVdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDQxNi8weDQ2
MApbICAgIDAuODUzMDMxXSAgPyBfX3BmeF9rZXJuZWxfaW5pdCsweDEwLzB4MTAKWyAgICAwLjg1
MzMyOF0gIGtlcm5lbF9pbml0KzB4MWEvMHgxNDAKWyAgICAwLjg1MzU4NV0gIHJldF9mcm9tX2Zv
cmsrMHgyYy8weDUwClsgICAgMC44NTM4NThdICA8L1RBU0s+ClsgICAgMC44NTQwNjddIEtlcm5l
bCBPZmZzZXQ6IDB4MTYwMDAwMDAgZnJvbSAweGZmZmZmZmZmODEwMDAwMDAKKHJlbG9jYXRpb24g
cmFuZ2U6IDB4ZmZmZmZmZmY4MDAwMDAwMC0weGZmZmZmZmZmYmZmZikKWyAgICAwLjg1NDg2Nl0g
LS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50
CnJvb3QgZnMgb24gdW5rbm93bi1ibG9jaygyNTMsMykgXS0tLQpgYGAKCiMjIyBBZGRpdGlvbmFs
IEluZm9ybWF0aW9uCi0gYC9ldGMvZnN0YWJgIGFuZCBgbHNibGtgIG91dHB1dCBhcmUgYXR0YWNo
ZWQgZm9yIHJlZmVyZW5jZS4KCiMjIyMgL2V0Yy9mc3RhYgpgYGAKL2Rldi9tYXBwZXIvc3lzdmct
cm9vdCAgLyAgICAgICAgICAgICAgICAgICAgICAgeGZzICAgICBkZWZhdWx0cyAgICAgICAgMCAw
ClVVSUQ9MmNkMThmYmYtNzcwNS00YTg2LThiYjgtYzE4ZGFmZGVlODIyIC9ib290ICAgICAgICAg
ICAgICAgICAgIGV4dDQKIGRlZmF1bHRzICAgICAgICAxIDIKYGBgCgojIyMjIGxzYmxrCmBgYApO
QU1FICAgICAgICAgICBNQUo6TUlOIFJNICBTSVpFIFJPIFRZUEUgTU9VTlRQT0lOVFMKc3IwICAg
ICAgICAgICAgIDExOjAgICAgMSAxMDI0TSAgMCByb20KenJhbTAgICAgICAgICAgMjUxOjAgICAg
MCAgMy44RyAgMCBkaXNrIFtTV0FQXQp2ZGEgICAgICAgICAgICAyNTI6MCAgICAwICAgIDdHICAw
IGRpc2sK4pSc4pSAdmRhMSAgICAgICAgIDI1MjoxICAgIDAgICAgMU0gIDAgcGFydArilJzilIB2
ZGEyICAgICAgICAgMjUyOjIgICAgMCAgICAxRyAgMCBwYXJ0IC9ib290CuKUlOKUgHZkYTMgICAg
ICAgICAyNTI6MyAgICAwICAgIDZHICAwIHBhcnQKICDilJTilIBzeXN2Zy1yb290IDI1MzowICAg
IDAgICAgNkcgIDAgbHZtICAvCmBgYAoKIyMjIyBsc2luaXRyZCBpbml0cmQuaW1nCmBgYApJbWFn
ZTogaW5pdHJkLmltZzogNDlNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpWZXJzaW9uOiBkcmFjdXQtMDQ5LTIy
My5naXQyMDIzMDExOS5lbDgKCkFyZ3VtZW50czogLS1mb3JjZSAtLWttb2RkaXIgJyRJTlNUQUxM
X01PRF9QQVRIL2xpYi9tb2R1bGVzLzYuNC4wKyA2LjQuMCsnCgpkcmFjdXQgbW9kdWxlczoKYmFz
aApzeXN0ZW1kCnN5c3RlbWQtaW5pdHJkCm5zcy1zb2Z0b2tuCmkxOG4KbmV0d29yay1tYW5hZ2Vy
Cm5ldHdvcmsKaWZjZmcKZHJtCnBseW1vdXRoCnByZWZpeGRldm5hbWUKY3J5cHQKZG0Ka2VybmVs
LW1vZHVsZXMKa2VybmVsLW1vZHVsZXMtZXh0cmEKa2VybmVsLW5ldHdvcmstbW9kdWxlcwpsdm0K
cmVzdW1lCnJvb3Rmcy1ibG9jawp0ZXJtaW5mbwp1ZGV2LXJ1bGVzCmJpb3NkZXZuYW1lCmRyYWN1
dC1zeXN0ZW1kCnVzcm1vdW50CmJhc2UKZnMtbGliCm1lbXN0cmFjawptaWNyb2NvZGVfY3RsLWZ3
X2Rpcl9vdmVycmlkZQpzaHV0ZG93bgpgYGAKCkkgd291bGQgYmUgZ3JhdGVmdWwgZm9yIGFueSBn
dWlkYW5jZSBvciBzdWdnZXN0aW9ucyB5b3UgY291bGQgcHJvdmlkZSB0bwpyZXNvbHZlIHRoaXMg
aXNzdWUuCgoKdmlzaGFsLmMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3QKbGludXgtbHZtQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0KcmVhZCB0
aGUgTFZNIEhPVy1UTyBhdCBodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLwo=

